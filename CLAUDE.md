# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter web application called "chiku_log" - a store development survey application (店舗開発アンケートです). The app is designed to collect survey responses with rating scores and comments, primarily targeting web deployment.

## Development Commands

### Running the Application
- **Development (web)**: `flutter run -d web-server --web-hostname=0.0.0.0 --web-port=50505` (or use `./debug.sh`)
- **Standard Flutter run**: `flutter run`
- **Web-specific**: `flutter run -d chrome` or `flutter run -d web-server`

### Build Commands
- **Build for web**: `flutter build web`
- **Build APK**: `flutter build apk`
- **Build iOS**: `flutter build ios`

### Testing and Analysis
- **Run tests**: `flutter test`
- **Analyze code**: `flutter analyze`
- **Get dependencies**: `flutter pub get`
- **Upgrade dependencies**: `flutter pub upgrade`

## Architecture Overview

### Multi-Environment Setup
- `main.dart` - Production entry point with Hive initialization and URL parameter handling
- `main_dev.dart` - Development environment entry point 
- `main_stg.dart` - Staging environment entry point (currently empty)

### Key Dependencies
- **GetX**: State management and routing (`get: ^4.7.2`)
- **Hive**: Local storage using IndexedDB for web (`hive_flutter: ^1.1.0`)
- **Talker Flutter**: Logging and debugging (`talker_flutter: ^4.9.3`)
- **Pointer Interceptor**: Web interaction handling (`pointer_interceptor: ^0.10.1+2`)

### Directory Structure
```
lib/
├── config/              # Configuration files
├── data/
│   ├── models/         # Data models (SurveyModel, LocalDataModel)
│   ├── repositories/   # Data repositories
│   └── services/       # API and data services
├── domain/             # Business logic layer
├── routing/            # GetX routing configuration
│   ├── router.dart     # Route definitions
│   └── routes.dart     # Route constants
├── ui/
│   ├── core/
│   │   ├── localizations/  # Internationalization
│   │   ├── themes/         # App theming (colors, dimensions, theme)
│   │   └── widgets/        # Reusable UI components
│   └── survey/             # Survey feature
│       ├── view_model/     # GetX controllers
│       └── widgets/        # Survey-specific widgets
└── utils/              # Utility functions (logging, scroll utilities)
```

### State Management Pattern
The app uses GetX for state management with the following pattern:
- **ViewModels**: Extend `GetxController` (e.g., `SurveyViewModel`)
- **Bindings**: Implement `Bindings` to manage dependencies (`SurveyBinding`)
- **Pages**: Extend `GetWidget<ControllerType>` for automatic dependency injection

### Data Flow
1. URL parameters are extracted in `main.dart` for tenant identification
2. Survey data is managed through `SurveyViewModel` with reactive state
3. Local persistence handled via Hive boxes (IndexedDB on web)
4. Logging throughout the app using custom `Log()` utility with Talker

### Key Features
- **Survey System**: Dynamic survey questions with rating scores and comments
- **Web-First Design**: Optimized for web deployment with specific configurations
- **Local Storage**: Browser-based persistence using Hive/IndexedDB
- **Debug Logging**: Integrated logging accessible via in-app debug route (`/log`)
- **Responsive Scrolling**: Custom scroll behavior for better UX

### Routing
- Uses GetX routing with predefined routes in `Routes` class
- Main route: `/survey` (SurveyPage)
- Debug route: `/log` (TalkerScreen)
- Route definitions in `router.dart` with lazy-loaded dependencies

### Theme System
- Supports both light and dark themes
- Centralized color scheme in `AppColors`
- Custom typography defined in `AppTheme`
- Material Design 3 implementation