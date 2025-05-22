#!/bin/bash

# Script to finalize a release according to GitFlow
# Usage: ./finalize-release.sh <version>
# Example: ./finalize-release.sh 1.0.0

set -e  # Exit immediately if a command exits with a non-zero status

# Check if version is provided
if [ -z "$1" ]; then
  echo "❌ Error: No version specified"
  echo "Usage: ./finalize-release.sh <version>"
  echo "Example: ./finalize-release.sh 1.0.0"
  exit 1
fi

VERSION=$1

# Validate version format (basic check)
if ! [[ $VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "❌ Error: Version must follow semantic versioning (MAJOR.MINOR.PATCH)"
  echo "Example: 1.0.0"
  exit 1
fi

# Check for release branch
RELEASE_BRANCH="release/v$VERSION"
if ! git show-ref --quiet refs/heads/$RELEASE_BRANCH; then
  echo "❌ Error: Release branch $RELEASE_BRANCH does not exist"
  echo "Run prepare-release.sh first to create the release branch"
  exit 1
fi

# Check if release notes exist
RELEASE_NOTES=".github/releases/v$VERSION.md"
if [ ! -f "$RELEASE_NOTES" ]; then
  echo "⚠️ Warning: Release notes not found at $RELEASE_NOTES"
  echo "Make sure you've prepared the release properly"
  read -p "Continue anyway? (y/n) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi

# Check for uncommitted changes
if ! git diff-index --quiet HEAD --; then
  echo "❌ Error: You have uncommitted changes. Please commit or stash them first."
  exit 1
fi

echo "🚀 Finalizing release v$VERSION..."

# Checkout main branch
echo "Checking out main branch..."
git checkout main

# Merge release branch into main
echo "Merging release branch into main..."
git merge --no-ff $RELEASE_BRANCH -m "chore(release): v$VERSION"

# Create tag
echo "Creating release tag..."
git tag -a "v$VERSION" -m "Release v$VERSION"

# Push main and tags
echo "Pushing main branch and tags..."
git push origin main --tags

# Checkout develop branch
echo "Checking out develop branch..."
git checkout develop

# Merge release branch into develop
echo "Merging release branch back into develop..."
git merge --no-ff $RELEASE_BRANCH -m "chore(release): merge v$VERSION back to develop"

# Push develop
echo "Pushing develop branch..."
git push origin develop

# Delete release branch
echo "Deleting release branch..."
git branch -d $RELEASE_BRANCH

echo "✅ Release v$VERSION complete!"
echo ""
echo "Don't forget to create a GitHub release with the content from $RELEASE_NOTES"
echo ""