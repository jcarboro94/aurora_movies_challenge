# Aurora Movies

Aurora Movies is a Flutter application that allows users to browse and search for movies. The app is designed with a clean architecture and utilizes modern Flutter libraries and tools to ensure a scalable and maintainable codebase.

## Features

- Browse featured movies
- Search for movies
- View movie details
- Supports both light and dark modes (recommended in dark mode)

## Project Structure

The project follows **Clean Architecture** principles, ensuring a clear separation of concerns and modular, testable code.

### Layers

1. **Domain**: Contains business logic and entities.
2. **Data**: Manages data sources and repositories.
3. **Presentation**: Handles UI and state management.

### Libraries and Tools

- **GoRouter** – Navigation and routing
- **GetIt** – Dependency injection
- **Bloc** – State management

## Folder Structure

```
lib/
├── features/
│   └── movies/
│       ├── data/
│       │   ├── repository_impl/
│       │   └── models/
│       ├── domain/
│       │   ├── entities/
│       │   └── repository/
│       └── presentation/
│           ├── bloc/
│           ├── pages/
│           └── widgets/
├── utils/
│   ├── api_manager/
│   ├── navigation/
│   └── shared_preferences_manager/
└── main.dart
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPOSITORY_NAME.git
   ```
2. Navigate to the project directory:
   ```sh
   cd YOUR_REPOSITORY_NAME
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```

### Environment Setup
1. Create a file named env.prod in the root of your project.
2. Add the following content to the env.prod file:
   ```sh
   AUTH_TOKEN="your_default_auth_token_here"
   ```

### Running the App

1. Ensure a device or emulator is running.
2. Run the app:
   ```sh
   flutter run
   ```

## Usage

- Browse featured movies on the home screen.
- Use the search bar to find specific movies.
- Tap on a movie to view its details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the **MIT License**.

