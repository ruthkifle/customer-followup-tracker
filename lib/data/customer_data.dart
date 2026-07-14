import '../models/customer.dart';

class CustomerData {
  static final List<Customer> customers = [
    Customer(
      id: '1',
      name: 'Abebe Kebede',
      phone: '+251 912 345 678',
      company: 'ABC Real Estate',
      status: 'Interested',
      followUpDate: DateTime(2025, 6, 12),
      notes: 'Wants a 2-bedroom apartment near Bole.',
      createdAt: DateTime.now(),
    ),
    Customer(
      id: '2',
      name: 'Hana Tadesse',
      phone: '+251 911 222 333',
      company: 'Fashion Shop',
      status: 'Negotiating',
      followUpDate: DateTime(2025, 6, 15),
      notes: 'Asked for a discount and delivery options.',
      createdAt: DateTime.now(),
    ),
  ];

  static void addCustomer(Customer customer) {
    customers.add(customer);
  }
}