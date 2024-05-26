import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.geolocation,
  });

  final Geolocation geolocation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.space24, vertical: Dimens.space16),
      child: Row(
        children: [
          ProfilePicture(
            pictureUrl: context.read<AuthCubit>().authUser!.profilePicture!,
            onTap: () {
              context.read<MainCubit>().updateIndex(4);
              context.go(Routes.profile.path);
            },
            radius: Dimens.space24,
            border: Dimens.space2,
          ),
          SpacerH(value: Dimens.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (_, __) {
                    return Text(
                      '${context.read<AuthCubit>().authUser!.name}',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    );
                  },
                ),
                Text(
                  context
                              .read<TechnicianCubit>()
                              .geolocation!
                              .placemark!
                              .name ==
                          context
                              .read<TechnicianCubit>()
                              .geolocation!
                              .placemark!
                              .street
                      ? '${context.read<TechnicianCubit>().geolocation!.placemark!.subLocality}, ${context.read<TechnicianCubit>().geolocation!.placemark!.locality}'
                      : '${context.read<TechnicianCubit>().geolocation!.placemark!.street}, ${context.read<TechnicianCubit>().geolocation!.placemark!.subLocality}, ${context.read<TechnicianCubit>().geolocation!.placemark!.locality}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          // const ButtonNotification(),
        ],
      ),
    );
  }
}
