import 'package:flutter/material.dart';
import '../widgets/bottom_nav_card.dart';
import '../models/customer.dart';
import '../services/customer_storage.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final companyController = TextEditingController();
  final notesController = TextEditingController();

  String selectedStatus = 'New';
  DateTime? selectedDate;

  final List<String> statuses = [
    'New',
    'Contacted',
    'Interested',
    'Negotiating',
    'Closed',
    'Lost',
  ];

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    companyController.dispose();
    notesController.dispose();
    super.dispose();
  }

  Future<void> pickFollowUpDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void saveCustomer() async {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        companyController.text.isEmpty ||
        selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all required fields'),
        ),
      );
      return;
    }

    final newCustomer = Customer(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: nameController.text,
      phone: phoneController.text,
      company: companyController.text,
      status: selectedStatus,
      followUpDate: selectedDate!,
      notes: notesController.text,
      createdAt: DateTime.now(),
    );

    await CustomerStorage.addCustomer(newCustomer);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Customer saved successfully'),
      ),
    );

    Navigator.pushReplacementNamed(context, '/customers');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Customer',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'Create a new customer lead',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 24),

              _InputLabel(label: 'Name'),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter customer name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              _InputLabel(label: 'Phone Number'),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: '+251...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              _InputLabel(label: 'Company / Business'),
              TextField(
                controller: companyController,
                decoration: const InputDecoration(
                  hintText: 'Business name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              _InputLabel(label: 'Lead Status'),
              DropdownButtonFormField<String>(
                value: selectedStatus,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                items: statuses.map((status) {
                  return DropdownMenuItem(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedStatus = value;
                    });
                  }
                },
              ),

              const SizedBox(height: 16),

              _InputLabel(label: 'Follow-up Date'),
              InkWell(
                onTap: pickFollowUpDate,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    selectedDate == null
                        ? 'Select date'
                        : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                    style: TextStyle(
                      color: selectedDate == null
                          ? Colors.black54
                          : Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              _InputLabel(label: 'Notes'),
              TextField(
                controller: notesController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Write notes...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: saveCustomer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Save Customer'),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const BottomNavCard(
        currentIndex: 2,
      ),
    );
  }
}

class _InputLabel extends StatelessWidget {
  final String label;

  const _InputLabel({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}