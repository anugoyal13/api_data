import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tab;
  const ResponsiveWidget({ required this.mobile,required this.tab});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints){
          if(constraints.maxWidth<768){
            return mobile;
          }
          else{
            return tab;
          }
        }


    );
  }}
