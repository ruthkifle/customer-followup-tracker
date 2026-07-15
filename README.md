# Customer Follow-Up Tracker

Customer Follow-Up Tracker is a simple Flutter Android app that helps users manage customer leads, follow-up dates, notes, and sales status.

The app is designed for small businesses, freelancers, salespeople, recruiters, and real estate agents who need a simple way to remember who to contact next.

## Problem

Many small businesses and salespeople lose potential customers because they forget to follow up at the right time.

This app helps users answer:

- Who are my current leads?
- What stage is each customer in?
- Who should I follow up with today?
- What notes did I save about each customer?

## Features

- Add new customers
- Save customer name, phone, company, status, follow-up date, and notes
- View all customers in a list
- Search customers by name, company, phone, or status
- View customer details
- Edit customer information
- Delete customers
- Change customer status
- Dashboard with real statistics
- Local data storage using Hive

## Lead Statuses

The app supports these customer statuses:

- New
- Contacted
- Interested
- Negotiating
- Closed
- Lost

## Tech Stack

- Flutter
- Dart
- Hive local storage
- Android Studio
- Git and GitHub

## Screens

The app includes:

- Dashboard Screen
- Customer List Screen
- Add Customer Screen
- Customer Detail Screen
- Edit Customer Screen

## Project Structure

```text
lib/
 ├── models/
 │    └── customer.dart
 ├── screens/
 │    ├── dashboard_screen.dart
 │    ├── customer_list_screen.dart
 │    ├── add_customer_screen.dart
 │    ├── customer_detail_screen.dart
 │    └── edit_customer_screen.dart
 ├── services/
 │    └── customer_storage.dart
 ├── widgets/
 │    ├── stat_card.dart
 │    ├── customer_card.dart
 │    └── bottom_nav_card.dart
 └── main.dart

```

## How to Run

1. Clone the repository:

```bash
git clone https://github.com/ruthkifle/customer-followup-tracker
```

2. Open the project in Android Studio.

3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

## What I Learned

While building this project, I practiced:

- Building Flutter screens
- Creating reusable widgets
- Managing form inputs
- Using routes and navigation
- Passing data between screens
- Creating a customer model
- Saving and loading data with Hive
- Implementing CRUD operations
- Using Git and GitHub

## Future Improvements

- Add notification reminders for follow-ups
- Add filtering by customer status
- Add sorting by follow-up date
- Add call button for customer phone numbers
- Add charts for lead progress
- Add Firebase login and cloud sync
- Add export to CSV or PDF

## Status

This project is a working local-storage MVP built with Flutter and Hive.
