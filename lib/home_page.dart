import 'package:coffee_ui/utils/coffee_tile.dart';
import 'package:coffee_ui/utils/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List of coffee types

  final List coffeeType = [
    [
      'Cappuccino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];

  //user tapped on coffee types

  void coffeeTypeSelected() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ' '),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ' '),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ' '),
      ]),
      body: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: MainColumn(),
          ),
        ],
      ),
    );
  }
}

class MainColumn extends StatelessWidget {
  const MainColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Find the best coffee for you

        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Find the best ',
            style: GoogleFonts.bebasNeue(fontSize: 50),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'coffee for you',
            style: GoogleFonts.bebasNeue(fontSize: 50),
          ),
        ),

        const SizedBox(
          height: 25,
        ),

//search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.orange,
              ),
              hintText: 'Find your coffee..',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600)),
            ),
          ),
        ),

        const SizedBox(
          height: 25,
        ),

        //horizontal listview of coffee types

        CoffeeTypeMenu(
          onSelected: (selectedValue) => print(selectedValue),
        ),

// horizontal Listview of coffee tiles

        SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: const [
              CoffeeTile(
                imageUrl: 'lib/images/cappucino.jpg',
                coffeeName: 'Cappuccino',
                coffeePrice: '4',
              ),
              CoffeeTile(
                imageUrl: 'lib/images/latte.jpg',
                coffeeName: 'Latte',
                coffeePrice: '3.75',
              ),
              CoffeeTile(
                imageUrl: 'lib/images/milk.jpg',
                coffeeName: 'Tea',
                coffeePrice: '3.50',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CoffeeTypeMenu extends StatefulWidget {
  const CoffeeTypeMenu({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  final void Function(int selectedValue) onSelected;

  @override
  State<CoffeeTypeMenu> createState() => _CoffeeTypeMenuState();
}

class _CoffeeTypeMenuState extends State<CoffeeTypeMenu> {
  int selecteId = 0;
  final List<String> coffeTypes = ['Cappuccino', 'Latte', 'Tea', 'Milk'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: coffeTypes.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              widget.onSelected(index);
              setState(() {
                selecteId = index;
              });
            },
            child: CoffeeType(
              coffeeType: coffeTypes[index],
              isSelected: index == selecteId,
            ),
          );
        },
      ),
    );
  }
}
