import 'dart:io';

import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class MakeOrderPage extends StatefulWidget {
  const MakeOrderPage({super.key, required this.uid});

  final String uid;

  @override
  State<MakeOrderPage> createState() => _MakeOrderPageState();
}

class _MakeOrderPageState extends State<MakeOrderPage> {
  late GlobalKey<FormState> _keyForm;

  final MapController mapController = MapController();

  // controller
  late TextEditingController _conGripe;
  late TextEditingController _conAddress;

  @override
  void initState() {
    _keyForm = GlobalKey<FormState>();
    _conGripe = TextEditingController();
    _conAddress = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _keyForm.currentState?.dispose();
    _conGripe.dispose();
    _conAddress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).extension<MyAppColors>()!;

    return Parent(
      appBar: MyAppBar(context, title: 'Form Order').call(),
      child: BlocBuilder<MakeOrderCubit, MakeOrderState>(
        builder: (context, state) {
          return BlocBuilder<TechnicianCubit, TechnicianState>(
            builder: (context, state) {
              final technician = context
                  .read<TechnicianCubit>()
                  .technicians
                  .firstWhere((element) => element.uid == widget.uid);
              return Stepper(
                controlsBuilder: (context, details) {
                  return const SizedBox();
                },
                currentStep: context.read<MakeOrderCubit>().index,
                type: StepperType.horizontal,
                onStepTapped: null,
                steps: [
                  Step(
                    title: Text(Strings.of(context)!.electronics),
                    isActive: context.read<MakeOrderCubit>().index >= 0,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: List.generate(
                            technician.electronics!.length,
                            (index) => RadioListTile<String>(
                              value: technician.electronics![index],
                              groupValue:
                                  context.read<MakeOrderCubit>().idElectronic,
                              onChanged: (value) {
                                context
                                    .read<MakeOrderCubit>()
                                    .selectElectronic(value!);
                              },
                              title: Text(
                                context
                                    .read<ElectronicCubit>()
                                    .electronics
                                    .firstWhere((element) =>
                                        element.id ==
                                        technician.electronics![index])
                                    .name!,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Dimens.space30),
                        FilledButton(
                          onPressed: () {
                            if (context.read<MakeOrderCubit>().idElectronic !=
                                null) {
                              final listGripe = context
                                  .read<ElectronicCubit>()
                                  .electronics
                                  .firstWhere((element) =>
                                      element.id ==
                                      context
                                          .read<MakeOrderCubit>()
                                          .idElectronic)
                                  .gripe!;
                              context
                                  .read<MakeOrderCubit>()
                                  .changeGripes(listGripe);
                              context.read<MakeOrderCubit>().nextStep();
                            } else {
                              Strings.of(context)!
                                  .chooseElectronicFirst
                                  .toToastError(context);
                            }
                          },
                          child: Text(Strings.of(context)!.next),
                        ),
                      ],
                    ),
                  ),
                  Step(
                    title: Text(Strings.of(context)!.gripe),
                    isActive: context.read<MakeOrderCubit>().index >= 1,
                    content: Column(
                      children: [
                        Column(
                          children: List.generate(
                            context.read<MakeOrderCubit>().listGripes.length,
                            (index) => CheckboxListTile(
                              value: context
                                  .read<MakeOrderCubit>()
                                  .gripes
                                  .contains(context
                                      .read<MakeOrderCubit>()
                                      .listGripes[index]),
                              onChanged: (value) {
                                if (value!) {
                                  context.read<MakeOrderCubit>().addGripe(
                                      context
                                          .read<MakeOrderCubit>()
                                          .listGripes[index]);
                                } else {
                                  context.read<MakeOrderCubit>().removeGripe(
                                      context
                                          .read<MakeOrderCubit>()
                                          .listGripes[index]);
                                }
                              },
                              title: Text(
                                context
                                    .read<MakeOrderCubit>()
                                    .listGripes[index],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: _conGripe,
                            decoration: InputDecoration(
                              hintText: 'Keluhan lainnya',
                              hintStyle: textTheme.bodyMedium!
                                  .copyWith(color: Theme.of(context).hintColor),
                            ),
                            maxLines: null,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'masukkan keluhan!.';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: Dimens.space30),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: Row(
                                children: [
                                  Text(
                                    Strings.of(context)!
                                        .photoOfElectronicDamage,
                                    style: textTheme.bodyLarge!
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    Strings.of(context)!.optional,
                                    style: textTheme.bodySmall,
                                  ),
                                  const Expanded(child: SizedBox()),
                                  IconButton(
                                    onPressed: () {
                                      context
                                          .read<MakeOrderCubit>()
                                          .pickFiles();
                                    },
                                    icon: const Icon(Icons.add_photo_alternate),
                                  ),
                                ],
                              ),
                            ),
                            if (context.read<MakeOrderCubit>().files.isNotEmpty)
                              Container(
                                margin: EdgeInsets.only(top: Dimens.space8),
                                padding: EdgeInsets.all(Dimens.space8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Theme.of(context)
                                      .hintColor
                                      .withOpacity(0.3),
                                ),
                                child: StaggeredGrid.count(
                                  crossAxisCount: context
                                              .read<MakeOrderCubit>()
                                              .files
                                              .length >
                                          2
                                      ? 2
                                      : context
                                          .read<MakeOrderCubit>()
                                          .files
                                          .length,
                                  crossAxisSpacing: Dimens.space8,
                                  mainAxisSpacing: Dimens.space8,
                                  children: List.generate(
                                    context.read<MakeOrderCubit>().files.length,
                                    (index) => StaggeredGridTile.fit(
                                      crossAxisCellCount: 1,
                                      child: Stack(
                                        children: [
                                          InkWell(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            onTap: () {
                                              showAdaptiveDialog(
                                                context: context,
                                                builder: (_) => ImageDialog(
                                                  image: context
                                                      .read<MakeOrderCubit>()
                                                      .files[index],
                                                ),
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              child: SizedBox(
                                                child: Image.file(
                                                  context
                                                      .read<MakeOrderCubit>()
                                                      .files[index],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              context
                                                  .read<MakeOrderCubit>()
                                                  .removeFiles(index);
                                            },
                                            icon: const Icon(Icons.close),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: Dimens.space30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ButtonText(
                              title: Strings.of(context)!.back,
                              onPressed: () {
                                context.read<MakeOrderCubit>().backStep();
                              },
                            ),
                            SizedBox(width: Dimens.space24),
                            FilledButton(
                              onPressed: () {
                                if (context
                                        .read<MakeOrderCubit>()
                                        .gripes
                                        .isNotEmpty ||
                                    _conGripe.text.isNotEmpty) {
                                  context
                                      .read<MakeOrderCubit>()
                                      .gripes
                                      .removeWhere(
                                        (element) => !context
                                            .read<MakeOrderCubit>()
                                            .listGripes
                                            .contains(element),
                                      );

                                  if (_conGripe.text.isNotEmpty) {
                                    context
                                        .read<MakeOrderCubit>()
                                        .addGripe(_conGripe.text);
                                  }
                                  context
                                      .read<LocationCubit>()
                                      .getDirection(technician.location!);
                                  context.read<MakeOrderCubit>().nextStep();
                                } else {
                                  Strings.of(context)!
                                      .chooseGripeFirst
                                      .toToastError(context);
                                }
                              },
                              child: Text(Strings.of(context)!.next),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Step(
                    title: Text(Strings.of(context)!.location),
                    isActive: context.read<MakeOrderCubit>().index >= 2,
                    content: BlocBuilder<LocationCubit, LocationState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => const Center(child: Loading()),
                          failure: (message) => Center(
                            child: Empty(errorMessage: message),
                          ),
                          success: (geolocation, direction) {
                            _conAddress.text = geolocation.placemark!.name ==
                                    geolocation.placemark!.street
                                ? '${geolocation.placemark!.subLocality}, ${geolocation.placemark!.locality}'
                                : '${geolocation.placemark!.street}, ${geolocation.placemark!.subLocality}, ${geolocation.placemark!.locality}';
                            return Column(
                              children: [
                                SizedBox(
                                  height: 550.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: FlutterMap(
                                      mapController: mapController,
                                      options: MapOptions(
                                        minZoom: 13,
                                        maxZoom: 18,
                                        initialZoom: 14,
                                        initialCenter: geolocation.location!,
                                        keepAlive: true,
                                        onTap: (tapPosition, point) {
                                          context
                                              .read<LocationCubit>()
                                              .changeDirection(
                                                  point, technician.location!);
                                        },
                                      ),
                                      children: [
                                        TileLayer(
                                          urlTemplate:
                                              'https://api.mapbox.com/styles/v1/levelsekawan/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}',
                                          additionalOptions: const {
                                            'mapStyleId': ListAPI.streetStyle,
                                            'accessToken':
                                                ListAPI.mapBoxAccessToken,
                                          },
                                        ),
                                        PolylineLayer(
                                          polylines: [
                                            Polyline(
                                              points: direction.routes![0]
                                                  .geometry!.coordinates!,
                                              strokeWidth: 5,
                                              color: Theme.of(context)
                                                  .extension<MyAppColors>()!
                                                  .blue!,
                                            ),
                                          ],
                                        ),
                                        MarkerLayer(
                                          markers: [
                                            Marker(
                                              point: technician.location!,
                                              child: ProfilePicture(
                                                pictureUrl:
                                                    technician.profilePicture!,
                                                onTap: () {},
                                                radius: Dimens.space12,
                                                border: Dimens.space2,
                                              ),
                                            ),
                                            Marker(
                                              point: geolocation.location!,
                                              child: Icon(
                                                Icons.location_on,
                                                color: colorTheme.red,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                TextF(
                                  autofillHints: const [AutofillHints.email],
                                  key: const Key("address"),
                                  textInputAction: TextInputAction.done,
                                  controller: _conAddress,
                                  keyboardType: TextInputType.emailAddress,
                                  readOnly: true,
                                  prefixIcon: Icon(
                                    Icons.home_outlined,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color,
                                  ),
                                  hintText: Strings.of(context)!.address,
                                  hint: Strings.of(context)!.email,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ButtonText(
                                      title: Strings.of(context)!.back,
                                      onPressed: () {
                                        context
                                            .read<MakeOrderCubit>()
                                            .backStep();
                                      },
                                    ),
                                    SizedBox(width: Dimens.space24),
                                    FilledButton(
                                      onPressed: () {
                                        final List<File> files = context
                                            .read<MakeOrderCubit>()
                                            .files;

                                        final repairCost = direction
                                                    .routes![0].distance! >=
                                                5000
                                            ? 3000 +
                                                (((direction.routes![0]
                                                                    .distance! /
                                                                1000)
                                                            .ceil() -
                                                        5) *
                                                    1000)
                                            : 3000;

                                        final order = RepairOrder(
                                          id: null,
                                          clientUid: context
                                              .read<AuthCubit>()
                                              .authUser!
                                              .uid,
                                          technicianUid: technician.uid,
                                          clientLocation: geolocation.location,
                                          technicianLocation:
                                              technician.location,
                                          clientAddress: context
                                                      .read<LocationCubit>()
                                                      .geolocation!
                                                      .placemark!
                                                      .name ==
                                                  context
                                                      .read<LocationCubit>()
                                                      .geolocation!
                                                      .placemark!
                                                      .street
                                              ? '${context.read<LocationCubit>().geolocation!.placemark!.subLocality}, ${context.read<LocationCubit>().geolocation!.placemark!.locality}'
                                              : '${context.read<LocationCubit>().geolocation!.placemark!.street}, ${context.read<LocationCubit>().geolocation!.placemark!.subLocality}, ${context.read<LocationCubit>().geolocation!.placemark!.locality}',
                                          duration:
                                              direction.routes![0].duration,
                                          distance:
                                              direction.routes![0].distance,
                                          electronic: context
                                              .read<MakeOrderCubit>()
                                              .idElectronic,
                                          gripe: context
                                              .read<MakeOrderCubit>()
                                              .gripes,
                                          damage: [],
                                          electronicPicture: [],
                                          checkingCost: repairCost,
                                          repairCost: 0,
                                          totalCost: repairCost,
                                          dateTime: null,
                                          status: Status.konfirmasiTeknisi.name,
                                          repair: null,
                                          pay: null,
                                          canceled: null,
                                          reasonCancelled: null,
                                        );

                                        context.push(
                                          Routes.orderSummary.path,
                                          extra: [order, files],
                                        );
                                      },
                                      child: Text(Strings.of(context)!.next),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
