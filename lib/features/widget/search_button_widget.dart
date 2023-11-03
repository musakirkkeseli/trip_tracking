import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_tracking/features/provider/managment.dart';
import 'package:trip_tracking/features/utlility/constants_string.dart';

class SearchButtonWidget extends StatelessWidget {
  const SearchButtonWidget({super.key, this.isAutoFocus});

  final bool? isAutoFocus;

  @override
  Widget build(BuildContext context) {
    return Consumer<Managment>(
      builder: (context, managment, child) {
        return Container(
          padding: const EdgeInsets.all(6),
          width: MediaQuery.sizeOf(context).width * .8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35.0),
            boxShadow: const [
              BoxShadow(offset: Offset(0, 2), blurRadius: 7, color: Colors.grey)
            ],
          ),
          child: TextField(
            autofocus: isAutoFocus ?? false,
            controller: managment.controller,
            onChanged: (value) {
              Provider.of<Managment>(context, listen: false).onChanged(value);
            },
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.purple[900],
                hintText: ConstantsString.searchHintText,
                hintStyle: TextStyle(color: Colors.purple[900]),
                border: InputBorder.none),
          ),
        );
      },
    );
  }
}
