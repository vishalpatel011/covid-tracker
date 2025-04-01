# COVID-19 Tracker App

[![COVID-19 Tracker Demo](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExOG9yZWNrc3VidWdzb2l6bG5pbm9sOGF1bDYxeGQ0YXFheW1vZzFzciZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/BiWD5KeMLeeTQiUGRO/giphy.gif)](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExOG9yZWNrc3VidWdzb2l6bG5pbm9sOGF1bDYxeGQ0YXFheW1vZzFzciZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/BiWD5KeMLeeTQiUGRO/giphy.gif)

A Flutter application that provides real-time tracking of COVID-19 statistics worldwide. The app features a clean, modern UI with both light and dark themes, and provides comprehensive information about the pandemic.

## Features

- 🌍 **Worldwide Statistics**
  - Total confirmed cases
  - Active cases
  - Recovered cases
  - Total deaths

- 🌎 **Country-wise Data**
  - Detailed statistics for each country
  - Country flags
  - Search functionality
  - Most affected countries list

- 📱 **User Interface**
  - Clean and modern design
  - Light/Dark theme support
  - Pull-to-refresh functionality
  - Responsive layout

- ℹ️ **Information Panel**
  - COVID-19 FAQs
  - Myth Busters
  - Donation links

## Screenshots

[Add your screenshots here]

## Demo Video

[Add your demo video link here]

## Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Android Studio / VS Code
- Android Emulator or Physical Device
- Internet Connection

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/covid-tracker.git
```

2. Navigate to the project directory:
```bash
cd covid-tracker
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## API Used

The app uses the [Disease.sh](https://disease.sh/) API to fetch real-time COVID-19 data:
- Worldwide data: `https://disease.sh/v3/covid-19/all`
- Country-wise data: `https://disease.sh/v3/covid-19/countries`

## Dependencies

- `provider`: ^6.0.5 (State management)
- `http`: ^1.1.0 (API calls)
- `url_launcher`: ^6.1.14 (Opening external links)
- `shared_preferences`: ^2.2.2 (Theme persistence)
- `pie_chart`: ^5.4.0 (Data visualization)

## Project Structure

```
lib/
├── main.dart
├── homepage.dart
├── datasource.dart
├── theme_provider.dart
├── panels/
│   ├── infoPanel.dart
│   ├── mostaffectedcountries.dart
│   └── wordwidepanel.dart
└── pages/
    ├── countryPage.dart
    ├── search.dart
    └── faqs.dart
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Vishal Patel

## Acknowledgments

- [Disease.sh](https://disease.sh/) for providing the COVID-19 API
- Flutter team for the amazing framework
- Made with ❤️ by Vishal Patel
