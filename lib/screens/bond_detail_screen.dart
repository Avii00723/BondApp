import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/bond_search_model.dart';
import '../widgets/bond_detail_header.dart';

class BondDetailScreen extends StatelessWidget {
  final BondDetailModel bondDetail;

  const BondDetailScreen({
    super.key,
    required this.bondDetail,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) {
          HapticFeedback.lightImpact();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              // Haptic feedback for back button
              HapticFeedback.lightImpact();
              Navigator.pop(context);
            },
          ),

          backgroundColor: Colors.grey[50],
          elevation: 0,
          toolbarHeight: 60,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // Only the BondDetailHeader which now contains the switchable sections
              BondDetailHeader(bondDetail: bondDetail),
              const SizedBox(height: 20),



            ],
          ),
        ),
      ),
    );
  }
}