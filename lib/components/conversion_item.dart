import 'package:exchange_rate_app/models/currency_rate_item.dart';
import 'package:exchange_rate_app/res/colors.dart';
import 'package:flutter/cupertino.dart';

import '../res/styles.dart';

class ConversionItem extends StatefulWidget {
  final CurrencyRatesItem item;

  const ConversionItem(this.item, {super.key});

  @override
  State<ConversionItem> createState() => _ConversionItemState();
}

class _ConversionItemState extends State<ConversionItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: darkGreyColor, width: 1),
              color: lightGreyColor),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.item.currency!,
                  style: appNormalBlackText.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.item.rate.toString(),
                  style: appNormalBlackText.copyWith(fontSize: 14, color: blackColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}