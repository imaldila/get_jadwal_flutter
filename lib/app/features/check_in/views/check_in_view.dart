import 'package:flutter/material.dart';
import 'package:get_jadwal/configs/configs.dart';
import 'package:get_jadwal/constants/app_constants.dart';
import 'package:get_jadwal/utils/utils.dart';

import 'check_in_view_controller.dart';

class CheckInView extends StatefulWidget {
  const CheckInView({super.key});

  @override
  State<CheckInView> createState() => _CheckInViewState();
}

class _CheckInViewState extends State<CheckInView> {
  late TextEditingController _emailController;
  late CheckInViewController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _controller = CheckInViewController();
    _emailController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GetJadwal',
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 28,
                color: Palette.kWhite,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 10,
              margin: EdgeInsets.symmetric(
                  horizontal: sizeWidth(context) / 3.6, vertical: 54),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 48.0, horizontal: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Check In',
                        style: Theme.of(context).textTheme.headline2!,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Text(
                      'Email',
                      style: Theme.of(context).textTheme.bodyText1!,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _emailController,
                      style: Theme.of(context).textTheme.bodyText1!,
                      cursorColor: Palette.kDarkPink,
                      decoration: InputDecoration(
                        enabledBorder: primaryEnable,
                        border: primaryEnable,
                        focusedBorder: primaryFocused,
                        fillColor: Palette.kBackgroundColor,
                        filled: true,
                        isDense: true,
                        hintText: 'Masukan Email Anda',
                        errorStyle: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Palette.kWarning),
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Palette.kDarkGrey),
                      ),
                      validator: (v) => v!.isValidEmail()
                          ? null
                          : '❗ Format email tidak sesuai',
                    ),
                    const SizedBox(height: 22),
                    Opacity(
                      opacity: _controller.opacityColor(_emailController.text),
                      child: SizedBox(
                        height: 48,
                        width: sizeWidth(context),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate())  {
                              await _controller.postCheckIn(
                                  email: _emailController.text.trim());
                                  
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(47),
                            ),
                            backgroundColor: Palette.kDarkPink,
                          ),
                          child: Text(
                            'Mulai Sesi',
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      color: Palette.kWhite,
                                      fontSize: 12,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
