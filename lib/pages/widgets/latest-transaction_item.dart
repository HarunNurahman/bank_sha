import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LatestTransactionItem extends StatelessWidget {
  final TransactionModel transactionData;
  const LatestTransactionItem({super.key, required this.transactionData});

  @override
  Widget build(BuildContext context) {
    String thumbnail() {
      if (transactionData.transactionType?.code == 'transfer') {
        return 'https://bwabank.my.id/storage/Nmmdj2yh1D.png';
      } else if (transactionData.transactionType?.code == 'top_up') {
        return 'https://bwabank.my.id/storage/xmamMx8utB.png';
      } else {
        return 'https://bwabank.my.id/storage/tL3YMHgck4.png';
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Image.network(thumbnail(), width: 48),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transactionData.transactionType!.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  DateFormat('MMM dd')
                      .format(transactionData.createdAt ?? DateTime.now()),
                  style: grayTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            (transactionData.transactionType?.action == 'cr' ? '+ ' : '- ') +
                formatCurrency(transactionData.amount ?? 0),
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          )
        ],
      ),
    );
  }
}
