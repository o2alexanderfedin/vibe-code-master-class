# 🤖 CLAUDE.md

## 🏷️ Versioning and Releases

- Follow semantic versioning (MAJOR.MINOR.PATCH)
- Update CHANGELOG.md with all notable changes
- Tag releases on main branch only
- Version numbers should reflect the significance of content changes:
  - MAJOR: Significant content reorganization or approach changes
  - MINOR: New content sections or examples
  - PATCH: Content corrections or minor improvements
- Use the standard release scripts:
  ```bash
  ./scripts/prepare-release.sh <version>
  ./scripts/finalize-release.sh <version>
  ```
- All releases must use the template in `.github/RELEASE_TEMPLATE.md`
- Release notes should be detailed and highlight all significant changes

## Project-Specific Rules for Claude Code

This file provides important context and rules for Claude when working with this repository.

### 📝 Commit Guidelines

Always follow these commit message guidelines:

1. Use conventional commits format:
   ```
   <type>(<scope>): <description>
   ```

2. Required scopes:
   - `content`: Course content updates
   - `structure`: Course structure changes
   - `examples`: Code examples
   - `slides`: Presentation slides
   - `docs`: Documentation
   - `meta`: Repository management

3. Always follow simplified GitFlow workflow for solo development:
   - Create feature branches from `develop`
   - Use proper prefixes: `feature/`, `fix/`, `docs/`, etc.
   - Merge directly into `develop` when feature is complete
   - Merge `develop` into `main` for releases

### 🛠️ Project Structure

- Markdown documents should use emojis for improved readability
- Course materials should follow the structure in masterclass_plan.md
- Use consistent formatting across all documentation

### 👤 Attribution

- Instructor: Alex Fedin (CEO at O2.services, CTO at Nolock.social)
- Always include proper attribution in new materials