// import 'package:flutter/widgets.dart';

// import '../../configs/resources.dart';

// class ChatMessage extends StatelessWidget {
//   final String messageType;
//   final String message;
//   const ChatMessage({super.key, required this.messageType, required this.message});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
//       child: Align(
//         alignment: (messageType == "receiver"
//             ? Alignment.topLeft
//             : Alignment.topRight),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: (messageType == "receiver"
//                 ? AppColors.gray
//                 : AppColors.linkBlue),
//           ),
//           padding: const EdgeInsets.all(16),
//           child: Text(
//             message,
//             style: AppTextStyles.regularBeVietnamPro16
//                 .copyWith(color: AppColors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }
