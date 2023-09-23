## **Table of Contents**

- **Screenshots**
- **Installation**
- **API Configuration**

## **Screenshots**
<img width="1440" alt="Screenshot 2023-09-23 at 10 55 25 PM" src="https://github.com/SUNIL-RAGHU/kaiburrr-task4/assets/89726488/c3fc8687-d7c6-4f9c-b3fc-1e902aff2b26">
<img width="1440" alt="Screenshot 2023-09-23 at 10 57 12 PM" src="https://github.com/SUNIL-RAGHU/kaiburrr-task4/assets/89726488/f20376dd-6e3b-4f08-8362-ebb478efe71c">




Include relevant screenshots or GIFs showcasing your app's UI or functionality.

## **Installation**

Provide step-by-step instructions on how to get your project up and running locally.

1. **Clone the repository:**
    
    ```bash
       git clone https://github.com/SUNIL-RAGHU/kaiburrr-task4.git
    ```
    
2. **Navigate to the project directory:**
    
    ```bash
    cd kaiburrr-task4
    ```
    
3. **Install dependencies:**
    
    ```arduino
    flutter pub get
    ```
    
4. **Run the app:**
    
    ```arduino
    flutter run -d chrome --web-browser-flag "--disable-web-security"
    ```


- Docker installed on your system
- Git installed on your system

## **Setup**

### **Step 1: Pull the latest MongoDB image**

```bash
docker pull mongo:latest
```

### **Step 2: Clone the repository**

```bash
git clone https://github.com/SUNIL-RAGHU/kaiburr-Task2.git
```

### **Step 3: Navigate to the repository**

```bash
cd kaiburr-Task2
```

### **Step 4: Build the Docker image for the Spring Boot application**

```bash
docker build -t kaiburr-api .
```

### **Step 5: Open the terminal and navigate to `src/resources`**

```bash
cd src/main/resources
```

### **Step 6: Start the Docker Compose to run MongoDB and the Spring Boot application**

```bash
docker-compose up
```
