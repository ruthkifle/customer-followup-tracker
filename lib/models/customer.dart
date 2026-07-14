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
  Customer copyWith({
    String? id,
    String? name,
    String? phone,
    String? company,
    String? status,
    DateTime? followUpDate,
    String? notes,
    DateTime? createdAt,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      company: company ?? this.company,
      status: status ?? this.status,
      followUpDate: followUpDate ?? this.followUpDate,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'company': company,
      'status': status,
      'followUpDate': followUpDate.toIso8601String(),
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Customer.fromMap(Map data) {
    return Customer(
      id: data['id'],
      name: data['name'],
      phone: data['phone'],
      company: data['company'],
      status: data['status'],
      followUpDate: DateTime.parse(data['followUpDate']),
      notes: data['notes'],
      createdAt: DateTime.parse(data['createdAt']),
    );
  }
}