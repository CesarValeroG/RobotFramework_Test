# RobotFramework_Test

A project to learn about Robot Framework - A generic open source automation framework for acceptance testing, acceptance test driven development (ATDD), and robotic process automation (RPA).

## Project Structure

```
RobotFramework_Test/
├── tests/                  # Test cases directory
│   └── sample_tests.robot  # Sample test cases demonstrating Robot Framework features
├── resources/              # Reusable keywords and resources
│   └── keywords.robot      # Custom keywords for test cases
├── results/                # Test execution results (HTML reports, logs, XML output)
│   └── .gitkeep           # Keeps the directory in version control
└── README.md              # Project documentation
```

## Prerequisites

- Python 3.7 or higher
- Robot Framework

## Installation

1. Clone this repository:
```bash
git clone https://github.com/CesarValeroG/RobotFramework_Test.git
cd RobotFramework_Test
```

2. Install Robot Framework:
```bash
pip install robotframework
```

## Running Tests

### Run all tests
```bash
robot --outputdir results tests/
```

### Run a specific test file
```bash
robot --outputdir results tests/sample_tests.robot
```

### Run a specific test case
```bash
robot --outputdir results --test "Test String Equality" tests/sample_tests.robot
```

### Run tests with different log levels
```bash
robot --outputdir results --loglevel DEBUG tests/
```

## Test Reports

After running tests, the following files will be generated in the `results/` directory:

- **report.html** - High-level test execution report
- **log.html** - Detailed test execution log
- **output.xml** - Machine-readable test results in XML format

Open `report.html` or `log.html` in a web browser to view the test results.

## Writing Tests

Robot Framework uses a keyword-driven approach. Tests are written in plain text using a simple tabular syntax.

### Example Test Case
```robot
*** Test Cases ***
Test String Equality
    [Documentation]    Verify that two strings are equal
    ${string1}=    Set Variable    Hello World
    ${string2}=    Set Variable    Hello World
    Should Be Equal    ${string1}    ${string2}
```

### Example Custom Keyword
```robot
*** Keywords ***
Create Greeting Message
    [Arguments]    ${name}
    ${greeting}=    Set Variable    Hello, ${name}!
    RETURN    ${greeting}
```

## Resources

- [Robot Framework Official Documentation](https://robotframework.org/)
- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [Robot Framework GitHub](https://github.com/robotframework/robotframework)

## Contributing

Feel free to fork this repository and submit pull requests to add more test examples or improve the project structure.

## License

This project is for educational purposes.
