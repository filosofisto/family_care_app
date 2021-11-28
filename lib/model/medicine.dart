class Medicine {

  final String id;
  final String userEmail;
  final String name;
  final String? image;

  Medicine({required this.id, required this.userEmail, required this.name, this.image});

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
        id: json['id'],
        userEmail: json['userEmail'],
        name: json['name'],
        image: json['image']
    );
  }
}

class MedicineList {
  final List<Medicine> medicines;

  MedicineList(this.medicines);

  factory MedicineList.fromJson(List<dynamic> json) {
    return MedicineList(json.map((e) => Medicine.fromJson(e)).toList());
  }
}