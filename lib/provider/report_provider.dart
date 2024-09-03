import 'package:desktop_app_test/model/report_model.dart';
import 'package:flutter/material.dart';

class ReportProvider with ChangeNotifier {
  String _lacalName = '';
  List<ReportModel> _reports = [];
  Map<int, bool> _selectedInvoices = {};
  double _totalAmount = 0.0;

  String get lacalName => _lacalName;
  List<ReportModel> get reports => _reports;
  double get totalAmount => _totalAmount;
  Map<int, bool> get selectedInvoices => _selectedInvoices;
  List<ReportModel> get selectedInvoicesList {
    return _reports
        .where((report) => _selectedInvoices[report.id] == true)
        .toList();
  }

  void changeLocal(String newLocalName, List<ReportModel> reports) {
    _lacalName = newLocalName;
    _reports = reports;
    _selectedInvoices.clear();
    _totalAmount = 0.0;
    notifyListeners();
  }

  void toggleInvoiceSelection(ReportModel reportSelected) {
    print("reportSelected ${reportSelected.cusName}");
    // print(
    //     '_selectedInvoices.containsKey(id) && _selectedInvoices[id] ${_selectedInvoices.containsKey(id)} + ${_selectedInvoices[id]}');
    if (_selectedInvoices.containsKey(reportSelected.id) &&
        _selectedInvoices[reportSelected.id] == true) {
      _selectedInvoices[reportSelected.id!] = false;
      _totalAmount -= reportSelected.money!;
    } else {
      _selectedInvoices[reportSelected.id!] = true;
      _totalAmount += reportSelected.money!;
    }
    notifyListeners();
  }
}
