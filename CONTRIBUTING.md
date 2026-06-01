# Contributing to Advanced Windows Admin Toolkit

Thank you for your interest in contributing! This document provides guidelines and instructions for contributing to the project.

## Code of Conduct

- Be respectful and professional in all communications
- Focus on constructive feedback
- Help others learn and grow
- Report inappropriate behavior to maintainers

## How to Contribute

### Reporting Bugs

**Before submitting a bug report:**
- Check existing issues to avoid duplicates
- Test with the latest version of the script
- Try running as Administrator
- Verify Windows version compatibility

**When submitting a bug report, include:**
- Windows version and build number
- Exact steps to reproduce the issue
- Expected behavior vs. actual behavior
- Screenshots or error messages (if applicable)
- Relevant log excerpts from the report file

### Suggesting Enhancements

**Before suggesting a feature:**
- Check existing issues and pull requests
- Consider if it aligns with the toolkit's purpose
- Think about implementation complexity

**When suggesting a feature, describe:**
- Use case and benefit
- Proposed implementation approach
- Potential impact on existing features
- Examples of similar tools or functionality

### Pull Requests

**Before starting development:**
1. Fork the repository
2. Create a feature branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Make your changes
4. Test thoroughly
5. Commit with clear messages

**Pull request requirements:**
- Reference related issues (#issue-number)
- Describe changes clearly
- Include testing notes
- Ensure code follows existing patterns
- Update documentation if needed

**Code guidelines:**
- Follow existing batch script conventions
- Add comments for complex logic
- Use descriptive variable names
- Maintain consistent formatting
- Keep functions focused and reusable

### Development Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/PwnPoint/Advanced-System-Admin-Toolkit.git
   cd Advanced-System-Admin-Toolkit
   ```

2. Test changes:
   - Run `AdminToolkit.bat` as Administrator
   - Test all modified menu options
   - Verify logging functionality
   - Check report file generation

3. Validate syntax:
   - Use an editor with batch syntax highlighting
   - Test edge cases
   - Verify error handling

## Areas for Contribution

### High Priority
- Bug fixes and stability improvements
- Performance optimizations
- Windows 11/12 compatibility testing
- Documentation improvements

### Medium Priority
- New diagnostic features
- Enhanced error handling
- Better logging capabilities
- User experience improvements

### Low Priority
- Visual enhancements
- Alternative command methods
- Extended platform support

## Documentation

### README Updates
- Reflect new features accurately
- Update option counts if changed
- Add new command descriptions
- Keep requirements current

### Code Comments
- Explain complex logic
- Document function purposes
- Clarify non-obvious operations
- Add usage examples where helpful

### CHANGELOG
When submitting a PR, update `CHANGELOG.md` with:
```
### Added
- New features

### Changed
- Modified features

### Fixed
- Bug fixes

### Removed
- Deprecated features
```

## Testing Checklist

Before submitting a pull request:

- [ ] Script runs without errors
- [ ] Administrator privileges check works
- [ ] All menu navigation functions
- [ ] Previous/Next page navigation works
- [ ] Exit function works properly
- [ ] Logging to report file functions
- [ ] All commands execute correctly
- [ ] Error messages are clear
- [ ] No unintended console output
- [ ] Report formatting is clean

## Review Process

1. **Automated checks** - Code syntax validation
2. **Manual review** - Maintainers review code and functionality
3. **Testing** - Changes tested on multiple Windows versions
4. **Feedback** - Comments and suggestions provided
5. **Approval** - PR approved and merged

## Commit Message Guidelines

Format your commits as:
```
[Type] Brief description (50 chars max)

Detailed explanation if needed, wrapped at 72 characters.
Reference issue: #123
```

Types:
- `[feat]` - New feature
- `[fix]` - Bug fix
- `[docs]` - Documentation
- `[refactor]` - Code restructuring
- `[test]` - Testing updates
- `[perf]` - Performance improvement

Example:
```
[feat] Add GPU memory detection option

Implements new option 27 to display GPU memory information
using WMIC. Includes logging to report file and error handling
for systems without dedicated GPU.
Closes #45
```

## Release Process

Releases follow semantic versioning: `MAJOR.MINOR.PATCH`

- `MAJOR` - Breaking changes
- `MINOR` - New features (backward compatible)
- `PATCH` - Bug fixes

## Questions?

- Open an issue with the `question` label
- Check existing documentation
- Review previous issues for similar questions
- Search Stack Overflow for Windows administration topics

## Recognition

Contributors will be:
- Added to the CONTRIBUTORS.md file
- Recognized in release notes
- Thanked in project acknowledgments

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for making Advanced Windows Admin Toolkit better!** 
