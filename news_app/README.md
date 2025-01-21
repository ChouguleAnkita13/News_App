# Flutter News Application

## Overview
The News App is a Flutter-based mobile application that delivers the latest news articles from various categories. It is built using the Provider state management solution and integrates with a news API for real-time updates. The app follows the Model-View-Controller (MVC) design pattern, ensuring clean architecture and maintainability. The folder structure is organized for scalability and easy management of code.


<div style="display: flex;">
    <img src="https://github.com/ChouguleAnkita13/Flutter_News_App/assets/155567405/4552e662-e92b-49a8-bd01-26f0711bad6d" alt="splash" style="margin-right: 10px;" width="300" height="600">
    <img src="https://github.com/ChouguleAnkita13/Flutter_News_App/assets/155567405/ab93c89d-a83f-4bf0-883f-64b0455d90f3" alt="login" style="margin-right: 10px; " width="300" height="600">
 <img src="https://github.com/ChouguleAnkita13/Flutter_News_App/assets/155567405/9f671095-bc53-40e2-b10d-ad0395bec7bf" alt="Home 1" style="margin-right: 10px; " width="300" height="600">
 <br> <br><br><br>
    <img src="https://github.com/ChouguleAnkita13/Flutter_News_App/assets/155567405/80bec03f-0af4-4d7b-9106-5e70ac783b69" alt="Bookmark 2" style="margin-right: 10px;" width="300" height="600">
 <img src="https://github.com/ChouguleAnkita13/Flutter_News_App/assets/155567405/1760e300-9d3e-4f62-ae6d-305490f32af3" alt="Home 2" style="margin-right: 10px;" width="300" height="600">
 <img src="https://github.com/ChouguleAnkita13/Flutter_News_App/assets/155567405/8890f9d4-9878-4cde-bc92-f8d4b564a049" alt="Bookmark 2" style="margin-right: 10px;" width="300" height="600">
   
</div>



## Project Structure

The project follows the MVC (Model-View-Controller) architecture for better organization and scalability.

```bash
lib/
├── controller/        # Handles app logic and state (e.g., news_provider.dart)
├── model/             # Data classes and business logic (e.g., newsmodel.dart)
├── view/              # UI components and screens
│   ├── HomeScreen/    # Home screen and related widgets
│   ├── LoginRegisterScreen/ # Login and Signup screens and related widgets
│   ├── Widgets/       # Reusable UI components (e.g., custom buttons, text fields)
│   ├── details_screen.dart # Detailed news screen
│   ├── bookmarked_news_screen.dart # Bookmarked articles screen
│   └── splash_screen.dart # Splash screen
├── theme/             # App themes and styling (e.g., app_theme.dart)
├── main.dart          # Entry point of the app
```
## Key Features

#### News Browsing
View the latest news articles from various sources.
Detailed news screens with article descriptions, publication dates, and author information.

#### Bookmarking
Save favorite news articles to revisit later.
Bookmark management to remove saved articles.

#### UI/UX
Clean and modern user interface with responsive design for mobile devices.
Engaging visuals, including blur effects and gradient overlays.
Dynamic news listing with title, author, and publication details.

#### State Management
Efficient and reactive updates using the Provider package.
Seamless interaction and performance across app features.

#### API Integration
Fetch real-time news data using REST API.
Smooth integration with external news APIs for up-to-date articles.

#### Navigation
Easy navigation between screens, including Login, Signup, Home, Bookmarked, and Details screens.
Intuitive back and forward transitions for better user flow.

#### Theming
Custom themes for consistent styling across the app.
Differentiated news appearance based on focus or selection.

## Flutter Version
```
flutter --version
  Flutter 3.22.3
  Dart 3.4.4
```

## Dependencies
```bash
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  google_fonts: ^6.2.1
  http: ^1.2.1
  url_launcher: ^6.3.0
  provider: ^6.1.2
  intl: ^0.20.1
```
## License
This project is licensed under the MIT License. See the [LICENSE](https://choosealicense.com/licenses/mit/) file for more details.

