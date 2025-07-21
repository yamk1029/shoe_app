import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:shoe_app/esewa_payment_page.dart';

class PaymentOptionsScreen extends StatefulWidget {
  const PaymentOptionsScreen({super.key});

  @override
  State<PaymentOptionsScreen> createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose Payment Method')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          PaymentOptionTile(
            icon: Icons.credit_card,
            title: 'Add Debit/Credit Card',
            onTap: () {},
          ),
          SizedBox(height: 20),
          PaymentOptionTile(
            iconAsset: 'assets/khalti.png',
            title: 'Pay with Khalti',
            onTap: () {
              KhaltiScope.of(context).pay(
                config: PaymentConfig(
                  amount: 180000,
                  productIdentity: 'shoes001',
                  productName: 'Nike Sneakers',
                ),
                preferences: [PaymentPreference.khalti],
                onSuccess: (success) {
                  print('Payment Successful');
                  print('Token: ${success.token}');
                  print('Amount: ${success.amount}');
                  print('Product: ${success.productName}');

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Payment Successful via Khalti!')),
                  );
                },

                onFailure: (failure) {
                  print('Payment Failed');
                  print('Error Message: ${failure.message}');

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Payment Failed: ${failure.message}'),
                    ),
                  );
                },

                onCancel: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Payment Cancelled')));
                },
              );
            },
          ),
          SizedBox(height: 20),
          PaymentOptionTile(
            iconAsset: 'assets/esewa.png',
            title: 'Pay with eSewa',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EsewaPaymentPage()),
              );
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class PaymentOptionTile extends StatelessWidget {
  final IconData? icon;
  final String? iconAsset;
  final String title;
  final VoidCallback onTap;

  const PaymentOptionTile({
    super.key,
    this.icon,
    this.iconAsset,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      leading:
          icon != null
              ? Icon(icon, size: 30, color: Colors.deepPurple)
              : Image.asset(iconAsset!, width: 30, height: 30),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
