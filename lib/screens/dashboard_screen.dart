import 'package:flutter/material.dart';

import '../widgets/customer_card.dart';
import '../widgets/bottom_nav_card.dart';
import '../widgets/StatCard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good morning, Ruth 👋',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Customer Follow-Up Tracker',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              'Stay on top of your leads and follow-ups',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 26),

            Row(
              children: const [
                Expanded(
                  child: StatCard(
                    title: 'Total Customers',
                    value: '24',
                    icon: Icons.people_alt_outlined,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Follow-ups Today',
                    value: '5',
                    icon: Icons.calendar_month,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: const [
                Expanded(
                  child: StatCard(
                    title: 'Interested Leads',
                    value: '8',
                    icon: Icons.star_border,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Closed Deals',
                    value: '4',
                    icon: Icons.done,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('+ Add Customer'),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Follow-ups Today',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            CustomerCard(
              name: 'Abebe Kebede',
              company: 'ABC Real Estate',
              status: 'Interested',
              followUp: 'Call today',
              compact: true,
              onTap: () {
                Navigator.pushNamed(context, '/customer-detail');
              },
            ),

            const SizedBox(height: 12),

            CustomerCard(
              name: 'Hana Tadesse',
              company: 'Fashion Shop',
              status: 'Negotiating',
              followUp: 'Send offer',
              compact: true,
              onTap: () {
                Navigator.pushNamed(context, '/customer-detail');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavCard(
        currentIndex: 0,
      ),
    );
  }
}