//This is where the backend service for the API is done!

import 'package:http/http.dart' as http;
import 'dart:convert';

//convert ZAR to USD
Future<double> convertZarToUsd() async {
  final url = Uri.parse('https://api.frankfurter.app/latest?from=ZAR&to=USD');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final double rate = (data['rates']['USD'] as num).toDouble();
    return rate;
  } else {
    throw Exception('Failed to fetch ZAR exchange rate');
  }
}

//convert ZAR to EUR
Future<double> convertZarToEur() async {
  final url = Uri.parse('https://api.frankfurter.app/latest?from=ZAR&to=EUR');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final double rate = (data['rates']['EUR'] as num).toDouble();
    return rate;
  } else {
    throw Exception('Failed to fetch ZAR exchange rate');
  }
}

//convert ZAR to GBP
Future<double> convertZarToGbp() async {
  final url = Uri.parse('https://api.frankfurter.app/latest?from=ZAR&to=GBP');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final double rate = (data['rates']['GBP'] as num).toDouble();
    return rate;
  } else {
    throw Exception('Failed to fetch ZAR exchange rate');
  }
}

//=================================================================================

//convert USD to ZAR
Future<double> convertUsdToZar() async {
  final url = Uri.parse('https://api.frankfurter.app/latest?from=USD&to=ZAR');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final double rate = (data['rates']['ZAR'] as num).toDouble();
    return rate;
  } else {
    throw Exception('Failed to fetch USD exchange rate');
  }
}

//convert USD to EUR
Future<double> convertUsdToEur() async {
  final url = Uri.parse('https://api.frankfurter.app/latest?from=USD&to=EUR');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final double rate = (data['rates']['EUR'] as num).toDouble();
    return rate;
  } else {
    throw Exception('Failed to fetch USD exchange rate');
  }
}

//convert USD to GBP
Future<double> convertUsdToGbp() async {
  final url = Uri.parse('https://api.frankfurter.app/latest?from=USD&to=GBP');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final double rate = (data['rates']['GBP'] as num).toDouble();
    return rate;
  } else {
    throw Exception('Failed to fetch USD exchange rate');
  }
}

//==================================================================================

//convert EUR to USD
Future<double> convertEurToUsd() async {
  final url = Uri.parse('https://api.frankfurter.app/latest?from=EUR&to=USD');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final double rate = (data['rates']['USD'] as num).toDouble();
    return rate;
  } else {
    throw Exception('Failed to fetch EUR exchange rate');
  }
}

//convert EUR to GBP
Future<double> convertEurToGbp() async {
  final url = Uri.parse('https://api.frankfurter.app/latest?from=EUR&to=GBP');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final double rate = (data['rates']['GBP'] as num).toDouble();
    return rate;
  } else {
    throw Exception('Failed to fetch EUR exchange rate');
  }
}

//convert EUR to ZAR
Future<double> convertEurToZar() async {
  final url = Uri.parse('https://api.frankfurter.app/latest?from=EUR&to=ZAR');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final double rate = (data['rates']['ZAR'] as num).toDouble();
    return rate;
  } else {
    throw Exception('Failed to fetch EUR exchange rate');
  }
}

//====================================================================================

//convert GBP to USD
Future<double> convertGbpToUsd() async {
  final url = Uri.parse('https://api.frankfurter.app/latest?from=GBP&to=USD');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final double rate = (data['rates']['USD'] as num).toDouble();
    return rate;
  } else {
    throw Exception('Failed to fetch GBP exchange rate');
  }
}

//convert GBP to EUR
Future<double> convertGbpToEur() async {
  final url = Uri.parse('https://api.frankfurter.app/latest?from=GBP&to=EUR');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final double rate = (data['rates']['EUR'] as num).toDouble();
    return rate;
  } else {
    throw Exception('Failed to fetch GBP exchange rate');
  }
}

//convert GBP to ZAR
Future<double> convertGbpToZar() async {
  final url = Uri.parse('https://api.frankfurter.app/latest?from=GBP&to=ZAR');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final double rate = (data['rates']['ZAR'] as num).toDouble();
    return rate;
  } else {
    throw Exception('Failed to fetch GBP exchange rate');
  }
}
