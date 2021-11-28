class MedicineEditDataOutput {

  final String id;
  final String name;
  final String userEmail;
  final String? image;

  MedicineEditDataOutput(this.id, this.name, this.userEmail, this.image);

  factory MedicineEditDataOutput.fromJson(Map<String, dynamic> json) {
    return MedicineEditDataOutput(
      json['id'],
      json['name'],
      json['userEmail'],
      json['image']
    );
  }
}