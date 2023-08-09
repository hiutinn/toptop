import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAnimatedBottomBar extends StatelessWidget {
  const CustomAnimatedBottomBar({
    Key? key,
    required this.selectedScreenIndex,
    required this.onItemTap,
  }) : super(key: key);

  final int selectedScreenIndex;
  final Function onItemTap;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontSize: 11, fontWeight: FontWeight.w600);
    var barHeight = MediaQuery.sizeOf(context).height * 0.06;
    return BottomAppBar(
      child: Container(
        color: selectedScreenIndex == 0 ? Colors.black : Colors.white,
        height: barHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _bottomNavBarItem(0, "Home", style, 'home'),
            _bottomNavBarItem(1, "Home", style, 'home'),
            _addVideoNavItem(barHeight),
            _bottomNavBarItem(2, "Home", style, 'home'),
            _bottomNavBarItem(3, "Home", style, 'home'),
          ],
        ),
      ),
    );
  }

  _bottomNavBarItem(
      int index, String label, TextStyle textStyle, String iconName) {
    bool isSelected = selectedScreenIndex == index;
    Color itemColor = isSelected ? Colors.black : Colors.grey;
    if (isSelected && selectedScreenIndex == 0) {
      itemColor = Colors.white;
    }

    return InkWell(
      onTap: () => {onItemTap(index)},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/icons/${isSelected ? '${iconName}_filled' : iconName}.svg",
            color: itemColor,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            label,
            style: textStyle.copyWith(color: itemColor),
          )
        ],
      ),
    );
  }

  _addVideoNavItem(double barHeight) {
    return 
      Container(
      height: barHeight - 15,
      width: 48,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blueAccent, Colors.redAccent],
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Container(
          width: 40,
          height: barHeight - 15,
          decoration: BoxDecoration(
            color: selectedScreenIndex == 0 ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Icon(Icons.add, color: selectedScreenIndex == 0 ? Colors.black : Colors.white,),
        ),
      ),
    );
  }
}
