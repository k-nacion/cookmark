# Cook Mark

## Description
Cook Mark is a simple recipe application created to test and showcase knowledge in data persistence and networking using Flutter. The app fetches data from the DummyJson API and allows users to search, browse, bookmark recipes, and generate a grocery checklist of ingredients.

## Features
- **Recipes Tab**: Browse and search for recipes fetched from the DummyJson API.
- **Bookmark Tab**: Save favorite recipes for easy access.
- **Grocery Tab**: Automatically generate a checklist of ingredients from bookmarked recipes, combining all the required items into a single list.
- **State Management**: Utilizes `provider` for efficient state management.
- **Data Persistence**: Stores bookmarks locally using `shared_preferences`.

## Requirements
- Flutter SDK (latest stable version)
- Dart (latest stable version)
- Dependencies:
    - `provider`: State management
    - `flex_color_scheme`: Simplified and customizable theming
    - `go_router`: Routing and navigation
    - `google_fonts`: For font customization (planned but not implemented yet)
    - `http`: Networking
    - `hugeicons`: For visually appealing icons
    - `get_it`: Dependency injection
    - `shared_preferences`: Data persistence

## Platforms
Cook Mark is configured with Flutter's default settings, making it available on all supported platforms (Android, iOS, Web, Desktop).

## Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/k-nacion/cook-mark.git
    ```
2. Navigate to the project directory:
    ```bash
    cd cook-mark
    ```
3. Install the dependencies:
    ```bash
    flutter pub get
    ```
4. Run the app:
    ```bash
    flutter run
    ```

## Contributing
Contributions are welcome! Although no specific guidelines are in place, feel free to fork the repository, create a new branch for your feature or bug fix, and submit a pull request.

## License
This project is licensed under the **MIT License**, allowing anyone to use and modify the code. See the [LICENSE](LICENSE) file for more details.

## Contact
You can find the project and follow its updates on GitHub:
[https://github.com/k-nacion](https://github.com/k-nacion)
