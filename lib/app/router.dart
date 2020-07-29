import 'package:auto_route/auto_route_annotations.dart';
import 'package:webeoapp/ui/views/home/home_view.dart';
import 'package:webeoapp/ui/views/login/login_view.dart';
import 'package:webeoapp/ui/views/welcome/welcome_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  WelcomeView welcomeViewRoute;
  LoginView loginViewRoute;
  HomeView homeViewRoute;
}
