import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:scheduler/views/constants/constants.dart';
import 'package:scheduler/views/widgets/app_scaffold.dart';

//
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginScreen extends StatefulWidget {
  //
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool rememberMe = false;

  void _onSubmitForm() {
    // validate form first

    if (!_formKey.currentState!.saveAndValidate()) {
      return;
    }
  }

  //
  void _onForgetPassword() {
    // TODO: add Forget Password handler
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      useSafeArea: false,
      child: Stack(
        children: [
          // TOP wave decoration - bottom layer
          SizedBox(
            width: 1.sw,
            height: 500.h,
            child: const CustomPaint(
              painter: _TopWaveDecoration(
                fillColor: AppColors.primaryLight2,
              ),
            ),
          ),

          // TOP wave decoration
          SizedBox(
            width: 1.sw,
            height: 400.h,
            child: const CustomPaint(
              painter: _TopWaveDecoration(
                fillColor: AppColors.primaryLight,
              ),
            ),
          ),

          // App name & logo
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Column(
                  children: [
                    // app name
                    Text(
                      'Daily Flow',
                      style: AppTextStyle.textStyle22.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //
                    20.h.verticalSpace,

                    // app logo
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
          ),

          Align(
            child: Container(
              height: 0.5.sh,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Email Input
                    _fieldLabel(label: "Email"),

                    //
                    8.h.verticalSpace,

                    // email input
                    _inputField(
                      name: 'email',
                      hint: 'Enter your email',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),

                    //
                    16.h.verticalSpace,

                    // Password Input
                    _fieldLabel(label: "Password"),

                    //
                    8.h.verticalSpace,

                    // password
                    _inputField(
                      name: 'password',
                      hint: 'Enter your password',
                      obscureText: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),

                    //
                    16.h.verticalSpace,

                    // Remember Me and Forgot Password Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            //
                            StatefulBuilder(
                              builder: (context, setState) {
                                return Checkbox(
                                  value: rememberMe,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.sp),
                                  ),
                                  activeColor: AppColors.primary,
                                  checkColor: Colors.white,
                                  side: const BorderSide(
                                      color: AppColors.primary),
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        rememberMe = !rememberMe;
                                      },
                                    );
                                  },
                                );
                              },
                            ),

                            _fieldLabel(label: "Remember me"),
                          ],
                        ),

                        //
                        TextButton(
                          onPressed: _onForgetPassword,
                          child: Text(
                            "Forgot Password?",
                            style: AppTextStyle.textStyle12.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),

                    //
                    16.h.verticalSpace,

                    // Sign In Button
                    ElevatedButton(
                      onPressed: _onSubmitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      child: Text(
                        "Sign In",
                        style: AppTextStyle.textStyle16.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fieldLabel({
    required String label,
  }) {
    return Text(
      label,
      style: AppTextStyle.textStyle14.copyWith(
        color: AppColors.black,
      ),
    );
  }

  Widget _inputField({
    required String name,
    bool obscureText = false,
    String? hint,
    String? Function(String?)? validator,
  }) {
    return FormBuilderTextField(
      name: name,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide.none,
        ),
        fillColor: AppColors.lightGray,
        filled: true,
        hintText: hint,
        hintStyle: AppTextStyle.textStyle12.copyWith(
          color: AppColors.lightGray2,
        ),
      ),
      validator: validator,
    );
  }
}

class _TopWaveDecoration extends CustomPainter {
  final Color fillColor;

  const _TopWaveDecoration({
    required this.fillColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width * 0.9949109, size.height * 0.2948945);
    path_0.quadraticBezierTo(size.width * 0.8107379, size.height * 0.2733451,
        size.width * 0.7357252, size.height * 0.2709038);
    path_0.cubicTo(
        size.width * 0.6503053,
        size.height * 0.2650000,
        size.width * 0.3179898,
        size.height * 0.2618897,
        size.width * 0.2307888,
        size.height * 0.2702817);
    path_0.quadraticBezierTo(size.width * 0.1624682, size.height * 0.2730164,
        size.width * -0.0000000, size.height * 0.2948945);

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = fillColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
