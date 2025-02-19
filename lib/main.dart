import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:paylync/accounting_software_grid.dart';
import 'package:paylync/appcolors.dart';
import 'package:paylync/cardconnect_layout.dart';
import 'package:paylync/merchantdetail_form_layout.dart';
import 'package:paylync/payment_gateway.dart';
import 'package:paylync/subscription_plans.dart';
import 'package:paylync/util/app_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PayLync - Steps',
      theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.black, // Sets the cursor color
            selectionColor: Colors.grey, // Sets the selection color
            selectionHandleColor:
                Colors.green, // Sets the selection handle color
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.grey), // Hint text color
            labelStyle: TextStyle(color: Colors.blue), // Label text color
            floatingLabelStyle:
                TextStyle(color: Colors.red), // Floating label color
            border: InputBorder.none,
            filled: true, // Enables the fill color property
            fillColor: secondaryColor, // Sets the background color
          ),
          buttonTheme: ButtonThemeData(
              colorScheme: ColorScheme.dark(),
              shape: Border.fromBorderSide(BorderSide.none)),
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.white,
              onPrimary: Colors.black,
              secondary: Colors.black,
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black)),
      home: const StepScreen(),
    );
  }
}

class StepScreen extends StatefulWidget {
  const StepScreen({super.key});

  @override
  State<StepScreen> createState() => _StepScreenState();
}

class _StepScreenState extends State<StepScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  int currentStep = 7;

  void _onNextStep() {
    if (currentStep < 8) {
      setState(() {
        currentStep++;
      });
    }
  }

  void _onPreviousStep() {
    if (currentStep > 1) {
      setState(() {
        currentStep--;
      });
    }
  }

  Widget _buildStepContent() {
    switch (currentStep) {
      case 1:
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.26,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '1 → Enter your email address',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              EnterEmailLayout(emailController: _emailController),
              const SizedBox(height: 20),
              Row(
                children: [
                  appButton(name: "Ok"),
                  const SizedBox(width: 30),
                  const Text('Press Enter ↵',
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            ],
          ),
        );
      case 2:
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Column(
              textDirection: TextDirection.rtl,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  // color: Colors.amber,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '2 → Enter OTP received in email address',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 20),
                      OtpTextField(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        numberOfFields: 6,
                        cursorColor: Colors.black,
                        borderColor: Colors.black,
                        showFieldAsBox: true,
                        fieldWidth: 55,
                        obscureText: true,
                        textStyle: const TextStyle(color: Colors.black),
                        enabledBorderColor: secondaryColor,
                        focusedBorderColor: secondaryColor,
                        fillColor: secondaryColor,
                        filled: true,
                        borderWidth: 0,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.black,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor),
                          ),
                        ),
                        onCodeChanged: (String code) {},
                        onSubmit: (String verificationCode) {
                          _otpController.text = verificationCode;
                          _onNextStep();
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Resend code',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              decoration: TextDecoration.underline,
                              decorationThickness: 1,
                              height:
                                  1.5, // Adjusts vertical spacing between text and underline
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          appButton(name: "Ok"),
                          const SizedBox(width: 30),
                          const Text('Press Enter ↵',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      case 3:
        return SizedBox(
          width: mediaSize(context).width * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '2 → Merchant Details',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              MerchantDetailFormLayout(),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  appButton(name: "Ok"),
                  const SizedBox(width: 30),
                  const Text('Press Enter ↵',
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            ],
          ),
        );

      case 4:
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '3 → Select Accounting Software',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              AccountingSoftwareGrid(),
              const SizedBox(height: 10),
              Row(
                children: [
                  appButton(name: "Ok"),
                  const SizedBox(width: 30),
                  const Text('Press Enter ↵',
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            ],
          ),
        );
      case 5:
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '3 → Choose Plan',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              // AccountingSoftwareGrid(),
              SubscriptionPlans(),
              const SizedBox(height: 10),
              Row(
                children: [
                  appButton(name: "Ok"),
                  const SizedBox(width: 30),
                  const Text('Press Enter ↵',
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            ],
          ),
        );
      case 6:
        return SizedBox(
          // color: Colors.amber,
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '4 → Select Payment Gateway',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: PaymentGateway(),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  appButton(name: "Ok"),
                  const SizedBox(width: 30),
                  const Text('Press Enter ↵',
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            ],
          ),
        );

      case 7:
        return SizedBox(
          width: mediaSize(context).width * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '5 → CardConnect Gateway Information',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              CardConnectFormLayout(),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  appButton(name: "Ok"),
                  const SizedBox(width: 30),
                  const Text('Press Enter ↵',
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            ],
          ),
        );

      default:
        return const Center(child: Text('Step content not available'));
    }
  }

  GestureDetector appButton({String name = "Ok", VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Text(
          name,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'PayLync.',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Step $currentStep of 6',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    widthFactor: 3,
                    child: _buildStepContent(),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Row(
              children: [
                GestureDetector(
                  onTap: _onPreviousStep,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: const Icon(Icons.keyboard_arrow_up,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(width: 2),
                GestureDetector(
                  onTap: _onNextStep,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EnterEmailLayout extends StatelessWidget {
  const EnterEmailLayout({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: _emailController,
        decoration: const InputDecoration(
          hintText: 'Email address',
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.emailAddress,
        // onSubmitted: (_) => _onNextStep(),
      ),
    );
  }
}
