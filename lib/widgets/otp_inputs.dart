import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../configs/resources.dart';

class OTPInputs extends StatefulWidget {
  final Function(String? value) onChanged;
  const OTPInputs({super.key, required this.onChanged});

  @override
  State<OTPInputs> createState() => _OTPInputsState();
}

class _OTPInputsState extends State<OTPInputs> {
  List<int> otp = [-1, -1, -1, -1];
  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  Widget build(BuildContext context) {
    void changeOtp(int index, String value) {
      setState(() {
        otp[index] = value != "" ? int.parse(value) : -1;
      });

      if (value != "") {
        if (index != 3) {
          Future.delayed(const Duration(milliseconds: 20), () {
            focusNodes[index + 1].requestFocus();
          });
        }
      }

      if (value == "") {
        if (index != 0) {
          Future.delayed(const Duration(milliseconds: 20), () {
            focusNodes[index - 1].requestFocus();
          });
        }
      }

      if (!otp.contains(-1)) {
        String otpString = otp.join().toString();
        widget.onChanged(otpString);
      }
    }

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OTPInputItem(
            value: otp[0] < 0 ? "" : otp[0].toString(),
            focusNode: focusNodes[0],
            onChanged: (value) => {changeOtp(0, value)},
          ),
          OTPInputItem(
            value: otp[1] < 0 ? "" : otp[1].toString(),
            focusNode: focusNodes[1],
            onChanged: (value) => {changeOtp(1, value)},
          ),
          OTPInputItem(
            value: otp[2] < 0 ? "" : otp[2].toString(),
            focusNode: focusNodes[2],
            onChanged: (value) => {changeOtp(2, value)},
          ),
          OTPInputItem(
            value: otp[3] < 0 ? "" : otp[3].toString(),
            focusNode: focusNodes[3],
            onChanged: (value) => {changeOtp(3, value)},
          )
        ],
      ),
    );
  }
}

class OTPInputItem extends StatelessWidget {
  final Function(String)? onChanged;
  final String value;
  final FocusNode focusNode;
  const OTPInputItem(
      {super.key,
      this.onChanged,
      required this.value,
      required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 50,
      height: 50,
      child: TextField(
        maxLength: 1,
        maxLines: 1,
        focusNode: focusNode,
        controller: TextEditingController()..text = value,
        style:
            const TextStyle(color: AppColors.white, fontSize: 30, height: 0.8),
        onChanged: onChanged,
        textAlign: TextAlign.center,
        autofocus: true,
        textInputAction: TextInputAction.next,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        // showCursor: false,
        keyboardType: TextInputType.number,
        textAlignVertical: TextAlignVertical.center,
        decoration: const InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 3, color: AppColors.golden),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 3, color: AppColors.golden),
          ),
        ),
      ),
    );
  }
}
