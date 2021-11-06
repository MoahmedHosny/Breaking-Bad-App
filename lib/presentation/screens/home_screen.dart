import 'package:breaking_app/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_app/business_logic/cubit/characters_state.dart';
import '../../data/models/characters_model.dart';
import '../widgets/build_characters.dart';
import '../../style/color/color.dart';
import '../../style/icon/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

// Search And Filter Character
List<CharactersModel> searchCharacters;
bool isSearch = false;
TextEditingController searchController = TextEditingController();

class _HomeScreen extends State<HomeScreen> {
  /// BackButton

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersStates>(
      builder: (context, state) {
        BlocProvider.of<CharactersCubit>(context).getData();
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 10,
            title: isSearch ? buildTextField() : buildAppBarTitle(),
            actions: buildAppBar(),
            leading: isSearch
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    splashRadius: 25,
                    icon: Icon(IconBroken.Arrow___Left_2),
                  )
                : null,
          ),
          body: OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if (connected) {
                return buildCharacters();
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/error.png'),
                              scale: 1.4,
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Please Check The Internet',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
            child: Container(),
          ),
        );
      },
    );
  }

  Widget buildAppBarTitle() {
    return Text(
      'Characters',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  /// Search
  // Text_Form_Field
  Widget buildTextField() => TextFormField(
        controller: searchController,
        cursorColor: black,
        decoration: InputDecoration(
          hintText: 'Find a characters ...',
          hintStyle: TextStyle(
            fontSize: 18,
            color: white,
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontSize: 18,
          color: white,
        ),
        onChanged: (searchedCharacters) {
          buildFilterCharacters(searchedCharacters);
        },
      );
  // Method_For_OnChanged
  void buildFilterCharacters(String searchedCharacters) {
    searchCharacters = characters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacters))
        .toList();
    setState(() {});
  }

  // List_OF_AppBar
  List<Widget> buildAppBar() {
    if (isSearch) {
      return [
        IconButton(
          onPressed: () {
            clearSearch();
            Navigator.pop(context);
          },
          splashRadius: 25,
          icon: Icon(Icons.close_rounded),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: startSearch,
          splashRadius: 25,
          icon: Icon(IconBroken.Search),
        ),
      ];
    }
  }

  // isSearch = true => I Mean I'm Doing a Search
  void startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    setState(() {
      isSearch = true;
    });
  }

  // isSearch = false => I Mean I'm Finishing a Search
  void stopSearch() {
    setState(() {
      isSearch = false;
    });
  }

// Delete The Words => Delete The Words After Finishing a Search
  void clearSearch() {
    searchController.clear();
  }
}
