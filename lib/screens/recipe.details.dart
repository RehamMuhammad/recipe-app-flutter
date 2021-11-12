import 'package:flutter/material.dart';
import 'package:flutter_recipes/models/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail(this.recipe, {Key? key}) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
    double personsNumber = 0;
    double firstIngredient = 0;
    double secondIngredient = 0;
    double thirdIngredient = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),     
            SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.label,
              style: TextStyle(fontSize: 18),
            ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("firstIngredient: $firstIngredient",
                      style: TextStyle(fontSize: 20, color: Colors.purple)),
                ),
                   Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("secondIngredient: $secondIngredient",
                      style: TextStyle(fontSize: 20, color: Colors.pink)),
                ),
                   Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("thirdIngredient: $thirdIngredient",
                      style: TextStyle(fontSize: 20, color: Colors.purple)),
                ),
          
                    Slider(
                  value: personsNumber,
                  label:"${personsNumber * widget.recipe.servings} Servings",
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,
                  activeColor: Colors.teal,
                  inactiveColor: Colors.amber,
                  onChanged: (newValue) {
                    setState(() {
                      personsNumber = newValue.round() as double;
                      firstIngredient = personsNumber * widget.recipe.ingredients[0].quantity;
                     secondIngredient = personsNumber * widget.recipe.ingredients[1].quantity;
                      thirdIngredient = personsNumber * widget.recipe.ingredients[2].quantity;
                     
                    });
                  },
                ),
          ],
        ),
      ),
    );
  }
}

class testApp extends StatelessWidget {
  const testApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
