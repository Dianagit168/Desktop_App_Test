import 'package:desktop_app_test/model/expansion_model.dart';

class ReportDetail {
  final String? location;
  final ReportModel? reportModel;

  ReportDetail({required this.location, required this.reportModel});
}

class ReportModel {
  final int? id;
  final String? cusName;
  final String? code;
  final double? money;
  final String? location;
  final String? mall;
  final String? shop;

  ReportModel({
    required this.id,
    required this.cusName,
    required this.code,
    required this.money,
    required this.location,
    required this.mall,
    required this.shop,
  });
}

List<Map<String, dynamic>> reportData = [
  {
    'location': 'វ៉េងស្រេង',
    'reports': [
      ReportModel(
          id: 001,
          cusName: 'Dyna',
          code: 'Xcode',
          money: 100,
          location: 'PP',
          mall: 'Kmall',
          shop: 'll110'),
      ReportModel(
          id: 002,
          cusName: 'Dany',
          code: 'Xcode',
          money: 50,
          location: 'PP',
          mall: 'Kmall',
          shop: 'll110'),
    ],
  },
  {
    'location': 'ក្រចេះ',
    'reports': [],
  },
  {
    'location': 'ស្ទឹងត្រែង',
    'reports': [],
  },
  {
    'location': 'រតនះគិរី',
    'reports': [],
  },
  {
    'location': 'តាខ្មៅ',
    'reports': [],
  },
  {
    'location': 'ពោធិ៏ចិនតុង',
    'reports': [],
  },
  {
    'location': 'សាំហាន់',
    'reports': [],
  },
  {
    'location': 'កំពង់ចាម​និងកំពង់ស្ពឺ',
    'reports': [],
  },
  {
    'location': 'កំពង់សោម',
    'reports': [],
  },
  {
    'location': ' សៀមរាបនិងបាត់ដំបងជាយក្រុង',
    'reports': [],
  },
  {
    'location': 'ជាយក្រុង',
    'reports': [],
  },
];

List<ExpansionModel> carrierData = [
  ExpansionModel(
      img: 'assets/images/icons8-user-100.png', title: 'kh developer'),
  ExpansionModel(img: 'assets/images/icons8-user-100.png', title: 'ម៉េង'),
  ExpansionModel(img: 'assets/images/icons8-user-100.png', title: '​និត'),
  ExpansionModel(img: 'assets/images/icons8-user-100.png', title: 'admin sale'),
  ExpansionModel(
      img: 'assets/images/icons8-user-100.png', title: 'កើត​​​ វឌ្ឍនះ'),
  ExpansionModel(img: 'assets/images/icons8-user-100.png', title: 'ម៉េត រស្មី'),
  ExpansionModel(
      img: 'assets/images/icons8-user-100.png', title: 'សេង សុវណ្ណារ៉ា'),
  ExpansionModel(img: 'assets/images/icons8-user-100.png', title: 'ណាវីន'),
  ExpansionModel(img: 'assets/images/icons8-user-100.png', title: 'ភារម្យ'),
  ExpansionModel(img: 'assets/images/icons8-user-100.png', title: 'ឡៃ ហៀង'),
  ExpansionModel(img: 'assets/images/icons8-user-100.png', title: 'អូច ពៅ'),
  ExpansionModel(
      img: 'assets/images/icons8-user-100.png', title: 'ឌឿន ខេមរ័តន'),
  ExpansionModel(
      img: 'assets/images/icons8-user-100.png', title: 'ដែក​ សិដារ៉េ'),
  ExpansionModel(img: 'assets/images/icons8-user-100.png', title: 'ផុន ឌីណា'),
  ExpansionModel(
      img: 'assets/images/icons8-user-100.png', title: 'ហៀង វណ្ណឌឿន​'),
  ExpansionModel(img: 'assets/images/icons8-user-100.png', title: 'សាក ៩'),
];
