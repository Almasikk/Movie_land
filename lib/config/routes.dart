import 'package:flutter/material.dart';
import 'package:vk_copy/bottom_bar/bottom_bar_widget.dart';
import '../UI/screens/login_screen.dart';
import '../app/app_bloc.dart';

List<Page> onGenerateAppViewPages(
   AppStatus state,
   List<Page<dynamic>> pages,
){
  switch(state) {
    case AppStatus.authenticated:
      return [CustomBottomBar.page()];
    case AppStatus.unauthenticated:
      return [LoginScreen.page()];
  }
}