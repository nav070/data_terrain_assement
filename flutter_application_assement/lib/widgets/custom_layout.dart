import 'package:flutter/material.dart';

class CardLayout extends StatelessWidget {
  final Widget? actionWidget;
  final String title;
  final bool showTitleExternalLink;
  final double? height;
  final Widget? child;
  const CardLayout(
      {super.key,
      this.actionWidget,
      required this.title,
      this.showTitleExternalLink = false,
      this.height,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      margin: EdgeInsets.only(
          bottom: MediaQuery.sizeOf(context).width > 600 ? 36 : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.06),
            offset: const Offset(3.75, 3.75),
            spreadRadius: 2,
            blurRadius: 16,
          ),
        ],
      ),
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF00AEBD),
                      Color(0xFF1D5BBF),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              if (showTitleExternalLink) const Icon(Icons.link),
              const Spacer(),
              actionWidget ??
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: const Color(0xFFDFEDFF),
                    ),
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Divider(
              color: Colors.black,
              indent: 0,
              endIndent: 0,
              height: 0,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          child ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
