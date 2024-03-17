import 'package:flutter/material.dart';
import 'package:reside_ease/widgets/card_big.dart';
import 'package:reside_ease/widgets/card_small.dart';
import 'package:reside_ease/widgets/horizontal_card.dart';
import 'package:reside_ease/widgets/top_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Home Overview',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              const HorizontalCard(
                title: 'Notify your security',
                subtitle: 'Pre-approve your guests, deliveries & more',
                image: 'assets/icons/avatar.png',
              ),
              const SizedBox(height: 8),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SmallCard(
                      title: 'Invite Guests',
                      image: 'assets/icons/invite.png',
                      // route: '/ten_digit_code',
                    ),
                    SizedBox(width: 8),
                    SmallCard(
                      title: 'Visitor Log',
                      image: 'assets/icons/log.png',
                      // route: '/login',
                    ),
                    SizedBox(width: 8),
                    SmallCard(
                      title: 'Call Gate',
                      image: 'assets/icons/call.png',
                      // route: '/register',
                    ),
                    SizedBox(width: 8),
                    SmallCard(
                      title: 'SOS',
                      image: 'assets/icons/SOS.png',
                      // route: '/otp',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Settle your Expenses',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CardBig(
                      title: 'One-stop payments',
                      image: 'assets/icons/card.png',
                      buttonText: 'Pay Now',
                      cardColor: Colors.purple.shade50,
                      containerColor: Colors.purple.shade100,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CardBig(
                      title: 'Bill Tabs',
                      image: 'assets/icons/bill.png',
                      buttonText: 'Check Now',
                      cardColor: Colors.purple.shade50,
                      containerColor: Colors.purple.shade100,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'For your Oversight',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CardBig(
                      title: 'Help Desk',
                      image: 'assets/icons/helpdesk.png',
                      buttonText: 'Connect',
                      cardColor: Colors.yellow.shade100,
                      containerColor: Colors.yellow.shade300,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CardBig(
                      title: 'Domestic Staff',
                      image: 'assets/icons/domestic.png',
                      buttonText: 'Check Out',
                      cardColor: Colors.yellow.shade100,
                      containerColor: Colors.yellow.shade300,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: CardBig(
                      title: 'Connect Now',
                      image: 'assets/icons/connect.png',
                      buttonText: 'Chat',
                      cardColor: Colors.yellow.shade100,
                      containerColor: Colors.yellow.shade300,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CardBig(
                      title: 'Emergency nos.',
                      image: 'assets/icons/emergency.png',
                      buttonText: 'Check Out',
                      cardColor: Colors.yellow.shade100,
                      containerColor: Colors.yellow.shade300,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'For your Community',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CardBig(
                      title: 'Resident Directory',
                      image: 'assets/icons/residentdir.png',
                      buttonText: 'Check Out',
                      cardColor: Colors.green.shade100,
                      containerColor: Colors.green.shade300,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CardBig(
                      title: 'Society Budget',
                      image: 'assets/icons/budget.png',
                      buttonText: 'Check Out',
                      cardColor: Colors.green.shade100,
                      containerColor: Colors.green.shade300,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
