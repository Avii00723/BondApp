import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/bond_search_model.dart';

class BondSearchCard extends StatefulWidget {
  final BondSearchModel bond;
  final VoidCallback onTap;
  final String? searchQuery;

  const BondSearchCard({
    super.key,
    required this.bond,
    required this.onTap,
    this.searchQuery,
  });

  @override
  State<BondSearchCard> createState() => _BondSearchCardState();
}

class _BondSearchCardState extends State<BondSearchCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
    _animationController.forward();
    HapticFeedback.lightImpact();
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
    _animationController.reverse();
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
    _animationController.reverse();
  }

  void _handleTap() {
    HapticFeedback.mediumImpact();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              elevation: _isPressed ? 3 : 1,
              shadowColor: Colors.black.withValues(
                alpha: _isPressed ? 0.15 : 0.1,
              ),
              child: GestureDetector(
                onTapDown: _handleTapDown,
                onTapUp: _handleTapUp,
                onTapCancel: _handleTapCancel,
                onTap: _handleTap,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: _isPressed
                        ? Border.all(color: Colors.blue.withOpacity(0.3), width: 1)
                        : null,
                  ),
                  child: InkWell(
                    onTap: null,
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: _isPressed
                                  ? [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.2),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                )
                              ]
                                  : null,
                              image: widget.bond.logo.isNotEmpty
                                  ? DecorationImage(
                                image: NetworkImage(widget.bond.logo),
                                fit: BoxFit.cover,
                                onError: (exception, stackTrace) {
                                  // Fallback to default logo
                                },
                              )
                                  : null,
                            ),
                            child: widget.bond.logo.isEmpty
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ISIN with highlighting
                                _buildHighlightedText(
                                  widget.bond.isin,
                                  widget.searchQuery,
                                  const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                // Company name and rating with highlighting
                                _buildHighlightedText(
                                  '${widget.bond.rating} • ${widget.bond.companyName}',
                                  widget.searchQuery,
                                  TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          AnimatedRotation(
                            turns: _isPressed ? 0.1 : 0.0,
                            duration: const Duration(milliseconds: 100),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: _isPressed ? Colors.blue : Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHighlightedText(
      String text,
      String? query,
      TextStyle baseStyle, {
        int? maxLines,
        TextOverflow? overflow,
      }) {
    if (query == null || query.isEmpty) {
      return Text(
        text,
        style: baseStyle,
        maxLines: maxLines,
        overflow: overflow,
      );
    }

    final spans = _getHighlightedTextSpans(text, query, baseStyle);

    return RichText(
      text: TextSpan(children: spans),
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.visible,
    );
  }

  List<TextSpan> _getHighlightedTextSpans(
      String text,
      String query,
      TextStyle baseStyle,
      ) {
    if (query.isEmpty) {
      return [TextSpan(text: text, style: baseStyle)];
    }

    final List<TextSpan> spans = [];
    final String lowerText = text.toLowerCase();
    final String lowerQuery = query.toLowerCase();

    int currentIndex = 0;

    while (currentIndex < text.length) {
      final int matchIndex = lowerText.indexOf(lowerQuery, currentIndex);

      if (matchIndex == -1) {
        spans.add(TextSpan(
          text: text.substring(currentIndex),
          style: baseStyle,
        ));
        break;
      }

      if (matchIndex > currentIndex) {
        spans.add(TextSpan(
          text: text.substring(currentIndex, matchIndex),
          style: baseStyle,
        ));
      }

      spans.add(TextSpan(
        text: text.substring(matchIndex, matchIndex + query.length),
        style: baseStyle.copyWith(
          backgroundColor: Colors.yellow.withValues(alpha: 0.3),
          color: Colors.orange[700],
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              color: Colors.orange.withOpacity(0.3),
              blurRadius: 1,
            ),
          ],
        ),
      ));

      currentIndex = matchIndex + query.length;
    }

    return spans;
  }


}