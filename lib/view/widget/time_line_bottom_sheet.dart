// import 'package:flutter/material.dart';
// import 'package:timelines/timelines.dart';

// class TimeLineBottomSheet extends StatelessWidget {
//   TimeLineBottomSheet({super.key});

//   DraggableScrollableController draggableScrollableController =
//       DraggableScrollableController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(20),
//                     topLeft: Radius.circular(20)), // <-- Radius
//               ),
//               fixedSize: Size(MediaQuery.of(context).size.width, 34)),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Container(
//             margin: EdgeInsets.all(12.0),
//             height: 10,
//             width: 50,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: MediaQuery.sizeOf(context).width,
//           height: 50,
//           child: Timeline.tileBuilder(
//             scrollDirection: Axis.horizontal,
//             builder: TimelineTileBuilder.fromStyle(
//               contentsAlign: ContentsAlign.alternating,
//               contentsBuilder: (context, index) => Padding(
//                 padding: const EdgeInsets.all(24.0),
//                 child: Text('Timeline Event $index'),
//               ),
//               itemCount: 10,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
