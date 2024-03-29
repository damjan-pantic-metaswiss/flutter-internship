import 'package:flutter/material.dart';
import 'package:flutter_internship/layout_tasks/helpers/header_text.dart';
import 'package:flutter_internship/components/helpers/spacer_width.dart';
import 'package:flutter_internship/components/widgets/navigation_app_bar.dart';
import 'package:flutter_internship/components/widgets/assignment_card.dart';
import 'package:flutter_internship/components/widgets/chip_component.dart';
import 'package:flutter_internship/components/widgets/circle_icon.dart';
import 'package:flutter_internship/components/widgets/discount_card.dart';
import 'package:flutter_internship/components/widgets/product_card.dart';
import 'package:flutter_internship/components/widgets/product_card_special.dart';

class ComponentClass extends StatelessWidget {
  const ComponentClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const HeaderText(text: 'Components'),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              //////////1
              HeaderText(text: 'Chip components'),
              Wrap(
                runSpacing: 8,
                children: [
                  ChipComponent(
                      chipType: ChipType.flat, label: 'Work in progress'),
                  SpacerWidth(),
                  ChipComponent(
                      chipType: ChipType.flat,
                      label: 'Work in progress',
                      icon: Icons.more_horiz),
                  SpacerWidth(),
                  ChipComponent(
                      chipType: ChipType.clean,
                      label: 'New',
                      icon: Icons.circle),
                  SpacerWidth(),
                  ChipComponent(
                      chipType: ChipType.clean, label: 'Old collection'),
                ],
              ),
              //////////2
              HeaderText(text: 'Circle Icon'),
              Row(
                children: [
                  CircleIcon.success(),
                  SpacerWidth(),
                  CircleIcon.warning(),
                  SpacerWidth(),
                  CircleIcon.error(),
                ],
              ),
              //////////3
              HeaderText(text: 'Assignment Card'),
              AssignmentCard(
                  title: 'Assignment V',
                  description:
                      'Lorem ipsum dolor sit amet consectetur. Cum enim tempus purus condimentum tristique viverra. Ipsum aliquam nisl imperdiet justo arcu nulla tortor cursus suspendisse.',
                  status: 'Work in progress'),
              //////////4
              HeaderText(text: 'Discount card'),
              DiscountCard(
                  title: 'Get a discount!',
                  description:
                      'To unlock an exclusive discount on our stylish sneakers, simply engage with our social media channels by liking, sharing, and tagging friends in our latest posts'),
              //////////5
              HeaderText(text: 'Product Card'),
              ProductCard(
                title: 'NIKE Dunk Low',
                image: 'assets/images/imageShoe.jpg',
                price: '100.00 €',
              ),
              //////////5
              HeaderText(text: 'Product Card - Special'),
              ProductCardSpecial(
                image: 'assets/images/pngwing 2.png',
                title: 'NIKE Air Jordan',
                description: 'Grab the last pair now',
                price: '160.00 €',
              ),
              //////////6
              HeaderText(text: 'Navigation & app bar'),
            ],
          ),
        ),
        bottomNavigationBar: const NavigationAppBar(),
      ),
    );
  }
}
