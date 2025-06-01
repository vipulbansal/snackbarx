# Contributing to SnackbarX

Thank you for your interest in contributing to SnackbarX! We welcome contributions from the community and appreciate your help in making this package better.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How to Contribute](#how-to-contribute)
- [Development Setup](#development-setup)
- [Submitting Changes](#submitting-changes)
- [Coding Standards](#coding-standards)
- [Testing Guidelines](#testing-guidelines)
- [Issue Reporting](#issue-reporting)
- [Feature Requests](#feature-requests)

## Code of Conduct

By participating in this project, you agree to abide by our Code of Conduct:

- Be respectful and inclusive
- Use welcoming and appropriate language
- Focus on what is best for the community
- Show empathy towards other community members

## How to Contribute

There are several ways you can contribute:

### 1. Report Bugs
Use our bug report template to report issues you encounter.

### 2. Suggest Features
Use our feature request template to propose new functionality.

### 3. Improve Documentation
Help us improve README, API docs, or add examples.

### 4. Submit Code Changes
Fix bugs, implement features, or improve existing code.

### 5. Review Pull Requests
Help review and test other contributors' changes.

## Development Setup

### Prerequisites

- Flutter SDK 3.0.0 or higher
- Dart SDK 2.17.0 or higher
- Git

### Setup Steps

1. **Fork the repository** on GitHub

2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/yourusername/snackbarx.git
   cd snackbarx
   ```

3. **Add upstream remote**:
   ```bash
   git remote add upstream https://github.com/vipulbansal/snackbarx.git
   ```

4. **Install dependencies**:
   ```bash
   flutter pub get
   ```

5. **Run the example app**:
   ```bash
   cd example
   flutter pub get
   flutter run
   ```

## Submitting Changes

### Pull Request Process

1. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes** following our coding standards

3. **Test your changes**:
   ```bash
   flutter test
   flutter analyze
   ```

4. **Update documentation** if needed

5. **Commit your changes**:
   ```bash
   git add .
   git commit -m "feat: add new animation type"
   ```

6. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

7. **Create a pull request** on GitHub

### Commit Message Format

We follow conventional commits format:

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples:**
```
feat(animations): add bounce animation type
fix(manager): resolve overlay disposal issue
docs(readme): update installation instructions
```

## Coding Standards

### Dart/Flutter Guidelines

1. **Follow official Dart style guide**
2. **Use meaningful variable and function names**
3. **Add documentation comments for public APIs**:
   ```dart
   /// Shows a success snackbar with the given [message].
   /// 
   /// The [config] parameter allows customization of appearance.
   static void showSuccess(String message, {SnackbarConfig? config}) {
     // Implementation
   }
   ```

4. **Keep functions focused and small**
5. **Use const constructors when possible**
6. **Prefer composition over inheritance**

### Code Organization

- Keep related functionality together
- Use clear file and directory names
- Separate concerns (models, widgets, logic)
- Export public APIs through main library file

### Error Handling

- Provide meaningful error messages
- Handle edge cases gracefully
- Use appropriate exception types
- Document error conditions

## Testing Guidelines

### Writing Tests

1. **Unit tests** for business logic
2. **Widget tests** for UI components
3. **Integration tests** for complete workflows

### Test Structure

```dart
void main() {
  group('SnackbarXManager', () {
    test('should initialize properly', () {
      // Arrange
      final manager = SnackbarXManager.instance;
      
      // Act
      manager.init();
      
      // Assert
      expect(manager.isInitialized, isTrue);
    });
  });
}
```

### Running Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/snackbar_manager_test.dart
```

## Issue Reporting

When reporting issues:

1. **Use the appropriate template**
2. **Provide clear reproduction steps**
3. **Include relevant code samples**
4. **Specify environment details**
5. **Add logs or error messages**

### Before Submitting

- Search existing issues first
- Verify the issue with latest version
- Try minimal reproduction case
- Check documentation and examples

## Feature Requests

Good feature requests include:

1. **Clear problem statement**
2. **Proposed solution**
3. **Use case examples**
4. **API design ideas**
5. **Consideration of alternatives**

### Evaluation Criteria

Features are evaluated based on:

- **General usefulness** to the community
- **Alignment** with package goals
- **Implementation complexity**
- **Maintenance burden**
- **Breaking changes** required

## Documentation

### API Documentation

- Use triple-slash comments (`///`)
- Include parameter descriptions
- Add usage examples
- Document return values and exceptions

### README Updates

When adding features:

- Update feature list
- Add usage examples
- Update configuration table
- Include troubleshooting if needed

### Example Updates

Demonstrate new features in the example app:

- Add buttons for new functionality
- Show different configuration options
- Include comments explaining usage

## Review Process

### Pull Request Reviews

Reviews focus on:

- **Code quality** and standards
- **Test coverage** and quality
- **Documentation** completeness
- **Performance** implications
- **Breaking changes** assessment

### Response Times

We aim to:

- Acknowledge PRs within 3 days
- Provide initial review within 1 week
- Complete review process within 2 weeks

## Release Process

### Version Numbering

We follow [Semantic Versioning](https://semver.org/):

- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

### Changelog

All changes are documented in CHANGELOG.md:

- Clear description of changes
- Attribution to contributors
- Migration notes for breaking changes

## Getting Help

If you need help:

1. **Check the documentation** first
2. **Search existing issues** and discussions
3. **Ask in GitHub Discussions**
4. **Create a question issue** using the template

## Recognition

Contributors are recognized through:

- Mention in release notes
- Attribution in commit messages
- Listing in CONTRIBUTORS.md (if created)

Thank you for contributing to SnackbarX!