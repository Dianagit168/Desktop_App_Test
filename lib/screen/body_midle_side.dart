import 'package:desktop_app_test/home_screen.dart';
import 'package:desktop_app_test/model/report_model.dart';
import 'package:desktop_app_test/provider/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyMidleSide extends StatelessWidget {
  const BodyMidleSide({super.key});

  @override
  Widget build(BuildContext context) {
    final locationName = Provider.of<ReportProvider>(context).lacalName;
    print("object $locationName");
    return const Column(
      // mainAxisAlignment: MainAxisAlignment,
      children: [
        Text('Row of print btn'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LocationTable(),
            InvioceTable(),
            CarrierTable(),
          ],
        ),
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
    final reports = Provider.of<ReportProvider>(context).reports;
    final totalAmount = Provider.of<ReportProvider>(context).totalAmount;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total: \$${totalAmount.toStringAsFixed(2)}'),
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
                    .toggleInvoiceSelection(report.id!, report.money!);
                print('report.id ${report.id}');
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
          rows: rowDataCarrier(),
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

List<DataRow> rowDataCarrier() {
  return carrierData.map((e) {
    return DataRow(
      cells: [
        const DataCell(
          Checkbox(
            value: false,
            onChanged: null,
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
