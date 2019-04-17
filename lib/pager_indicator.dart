import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animasi_login/Pages.dart';

class PageIndicator extends StatelessWidget {
  final PagerIndicatorViewModel viewModel;

  PageIndicator({this.viewModel});

  @override
  Widget build(BuildContext context) {
    List<PageBubble> bubbles = [];
    for (var i = 0; i < viewModel.pages.length; ++i) {
      final page = viewModel.pages[i];
      bubbles.add(new PageBubble(
        viewModel: new PagerBubbleViewModel(
             i == viewModel.activeIndex ? 1.0 : 0.0, page.color, i > viewModel.activeIndex, page.iconAssetIcon),
      ));
    }

    return new Column(
      children: <Widget>[
        new Expanded(
          child: new Container(),
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: bubbles,
          // children: <Widget>[
          //   new PageBubble(
          //     viewModel: new PagerBubbleViewModel(
          //         0.0, Colors.green, false, 'assets/shopping_cart.png'),
          //   ),
          //   new PageBubble(
          //     viewModel: new PagerBubbleViewModel(
          //         1.0, Colors.green, false, 'assets/shopping_cart.png'),
          //   ),
          //   new PageBubble(
          //     viewModel: new PagerBubbleViewModel(
          //         0.0, Colors.green, true, 'assets/shopping_cart.png'),
          //   ),
          // ],
        )
      ],
    );
  }
}

enum SlideDirection {
  leftToRight,
  rightToLeft,
  none
}

class PageBubble extends StatelessWidget {
  final PagerBubbleViewModel viewModel;

  PageBubble({
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Container(
        width: lerpDouble(20.0, 45.0, viewModel.activePercent),
        height: lerpDouble(20.0, 45.0, viewModel.activePercent),
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: viewModel.isHollow
                ? Colors.transparent
                : const Color(0x88FFFFFF),
            border: new Border.all(
                color: viewModel.isHollow
                    ? const Color(0x88FFFFFF)
                    : Colors.transparent,
                width: 3.0)),
        child: new Opacity(
          opacity: viewModel.activePercent,
          child: new Image.asset(
            viewModel.iconAssetPath,
            color: viewModel.color,
          ),
        ),
      ),
    );
  }
}

class PagerIndicatorViewModel {
  final List<PageViewModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;

  PagerIndicatorViewModel(
      this.pages, this.activeIndex, this.slideDirection, this.slidePercent);
}

class PagerBubbleViewModel {
  final String iconAssetPath;
  final Color color;
  final bool isHollow;
  final double activePercent;

  PagerBubbleViewModel(
      this.activePercent, this.color, this.isHollow, this.iconAssetPath);
}
