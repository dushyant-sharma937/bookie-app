# Bookie App - Books Search Application

![Bookie App Logo](https://drive.google.com/file/d/13QylpQchqAX9uZVYX8bIWawkOHtYsr9P/view?usp=sharing)

Bookie App is a Flutter-based mobile application that allows users to search for books using the Google Books API. With Bookie App, users can discover both paid and unpaid books, view ratings, author information, and all other essential details about each book.

## Features

- Search for books based on title, author, or keywords.
- View a list of books matching the search criteria.
- See detailed information about each book, including title, author, description, ratings, and more.
- Identify whether a book is free or paid.
- Get additional recommendations based on the selected book.
- User-friendly and intuitive interface.

## Demo

You can try out the live demo of Bookie App at: [https://example.com/bookie-app-demo](https://drive.google.com/file/d/1NmEwlA8PmSg50ndWc7rk6IfRNPD_z4Hr/view?usp=sharing)

## Screenshots

![Bookie App Screenshot 1](https://drive.google.com/file/d/1OxW791Yb4QxX78CJcbw8qkL6an4VspnQ/view?usp=sharing)
![Bookie App Screenshot 2](https://drive.google.com/file/d/19mP5iX-1N2gw-JBMTzZNR_vmPtPWUare/view?usp=sharing)

## Getting Started

To run the Bookie App locally on your machine, follow these steps:

1. Clone the repository to your local machine using the following command:

```bash
git clone https://github.com/dushyant-sharma937/bookie-app.git
```


2. Navigate to the project directory:

```bash
cd bookie-app
```


3. Make sure you have Flutter SDK installed on your machine. If not, you can download and install it from the official website: [Flutter Official Website](https://flutter.dev/)

   
4. Install the required dependencies by running the following command in the project directory:

```bash
flutter pub get
```


5. Obtain an API key from the Google Books API and replace the YOUR_API_KEY in the lib/api/google_books_api.dart file with your actual API key:
   
```bash
// file: lib/api/google_books_api.dart

const String apiKey = 'YOUR_API_KEY';
```


6. Run the Bookie App on your connected device or emulator by running the following command:

```bash
flutter run
```


7. The Bookie App will now be available on your device or emulator, allowing you to search for books and explore their details.



## Technologies Used
  - Flutter: Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
  - Dart: The programming language used for building Flutter applications.
  - Google Books API: Provides access to the Google Books database to fetch book details.



## API Reference
The Bookie App fetches book data from the Google Books API. You can find more information about the API and its endpoints here: [Google Books API Documentation](https://developers.google.com/books/docs/v1/using)



## Contributing
If you'd like to contribute to Bookie App, please follow these guidelines:

Fork the repository on GitHub.
Create a new branch with a descriptive name for your feature or bug fix.
Commit your changes with clear and concise commit messages.
Push your changes to your forked repository.
Submit a pull request, explaining the changes and why they should be merged.



## Acknowledgments
A big thank you to the developers of the Google Books API for providing the data used in this application.



Happy reading with Bookie App! If you encounter any issues or have suggestions, please feel free to open an issue on GitHub. We'd love to hear from you!
