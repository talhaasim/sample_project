import 'package:exchange_rate_app/repository/home_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/currency_rate_item.dart';
import '../res/colors.dart';
import '../res/styles.dart';

class DropdownField extends StatefulWidget {
  const DropdownField({
    super.key,
    this.title,
    this.dropdownText,
    this.showSheetFunction,
  });

  final String? title;
  final String? dropdownText;
  final Function()? showSheetFunction;

  @override
  DropdownFieldState createState() => DropdownFieldState();
}

class DropdownFieldState extends State<DropdownField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  widget.title!,
                  style: appNormalBlackText.copyWith(
                      fontSize: 12, color: blackColor.withOpacity(0.5)),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Row(
                    children: [
                      const VerticalDivider(
                        endIndent: 5,
                        indent: 5,
                        color: lightGreyColor,
                      ),
                      InkWell(
                        onTap: widget.showSheetFunction ?? () {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 10, right: 10),
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Text(
                              widget.dropdownText!,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 10, bottom: 4),
                            child: Image.asset(
                              'assets/icons/dropdown_arrow.png',
                              width: 10,
                              height: 10,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class CurrencyDropDownList extends StatefulWidget {
  CurrencyDropDownList(this.currency, this.options, this.onSelect, {super.key});

  CurrencyRatesItem? currency;
  final List<CurrencyRatesItem>? options;
  Function onSelect;

  @override
  CountriesDropDownListState createState() => CountriesDropDownListState();
}

class CountriesDropDownListState extends State<CurrencyDropDownList> {
  String? value;
  List<CurrencyRatesItem>? currencyList;

  @override
  void initState() {
    super.initState();
    currencyList = widget.options;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: currencyList?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      widget.currency = currencyList![index];
                      widget.onSelect(widget.currency);
                      Navigator.pop(context);
                    },
                    title: Text(
                      currencyList![index].currency ?? '',
                      style: appNormalBlackText.copyWith(fontSize: 14),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
