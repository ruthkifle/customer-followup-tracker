class Customer {
  final String id;
  final String name;
  final String phone;
  final String company;
  final String status;
  final DateTime followUpDate;
  final String notes;
  final DateTime createdAt;

  Customer({
    required this.id,
    required this.name,
    required this.phone,
    required this.company,
    required this.status,
    required this.followUpDate,
    required this.notes,
    required this.createdAt,
  });
}