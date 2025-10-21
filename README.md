# 🚀 Flutter ERP Task App - Agribasket Assessment

A complete Flutter application for managing delivery jobs with offline support, real-time status updates, and modern UI/UX. Built for the Agribasket Flutter Developer assessment.

## 📱 App Features

### ✅ Core Requirements
- **Authentication** - Secure login with token-based auth
- **Job Management** - View, filter, and update job statuses  
- **Pagination** - Infinite scroll with load more
- **Status Filtering** - Filter by status (All, Pending, Accepted, Picked Up, Delivered)
- **Real-time Updates** - Optimistic UI with status progression
- **Offline Support** - Basic offline queue for status updates
- **Modern UI** - Clean, responsive design with Flutter ScreenUtil
- **State Management** - BLoC/Cubit for predictable state management

### ✅ Bonus Features (Polish/Extras)
- **Pull-to-Refresh** - Refresh job list with pull gesture
- **Empty States** - Helpful empty state illustrations
- **Loading States** - Skeleton screens during loading
- **Error Handling** - User-friendly error messages with retry
- **Status Progress** - Visual progress indicator for job status
- **Professional UI** - Consistent spacing, touch targets, Material Design

## 🛠️ Tech Stack

- **Flutter** 3.0+ with Dart 3.0+ (Sound Null Safety)
- **State Management**: BLoC/Cubit
- **Networking**: Dio with interceptors
- **Local Storage**: SharedPreferences for caching & offline queue
- **UI**: Material Design with custom themes
- **Navigation**: flutter Routing

## 🚀 Getting Started

### Prerequisites
- Flutter 3.0.0 or higher
- Dart 3.0.0 or higher
- Android Studio/VSCode

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/mohamedhisham1369/taskapp.git
cd taskapp
