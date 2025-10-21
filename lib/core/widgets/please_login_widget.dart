import 'package:easy_localization/easy_localization.dart';
import 'package:erp/core/extensions/navigation_extension.dart';
import 'package:erp/core/routing/routes_name.dart';
import 'package:erp/core/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PleaseLoginWidget extends StatelessWidget {
  const PleaseLoginWidget({super.key, required this.appBarTitle});
  final String appBarTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle.tr()),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButtonWidget(
              text: 'Please login',
              // text: 'pleaselogin'.tr(),
              width: MediaQuery.of(context).size.width * 0.7,
              margin: EdgeInsets.all(20.sp),
              onPressed: () {
                context.pushNamed(
                  Routes.loginScreen,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
