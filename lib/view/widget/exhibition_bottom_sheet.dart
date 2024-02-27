// import 'dart:math' as math;
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:timelines/timelines.dart';

// final class ExhibitionBottomSheet extends StatefulWidget {
//   const ExhibitionBottomSheet({super.key});

//   @override
//   _ExhibitionBottomSheetState createState() => _ExhibitionBottomSheetState();
// }

// class _ExhibitionBottomSheetState extends State<ExhibitionBottomSheet>
//     with SingleTickerProviderStateMixin {
//   double minHeight = 120;
//   double iconStartSize = 80;
//   double iconEndSize = 120;
//   double iconStartMarginTop = 36;
//   double iconEndMarginTop = 80;
//   double iconsVerticalSpacing = 24;
//   double iconsHorizontalSpacing = 16;

//   late AnimationController _controller;

//   double get maxHeight => MediaQuery.of(context).size.height;

//   double get headerTopMargin =>
//       lerp(20, 20 + MediaQuery.of(context).padding.top);

//   double get headerFontSize => lerp(14, 24);

//   double get itemBorderRadius => lerp(8, 24);

//   double get iconLeftBorderRadius => itemBorderRadius;

//   double get iconRightBorderRadius => lerp(8, 0);

//   double get iconSize => lerp(iconStartSize, iconEndSize);

//   double iconTopMargin(int index) =>
//       lerp(iconStartMarginTop, iconEndMarginTop) + headerTopMargin;

//   double iconLeftMargin(int index) => lerp(0, 0);

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   double lerp(double min, double max) =>
//       lerpDouble(min, max, _controller.value)!;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         return Positioned(
//           height: lerp(minHeight, maxHeight),
//           left: 0,
//           right: 0,
//           bottom: 0,
//           child: GestureDetector(
//             onTap: _toggle,
//             onVerticalDragUpdate: _handleDragUpdate,
//             onVerticalDragEnd: _handleDragEnd,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 32),
//               decoration: const BoxDecoration(
//                 color: Color(0xFF162A49),
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
//               ),
//               child: Stack(
//                 children: <Widget>[
//                   const MenuButton(),
//                   SheetHeader(
//                     fontSize: headerFontSize,
//                     topMargin: headerTopMargin,
//                   ),
//                   // for (Event event in events)
//                   _buildFullItem(events.first),
//                   _buildIcon(events),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildIcon(List<Event> event) {
//     return Positioned(
//         height: 70,
//         width: 200,
//         top: iconTopMargin(0),
//         left: iconLeftMargin(0),
//         child: Timeline.tileBuilder(
//           scrollDirection: Axis.horizontal,
//           builder: TimelineTileBuilder.fromStyle(
//             contentsAlign: ContentsAlign.alternating,
//             contentsBuilder: (context, index) => Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Text('Timeline Event $index'),
//             ),
//             itemCount: 10,
//           ),
//         ));
//   }

//   Widget _buildFullItem(Event event) {
//     int index = events.indexOf(event);
//     return ExpandedEventItem(
//       topMargin: iconTopMargin(index),
//       leftMargin: iconLeftMargin(index),
//       height: iconSize,
//       isVisible: _controller.status == AnimationStatus.completed,
//       borderRadius: itemBorderRadius,
//       title: event.title,
//       date: event.date,
//     );
//   }

//   void _toggle() {
//     final bool isOpen = _controller.status == AnimationStatus.completed;
//     _controller.fling(velocity: isOpen ? -2 : 2);
//   }

//   void _handleDragUpdate(DragUpdateDetails details) {
//     _controller.value -= details.primaryDelta! / maxHeight;
//   }

//   void _handleDragEnd(DragEndDetails details) {
//     if (_controller.isAnimating ||
//         _controller.status == AnimationStatus.completed) return;

//     final double flingVelocity =
//         details.velocity.pixelsPerSecond.dy / maxHeight;
//     if (flingVelocity < 0.0) {
//       _controller.fling(velocity: math.max(2.0, -flingVelocity));
//     } else if (flingVelocity > 0.0)
//       _controller.fling(velocity: math.min(-2.0, -flingVelocity));
//     else
//       _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
//   }
// }

// class ExpandedEventItem extends StatelessWidget {
//   final double topMargin;
//   final double leftMargin;
//   final double height;
//   final bool isVisible;
//   final double borderRadius;
//   final String title;
//   final String date;

//   const ExpandedEventItem(
//       {super.key,
//       required this.topMargin,
//       required this.height,
//       required this.isVisible,
//       required this.borderRadius,
//       required this.title,
//       required this.date,
//       required this.leftMargin});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: topMargin,
//       left: leftMargin,
//       right: 0,
//       height: height,
//       child: AnimatedOpacity(
//         opacity: isVisible ? 1 : 0,
//         duration: const Duration(milliseconds: 200),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(borderRadius),
//             color: Colors.white,
//           ),
//           padding: EdgeInsets.only(left: height).add(const EdgeInsets.all(8)),
//           child: _buildContent(),
//         ),
//       ),
//     );
//   }

//   Widget _buildContent() {
//     return Text("İstanbul");
//   }
// }

// final List<Event> events = [
//   Event('steve-johnson.jpeg', 'Shenzhen GLOBAL DESIGN AWARD 2018', '4.20-30'),
//   Event('efe-kurnaz.jpg', 'Shenzhen GLOBAL DESIGN AWARD 2018', '4.20-30'),
//   Event('rodion-kutsaev.jpeg', 'Dawan District Guangdong Hong Kong', '4.28-31'),
// ];

// class Event {
//   final String assetName;
//   final String title;
//   final String date;

//   Event(this.assetName, this.title, this.date);
// }

// class SheetHeader extends StatelessWidget {
//   final double fontSize;
//   final double topMargin;

//   const SheetHeader(
//       {super.key, required this.fontSize, required this.topMargin});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: topMargin,
//       child: Text(
//         'Yol haritası',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: fontSize,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
// }

// class MenuButton extends StatelessWidget {
//   const MenuButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Positioned(
//       right: 0,
//       bottom: 24,
//       child: Icon(
//         Icons.menu,
//         color: Colors.white,
//         size: 28,
//       ),
//     );
//   }
// }
