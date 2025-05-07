# Weather or Not

A modern weather checking application built with Flutter that provides real-time weather information and forecasts.

## Features

- Real-time weather information
- Location-based weather updates
- Modern Material Design 3 UI
- Responsive layout
- Cross-platform support (Android, Web)

## Prerequisites

Before you begin **be sure** to have Flutter SDK (3.27.4 was used for this project). Due to some Android constraints, it is strongly advised to use any version >=3.27.4

## Getting Started

1. Clone the repository:
```
git clone
cd weather_check_app
```

2. Install dependencies:
```
flutter pub get
```

3. Run the app:
```
flutter run
```

## Project Structure

```
lib/
├── constants/     # App-wide constants and configurations
├── core/         # Core functionality and utilities
├── features/     # Feature-specific modules
├── routing/      # Navigation and routing configuration
└── main.dart     # Application entry point
```

## Dependencies

The project uses several key packages:
- `flutter_riverpod` (^2.6.1) - State management
- `go_router` (^15.1.1) - Navigation and routing (This is necessary because it is a web project aswell. Navigator does not handle well web navigation)
- `dio` (^5.8.0+1) - HTTP client
- `geolocator` (^14.0.0) - Location services (With a override on geolocation_android. This was made to ensure working conditions in web and Android platforms)
- `flutter_svg` (^2.1.0) - SVG support
- `fpdart` (^1.1.1) - Functional programming utilities
- `easy_rich_text` (^2.2.0) - Rich text formatting

## Development

The project follows a clean architecture approach with the following key components:
- Feature-based organization
- Riverpod for state management
- Material 3 design system
- Responsive UI components
- Structure ready to receive major upgrades
