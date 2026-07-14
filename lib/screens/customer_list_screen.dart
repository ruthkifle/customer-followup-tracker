import 'package:customer_followup_tracker/services/customer_storage.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_nav_card.dart';
import '../widgets/customer_card.dart';
import '../services/customer_storage.dart';
import '../widgets/customer_card.dart';

class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customers = CustomerStorage.getCustomers();
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Customers',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'Manage your leads and follow-ups',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 20),

              // Search box
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: 'Search customer...',
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'All Leads',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: customers.isEmpty
                    ? const Center(
                  child: Text(
                    'No customers yet. Add your first customer.',
                    style: TextStyle(color: Colors.black54),
                  ),
                )
                    : ListView.builder(
                  itemCount: customers.length,
                  itemBuilder: (context, index) {
                    final customer = customers[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: CustomerCard(
                        name: customer.name,
                        company: customer.company,
                        status: customer.status,
                        followUp:
                        '${customer.followUpDate.day}/${customer.followUpDate.month}/${customer.followUpDate.year}',
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
      ),

      bottomNavigationBar: const BottomNavCard(
        currentIndex: 1,
      ),
    );
  }
}