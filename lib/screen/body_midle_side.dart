import 'package:desktop_app_test/model/report_model.dart';
import 'package:desktop_app_test/provider/carrier_provider.dart';
import 'package:desktop_app_test/provider/report_provider.dart';
import 'package:desktop_app_test/sevice/invoice_pdf_service.dart';
import 'package:desktop_app_test/widgets/column_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyMidleSide extends StatelessWidget {
  const BodyMidleSide({super.key});

  @override
  Widget build(BuildContext context) {
    final locationName = Provider.of<ReportProvider>(context).lacalName;
    print("object $locationName");
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LocationTable(),
        InvioceTable(),
        CarrierTable(),
      ],
    );
  }
}

class InvioceTable extends StatelessWidget {
  const InvioceTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final InvoicePdfService invoicePdfService = InvoicePdfService();
    final reports = Provider.of<ReportProvider>(context).reports;
    final totalAmount = Provider.of<ReportProvider>(context).totalAmount;
    final selectedInvoices =
        Provider.of<ReportProvider>(context).selectedInvoicesList;
    // final selectedCarrier = Provider.of<CarrierProvider>(context).carrierName;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () async {
                  final data = await invoicePdfService.generatePdf(context);
                  invoicePdfService.savePdffile('ivoice_pdf', data);
                },
                icon: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'assets/images/icons8-printer-50.png',
                        height: 25,
                      ),
                    ),
                    const Text(
                      'រក្សាទុកនិងបោះពុម្ភ',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 20),
              boldText('កាលបរិច្ឆេទ 03/09/2024'),
            ],
          ),
          DataTable(
            border: TableBorder.all(width: 0.5),
            columnSpacing: 40,
            columns: [
              const DataColumn(
                label: Checkbox(
                  value: false,
                  onChanged: null,
                ),
              ),
              DataColumn(
                label: boldText('លេខកូដអតិថិជន'),
              ),
              DataColumn(
                label: boldText('ឈ្មោះអតិថិជន'),
              ),
              DataColumn(
                label: boldText('កូដ'),
              ),
              DataColumn(
                label: boldText('ទឹកលុយ'),
              ),
              DataColumn(
                label: boldText('តំបន់'),
              ),
              DataColumn(
                label: boldText('ផ្សារ'),
              ),
              DataColumn(
                label: boldText('តូប'),
              )
            ],
            rows: rowData(context, reports),
          ),
          SizedBox(
            width: 750,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: boldText('របាយការប្រមូលលុយប្រចាំថ្ងៃ'),
                      ),
                      boldText('03/09/2024'),
                    ],
                  ),
                ),
                ListView.builder(
                  itemCount: selectedInvoices.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final invoice = selectedInvoices[index];
                    return Container(
                      padding: const EdgeInsets.only(bottom: 4),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(border: Border.all()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ColoumnContent(
                            content: 'ល.រ',
                            title: " ${index + 1}",
                          ),
                          ColoumnContent(
                            content: 'លេខកូដអតិថិជន',
                            title: invoice.id.toString(),
                          ),
                          ColoumnContent(
                            content: 'ឈ្មោះអតិថិជន',
                            title: invoice.cusName!,
                          ),
                          ColoumnContent(
                            content: 'តូប',
                            title: invoice.shop!,
                          ),
                          ColoumnContent(content: 'កូដ', title: invoice.code!),
                          const ColoumnContent(
                            content: 'ចាស់',
                            title: '0',
                          ),
                          ColoumnContent(
                            content: 'ថ្មី',
                            title: selectedInvoices.length.toString(),
                          ),
                          const ColoumnContent(
                            content: 'ដូរ',
                            title: '0',
                          ),
                          ColoumnContent(
                            content: 'ទឹកលុយ',
                            title: invoice.money.toString(),
                          ),
                          const ColoumnContent(
                            content: 'អីវ៉ាន់ត្រឡប់',
                            title: '',
                          ),
                          const ColoumnContent(
                            content: 'ផ្សេងៗ',
                            title: '',
                          ),
                          const ColoumnContent(
                            content: 'ចំនួនទូទាត់',
                            title: '',
                          ),
                          const ColoumnContent(
                            content: 'ថ្ងៃណាត់',
                            title: '',
                          )
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: boldText('Total: \$${totalAmount.toStringAsFixed(2)}'),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: boldText(selectedCarrier),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<DataRow> rowData(BuildContext context, List<ReportModel> reports) {
    return reports.map((report) {
      final isSelected =
          Provider.of<ReportProvider>(context).selectedInvoices[report.id] ??
              false;

      return DataRow(
        cells: [
          DataCell(
            Checkbox(
              value: isSelected,
              onChanged: (bool? value) {
                Provider.of<ReportProvider>(context, listen: false)
                    .toggleInvoiceSelection(report);
              },
            ),
          ),
          DataCell(
            Text(report.id.toString()),
          ),
          DataCell(
            Text(report.cusName!),
          ),
          DataCell(
            Text(report.code!),
          ),
          DataCell(
            Text(report.money.toString()),
          ),
          DataCell(
            Text(report.location!),
          ),
          DataCell(
            Text(report.mall!),
          ),
          DataCell(
            Text(report.shop!),
          ),
        ],
      );
    }).toList();
  }
}

class LocationTable extends StatelessWidget {
  const LocationTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      //columnSpacing: 0,
      border: TableBorder.all(width: 0.5),
      columnSpacing: 15,
      columns: [
        DataColumn(
          label: boldText(''),
        ),
        DataColumn(
          label: boldText('តំបន់'),
        ),
      ],
      rows: rowDataLocation(context),
    );
  }
}

