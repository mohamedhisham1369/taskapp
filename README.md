# 🚀 Flutter ERP Task App

A complete job management application built with Flutter for the Agribasket assessment.

## 📱 Features

- **User Authentication** - Secure login with token management
- **Job List** - Paginated list with infinite scroll
- **Status Management** - Update job status with optimistic UI
- **Filtering** - Real-time status filtering
- **Offline Support** - Basic offline queue for updates
- **Modern UI** - Professional, responsive design

## 🛠️ Tech Stack

- **Flutter 3.0+** with Dart 3.0+
- **BLoC/Cubit** for state management
- **Dio** for networking
- **SharedPreferences** for local caching
- **flutter Routes** for navigation

## 🚀 Getting Started

### Prerequisites
- Flutter 3.0.0+
- Dart 3.0.0+

### Installation
```bash
git clone https://github.com/mohamedhisham1369/taskapp.git
cd taskapp
flutter pub get
flutter run




Build APK
bash
flutter build apk --debug


## 📸 Screenshots

### Job List Screen
![Job List](screenshots/all_jobs.png)

### Job Details Screen
![Job Details](assets/screenshots/job_details.png)


### Job login
![Job Details](screenshots/login.png)
<img src="screenshots/app_gif.gif" width="300">


📁 Project Structure
text
llib/
├── core/
│   ├── cache_helper/
│   ├── themes/
│   ├── utils/
│   ├── routing/
│   └── extensions/
├── features/
│   ├── authentication/
│   └── jobs/
│       ├── data/
│       │   ├── models/
│       │   └── repos/
│       ├── domain/
│       │   └── cubits/
│       └── presentation/
│           ├── screens/
│           └── widgets/
└── main.dart

🔌 API
Base URL: https://68f6b896f7fb897c661366d7.mockapi.io/api/v1

Endpoints:

POST /auth/login

GET /job?page=1&limit=10

GET /job/:id

PATCH /job/:id

Login Credentials:

Email: demo@demo.com

Password: password

🎯 Implementation
State Management
jobCubit - Manages job list, pagination, filtering

JobDetailsCubit - Handles status updates

Features
Pagination - Infinite scroll with load more

Filtering - Chip-based status filters

Optimistic UI - Immediate updates with rollback

Offline Queue - Basic offline update queuing


📝 Requirements Coverage
Requirement	Status
Flutter 3.x + Dart	✅
State Management	✅
Networking	✅
Authentication	✅
Pagination	✅
Status Updates	✅
Offline Support	⚠️
Testing	✅
UI/UX Polish	✅
👨‍💻 Developer
Mohamed Hisham
GitHub: mohamedhisham1369

*Built for Agribasket Flutter Developer Assessment - October 2025*

text

**That's it!** This single README file covers everything you need for documentation. Just:

1. **Create this file** in your project root
2. **Update your pubspec.yaml** description
3. **Push to GitHub**

```bash
git add README.md
git commit -m "Add project documentation"
git push origin main
