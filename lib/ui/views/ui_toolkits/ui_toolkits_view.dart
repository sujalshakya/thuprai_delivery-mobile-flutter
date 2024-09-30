import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:thuprai_delivery/base/ui_toolkits/label_text.dart';
import 'package:thuprai_delivery/base/ui_toolkits/logo.dart';
import 'package:thuprai_delivery/base/ui_toolkits/order.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_appbar.dart';
import 'package:thuprai_delivery/base/ui_toolkits/secondary_button.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_button.dart';
import 'package:thuprai_delivery/base/ui_toolkits/primary_textfield.dart';
import 'package:thuprai_delivery/base/ui_toolkits/title_text.dart';
import 'package:thuprai_delivery/ui/views/ui_toolkits/ui_toolkits_view.form.dart';

import 'ui_toolkits_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'name'),
])
class UiToolkitsView extends StackedView<UiToolkitsViewModel>
    with $UiToolkitsView {
  const UiToolkitsView({Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    UiToolkitsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,

        /// AppBar
        appBar: const PrimaryAppBar(
          title: "UI Toolkit",
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              /// Logo
              const Logo(height: 150, width: 150),

              /// Title Text
              const TitleText(text: "Title text."),

              /// Primary TextField with only required fields
              PrimaryTextfield(controller: nameController, obscure: false),

              /// Body Text
              PrimaryText(
                text: "primary text",
                align: TextAlign.center,
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w300,
                maxLines: 2,
              ),

              /// Primary TextField with all fields.
              PrimaryTextfield(
                obscure: viewModel.passwordVisible,
                suffix: GestureDetector(
                  onTap: () {
                    viewModel.suffixIconTap();
                  },
                  child: viewModel.suffixIcon,
                ),
                controller: nameController,
                hintText: "Password",
                prefix: const Icon(
                  Icons.lock,
                  size: 16,
                ),
              ),

              /// Outline button
              SecondaryButton(
                width: 100.w,
                text: 'Sec Button',
                onTap: () {},
              ),

              /// Primary Button
              PrimaryButton(
                text: "Button",
                onTap: () {},
              ),

              const OrderListtile(
                  orderId: "9182293",
                  paid: false,
                  payment: "999",
                  address1: "Lalitpur",
                  address2: "sinchahit",
                  name: "Sujal")
            ],
          ),
        )));
  }

  @override
  void onViewModelReady(UiToolkitsViewModel viewModel) =>
      SchedulerBinding.instance
          .addPostFrameCallback((timeStamp) => viewModel.suffixIconTap());
  @override
  UiToolkitsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UiToolkitsViewModel();
}
