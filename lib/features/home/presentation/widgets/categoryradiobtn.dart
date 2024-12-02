import 'package:admingrocerypanel/core/utils/appstrings.dart';
import 'package:admingrocerypanel/core/utils/appstyles.dart';
import 'package:flutter/material.dart';

class CatgoryRadioBtn extends StatefulWidget {
  const CatgoryRadioBtn(
      {super.key, required this.onchanged, required this.ispiece});
  final ValueChanged<int> onchanged;
  final int ispiece;

  @override
  State<CatgoryRadioBtn> createState() => _CatgoryRadioBtnState();
}

class _CatgoryRadioBtnState extends State<CatgoryRadioBtn> {
  int groupValue = 0;
  @override
  void initState() {
    groupValue = widget.ispiece;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.piece,
          style: AppStyles.style15,
        ),
        Radio(
          activeColor: Colors.green,
          value: 1,
          groupValue: groupValue,
          onChanged: (value) {
            setState(
              () {
                groupValue = value!;
              },
            );
            widget.onchanged(groupValue);
          },
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          AppStrings.kg,
          style: AppStyles.style15,
        ),
        Radio(
          activeColor: Colors.green,
          value: 0,
          groupValue: groupValue,
          onChanged: (value) {
            setState(
              () {
                groupValue = value!;
              },
            );
            widget.onchanged(groupValue);
          },
        )
      ],
    );
  }
}
