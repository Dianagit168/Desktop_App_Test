import 'package:desktop_app_test/provider/content_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    String bodyContent =
        Provider.of<ContentProvider>(context).content.toString();
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            color: const Color.fromARGB(125, 158, 158, 158),
            child: const Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  imageL: 'assets/images/icons8-invoice-48.png',
                  imageR: 'assets/images/icons8-invoice-64.png',
                  titleL: 'ចេញវិក័យប័ត្រ',
                  titleR: 'ទូទាត់វិក័យប័ត្រ',
                  subTitle: 'ទូទាត់ប្រចាំថ្ងៃ',
                ),
                Card(
                  imageL: 'assets/images/icons8-upload-64.png',
                  imageR: 'assets/images/icons8-check-48.png',
                  titleL: 'ការដាក់ស្នើរប្រចាំថ្ងៃ',
                  titleR: 'ត្រួតពិនិតការដាក់ស្នើរប្រចាំថ្ងៃ',
                  subTitle: 'ដាក់ស្នើរ',
                ),
                Card(
                  imageL: 'assets/images/icons8-window-search-100.png',
                  imageR: '',
                  titleL: 'ផ្ទៀងផ្តាត់វិក័យប័ត្រ',
                  titleR: '',
                  subTitle: 'សវនកម្ម',
                ),
              ],
            ),
          ),
          bodyContent == 'ចេញវិក័យប័ត្រ'
              ? const InvoiceBody()
              : Text(bodyContent),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String? imageL;
  final String? titleL;
  final String? imageR;
  final String? titleR;
  final String? subTitle;
  const Card({
    super.key,
    this.imageL,
    this.titleL,
    this.imageR,
    this.titleR,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 110,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InvoiceFeat(image: imageL!, title: titleL!),
              InvoiceFeat(image: imageR!, title: titleR!),
            ],
          ),
          Text(
            subTitle!,
            style: const TextStyle(
                fontFamily: 'DAUNPENH',
                fontWeight: FontWeight.w600,
                fontSize: 21),
          ),
        ],
      ),
    );
  }
}

class InvoiceFeat extends StatelessWidget {
  final String? image;
  final String? title;
  const InvoiceFeat({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          image == ''
              ? const SizedBox.shrink()
              : Image.asset(
                  image!,
                  width: 25,
                  height: 25,
                ),
          TextButton(
            onPressed: () {
              Provider.of<ContentProvider>(context, listen: false)
                  .changeContent(title!);
            },
            child: Text(
              title!,
              style: const TextStyle(
                  fontFamily: 'DAUNPENH',
                  color: Color.fromARGB(255, 9, 100, 173),
                  fontWeight: FontWeight.w600,
                  fontSize: 21),
            ),
          ),
        ],
      ),
    );
  }
}

class InvoiceBody extends StatelessWidget {
  const InvoiceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color.fromARGB(255, 205, 147, 166),
      child: Row(
        children: [
          Container(
            height: 700,
            width: 300,
            color: Colors.amber,
            child: ExpansionTile(
              title: const Text('ExpansionTile 1'),
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 50,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      //selected: true,
                      title: Text('This is tile number $index'),
                      leading:
                          Image.asset('assets/images/icons8-invoice-64.png'),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
