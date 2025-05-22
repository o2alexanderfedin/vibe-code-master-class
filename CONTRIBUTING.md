# 🤝 Contributing Guidelines

## 🏷️ Versioning

This project follows [Semantic Versioning](https://semver.org/) (SemVer):

- **MAJOR version** (x.0.0): Incompatible content changes or complete reorganization
- **MINOR version** (0.x.0): New content additions in a backward compatible manner
- **PATCH version** (0.0.x): Backward compatible fixes, corrections, or minor content improvements

### Release Process

We use automated scripts to standardize our release process:

#### 1. Prepare the Release

```bash
./scripts/prepare-release.sh 1.0.0
```

This creates a release branch and prepares version files. Then:

1. Edit the generated release notes in `.github/releases/v1.0.0.md`
2. Make any final adjustments to the release branch
3. Commit any additional changes

#### 2. Finalize the Release

```bash
./scripts/finalize-release.sh 1.0.0
```

This script will:

1. Merge the release branch into main
2. Create a version tag
3. Merge changes back to develop
4. Push all changes and delete the release branch

#### 3. Create a GitHub Release

Create a GitHub release using the content from `.github/releases/v1.0.0.md`.

### Release Templates

All releases should follow the template in `.github/RELEASE_TEMPLATE.md` to maintain consistency.

## 📊 Git Workflow

This project follows the GitFlow workflow for all changes:

### 🌿 Branch Structure

- `main`: Production-ready code
- `develop`: Integration branch for features
- `feature/*`: New features or improvements
- `fix/*`: Bug fixes
- `docs/*`: Documentation changes
- `style/*`: Formatting changes
- `refactor/*`: Code refactoring
- `test/*`: Test additions or changes

### 🔄 Workflow Process (Solo Development)

1. Create a new branch from `develop` with the appropriate prefix
   ```bash
   git checkout develop
   git checkout -b feature/your-feature-name
   ```

2. Make your changes and commit them with descriptive messages
   ```bash
   git commit -m "feat(scope): your descriptive message"
   ```

3. Push your branch to the repository
   ```bash
   git push -u origin feature/your-feature-name
   ```

4. When feature is complete, merge directly into develop
   ```bash
   git checkout develop
   git merge feature/your-feature-name
   git push origin develop
   ```

5. For releases, merge develop into main and tag with version
   ```bash
   git checkout main
   git merge develop
   git tag -a v1.0.0 -m "Release version 1.0.0"
   git push origin main --tags
   ```

## 💬 Commit Message Format

All commit messages should follow the conventional commits format:

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Types:
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation changes
- `style`: Changes that don't affect code functionality (formatting, etc.)
- `refactor`: Code changes that neither fix bugs nor add features
- `test`: Adding or fixing tests
- `chore`: Changes to build process or auxiliary tools

### Scope:
Always include a scope that identifies the area of the change:
- `content`: Course content updates
- `structure`: Course structure changes
- `examples`: Code examples
- `slides`: Presentation slides
- `docs`: Documentation
- `meta`: Repository management

### Examples:
```
feat(content): add section on LLM context limitations
fix(examples): correct code sample in process section
docs(README): update installation instructions
```