# News Articles Flutter App

This Flutter app follows the MVVM (Model-View-ViewModel) architecture pattern to display news articles fetched from an external API.

## Project Structure

- **lib/main.dart**  
  Entry point of the app. Sets up dependency injection using Provider for services, repositories, and view models. Launches the `PostsScreen` as the home screen.

- **lib/data/**  
  Handles data-related operations such as fetching from APIs and data models.  
  - `models.dart`: Defines data models (DTOs) used for parsing API responses and converting to domain models.  
  - `services/post_service.dart`: Contains `PostService` which fetches posts from the news API.  
  - `repositories/post_repository.dart`: Abstracts data access and provides a repository interface and implementation.

- **lib/domain/**  
  Contains business/domain models used throughout the app.  
  - `models.dart`: Defines the `Post` model representing a news article.

- **lib/ui/**  
  Contains UI components and view models.  
  - `core/theme.dart`: (Not detailed) Likely contains app-wide theming.  
  - `core/ui/post_card.dart`: UI widget to display individual post cards.  
  - `post/posts_screen.dart`: The main screen (View) displaying a list of posts.  
  - `post/posts_view_modal.dart`: The ViewModel managing UI state, fetching posts, and notifying the view.

## MVVM Architecture

- **Model**: Represents data and business logic. Includes domain models and data models for API parsing.  
- **ViewModel**: Manages UI-related data and business logic, exposes data to the View, and handles user actions.  
- **View**: UI components that display data and forward user interactions to the ViewModel.

## Features

- Fetches news articles about "apple" from the NewsAPI.  
- Displays articles with image, title, description, and published date.  
- Handles loading and error states gracefully.

## How to Run

1. Ensure Flutter SDK is installed and configured.  
2. Run `flutter pub get` to install dependencies.  
3. Run the app on an emulator or physical device using `flutter run`.

## Notes

- The app uses the `provider` package for state management and dependency injection.  
- The data layer separates API calls and data models from domain models for better maintainability.  
- The ViewModel uses `ChangeNotifier` to notify the UI of state changes.

## Testing

- Verify that the app fetches and displays articles correctly.  
- Check loading indicators and error messages on network failure.  
- UI components like `PostCard` should render article details properly.
