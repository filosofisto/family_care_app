class MedicineNewDataOutput {

  final String id;
  final String name;
  final String userEmail;
  final String? image;

  MedicineNewDataOutput(this.id, this.name, this.userEmail, this.image);

  factory MedicineNewDataOutput.fromJson(Map<String, dynamic> json) {
    return MedicineNewDataOutput(
      json['id'],
      json['name'],
      json['userEmail'],
      json['image']
    );
  }
}