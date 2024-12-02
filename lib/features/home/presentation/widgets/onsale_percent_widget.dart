import 'package:admingrocerypanel/core/utils/appstrings.dart';
import 'package:admingrocerypanel/core/utils/appstyles.dart';
import 'package:flutter/material.dart';

class OnSaleParcent extends StatefulWidget {
  const OnSaleParcent(
      {super.key,
      required this.price,
      required this.onchanged,
      required this.isonsale,
      required this.onPercentChanged,
      required this.getPercent,
      required this.getpriceAfterSale});
  final ValueChanged<double> onchanged;
  final double price;
  final bool isonsale;
  final ValueChanged<String> onPercentChanged;
  final String getPercent;
  final double getpriceAfterSale;

  @override
  State<OnSaleParcent> createState() => _OnSaleParcentState();
}

class _OnSaleParcentState extends State<OnSaleParcent> {
  late double priceAfterSale;
  String showpercentValue = '0';
  bool? isonsale;
  @override
  void initState() {
    isonsale = widget.isonsale;
    priceAfterSale = widget.getpriceAfterSale;
    showpercentValue = widget.getPercent;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: Colors.green,
              value: isonsale,
              onChanged: (value) {
                isonsale = value!;
                priceAfterSale = widget.price;
                setState(() {});
              },
            ),
            Text(
              AppStrings.sale,
              style: AppStyles.style16,
            )
          ],
        ),
        isonsale!
            ? AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Row(
                  key: ValueKey(showpercentValue),
                  children: [
                    Text(
                      "\$${priceAfterSale.toStringAsFixed(2)}",
                      style: AppStyles.style14,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      key: ValueKey(showpercentValue),
                      height: 45,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: showpercentValue,
                            items: [
                              DropdownMenuItem(
                                value: "75",
                                onTap: () {},
                                child: const Text(AppStrings.value6),
                              ),
                              DropdownMenuItem(
                                value: "50",
                                onTap: () {},
                                child: const Text(AppStrings.value5),
                              ),
                              DropdownMenuItem(
                                value: "25",
                                onTap: () {},
                                child: const Text(AppStrings.value4),
                              ),
                              DropdownMenuItem(
                                value: "15",
                                onTap: () {},
                                child: const Text(AppStrings.value3),
                              ),
                              DropdownMenuItem(
                                value: "10",
                                onTap: () {},
                                child: const Text(AppStrings.value2),
                              ),
                              DropdownMenuItem(
                                value: "0",
                                onTap: () {},
                                child: const Text(AppStrings.value1),
                              ),
                            ],
                            onChanged: (value) {
                              showpercentValue = value!;
                              widget.onPercentChanged(value);
                              _calculatePriceAfterSale();
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }

  void _calculatePriceAfterSale() {
    double originalPrice = widget.price;
    double percentDiscount = double.parse(showpercentValue);
    setState(() {
      priceAfterSale =
          originalPrice - ((percentDiscount * originalPrice) / 100);
      widget.onchanged(priceAfterSale);
    });
  }
}
