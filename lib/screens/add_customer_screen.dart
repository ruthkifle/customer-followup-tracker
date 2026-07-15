import 'package:flutter/material.dart';
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
  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.white,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFFE5E7EB),
          width: 1,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.blue,
          width: 2,
        ),
      ),
    );
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                      size: 28,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                  const SizedBox(width: 16),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Customer',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          'Create a new lead or customer.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              _InputLabel(label: 'Name'),
              TextField(
                controller: nameController,
                decoration: customInputDecoration('Enter customer name'),
              ),

              const SizedBox(height: 16),

              _InputLabel(label: 'Phone Number'),
              TextField(
                controller: phoneController,
                decoration: customInputDecoration('+251...'),
              ),

              const SizedBox(height: 16),

              _InputLabel(label: 'Company / Business'),
              TextField(
                controller: companyController,
                decoration: customInputDecoration('Business name')
              ),

              const SizedBox(height: 16),

              _InputLabel(label: 'Lead Status'),
              DropdownButtonFormField<String>(
                value: selectedStatus,
                decoration: customInputDecoration('Select status'),
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(12),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.blue,
                ),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                menuMaxHeight: 250,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFE5E7EB),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 20,
                        color: Colors.black54,
                      ),

                      const SizedBox(width: 10),

                      Text(
                        selectedDate == null
                            ? 'Select date'
                            : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                        style: TextStyle(
                          color: selectedDate == null ? Colors.black54 : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              _InputLabel(label: 'Notes'),
              TextField(
                controller: notesController,
                maxLines: 4,
                decoration: customInputDecoration('Write notes...')
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
          fontSize: 16
        ),
      ),
    );
  }
}