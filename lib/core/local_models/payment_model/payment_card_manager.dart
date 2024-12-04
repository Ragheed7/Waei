import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waie/core/local_models/payment_model/payment_card.dart';

class PaymentCardManager {
  static final PaymentCardManager _instance = PaymentCardManager._internal();
  factory PaymentCardManager() => _instance;

  PaymentCardManager._internal();

  List<PaymentCard> _paymentCards = [];

  List<PaymentCard> get paymentCards => _paymentCards;

  // Helper method to create a unique storage key for each user
  String _getStorageKeyForUser(String userId) {
    return 'payment_cards_$userId';
  }

  // Load payment cards for a specific user
  Future<void> loadPaymentCards(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = _getStorageKeyForUser(userId);
    String? jsonString = prefs.getString(key);
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      _paymentCards = jsonList.map((json) => PaymentCard.fromJson(json)).toList();
    } else {
      _paymentCards = [];
    }
  }

  // Save payment cards for a specific user
  Future<void> _savePaymentCards(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = _getStorageKeyForUser(userId);
    List<Map<String, dynamic>> jsonList = _paymentCards.map((card) => card.toJson()).toList();
    String jsonString = jsonEncode(jsonList);
    await prefs.setString(key, jsonString);
  }

  // Add a new payment card for a specific user
  Future<void> addPaymentCard(PaymentCard card, String userId) async {
    _paymentCards.add(card);
    await _savePaymentCards(userId);
  }

  // Update an existing payment card for a specific user
  Future<void> updatePaymentCard(int index, PaymentCard card, String userId) async {
    _paymentCards[index] = card;
    await _savePaymentCards(userId);
  }

  // Delete a payment card for a specific user
  Future<void> deletePaymentCard(int index, String userId) async {
    _paymentCards.removeAt(index);
    await _savePaymentCards(userId);
  }
}
