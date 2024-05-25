import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecomendationContainer extends StatelessWidget {
  const RecomendationContainer({
    super.key,
    required this.technicians,
  });

  final List<Technician> technicians;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.space8),
            child: Row(
              children: [
                Text(
                  Strings.of(context)!.recomendation,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ButtonText(
                  title: Strings.of(context)!.seeAll,
                  onPressed: () {
                    context.push(Routes.technicianList.path);
                  },
                ),
              ],
            ),
          ),
          Column(
            children: List.generate(
              technicians.length > 5 ? 5 : technicians.length,
              (index) => TechnicianListTile(technician: technicians[index]),
            ),
          ),
        ],
      ),
    );
  }
}
