import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2A2F4F),
      child: const Center(
          child: SpinKitCubeGrid(
        color: Color(0xffE5BEEC),
        size: 50.0,
      )),
    );
  }
}
