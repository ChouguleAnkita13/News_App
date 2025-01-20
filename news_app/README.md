# Flutter News Application

News App developed with Flutter.

 
<div style="display: flex;;">
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
├── controller/
│   ├── news_provider.dart         # Business logic and state management
│   └── getnews.dart               # API call to fetch news data
├── model/
│   └── news_model.dart            # Data models
├── view/
│   ├── screens/
│   │   ├── bookmarked_news_screen.dart # UI for bookmarked news
│   │   ├── home.dart                   # UI for home screen
│   │   ├── login_screen.dart           # UI for login screen
│   │   ├── signup.dart                 # UI for signup screen
│   │   ├── details_screen.dart         # UI for news details
│   │   └── splash_screen.dart          # UI for splash screen
│   └── widgets/
│       ├── menubar.dart                # Custom menu bar widget
│       └── news.dart                   # Custom widget to display news articles
├── route/
│   └── app_route.dart                  # Application routes
└── main.dart                           # Application entry point
```

## Libraries used

#### google_fonts:
 This dependency allows easy integration of custom fonts from the Google Fonts library into the Flutter application, enhancing typography and visual design.

#### http:
 The HTTP package facilitates making HTTP requests within the Flutter application, enabling communication with remote servers to fetch data, such as news articles, from APIs.

#### url_launcher:
 This package provides functionality to launch URLs, enabling the Flutter application to open external web links or perform actions associated with URLs, such as sending emails or making phone calls.

#### provider: 
Provider is a state management library for Flutter applications, used to manage application state and data flow efficiently. It enables the sharing of data between different parts of the application and helps maintain a clean and scalable codebase.

## License

[MIT](https://choosealicense.com/licenses/mit/)

