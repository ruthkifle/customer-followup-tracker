import 'package:flutter/material.dart';

import 'screens/dashboard_screen.dart';
import 'screens/customer_list_screen.dart';
import 'screens/add_customer_screen.dart';
import 'screens/customer_detail_screen.dart';

void main() {
  runApp(const CustomerTrackerApp());
}

class CustomerTrackerApp extends StatelessWidget {
  const CustomerTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer Follow-Up Tracker',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
        primarySwatch: Colors.blue,
      ),

      initialRoute: '/dashboard',

      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        '/customers': (context) => const CustomerListScreen(),
        '/add-customer': (context) => const AddCustomerScreen(),
        '/customer-detail': (context) => const CustomerDetailScreen(),
      },
    );
  }
}