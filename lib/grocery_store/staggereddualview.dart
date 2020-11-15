import 'package:flutter/material.dart';

class StaggeredDualView extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemcount;
  final double spacing;
  final double aspictRatio;
  final double offsetprecent;

  const StaggeredDualView({
    Key key,
    @required this.itemBuilder,
    @required this.itemcount,
    this.spacing = 0.0,
    this.aspictRatio = 0.5,
    this.offsetprecent = 0.5,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final itemheight = (width * 0.5) / aspictRatio;
        final height = constraints.maxHeight + itemheight;
        return ClipRRect(
          child: OverflowBox(
            maxHeight: height,
            minHeight: height,
            maxWidth: width,
            minWidth: width,
            child: GridView.builder(
              padding: EdgeInsetsDirectional.only(
                  top: itemheight / 2, bottom: itemheight),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: aspictRatio,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing),
              itemCount: itemcount,
              itemBuilder: (context, index) {
//this to make it unequal shape at hieght.
                return Transform.translate(
                  offset: Offset(
                      0.0, index.isOdd ? itemheight * offsetprecent : 0.0),
                  child: itemBuilder(context, index),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
