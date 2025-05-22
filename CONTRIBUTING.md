# 🤝 Contributing Guidelines

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

### 🔄 Workflow Process

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

4. Create a pull request to merge into `develop`

5. After review and approval, the changes will be merged

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