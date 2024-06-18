import 'package:flutter/material.dart';
import 'package:smart_home/screens/countries/widgets/page_of_rich_text.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';

class SecondPageItem extends StatefulWidget {
  const SecondPageItem({super.key});

  @override
  State<SecondPageItem> createState() => _SecondPageItemState();
}

class _SecondPageItemState extends State<SecondPageItem> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    textEditingController.text = 'My Home';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        12.getH(),
        const PageOfRichText(
          firstText: 'Add ',
          secondText: 'Home ',
          thirdText: 'Name',
        ),
        Text(
          'Every smart home needs a name. What would you like to call yours?',
          style: AppTextStyle.urbanistW400.copyWith(
            fontSize: 18.w,
            color: AppColors.c616161,
          ),
          textAlign: TextAlign.center,
        ),
        28.getH(),
        TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.cFAFAFA,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.cFAFAFA,
                width: 1.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.cFAFAFA,
                width: 1.w,
              ),
            ),
          ),
        )
      ],
    );
  }
}
