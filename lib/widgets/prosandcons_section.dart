import 'package:flutter/material.dart';

import '../models/bond_search_model.dart';

class ProsConsSection extends StatelessWidget {
  final ProsAndCons prosAndCons;

  const ProsConsSection({
    super.key,
    required this.prosAndCons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pros and Cons',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          if (prosAndCons.pros.isNotEmpty) ...[
            const Text(
              'Pros',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 12),
            ...prosAndCons.pros.map((pro) => _buildProConItem(pro, true)),
            const SizedBox(height: 20),
          ],
          if (prosAndCons.cons.isNotEmpty) ...[
            const Text(
              'Cons',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 12),
            ...prosAndCons.cons.map((con) => _buildProConItem(con, false)),
          ],
        ],
      ),
    );
  }

  Widget _buildProConItem(String text, bool isPositive) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: isPositive ? Colors.green : Colors.orange,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isPositive ? Icons.check : Icons.info_outline,
              color: Colors.white,
              size: 12,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}