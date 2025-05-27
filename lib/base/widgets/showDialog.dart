import 'package:GoTravel/base/res/Style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

Future<void> showCustomDialog(BuildContext context, String title, String content) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
          title,
          style: AppStyle.headTextSmall,
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            content,
          style: AppStyle.headTextSmaller,
        ),
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              AppLocalizations.of(context)!.close,
              style: AppStyle.headTextSmaller.copyWith(
                color: Colors.white
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
