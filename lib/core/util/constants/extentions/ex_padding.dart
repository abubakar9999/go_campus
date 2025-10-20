import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_campus/core/util/constants/my_dimention.dart';

// padding extension

Widget gapY(double pt) => SizedBox(height: pt.h);
Widget gapX(double pt) => SizedBox(width: pt.w);

extension PaddingExtension on Widget {
  Widget padAll({double? val}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:  val?.h ?? MyDimension.padAll, horizontal: val?.w ?? MyDimension.padAll),
      child: this,
    );
  }

  Widget padX({double? val}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: val?.w ?? MyDimension.padX),
      child: this,
    );
  }

  Widget padY({double? val}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: val?.h ?? MyDimension.padY),
      child: this,
    );
  }

  Widget padOT({double? val}) {
    return Padding(
      padding: EdgeInsets.only(top: val?.h ?? MyDimension.padT),
      child: this,
    );
  }

  Widget padOL({double? val}) {
    return Padding(
      padding: EdgeInsets.only(left: val?.w ?? MyDimension.padL),
      child: this,
    );
  }

  Widget padOR({double? val}) {
    return Padding(
      padding: EdgeInsets.only(right: val?.w ?? MyDimension.padR),
      child: this,
    );
  }

  Widget padOB({double? val}) {
    return Padding(
      padding: EdgeInsets.only(bottom: val?.h ?? MyDimension.padB),
      child: this,
    );
  }
}


Widget spaceX({double? val}){
  return SizedBox(
    width: val?.w??10.h,
  );
}
Widget spaceY({double? val}){
  return SizedBox(
    height: val?.h ?? 10.h,
  );
}

extension WidgetSliverBox on Widget{
  Widget get asSliverBox => SliverToBoxAdapter(child: this);
}