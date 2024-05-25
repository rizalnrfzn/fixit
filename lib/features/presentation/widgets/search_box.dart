import 'package:fixit/core/core.dart';
import 'package:fixit/features/domain/domain.dart';
import 'package:fixit/features/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    required this.allTeknisi,
    required this.dashboard,
  });

  final List<Technician> allTeknisi;
  final bool dashboard;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<MyAppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return dashboard
        ? TextF(
            prefixIcon: Icon(
              Icons.search_outlined,
              size: Dimens.space24,
              color: Theme.of(context).hintColor,
            ),
            readOnly: true,
            hintText: Strings.of(context)!.search,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            onTap: () => showSearch(
              context: context,
              delegate: TeknisiSearch(
                  allTeknisi: allTeknisi, searchFieldLabel: 'Pencarian'),
            ),
          )
        : TextField(
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Cari Teknisi',
              hintStyle:
                  textTheme.bodyLarge!.copyWith(color: colorTheme.subtitle),
              fillColor: colorTheme.card,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              suffixIcon: Icon(Icons.search, color: colorTheme.blue),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.outline),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.outline),
              ),
            ),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            onTap: () => showSearch(
              context: context,
              delegate: TeknisiSearch(
                  allTeknisi: allTeknisi, searchFieldLabel: 'Cari teknisi'),
            ),
          );
  }
}

class TeknisiSearch extends SearchDelegate {
  TeknisiSearch({
    super.searchFieldLabel,
    super.searchFieldStyle,
    super.searchFieldDecorationTheme,
    super.keyboardType,
    super.textInputAction,
    required this.allTeknisi,
  });

  final List<Technician> allTeknisi;

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(
            Icons.clear,
            color: Colors.grey,
          ),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        ),
      ];
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
      );
  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
        ),
      );
  @override
  Widget buildSuggestions(BuildContext context) {
    // will show a query hint suggestion "flutter search bar with listview"
    List<Technician> suggesstions = allTeknisi.where((element) {
      final result = element;
      final input = query.toLowerCase();

      return result.name!.toLowerCase().contains(input) ||
          result.address!.toLowerCase().contains(input);
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: suggesstions.length,
        itemBuilder: (context, index) {
          final suggestion = suggesstions[index];
          return GestureDetector(
            onTap: () => context.push(
              Routes.technicianDetail.path,
              extra: suggestion.uid,
            ),
            child: TechnicianListTile(technician: suggestion),
          );
        },
      ),
    );
  }
}
