# **🚀 Setup and Run the Project**

This document provides step-by-step instructions to set up, install dependencies, and run the project locally and on GitHub Actions.

---

## **1️⃣ Clone the Repository**
First, clone the repository to your local machine:

```bash
git clone git@github.com:<your-github-username>/aviv-qa-technical-test.git
cd aviv-qa-technical-test
```

---

## **2️⃣ Set Up Virtual Environment**
Create and activate a **Python virtual environment** to isolate dependencies:

```bash
python -m venv venv  # Create venv
source venv/bin/activate  # Activate (Mac/Linux)
# On Windows, use: venv\Scripts\activate
```

---

## **3️⃣ Install Dependencies**
Run the following command to install required dependencies:

```bash
pip install --upgrade pip
pip install -r requirements.txt
```
_If `requirements.txt` is missing, install manually:_
```bash
pip install robotframework robotframework-seleniumlibrary robotframework-pabot webdriver-manager
```

---

## **4️⃣ Install Browsers & WebDrivers**
Ensure that **Google Chrome** and **Firefox** are installed:

- **For Mac (Homebrew Users)**:
```bash
brew install --cask google-chrome
brew install --cask firefox
brew install geckodriver
brew install chromedriver
```

- **For Ubuntu/Linux**:
```bash
sudo apt update
sudo apt install -y google-chrome-stable firefox
wget -q https://github.com/mozilla/geckodriver/releases/latest/download/geckodriver-linux64.tar.gz
tar -xvzf geckodriver-linux64.tar.gz
sudo mv geckodriver /usr/local/bin/
```

---

## **5️⃣ Verify Installation**
Ensure all dependencies are correctly installed:

```bash
robot --version
pabot --version
chromedriver --version
geckodriver --version
```

✅ If all versions print correctly, the setup is complete.

---

## **6️⃣ Run Tests Locally**
Run the test cases individually:
```bash
robot tests/test_cases/test_login.robot
robot tests/test_cases/test_registration.robot
robot tests/test_cases/test_logout.robot
```

To run all tests in parallel on **Chrome & Firefox**:
```bash
pabot --processes 2 --argumentfile1 tests/browser_chrome.txt --argumentfile2 tests/browser_firefox.txt tests/test_cases/
```

---

## **7️⃣ Run Tests in Headless Mode**
For **faster execution** and **CI/CD compatibility**, use headless mode:
```bash
pabot --processes 2 --argumentfile1 tests/browser_headless_chrome.txt --argumentfile2 tests/browser_headless_firefox.txt tests/test_cases/
```

---

## **8️⃣ Run GitHub Actions (CI/CD)**
Tests will **automatically run** on every **push or pull request** to `main`.

If needed, **manually trigger a run**:
1. **Go to your GitHub repository.**
2. **Click on "Actions"** → Select **latest workflow run.**
3. **Click "Re-run jobs"** (if needed).

---

## **9️⃣ View Test Reports**
Test results are stored in **log.html, report.html, and output.xml**.

- Open the HTML report in a browser:
```bash
open log.html  # Mac
xdg-open log.html  # Linux
start log.html  # Windows
```

- If running in GitHub Actions:
  - Reports are uploaded as **artifacts** and can be downloaded.

---

## **🔄 Stopping Virtual Environment**
Once you're done, deactivate the virtual environment:
```bash
deactivate
```

---

### 🎯 **Project is now fully set up and ready to run! 🚀🔥**

