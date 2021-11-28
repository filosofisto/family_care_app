class MedicineEditDataInput {

  final String id;
  final String name;
  final String userEmail;
  final String? image;

  MedicineEditDataInput({required this.id, required this.name, required this.userEmail, this.image});
}