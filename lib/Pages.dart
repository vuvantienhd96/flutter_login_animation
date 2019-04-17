import 'package:flutter/material.dart';

final pages = [
  new PageViewModel(
      const Color(0xFF678FB4),
      'assets/hotels.png',
      'Hotels',
      'All hotels and hostels are sorted by hospitality rating',
      'assets/key.png'),
  new PageViewModel(
      const Color(0xFF65B0B4),
      'assets/banks.png',
      'Banks',
      'We carefully verify all banks before adding them into the app',
      'assets/wallet.png'),
  new PageViewModel(
    const Color(0xFF9B90BC),
    'assets/stores.png',
    'Store',
    'All local stores are categorized for your convenience',
    'assets/shopping_cart.png',
  ),
];

class Page extends StatelessWidget {
  final PageViewModel viewModel;
  final double percentVisible;

  Page({
    this.viewModel,
    this.percentVisible = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      color: viewModel.color,
      child: new Opacity(
        opacity: percentVisible,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 50.0 * (1 - percentVisible), 0.0),
              child: new Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: new Image.asset(
                  viewModel.heroAssetPath,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 30 * (1 - percentVisible), 0.0),
              child: new Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: new Text(
                  viewModel.title,
                  style: new TextStyle(color: Colors.white, fontSize: 34.0),
                ),
              ),
            ),
            new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 30 * (1 - percentVisible), 0.0),
              child: new Padding(
                padding: const EdgeInsets.only(bottom: 75.0),
                child: new Text(
                  viewModel.body,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetIcon;

  PageViewModel(this.color, this.heroAssetPath, this.title, this.body,
      this.iconAssetIcon);
}
