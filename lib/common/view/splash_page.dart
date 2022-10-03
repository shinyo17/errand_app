import 'package:errand_app/common/component/logo.dart';
import 'package:errand_app/common/const/colors.dart';
import 'package:errand_app/common/layout/default_layout.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  static String get routeName => "splash";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      backgroundColor: BLUE100,
      child: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Logo(
                fontSize: 24.sp,
              ),
              SizedBox(height: 10.h),
              Text(
                "copyright © 2022 Team Milestone all rights reserved",
                style: TextStyle(
                  fontSize: 10.sp,
                  color: GREY500,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30.0.h),
              const CircularProgressIndicator(color: BLUE800),
            ],
          ),
        ),
      ),
    );
  }
}
