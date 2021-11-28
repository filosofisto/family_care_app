class Page {

  final int size;
  final int totalElements;
  final int totalPages;
  final int number;

  Page({
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.number
  });

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
        size: json['size'],
        totalElements: json['totalElements'],
        totalPages: json['totalPages'],
        number: json['number']
    );
  }
}