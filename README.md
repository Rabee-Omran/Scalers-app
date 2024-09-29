# Scalers Project

## Overview

Scalers is a Flutter project built using Clean Architecture principles. The architecture divides the code into three main layers:

- **Domain Layer:** Contains the business logic, entities, and use cases.
- **Data Layer:** Responsible for handling the data sources (APIs, local storage, etc.) and repositories.
- **Presentation Layer:** Handles the UI and the state management using `flutter_bloc`.

This structure helps in maintaining a clean separation of concerns, easier testability, and better scalability of the project.

## Project Structure

The project is organized into the following main directories:

### 1. **lib/**
This directory contains the main application code, structured as:

- **config/**: Contains app-wide configuration like locale setup, routes, and theme.
- **core/**: Common utilities, resources (strings, styles), and widgets shared across the app.
- **features/**: Each feature of the app has its own subdirectory containing its domain, data, and presentation layers. For example, the `jobs` feature contains:
  - **domain/**: Includes entities, repositories, and use cases.
  - **data/**: Contains repositories and data sources (e.g., remote and local).
  - **presentation/**: Contains the UI code and state management using Blocs or Cubits.

### 2. **assets/**
Contains static assets like images, fonts, and localization files.

- **svg/**: Stores SVG assets.
- **fonts/**: Custom fonts used in the app.
- **lang/**: JSON files for localization support.

## Key Packages and Design Choices

This project utilizes a variety of third-party packages to enhance functionality and ease development:

- **[flutter_bloc](https://pub.dev/packages/flutter_bloc)**: Used for state management across the app, making it easier to manage complex business logic and UI states.
- **[dio](https://pub.dev/packages/dio)**: A powerful HTTP client that provides easy-to-use methods for network requests and error handling.
- **[equatable](https://pub.dev/packages/equatable)**: Simplifies value equality checks, especially useful for Bloc events and states.
- **[get_it](https://pub.dev/packages/get_it)**: A service locator used for dependency injection, allowing for easy access to services (e.g., repositories, use cases) in the app.
- **[flutter_screenutil](https://pub.dev/packages/flutter_screenutil)**: A utility to handle responsive designs across different screen sizes.
- **[shared_preferences](https://pub.dev/packages/shared_preferences)**: Used to store small amounts of persistent data like user settings locally.
- **[cached_network_image](https://pub.dev/packages/cached_network_image)**: For efficient image loading and caching, improving performance when dealing with remote images.
- **[go_router](https://pub.dev/packages/go_router)**: A declarative router for handling navigation within the app.

## Running the Project

### Prerequisites

Before running the project, ensure you have:

- Flutter SDK installed: [Flutter Installation](https://flutter.dev/docs/get-started/install)
- All required packages by running:

```bash
flutter pub get
```

### Running the App

You can run the app on a connected device or emulator with:

```bash
flutter run
```

Alternatively, to target a specific platform, use:

```bash
flutter run -d <platform>
```

For example:

```bash
flutter run -d android  # For Android
```

### Building the App

To build the app for release, run the following command:

```bash
flutter build <platform>
```

Replace `<platform>` with `apk`, `ios`, etc., depending on your target platform.

## Localization

The project supports multiple languages, and the translations are stored in JSON files under the `lang/` directory. Localization is handled using the `flutter_localizations` package.

## Code Organization

### Domain Layer

The domain layer contains the core business logic of the app. This layer is completely independent of other layers and only interacts via interfaces (abstract classes).

- **Entities**: These are the core objects of the app (e.g., `Job`, `Company`). They are simple data classes.
- **Repositories**: Abstract classes that define the methods for interacting with data. They are implemented in the data layer.
- **Use Cases**: Classes responsible for a single unit of work. Each use case encapsulates a specific action (e.g., `FetchJobs`, `GetJobDetails`).

### Data Layer

The data layer is responsible for fetching data from various sources (API, local storage). It implements the repository interfaces defined in the domain layer.

- **Data Sources**: Handle communication with remote APIs and local storage.
- **Repositories**: Implement the repository interfaces from the domain layer and decide how to fetch the data.

### Presentation Layer

The presentation layer consists of UI widgets and state management. The main components are:

- **Blocs/Cubits**: Handle the state management of individual features (e.g., `JobsBloc`).
- **Widgets**: The UI components of the app, organized by features.
  
This layer depends on both the domain and data layers.

## Troubleshooting

- Ensure you have the correct Flutter SDK version specified in the `pubspec.yaml`.
- Run `flutter pub get` to install all dependencies before running the app.
- If any package-related errors occur, try running `flutter clean` followed by `flutter pub get`.

## Contributing

If you wish to contribute to the project, feel free to fork the repository, make your changes, and open a pull request. All contributions are welcome!

---

Feel free to reach out with any questions or issues regarding the project.

```

This `README.md` provides an overview of your Flutter project based on Clean Architecture, explains your design decisions, and offers guidance on how to run the project and contribute.