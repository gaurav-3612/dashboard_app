Flutter Responsive Dashboard Assignment

A responsive Dashboard UI application built with Flutter, designed to work seamlessly across Mobile, Tablet, and Web/Desktop platforms. This project was developed as a technical assignment for Adstacks Media.

📱 App Overview

This application replicates a complex dashboard design with the following key sections:

Responsive Sidebar: Collapsible on mobile, persistent on desktop.

Dashboard Widgets: Project listings, Top Creators, and Performance Charts.

Right Panel: Calendar integration and upcoming events (Birthday/Anniversary).

Adaptive Layout: Automatically adjusts layout structure based on screen width (Mobile < 850px, Tablet < 1100px, Desktop >= 1100px).


🛠️ Tech Stack

Framework: Flutter

Language: Dart

State Management: Stateless Widgets with Responsive Layout Builder

Dependencies:

fl_chart - For the Performance Line Chart.

google_fonts - For custom typography (Poppins).

intl - For date formatting.

🚀 Getting Started

Prerequisites

Ensure you have the Flutter SDK installed and set up on your machine.

flutter --version


Installation

Clone the repository:

git clone [https://github.com/your-username/dashboard_app.git](https://github.com/your-username/dashboard_app.git)
cd dashboard_app


Install Dependencies:

flutter pub get


Run the App:

For Web (Recommended for testing responsiveness):

flutter run -d chrome


For Mobile (Android):

flutter run


🔧 Troubleshooting & Configuration

During development, specific configurations were applied to ensure compatibility with the latest Flutter SDK.

Kotlin & Gradle Version Fix

If you encounter a Kotlin Gradle plugin version mismatch error, ensure your android/settings.gradle file uses Kotlin version 1.9.0 or higher:

plugins {
    id "dev.flutter.flutter-plugin-loader" version "1.0.0"
    id "com.android.application" version "7.3.0" apply false
    id "org.jetbrains.kotlin.android" version "1.9.0" apply false // Ensure this is 1.9.0+
}


Layout Overflow Fixes

To prevent Bottom Overflowed errors on smaller screens:

The Side Menu uses a flexible Container instead of a fixed DrawerHeader.

The Search Bar and Project Titles use Expanded widgets with TextOverflow.ellipsis to adapt to narrow widths safely.

📂 Folder Structure

lib/
├── constants.dart       # Colors, Gradients, and Padding constants
├── main.dart           # Entry point and Main Theme setup
├── middle_section.dart # Central Dashboard (Charts, Search, Banners)
├── responsive.dart     # Utility class for Breakpoints (Mobile/Tablet/Desktop)
├── right_section.dart  # Right Sidebar (Calendar, Events)
└── side_menu.dart      # Navigation Drawer (Profile, Menu Items)
