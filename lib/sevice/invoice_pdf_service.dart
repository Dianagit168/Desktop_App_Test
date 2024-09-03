import 'dart:io';
import 'dart:typed_data';
import 'package:desktop_app_test/provider/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

class InvoicePdfService {
  InvoicePdfService();

  Future<Uint8List> generatePdf(BuildContext context) async {
    final selectedInvoices = Provider.of<ReportProvider>(context, listen: false)
        .selectedInvoicesList;
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.ListView.builder(
          itemCount: selectedInvoices.length,
          itemBuilder: (context, index) {
            final invoice = selectedInvoices[index];
            return pw.Padding(
              padding: const pw.EdgeInsets.all(8.0),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Invoice ID: ${invoice.id}',
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold)),
                  pw.Text('Amount: \$${invoice.money}',
                      style: const pw.TextStyle(fontSize: 16)),
                  pw.Text('Customer: ${invoice.cusName}',
                      style: const pw.TextStyle(fontSize: 14)),
                  pw.Text('Market: ${invoice.mall}',
                      style: const pw.TextStyle(fontSize: 14)),
                  pw.Divider(),
                ],
              ),
            );
          },
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
}
