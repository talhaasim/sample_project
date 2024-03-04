import 'package:exchange_rate_app/components/input_field.dart';
import 'package:exchange_rate_app/repository/home_repository.dart';
import 'package:exchange_rate_app/res/strings.dart';
import 'package:exchange_rate_app/storage/get_storage_expension.dart';
import 'package:exchange_rate_app/view_models/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/conversion_item.dart';
import '../../components/dropdown.dart';
import '../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = HomeController();
  late HomeRepository homeRepository;

  // CurrencyRatesItem currentCurrency = CurrencyRatesItem();

  void checkForLatestFetch() async {
    if (storage?.getLatestFetch() == null) {
      await homeRepository.getLatestExchangeRates();
    } else {
      if (homeRepository.canFetchLatestData()) {
        await homeRepository.getLatestExchangeRates();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    homeRepository = Provider.of<HomeRepository>(context, listen: true);
    checkForLatestFetch();
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SimpleInputField(
                  Icons.check,
                  () {
                    if (homeController.inputController.value.text.isNotEmpty) {
                      homeRepository.performConversion(homeRepository.currentCurrency, homeController.inputController.value.text);
                    } else {
                      homeRepository.clearAll();
                    }
                  },
                  placeHolder: AppStrings.homeInputPlaceholder,
                  controller: homeController.inputController.value,
                  isNumeric: true,

                ),
              ),
              DropdownField(
                title: AppStrings.homeDropdownLabel,
                dropdownText: homeRepository.currentCurrency.currency,
                showSheetFunction: () {
                  homeRepository.showCurrencySheet(context);
                },
              ),
              const SizedBox(height: 10),
              if (homeRepository.currencies != null &&
                  homeController.inputController.value.text.isNotEmpty)
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeRepository.currencies?.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return ConversionItem(homeRepository.currencies![index]);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
