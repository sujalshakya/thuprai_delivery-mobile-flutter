import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:thuprai_delivery/base/common/validators.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/logo.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_button.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_textfield.dart';
import 'package:thuprai_delivery/ui/views/login/login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: Validators.validateEmail),
  FormTextField(name: "password", validator: Validators.validatePassword)
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: viewModel.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              SizedBox(
                height: 70.h,
              ),
              Logo(
                height: 150.h,
                width: 150.w,
              ),
              PrimaryTextfield(
                key: const Key('email'),
                prefix: const Icon(
                  Icons.mail,
                  size: 16,
                ),
                controller: emailController,
                obscure: false,
                hintText: "Email",
              ),
              if (viewModel.hasEmailValidationMessage) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    viewModel.emailValidationMessage!,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                )
              ],
              PrimaryTextfield(
                key: const Key('password'),
                obscure: viewModel.passwordVisible,
                suffix: GestureDetector(
                  onTap: () {
                    viewModel.suffixIconTap();
                  },
                  child: viewModel.suffixIcon,
                ),
                controller: passwordController,
                hintText: "Password",
                prefix: const Icon(
                  Icons.lock,
                  size: 16,
                ),
              ),
              if (viewModel.hasPasswordValidationMessage) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    viewModel.passwordValidationMessage!,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                )
              ],
              SizedBox(
                height: 10.h,
              ),
              PrimaryButton(
                key: const Key('login'),
                text: "Login",
                onTap: () {
                  viewModel.login(
                      emailController.text, passwordController.text);
                },
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PrimaryText(
                    text: "Forgot Password?",
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                )
              ]),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => viewModel.suffixIconTap());
    syncFormWithViewModel(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
