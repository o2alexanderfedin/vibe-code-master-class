#!/bin/bash

# Script to prepare a new release according to GitFlow
# Usage: ./prepare-release.sh <version>
# Example: ./prepare-release.sh 1.0.0

set -e  # Exit immediately if a command exits with a non-zero status

# Check if version is provided
if [ -z "$1" ]; then
  echo "❌ Error: No version specified"
  echo "Usage: ./prepare-release.sh <version>"
  echo "Example: ./prepare-release.sh 1.0.0"
  exit 1
fi

VERSION=$1

# Validate version format (basic check)
if ! [[ $VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "❌ Error: Version must follow semantic versioning (MAJOR.MINOR.PATCH)"
  echo "Example: 1.0.0"
  exit 1
fi

# Check if we're on develop branch
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "develop" ]; then
  echo "❌ Error: You must be on the develop branch to prepare a release"
  echo "Current branch: $CURRENT_BRANCH"
  exit 1
fi

# Check for uncommitted changes
if ! git diff-index --quiet HEAD --; then
  echo "❌ Error: You have uncommitted changes. Please commit or stash them first."
  exit 1
fi

# Create release branch
echo "🌿 Creating release branch release/v$VERSION..."
git checkout -b "release/v$VERSION"

# Update version in package.json if it exists
if [ -f "package.json" ]; then
  echo "📦 Updating version in package.json..."
  # Use temporary file to avoid issues with some versions of sed
  sed "s/\"version\": \".*\"/\"version\": \"$VERSION\"/" package.json > package.json.tmp
  mv package.json.tmp package.json
  git add package.json
fi

# Update CHANGELOG.md - replace [Unreleased] with the version
echo "📝 Updating CHANGELOG.md..."
DATE=$(date +%Y-%m-%d)
sed -i '' "s/## \[Unreleased\]/## [$VERSION] - $DATE\n\n## [Unreleased]\n\n### Added/" CHANGELOG.md
git add CHANGELOG.md

# Create a release notes file from template
echo "📋 Creating release notes..."
mkdir -p .github/releases
RELEASE_NOTES=".github/releases/v$VERSION.md"
cp .github/RELEASE_TEMPLATE.md "$RELEASE_NOTES"
sed -i '' "s/{VERSION}/$VERSION/g" "$RELEASE_NOTES"
echo "✅ Release notes template created at $RELEASE_NOTES"
echo "📝 Please edit the release notes to fill in the details before completing the release"

# Commit changes
git commit -m "chore(release): prepare for v$VERSION"

echo "🚀 Release preparation complete!"
echo ""
echo "Next steps:"
echo "1. Edit $RELEASE_NOTES to include release details"
echo "2. Make any final adjustments to the release"
echo "3. Run the following commands to complete the release:"
echo ""
echo "   git checkout main"
echo "   git merge --no-ff release/v$VERSION -m \"chore(release): v$VERSION\""
echo "   git tag -a v$VERSION -m \"Release v$VERSION\""
echo "   git push origin main --tags"
echo "   git checkout develop"
echo "   git merge --no-ff release/v$VERSION -m \"chore(release): merge v$VERSION back to develop\""
echo "   git push origin develop"
echo "   git branch -d release/v$VERSION"
echo ""