# 🦴 Bone Care Mobile Application

Bone Care is a **full-stack healthcare system** that combines a **Flutter mobile application**, a **Node.js backend API**, and a **Python-based deep learning model** to support osteoporosis and knee osteoarthritis monitoring.

Users can learn about bone health, follow physiotherapy exercises, track rehabilitation progress, and interact with other users through the social platform. Additionally, users can upload **knee X-ray images**, which are analyzed by an **AI model built with PyTorch** to classify osteoarthritis stages.

---

## ✨ Features

### 🔐 User Authentication
- User registration and login  
- Password reset with **OTP verification**  
- Secure session management  

### 🤖 AI X-Ray Analysis
- Upload knee X-ray images  
- AI model predicts **osteoarthritis stage**  
- Instant prediction results  

### 🧘 Physiotherapy Exercise Guide
- Video-based physiotherapy exercises  
- Exercise playlists for rehabilitation  
- Step-by-step instructions  

### 📊 Monthly Progress Tracking
- Track physiotherapy progress  
- Generate **monthly reports**  
- Export reports as **PDF**  

### 👥 Social Community Platform
- Create posts with images  
- Like and comment on posts  
- Interact with other users  

### 📚 Educational Resources
- Osteoporosis information  
- Bone health awareness  
- Prevention tips  

### 👤 User Profile
- Profile management  
- Profile image upload  
- Personal information updates  

### 🛠 Support System
- Technical support screen  
- Terms and conditions page  

---

## 🏗 System Architecture

The system consists of three main components:

- 📱 **Flutter Mobile Application**
- ⚙️ **Node.js REST API Backend**
- 🧠 **Python AI Model Service**

### Workflow

Flutter Mobile App  
⬇  
Node.js Express API  
⬇  
MySQL Database  

Flutter Mobile App  
⬇  
Flask API  
⬇  
PyTorch Deep Learning Model  

---

## 🛠 Technologies Used

### 📱 Mobile Application
- Flutter  
- Dart  
- Provider (State Management)  
- HTTP Package  
- Flutter Secure Storage  
- Image Picker  
- YouTube Player Flutter  
- Liquid Pull To Refresh  
- Intl  

### ⚙️ Backend
- Node.js  
- Express.js  
- REST API  
- MySQL Database  

### 🧠 AI Model
- Python  
- PyTorch  
- Torchvision  
- DenseNet201  
- InceptionV3  
- Flask API  
- Pillow  
- Matplotlib  

---

## 🧠 AI Model Description

The AI model used for knee osteoarthritis detection is a custom deep learning architecture called **DIKO_Stage2**.

The model combines features from two pretrained convolutional neural networks:

- **DenseNet201**
- **InceptionV3**

Features extracted from both networks are combined and passed through multiple **fully connected layers** to classify the X-ray image into **five osteoarthritis stages**.

### 🔬 Model Pipeline

1. Input X-ray image  
2. Image preprocessing (resize + normalization)  
3. Feature extraction using DenseNet201 & InceptionV3  
4. Feature fusion  
5. Fully connected layers  
6. Output classification (**Stage 0 – 4**)

---

## 📂 Project Structure

```
bone_care_project/

│
├── mobile_app/
│   └── lib/
│       ├── screens/
│       ├── providers/
│       ├── services/
│       ├── utils/
│       └── main.dart
│
├── backend/
│   ├── server.js
│   ├── routes/
│   ├── controllers/
│   └── uploads/
│
├── ai_model/
│   ├── DIKO_Stage2.py
│   ├── app.py
│   ├── DIKO.pth
│   └── requirements.txt

```

---

## ⚙️ Installation Guide

### 📥 Clone Repository

```bash
git clone https://github.com/yourusername/bone-care-app.git
```

### ▶️ Run Flutter Mobile App

```bash
cd mobile_app
flutter pub get
flutter run
```

### ⚙️ Run Backend Server

```bash
cd backend
npm install
node server.js
```

### 🧠 Run AI Model API

```bash
cd ai_model
pip install -r requirements.txt
python app.py
```


---

## 📸 Screenshots
<img src="https://github.com/PramudiWalakuluarachchi01/BoneCare/blob/main/bone_care_01.png?raw=true"  width=200 height=300>
<img src="https://github.com/PramudiWalakuluarachchi01/BoneCare/blob/main/bone_care_02.png?raw=true"  width=200 height=300>
<img src="https://github.com/PramudiWalakuluarachchi01/BoneCare/blob/main/bone_care_03.png?raw=true"  width=200 height=300>
<img src="https://github.com/PramudiWalakuluarachchi01/BoneCare/blob/main/bone_care_04.png?raw=true"  width=200 height=300>

---

## 🚀 Future Improvements

- Improve AI model accuracy  
- Add doctor consultation module  
- Real-time physiotherapy monitoring  
- Cloud deployment  
- Push notifications  

---

## 👩‍💻 Author

**Pramudi Walakuluarachchi**  

