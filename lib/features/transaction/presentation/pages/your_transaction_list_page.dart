import 'package:fin_track/app/widgets/background_container.dart';
import 'package:fin_track/features/transaction/presentation/widgets/transaction_header_text.dart';
import 'package:flutter/material.dart';

class YourTransactionListPage extends StatelessWidget {
  const YourTransactionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: SafeArea(
          child: Column(
            children: [
              TransactionHeaderText(),
            ],
          ),
        ),
      ),
    );
  }
}
