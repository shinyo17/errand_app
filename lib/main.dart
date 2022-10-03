import 'package:errand_app/common/const/colors.dart';
import 'package:errand_app/common/const/fonts.dart';
import 'package:errand_app/common/view/root_tab.dart';
import 'package:errand_app/common/view/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    const ProviderScope(
      child: _App(),
    ),
  );
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: "덕부름",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: false,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: BLUE800,
              // secondary: SECONDARY_COLOR,
            ),
            fontFamily: PRETENDARD,
            backgroundColor: WHITE,
            dialogBackgroundColor: WHITE,
            scaffoldBackgroundColor: WHITE,
          ),
          darkTheme: ThemeData(
            useMaterial3: false,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: BLUE800,
              // secondary: SECONDARY_COLOR,
            ),
            fontFamily: PRETENDARD,
            backgroundColor: WHITE,
            dialogBackgroundColor: WHITE,
            scaffoldBackgroundColor: WHITE,
          ),
          themeMode: ThemeMode.light,
          home: RootTab(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ko', 'KR'),
          ],
          locale: const Locale('ko'),
        );
      },
    );
  }
}
