import 'dart:io';
import 'dart:typed_data';
import 'package:desktop_app_test/provider/carrier_provider.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';
import 'package:desktop_app_test/provider/report_provider.dart';

class InvoicePdfService {
  InvoicePdfService();

  Future<Uint8List> generatePdf(BuildContext context) async {
    final selectedInvoices = Provider.of<ReportProvider>(context, listen: false)
        .selectedInvoicesList;
    final totalAmount =
        Provider.of<ReportProvider>(context, listen: false).totalAmount;
    final pdf = pw.Document();
    final selectedCarrier =
        Provider.of<CarrierProvider>(context, listen: false).carrierName;

    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(vertical: 30),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 8),
                    child: boldText('Invoice'),
                  ),
                  boldText('03/09/2024'),
                ],
              ),
            ),
            pw.ListView.builder(
              itemCount: selectedInvoices.length,
              itemBuilder: (context, index) {
                final invoice = selectedInvoices[index];
                return pw.Container(
                  padding: const pw.EdgeInsets.only(bottom: 4),
                  margin: const pw.EdgeInsets.only(bottom: 20),
                  decoration: pw.BoxDecoration(border: pw.Border.all()),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      coloumnContent('No', "${index + 1}"),
                      coloumnContent('CustomerID', invoice.id.toString()),
                      coloumnContent('Customer name', invoice.cusName ?? ''),
                      coloumnContent('Stall', invoice.shop ?? ''),
                      coloumnContent('Code', invoice.code!),
                      coloumnContent('Old', '0'),
                      coloumnContent('New', selectedInvoices.length.toString()),
                      coloumnContent('Change', '0'),
                      coloumnContent('Money', invoice.money.toString()),
                      coloumnContent('Return item', ''),
                      coloumnContent('Other', ''),
                      coloumnContent('Payment amount', ''),
                      coloumnContent('Date', ''),
                    ],
                  ),
                );
              },
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8.0),
              child: boldText('Subtotal: \$${totalAmount.toStringAsFixed(2)}'),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8.0),
              child: boldText('Carrier: $selectedCarrier'),
            ),
          ],
        );
      },
    ));

    return pdf.save();
  }

  Future<void> savePdffile(String fileName, Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    final filePath = "${output.path}/$fileName.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    await OpenFile.open(filePath);
  }

  pw.Widget boldText(String text) {
    return pw.Text(text, style: pw.TextStyle(fontWeight: pw.FontWeight.bold));
  }

  pw.Widget coloumnContent(String content, String title) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 4.0),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(content, style: const pw.TextStyle(fontSize: 8)),
          pw.Text(title, style: const pw.TextStyle(fontSize: 6)),
        ],
      ),
    );
  }
}
