import 'dart:io';

import 'package:fixit/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePictureEdit extends StatefulWidget {
  const ProfilePictureEdit({
    super.key,
    this.picture,
    required this.onTap,
  });

  final File? picture;
  final Function() onTap;

  @override
  State<ProfilePictureEdit> createState() => _ProfilePictureEditState();
}

class _ProfilePictureEditState extends State<ProfilePictureEdit> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150.w,
        child: Stack(
          children: [
            CircleAvatar(
              radius: Dimens.space70,
              backgroundColor: Theme.of(context).hintColor,
              child: CircleAvatar(
                radius: Dimens.space70 - Dimens.space4,
                backgroundImage:
                    widget.picture == null ? null : FileImage(widget.picture!),
              ),
            ),
            Positioned(
              top: 110.w,
              left: 100.w,
              child: InkWell(
                onTap: widget.onTap,
                child: Container(
                  height: Dimens.space30,
                  width: Dimens.space30,
                  decoration: BoxDecoration(
                    color: Theme.of(context).extension<MyAppColors>()!.blue,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: Dimens.space16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
