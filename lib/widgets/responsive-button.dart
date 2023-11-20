import 'package:aptproj/misc/colors.dart';
import 'package:aptproj/widgets/small-text.dart';
import 'package:flutter/cupertino.dart';

class ResponsvieButton extends StatelessWidget{
  bool? isResponsive;
  double? width;
  ResponsvieButton({Key? key, this.width, this.isResponsive=false}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(text: "Booking Now",color: CupertinoColors.white,),
            // Image.asset("img/right-arrow.png"),
          ],
        ),
      ),
    );
  }
}
