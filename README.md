# Air Quality Sensor (AQS) Frontend

A Flutter-based mobile application for monitoring and displaying air quality sensor data in real-time. This application provides users with intuitive visualizations of gas parameters, temperature, humidity, and other environmental metrics.

**Backend:** [https://github.com/skan652/actia-backend](https://github.com/skan652/actia-backend)

## Features

- **User Authentication**: Secure login and signup with password recovery functionality
- **Real-time Data Visualization**: Interactive charts for temperature and humidity trends
- **Gas Parameters Monitoring**: Display and analyze various gas measurements
- **Responsive Design**: Optimized UI for different device sizes
- **Onboarding Flow**: User-friendly onboarding experience for new users
- **CSV Export Options**: Export sensor data in CSV format

## Project Structure

```text
lib/
├── main.dart                    # Application entry point
├── utils.dart                   # Utility functions
└── pages/
    ├── homescreen.dart          # Main home screen
    ├── login.dart               # User login page
    ├── signup.dart              # User registration
    ├── password_recovery.dart    # Password reset flow
    ├── GasParameters.dart        # Gas sensor readings
    ├── TemperatureParameters.dart # Temperature data
    ├── humidity_temperature_graph.dart # Chart visualization
    ├── csvoptions.dart          # CSV export options
    ├── onboarding_screen.dart   # Onboarding flow
    └── gas_particles.dart       # Particle visualization
```

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- An IDE (Android Studio, VS Code, or IntelliJ)
- For iOS: Xcode and CocoaPods
- For Android: Android SDK and emulator/device

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd AQS-frontend
   ```

1. **Install dependencies**

   ```bash
   flutter pub get
   ```

1. **Run the application**

   ```bash
   flutter run
   ```

### Platform-Specific Setup

#### iOS Setup

```bash
cd ios
pod install
cd ..
```

#### Android Setup

Ensure Android SDK is properly configured. The app targets Android devices with the configuration specified in `android/app/build.gradle`.

## Configuration

### API Integration

The application uses backend APIs for authentication and data retrieval. Ensure the following environment variables are configured:

- **Backend URL**: Update the API endpoint in your configuration
- **API Keys**: Store API keys securely in environment variables or secure storage (never commit keys to version control)

For third-party services (e.g., email notifications):

- API keys should be managed through secure configuration files
- Never hardcode sensitive credentials in the source code
- Use environment variables or secure secret management systems

## Development

### Building for Different Platforms

**iOS:**

```bash
flutter build ios
```

**Android:**

```bash
flutter build apk
# or for App Bundle
flutter build appbundle
```

**Web:**

```bash
flutter build web
```

### Running Tests

```bash
flutter test
```

## Architecture

- **UI Layer**: Flutter widgets organized by pages
- **Data Layer**: API integration for backend communication
- **State Management**: Stateful/Stateless widgets for state management

## Security Considerations

- ✅ User credentials are transmitted over HTTPS
- ✅ No hardcoded API keys or sensitive data in source code
- ✅ Implement proper input validation
- ✅ Use secure storage for sensitive local data
- ✅ Follow OAuth/JWT standards for authentication

## Dependencies

See `pubspec.yaml` for the complete list of dependencies including:

- `google_fonts` - Custom typography
- `http` - HTTP client for API calls
- `flutter` - Core Flutter framework

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language Guide](https://dart.dev/guides)
- [Flutter Best Practices](https://docs.flutter.dev/testing/best-practices)
