import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/pages/detail_page.dart';
import 'package:pokedex/ui/general/colors.dart';
import 'package:pokedex/ui/widgets/item_type_widget.dart';

// ignore: must_be_immutable
class ItemPokemonWidget extends StatelessWidget {
  // String name;
  // String image;
  // List<String> types;

  PokemonModel pokemon;


  // ignore: use_key_in_widget_constructors
  ItemPokemonWidget({
    // required this.name,
    // required this.image,
    // required this.types,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(pokemon: pokemon,)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorsPokemon[pokemon.type.first],
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -20,
              right: -20,
              child: Image.asset(
                'assets/images/pokeball.png',
                height: 120.0,
                color: Colors.white.withOpacity(0.27),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Column(
                  //   children: types.map((e) => ItemTypeWidget()).toList(),
                  // ),
                  ...pokemon.type.map((item) => ItemTypeWidget(text: item,)).toList(),

                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.network(pokemon.img),
            ),
          ],
        ),
      ),
    );
  }
}