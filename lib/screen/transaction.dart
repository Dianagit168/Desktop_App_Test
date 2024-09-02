import 'package:desktop_app_test/model/expansion_model.dart';
import 'package:desktop_app_test/provider/content_provider.dart';
import 'package:desktop_app_test/screen/body_midle_side.dart';
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

class InvoiceFeat extends StatefulWidget {
  final String? image;
  final String? title;
  const InvoiceFeat({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  State<InvoiceFeat> createState() => _InvoiceFeatState();
}

class _InvoiceFeatState extends State<InvoiceFeat> {
  String? selectedCon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          widget.image == ''
              ? const SizedBox.shrink()
              : Image.asset(
                  widget.image!,
                  width: 25,
                  height: 25,
                ),
          TextButton(
            autofocus:
                selectedCon == widget.title, // i will change to used list
            onPressed: () {
              Provider.of<ContentProvider>(context, listen: false)
                  .changeContent(widget.title!);
              setState(() {
                selectedCon = widget.title!;
              });
            },
            child: Text(
              widget.title!,
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

class InvoiceBody extends StatefulWidget {
  const InvoiceBody({super.key});

  @override
  State<InvoiceBody> createState() => _InvoiceBodyState();
}

class _InvoiceBodyState extends State<InvoiceBody> {
  //final bool isClick = false;
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    String exContent = Provider.of<ContentProvider>(context).exContent!;
    return Container(
      // color: const Color.fromARGB(255, 205, 147, 166),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 700,
            width: 200,
            child: ExpansionTile(
              title: const Text('វិក័យប័ត្រ'),
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: invoicModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });

                        Provider.of<ContentProvider>(context, listen: false)
                            .changeContentEx(invoicModel[index].title!);
                        print(invoicModel[index].title);
                      },
                      child: ListTile(
                        selected: selectedIndex == index,
                        title: Text(invoicModel[index].title!),
                        leading: Image.asset(
                          invoicModel[index].img!,
                          height: 30,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          exContent == 'បែងចែកវិក័យប័ត្រ'
              ? const BodyMidleSide()
              : Text(exContent),
        ],
      ),
    );
  }
}
