import 'package:hive/hive.dart';
import '../models/customer.dart';

class CustomerStorage {
  static final Box _box = Hive.box('customersBox');

  static List<Customer> getCustomers() {
    return _box.values.map((data) {
      return Customer.fromMap(Map<String, dynamic>.from(data));
    }).toList();
  }

  static Future<void> addCustomer(Customer customer) async {
    await _box.put(customer.id, customer.toMap());
  }

  static Future<void> deleteCustomer(String id) async {
    await _box.delete(id);
  }

  static Future<void> clearAllCustomers() async {
    await _box.clear();
  }
}