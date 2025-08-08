import 'package:flutter/material.dart';

import '../models/bond_search_model.dart';
import '../widgets/financial_chart.dart';
import '../widgets/issuer_detail_screen.dart';
import '../widgets/prosandcons_section.dart';

class BondDetailHeader extends StatefulWidget {
  final BondDetailModel bondDetail;

  const BondDetailHeader({
    super.key,
    required this.bondDetail,
  });

  @override
  State<BondDetailHeader> createState() => _BondDetailHeaderState();
}

class _BondDetailHeaderState extends State<BondDetailHeader> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: widget.bondDetail.logo.isNotEmpty
                          ? DecorationImage(
                        image: NetworkImage(widget.bondDetail.logo),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: widget.bondDetail.logo.isEmpty
                        ? Container(
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Text(
                          'INFRA\nMARKET',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 8,
                          ),
                        ),
                      ),
                    )
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.bondDetail.companyName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                widget.bondDetail.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _buildStatusChip('ISIN: ${widget.bondDetail.isin}', Colors.blue),
                  const SizedBox(width: 12),
                  _buildStatusChip(widget.bondDetail.status, Colors.green),
                ],
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTabIndex = 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: _selectedTabIndex == 0 ? Colors.blue : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text(
                          'ISIN Analysis',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: _selectedTabIndex == 0 ? Colors.blue : Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTabIndex = 1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: _selectedTabIndex == 1 ? Colors.blue : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text(
                          'Pros & Cons',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: _selectedTabIndex == 1 ? Colors.blue : Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Content Section
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _selectedTabIndex == 0
              ? _buildIsinAnalysisContent()
              : _buildProsConsContent(),
        ),
      ],
    );
  }

  Widget _buildIsinAnalysisContent() {
    return Column(
      key: const ValueKey('isin_analysis'),
      children: [
        // Financial Chart Widget
        FinancialChart(financialData: widget.bondDetail.financials),
        const SizedBox(height: 20),

        // Issuer Details Widget
        IssuerDetailsSection(issuerDetails: widget.bondDetail.issuerDetails),
      ],
    );
  }

  Widget _buildProsConsContent() {
    return Column(
      key: const ValueKey('pros_cons'),
      children: [
        // Pros & Cons Widget
        ProsConsSection(prosAndCons: widget.bondDetail.prosAndCons),
      ],
    );
  }

  Widget _buildStatusChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}