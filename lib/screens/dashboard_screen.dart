import 'package:customer_followup_tracker/services/customer_storage.dart';
import 'package:flutter/material.dart';

//import '../data/customer_data.dart';
import '../widgets/customer_card.dart';
import '../widgets/bottom_nav_card.dart';
import '../widgets/StatCard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customers = CustomerStorage.getCustomers();

    final totalCustomers = customers.length;

    final interestedLeads = customers
        .where((customer) => customer.status == 'Interested')
        .length;

    final closedDeals = customers
        .where((customer) => customer.status == 'Closed')
        .length;

    final today = DateTime.now();

    final followUpsToday = customers.where((customer) {
      return customer.followUpDate.day == today.day &&
          customer.followUpDate.month == today.month &&
          customer.followUpDate.year == today.year;
    }).toList();

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
              children:  [
                Expanded(
                  child: StatCard(
                    title: 'Total Customers',
                    value: totalCustomers.toString(),
                    icon: Icons.people_alt_outlined,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Follow-ups Today',
                    value: followUpsToday.length.toString(),
                    icon: Icons.calendar_month,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Interested Leads',
                    value: interestedLeads.toString(),
                    icon: Icons.star_border,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Closed Deals',
                    value: closedDeals.toString(),
                    icon: Icons.check_circle_outline,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/add-customer',
                  );
                },
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

            Expanded(
              child: followUpsToday.isEmpty
                  ? const Center(
                child: Text(
                  'No follow-ups today',
                  style: TextStyle(color: Colors.black54),
                ),
              )
                  : ListView.builder(
                itemCount: followUpsToday.length,
                itemBuilder: (context, index) {
                  final customer = followUpsToday[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: CustomerCard(
                      name: customer.name,
                      company: customer.company,
                      status: customer.status,
                      followUp: 'Today',
                      compact: true,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/customer-detail',
                          arguments: customer,
                        );
                      },
                    ),
                  );
                },
              ),
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