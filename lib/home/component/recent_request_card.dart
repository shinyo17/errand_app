import 'package:errand_app/common/component/duck_text.dart';
import 'package:errand_app/common/const/colors.dart';
import 'package:errand_app/request/model/request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentRequestCard extends StatelessWidget {
  final RequestModel request;
  const RecentRequestCard({
    Key? key,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 150.h,
      margin: EdgeInsets.only(right: 12.r),
      padding: EdgeInsets.symmetric(
        horizontal: 12.0.r,
        vertical: 14.0.r,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: GREY200,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 6.0.r,
              vertical: 5.0.r,
            ),
            decoration: BoxDecoration(
              color: request.priceColor,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: DuckText(
              "시급 ${request.price}만원",
              size: 11.sp,
              weight: FontWeight.w800,
              color: request.priceTextColor,
            ),
          ),
          SizedBox(height: 12.0.h),
          DuckText(
            request.location,
            size: 14.sp,
            weight: FontWeight.w800,
          ),
          SizedBox(height: 8.0.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(
                  8.0.r,
                ),
                decoration: BoxDecoration(
                  color: BLUE100,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: DuckText(
                  request.errand,
                  color: BLUE800,
                  size: 12.sp,
                  weight: FontWeight.w800,
                ),
              ),
              SizedBox(width: 3.0.w),
              request.more > 0
                  ? Container(
                      padding: EdgeInsets.all(6.0.r),
                      decoration: BoxDecoration(
                        color: BLUE800,
                        shape: BoxShape.circle,
                      ),
                      child: DuckText(
                        "+${request.more}",
                        color: WHITE,
                        size: 12.0.sp,
                        weight: FontWeight.w800,
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
          SizedBox(height: 10.0.h),
          DuckText(
            "8/6 오후 8:00",
            color: GREY400,
            size: 12.0.sp,
          ),
        ],
      ),
    );
  }
}
