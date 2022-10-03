import 'package:errand_app/common/component/duck_text.dart';
import 'package:errand_app/common/const/colors.dart';
import 'package:errand_app/common/layout/default_layout.dart';
import 'package:errand_app/request/model/request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestListPage extends StatelessWidget {
  const RequestListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<RequestModel> requests = [
      RequestModel(price: 1, errand: '팬싸 대리응모', location: "서울시 광진구", more: 2),
      RequestModel(
        price: 3,
        errand: '행사 대리줄서기',
        location: "서울시 광진구",
        priceColor: PURPLE100,
        priceTextColor: PURPLE800,
      ),
      RequestModel(
        price: 5,
        errand: '앨범 대리구매',
        location: "서울시 마포구",
        more: 3,
        priceColor: PINK100,
        priceTextColor: PINK800,
      ),
      RequestModel(
        price: 1,
        errand: '팬싸 대리응모',
        location: "서울시 성동구",
        more: 2,
      ),
    ];
    return DefaultLayout(
      appBar: AppBar(
        backgroundColor: WHITE,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: GREY900,
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          iconSize: 20,
        ),
        title: DuckText(
          "심부름",
          size: 17.sp,
          weight: FontWeight.w800,
        ),
        elevation: 0.0,
      ),
      child: ListView.builder(
        padding: EdgeInsets.all(20.r),
        itemCount: requests.length,
        itemBuilder: (context, index) {
          return _RequestCard(request: requests[index]);
        },
      ),
    );
  }
}

class _RequestCard extends StatelessWidget {
  final RequestModel request;
  const _RequestCard({
    Key? key,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 23.0.r,
        vertical: 20.0.r,
      ),
      margin: EdgeInsets.only(bottom: 16.r),
      decoration: BoxDecoration(
        color: WHITE,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFBBC1D0).withOpacity(0.25),
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12.0),
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
                  borderRadius: BorderRadius.circular(16.0),
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
