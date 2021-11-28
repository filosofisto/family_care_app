import 'package:family_care_app/model/Page.dart';
import 'package:family_care_app/model/links.dart';
import 'package:family_care_app/model/medicine.dart';

class MedicineOutputData {
  final MedicineEmbedded embedded;

  MedicineOutputData(this.embedded);

  factory MedicineOutputData.fromJson(Map<String, dynamic> json) {
    return MedicineOutputData(MedicineEmbedded.fromJson(json));
  }
}

class MedicineEmbedded {

  final List<Medicine> medicineTOList;
  final Links links;
  final Page page;

  MedicineEmbedded({required this.medicineTOList, required this.links, required this.page});

  factory MedicineEmbedded.fromJson(Map<String, dynamic> json) {
    return MedicineEmbedded(
        medicineTOList: MedicineList.fromJson(json['_embedded']['medicineTOList']).medicines,
        links: Links.fromJson(json['_links']),
        page: Page.fromJson(json['page']));
  }
}