List<DataRow> rowDataLocation(BuildContext context) {
  final selectedLocation = Provider.of<ReportProvider>(context).lacalName;

  return reportData.map((e) {
    final isSelected = e['location'] == selectedLocation;

    return DataRow(
      cells: [
        DataCell(
          Image.asset(
            'assets/images/icons8-where-100.png',
            height: 25,
          ),
        ),
        DataCell(
          onTap: () {
            Provider.of<ReportProvider>(context, listen: false).changeLocal(
                e['location'], List<ReportModel>.from(e['reports']));
          },
          // Apply color change based on selection
          Text(
            e['location'],
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }).toList();
}

Widget boldText(String? title) {
  return Text(
    title!,
    style: const TextStyle(fontWeight: FontWeight.bold),
  );
}

class CarrierTable extends StatelessWidget {
  const CarrierTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          height: 40,
          width: 270,
          child: const TextField(
            cursorHeight: 15,
            cursorWidth: 1.7,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
              ),
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(175, 158, 158, 158),
              ),
              hintText: 'ស្វែងរកឈ្មោះអ្នកដឹកជញ្ជូន',
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              fillColor: Color.fromARGB(88, 158, 158, 158),
              filled: true,
            ),
          ),
        ),
        DataTable(
          //columnSpacing: 0,
          border: TableBorder.all(width: 0.5),
          columnSpacing: 15,
          columns: columnHeadCarrier(),
          rows: rowDataCarrier(context),
        ),
      ],
    );
  }
}

List<DataColumn> columnHeadCarrier() {
  return [
    const DataColumn(label: Checkbox(value: false, onChanged: null)),
    DataColumn(
      label: boldText('ឈ្មោះអ្នកដឹកជញ្ជូន'),
    ),
    DataColumn(
      label: boldText('រូបភាព'),
    ),
  ];
}

List<DataRow> rowDataCarrier(BuildContext context) {
  final selectedCarrier = Provider.of<CarrierProvider>(context).carrierName;
  return carrierData.map((e) {
    final isSelected = e.title == selectedCarrier;

    return DataRow(
      cells: [
        DataCell(
          Checkbox(
            value: isSelected,
            onChanged: (value) {
              print("selectedCarrier ${selectedCarrier}");
              Provider.of<CarrierProvider>(context, listen: false)
                  .changeCarrier(e.title!);
            },
          ),
        ),
        DataCell(
          Text(e.title!),
        ),
        DataCell(
          Image.asset(
            e.img!,
            height: 25,
          ),
        ),
      ],
    );
  }).toList();
}
