import 'package:carousel_slider/carousel_slider.dart';
import 'package:errand_app/common/component/duck_text.dart';
import 'package:errand_app/common/component/logo.dart';
import 'package:errand_app/common/const/colors.dart';
import 'package:errand_app/common/layout/default_layout.dart';
import 'package:errand_app/home/component/recent_request_card.dart';
import 'package:errand_app/request/model/request_model.dart';
import 'package:errand_app/request/view/request_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: AppBar(
        backgroundColor: WHITE,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: 12.r),
          child: Logo(
            fontSize: 24.sp,
          ),
        ),
        elevation: 0.0,
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 8.0.r,
          horizontal: 20.r,
        ),
        children: [
          const _Notice(),
          SizedBox(height: 20.0.h),
          _Event(),
          SizedBox(height: 20.0.h),
          const _SubmitButton(),
          SizedBox(height: 44.0.h),
          const _RecentMatchedRequest(),
          SizedBox(height: 30.0.h),
          const _HowToUse(),
        ],
      ),
    );
  }
}

class _Notice extends StatelessWidget {
  const _Notice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.0.r,
        vertical: 10.0.r,
      ),
      decoration: BoxDecoration(
        color: GREY100,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          DuckText(
            "공지",
            size: 13.0.sp,
            weight: FontWeight.w800,
          ),
          SizedBox(width: 10.0.w),
          Expanded(
            child: DuckText(
              "덕부름에 새로운 기능이 추가됐어요.",
              size: 13.0.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class _Event extends StatefulWidget {
  _Event({Key? key}) : super(key: key);

  @override
  State<_Event> createState() => _EventState();
}

class _EventState extends State<_Event> {
  final images = [1, 2, 3, 4];

  int currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172.h,
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentImageIndex = index;
                });
              },
              height: 172,
              aspectRatio: MediaQuery.of(context).size.aspectRatio,
              enableInfiniteScroll: true,
              viewportFraction: 1.0,
              autoPlay: false,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayCurve: Curves.easeIn,
              autoPlayAnimationDuration: Duration(milliseconds: 500),
            ),
            items: [
              _eventCard(),
              _eventCard(),
              _eventCard(),
              _eventCard(),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.r),
            alignment: FractionalOffset.bottomLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: images.map((i) {
                return Container(
                  width: 7,
                  height: 7,
                  margin:
                      EdgeInsets.symmetric(vertical: 16.0.r, horizontal: 4.0.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentImageIndex == images.indexOf(i)
                        ? Color(0xFFF8F8F8)
                        : Color(0xFFFFFFFF),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _eventCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF878787),
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/banner.png",
                ),
                fit: BoxFit.fitHeight,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dstATop),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 32.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DuckText(
                  "EVENT",
                  size: 18.0.sp,
                  weight: FontWeight.w300,
                  color: WHITE,
                ),
                DuckText(
                  "SEVENTEEN Photo",
                  size: 22.0.sp,
                  weight: FontWeight.w800,
                  color: WHITE,
                ),
                DuckText(
                  "지금 이벤트 참가하고 세븐틴 굿즈 받기",
                  size: 12.0.sp,
                  weight: FontWeight.w500,
                  color: WHITE,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18.0.r,
        vertical: 20.0.r,
      ),
      decoration: BoxDecoration(
        color: GREY900,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DuckText(
                  "심부름 신청하러 가기",
                  size: 16.0.sp,
                  weight: FontWeight.w800,
                  color: WHITE,
                ),
                DuckText(
                  "덕질 관련 심부름을 신청해 보세요!",
                  size: 14.0.sp,
                  color: WHITE,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 15.0.r,
              horizontal: 12.0.r,
            ),
            decoration: BoxDecoration(
              color: GREY700,
              shape: BoxShape.circle,
            ),
            child: Icon(
              CupertinoIcons.arrow_right,
              color: WHITE,
              size: 16.5.w,
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentMatchedRequest extends StatelessWidget {
  const _RecentMatchedRequest({Key? key}) : super(key: key);

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
        location: "서울시 광진구",
        more: 2,
      ),
    ];

    return Column(
      children: [
        _title(context),
        SizedBox(height: 14.0.h),
        //   SizedBox(
        //     height: 150.h,
        //     child: ListView(
        //       shrinkWrap: true,
        //       scrollDirection: Axis.horizontal,
        //       children: [
        //         RecentRequestCard(
        //             request: RequestModel(
        //                 price: 1,
        //                 errand: '팬싸 대리응모',
        //                 location: "서울시 광진구",
        //                 more: 2)),
        //         RecentRequestCard(
        //           request: RequestModel(
        //             price: 3,
        //             errand: '행사 대리줄서기',
        //             location: "서울시 광진구",
        //             priceColor: PURPLE100,
        //             priceTextColor: PURPLE800,
        //           ),
        //         ),
        //         RecentRequestCard(
        //           request: RequestModel(
        //             price: 5,
        //             errand: '앨범 대리구매',
        //             location: "서울시 마포구",
        //             more: 3,
        //             priceColor: PINK100,
        //             priceTextColor: PINK800,
        //           ),
        //         ),
        //         RecentRequestCard(
        //           request: RequestModel(
        //             price: 1,
        //             errand: '팬싸 대리응모',
        //             location: "서울시 광진구",
        //             more: 2,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),

        SizedBox(
          height: 150.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: requests.length,
            itemBuilder: (context, index) {
              return RecentRequestCard(
                request: requests[index],
              );
            },
          ),
        ),
      ],
    );
  }

  Row _title(
    BuildContext context,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: DuckText(
            "최근 매칭된 심부름",
            size: 16.0.sp,
            weight: FontWeight.w800,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RequestListPage(),
                ),
              );
            },
            child: Row(
              children: [
                DuckText(
                  "더보기",
                  color: GREY400,
                  size: 13.0.sp,
                ),
                SizedBox(width: 3.0.w),
                Icon(
                  Icons.arrow_forward_ios,
                  color: GREY400,
                  size: 13.0.sp,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _HowToUse extends StatelessWidget {
  const _HowToUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(19.0.r),
      decoration: BoxDecoration(
        color: Color(0xFFF7FFE7),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: Color(0xFFDBFFAC),
              shape: BoxShape.circle,
            ),
            child: DuckText(
              "Tip!",
              weight: FontWeight.w900,
              size: 16.0.sp,
              align: TextAlign.center,
            ),
          ),
          SizedBox(width: 17.0.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DuckText(
                  "덕부름 이용 방법",
                  size: 16.0.sp,
                  weight: FontWeight.w800,
                ),
                Row(
                  children: [
                    DuckText(
                      "덕부름의 이용 방법을 알아보세요!",
                      size: 13.0.sp,
                      color: GREY700,
                    ),
                    SizedBox(width: 3.0.w),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: GREY700,
                      size: 12.0.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
