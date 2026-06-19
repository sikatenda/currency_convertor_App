//In this page, the user convert EUR to other currency

import 'dart:math';

import 'package:convert_currency/home.dart';
import 'package:convert_currency/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyEur extends StatefulWidget {
  const MyEur({super.key});

  @override
  State<MyEur> createState() => _MyEurState();
}

class _MyEurState extends State<MyEur> {
  final TextEditingController _controller = TextEditingController();
  double usdRate = 0.0;
  double zarRate = 0.0;
  double gbpRate = 0.0;
  double usdAmount = 0.0;
  double zarAmount = 0.0;
  double gbpAmount = 0.0;
  bool isLoading = false;

  @override
  initState() {
    super.initState();
    _getRates();
  }

  Future<void> _getRates() async {
    final usd = await convertEurToUsd();
    final zar = await convertEurToZar();
    final gbp = await convertEurToGbp();

    setState(() {
      usdRate = usd;
      usdRate = double.parse(usdRate.toStringAsFixed(2));
      zarRate = zar;
      zarRate = double.parse(zarRate.toStringAsFixed(2));
      gbpRate = gbp;
      gbpRate = double.parse(gbpRate.toStringAsFixed(2));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    });
  }

  void process() async {
    setState(() {
      isLoading = true;
    });

    try {
      usdRate = await convertEurToUsd();
      zarRate = await convertEurToZar();
      gbpRate = await convertEurToGbp();

      setState(() {
        // from EUR to USD
        usdRate = double.parse(usdRate.toStringAsFixed(2));
        usdAmount = usdRate * double.parse(_controller.text);
        usdAmount = double.parse(usdAmount.toStringAsFixed(2));

        // from EUR to ZAR
        zarRate = double.parse(zarRate.toStringAsFixed(2));
        zarAmount = zarRate * double.parse(_controller.text);
        zarAmount = double.parse(zarAmount.toStringAsFixed(2));

        // from EUR to GBP
        gbpRate = double.parse(gbpRate.toStringAsFixed(2));
        gbpAmount = gbpRate * double.parse(_controller.text);
        gbpAmount = double.parse(gbpAmount.toStringAsFixed(2));
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      usdAmount = 0.0;
                      zarAmount = 0.0;
                      gbpAmount = 0.0;
                      _controller.clear();
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHome()),
                    );
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Text(
                      'CURRENCY CONVERTOR',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.lime.shade100,
                    ),
                    padding: const EdgeInsets.fromLTRB(25, 25, 25, 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text('Convert EUR'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SizedBox(
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('...'),
                                Text(
                                  'Rate',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                const Text(
                                  'Amount',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('ZAR'),
                                Text(
                                  '$zarRate',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Text(
                                  '$zarAmount',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('USD'),
                                Text(
                                  '$usdRate',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Text(
                                  '$usdAmount',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('GBP'),
                                Text(
                                  '$gbpRate',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Text(
                                  '$gbpAmount',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: TextField(
                            controller: _controller,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            maxLength: 20,
                            decoration: InputDecoration(
                              hintText: 'Enter the amount here',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    usdAmount = 0.0;
                                    zarAmount = 0.0;
                                    gbpAmount = 0.0;
                                    _controller.clear();
                                  });
                                },
                                icon: const Icon(Icons.clear),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Builder(
                            builder: (context) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  padding: const EdgeInsets.all(16),
                                  fixedSize: const Size.fromWidth(300),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: process,
                                child: const Text("Convert EUR"),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Powered by FERUZI',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
