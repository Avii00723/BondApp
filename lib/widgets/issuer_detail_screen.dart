import 'package:flutter/material.dart';

import '../models/bond_search_model.dart';

class IssuerDetailsSection extends StatelessWidget {
  final IssuerDetails issuerDetails;

  const IssuerDetailsSection({
    super.key,
    required this.issuerDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.article_outlined,
                size: 20,
                color: Colors.blue,
              ),
              const SizedBox(width: 8),
              const Text(
                'Issuer Details',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildDetailRow('Issuer Name', issuerDetails.issuerName),
          _buildDetailRow('Type of Issuer', issuerDetails.typeOfIssuer),
          _buildDetailRow('Sector', issuerDetails.sector),
          _buildDetailRow('Industry', issuerDetails.industry),
          _buildDetailRow('Issuer nature', issuerDetails.issuerNature),
          _buildDetailRow('Corporate Identity Number (CIN)', issuerDetails.cin),
          _buildDetailRow('Name of the Lead Manager',
              issuerDetails.leadManager == '-' ? '-' : issuerDetails.leadManager),
          _buildDetailRow('Registrar', issuerDetails.registrar),
          _buildDetailRow('Name of Debenture Trustee', issuerDetails.debentureTrustee),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, [Color? valueColor]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: valueColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}