import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about_us_vision_and_goal_section_widget.dart';

class AboutUsIntroCard extends StatelessWidget {
  const AboutUsIntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AboutUsSectionCard(
      child: Text(
        "توفر دعماً موثقاً لكل من يبحث عن الإرشاد والمساندة. نؤمن أن طلب الاستشارة خطوة شجاعة، لذلك صممنا مساحة آمنة وسهلة الاستخدام للتواصل مع استشاريين معتمدين، سواء عبر جلسات مجدولة أو فورية للحالات العاجلة.\nفي استشير، نحن هنا لسماعك ونرشدك وندعمك .. خطوة بخطوة.",
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyLarge?.copyWith(
          height: 1.6,
          color: theme.dividerColor,
        ),
      ),
    );
  }
}
