import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/widgets/long_button.dart';
import '../res/widgets/password_form_field.dart';
import '../res/widgets/textform_field.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;
  late ValueNotifier<bool> _obscureText;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _formKey = GlobalKey<FormState>();
    _obscureText = ValueNotifier<bool>(true);

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _obscureText.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Signup: Heading Widget Built');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Align(child: _signupPageUI()),
    );
  }

  Widget _signupPageUI() {
    return LayoutBuilder(
      builder: (context, cons) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: cons.maxWidth * 0.05),
          alignment: Alignment.center,
          height: cons.maxHeight * 0.60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _headingWidget(cons),
              _inputForm(cons),
              _longButton(cons, context),
              // _registerText()
            ],
          ),
        );
      },
    );
  }

  Widget _headingWidget(BoxConstraints cons) {
    return SizedBox(
      height: cons.maxHeight * 0.10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hey There!',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'Signup Now For Free',
            style: Theme.of(context).textTheme.headlineSmall,
          )
        ],
      ),
    );
  }

  Widget _inputForm(BoxConstraints cons) {
    return SizedBox(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            _emailTextField(),
            const SizedBox(
              height: 15,
            ),
            _passwordTextField(),
            const SizedBox(
              height: 15,
            ),
            _confirmPasswordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return MyTextFormField(
      controller: _emailController,
      labelText: 'Email',
      focusNode: _emailFocusNode,
      prefixIcon: const Icon(Icons.email),
      keyboardType: TextInputType.emailAddress,
      onSaved: (input) {
        debugPrint(_emailController.text);
      },
      onFieldSubmitted: (p0) => Utils.fieldFocusChange(
        context,
        _emailFocusNode,
        _passwordFocusNode,
      ),
    );
  }

  Widget _passwordTextField() {
    return PasswordFormField(
        obscureText: _obscureText,
        controller: _passwordController,
        focusNode: _passwordFocusNode,
        labelText: 'Password',
        onSaved: (input) {
          debugPrint(_passwordController.text);
        },
        onFieldSubmitted: (val) => Utils.fieldFocusChange(
              context,
              _passwordFocusNode,
              _confirmPasswordFocusNode,
            ));
  }

  Widget _confirmPasswordTextField() {
    return PasswordFormField(
      obscureText: _obscureText,
      controller: _confirmPasswordController,
      focusNode: _confirmPasswordFocusNode,
      labelText: 'Confirm Password',
      onSaved: (input) {
        debugPrint(_passwordController.text);
      },
    );
  }

  Widget _longButton(
    BoxConstraints cons,
    BuildContext context,
  ) {
    return Consumer<AuthViewModel>(builder: (context, provider, child) {
      return LongButton(
        height: cons.maxHeight * 0.06,
        backgroundColor: Colors.blueGrey,
        loading: provider.loading,
        onPressed: () {
          if (_emailController.text.isEmpty) {
            Utils.flushBarErrorMessage(context, 'Please Enter an Email');
          } else if (_passwordController.text.isEmpty) {
            Utils.flushBarErrorMessage(context, 'Please Enter a Password');
          } else if (_passwordController.text.length < 6) {
            Utils.flushBarErrorMessage(
                context, 'Password should be more than 6 characters');
          } else if (_confirmPasswordController.text.isEmpty) {
            Utils.flushBarErrorMessage(context, 'Please Confirm your Password');
          } else if (!_emailController.text.contains('@')) {
            Utils.flushBarErrorMessage(
                context, 'Please Enter a valid Email Address');
          } else if (_passwordController.text !=
              _confirmPasswordController.text) {
            Utils.flushBarErrorMessage(
                context, 'Passwords donot Match Try Again!');
          } else {
            //Login User
            Map data = {
              'email': _emailController.text,
              'password': _passwordController.text
            };
            _formKey.currentState!.save();
            provider.registerApi(data, context);
          }
        },
        text: 'SIGNUP',
      );
    });
  }
}
