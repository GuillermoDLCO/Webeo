import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:webeoapp/app/locator.dart';
import 'package:webeoapp/app/router.gr.dart';
import 'package:webeoapp/services/google_sign_service.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final GoogleSign _googleSign = locator<GoogleSign>();
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // * Getters
  GlobalKey<FormState> get formKey => _formKey;

  // * Functions

  void goToEnrollPage() async {
    await _navigationService.navigateTo(Routes.loginViewRoute);
  }

  void signingGoogle() async{
    var user = await _googleSign.handleSignIn();
    if(user!=null){
      _navigationService.navigateTo(Routes.homeViewRoute);
    }
  }
}
