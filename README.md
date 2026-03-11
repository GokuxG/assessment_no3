# Backend API Automation Assignment

## Test Scenarios

1. Get user profile success  
2. Get user profile but user not found  

---

## Project Structure

```text
api-automation/
├── tests/
│   └── get_user_profile.robot
├── testdata/
│   └── user_profile_data.robot
├── requirements.txt
└── README.md
```

---

## Setup

### 1. Clone Repository

```bash
git clone git@github.com:GokuxG/assessment_no3.git
cd assessment_no3
```

### 2. Install Python Dependencies

Make sure Python 3 is installed.

Check version:

```bash
python3 --version
pip3 --version
```

Install required libraries:

```bash
pip install -r requirements.txt
```

This will install the following packages:

- robotframework
- robotframework-requests

---

## How to Run Tests

### Run All Tests

Execute all test cases inside the `tests` folder.

```bash
robot tests
```

---

### Run Specific Test Case

Example:

```bash
robot -t "Get user profile success" tests
```

---

### Run Specific Test File

Example:

```bash
robot tests/get_user_profile.robot
```

---

## Test Results

After running the tests, Robot Framework will generate the following files:

```text
report.html
log.html
output.xml
```

Open `report.html` in your browser to view the test execution report.

---

## API Used

This project uses a public API for testing purposes:

```
https://reqres.in
```

The API is used to simulate user profile retrieval scenarios.
