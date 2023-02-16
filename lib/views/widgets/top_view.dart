import 'package:fakestore/utils/colors.dart';
import 'package:flutter/material.dart';

class TopView extends StatelessWidget {
  const TopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(6),
            topRight: const Radius.circular(6),
            bottomLeft: const Radius.circular(6),
            bottomRight: const Radius.circular(6)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0) // changes position of shadow
              ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      child: Text(
                        "Search...",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.tune_rounded,
                    size: 20.0, color: AppColors.alternativeColor),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
