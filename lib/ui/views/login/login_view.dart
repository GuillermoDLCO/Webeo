import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';

import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:webeoapp/res/pallete_color.dart';
import 'package:webeoapp/ui/views/login/login_viewmodel.dart';
import 'package:webeoapp/ui/widgets/buttons/action_button_custom.dart';
import 'package:webeoapp/ui/widgets/buttons/google_button.dart';
import 'package:webeoapp/ui/widgets/text_fields/text_field_custom.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
          ),
          backgroundColor: Colors.black,
          body: Container(
            height: double.infinity,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
              color: Colors.white,
            ),
            child: Form(
              key: model.formKey,
              child: _BodyLogin(),
            ),
          ),
        ),
      ),
    );
  }
}

class _BodyLogin extends HookViewModelWidget<LoginViewModel> {
  _BodyLogin({
    Key key,
  }) : super(key: key);
  @override
  Widget buildViewModelWidget(BuildContext context, LoginViewModel model) {
    final TextEditingController usernameController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFieldCustom(
              controller: usernameController,
              name: 'Email',
              theme: TextFormTheme.Dark,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextFieldCustom(
              controller: passwordController,
              name: 'Password',
              theme: TextFormTheme.Dark,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
            child: ActionButtonCustom(
              action: () {},
              label: 'Iniciar Sesión',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'O conéctate con',
              style: TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GoogleButton(action: () => model.signingGoogle()),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '¿No tienen una cuenta?',
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
                Material(
                  child: InkWell(
                    onTap: () => model.goToEnrollPage(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Regístrate',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
