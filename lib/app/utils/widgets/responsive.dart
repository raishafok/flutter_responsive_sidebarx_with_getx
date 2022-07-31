import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Responsive extends StatelessWidget{
   final Widget mobile;
  final Widget? tablet;
  final Widget? watch;
  final Widget? desktop;

  const Responsive({super.key,  required this.mobile, this.tablet,  this.desktop, this.watch});
  @override
  Widget build(BuildContext context) {

    

   return context.responsiveValue(mobile: mobile,tablet: tablet,desktop: desktop,watch: watch);
       
   
  }

}