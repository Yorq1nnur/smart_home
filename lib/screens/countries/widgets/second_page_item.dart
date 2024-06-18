import 'package:flutter/material.dart';
import 'package:smart_home/screens/countries/widgets/page_of_rich_text.dart';
import 'package:smart_home/utils/size.dart';

class SecondPageItem extends StatefulWidget {
  const SecondPageItem({super.key});

  @override
  State<SecondPageItem> createState() => _SecondPageItemState();
}

class _SecondPageItemState extends State<SecondPageItem> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        12.getH(),
        const PageOfRichText(
          firstText: 'Add ',
          secondText: 'Home ',
          thirdText: 'Name',
        ),
      ],
    );
  }
}
