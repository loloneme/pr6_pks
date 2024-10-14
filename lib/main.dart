import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr6/models/cart_item.dart';
import 'package:pr6/pages/cart_page.dart';
import 'package:pr6/pages/drinks_page.dart';
import 'pages/profile_page.dart';
import '../data.dart';
import 'pages/favorites_page.dart';
import '../models/drink.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ПР6 ПКС',
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromRGBO(44, 32, 17, 1.0),
          selectedItemColor: Color.fromRGBO(181, 139, 80, 1.0),
          unselectedItemColor: Color.fromRGBO(255, 238, 205, 1.0),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  final List<Drink> _drinks = drinks;
  late Map<String, String> _profile = {
    'name': "Мрясова Анастасия",
    'profile_picture': 'https://github.com/loloneme/images/blob/main/182a9bb9f5b32babe6efc8c7bf4305be.jpg?raw=true',
    'email': '1fukkacumi2@mail.ru',
    'phone': '89991111337'
  };

  late List<CartItem> _cart = [
    CartItem('Милкшейк',
        'https://github.com/loloneme/images/blob/main/milkshake.png?raw=true',
        true,
        2,
        260,
        '350'),
    CartItem('Бамбл',
        'https://github.com/loloneme/images/blob/main/bumble.png?raw=true',
        true,
        2,
        300,
        '350')
  ];

  List<Widget> get _pageOptions => <Widget>[
        DrinksPage(
          drinks: _drinks,
          addNewDrink: _addNewDrink,
          toggleFavorite: _toggleFavorite,
          removeDrink: _removeDrink,
          addToCart: _addToCart,
        ),
        FavoritesPage(
          drinks: _drinks,
          addNewDrink: _addNewDrink,
          toggleFavorite: _toggleFavorite,
          addToCart: _addToCart,
        ),
        CartPage(
            items: _cart,
            deleteItem: _removeFromCart,
            decrementAmount: _decrementAmount,
            incrementAmount: _incrementAmount,
        ),
        ProfilePage(
          profile: _profile,
          updateProfile: _updateProfile,
        )
      ];

  void _addNewDrink(Drink drink) {
    setState(() {
      _drinks.add(drink);
    });
  }

  void _updateProfile(newProfile){
    setState(() {
      _profile = newProfile;
    });
  }

  void _removeDrink(index) {
    setState(() {
      _cart = _cart.where((el) => el.name != _drinks[index].name).toList();
      _drinks.removeAt(index);
    });
  }

  void _toggleFavorite(index) {
    setState(() {
      _drinks[index].isFavorite = !_drinks[index].isFavorite;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  void _removeFromCart(int index){
    setState(() {
      _cart.removeAt(index);
    });
  }

  void _decrementAmount(int index){
    if (_cart[index].amount <= 1){
      _removeFromCart(index);
    } else {
      setState(() {
        _cart[index].amount -= 1;
      });
    }
  }

  void _incrementAmount(int index){
    setState(() {
      _cart[index].amount += 1;
    });
  }

  void _addToCart(CartItem item){
    int index = _cart.indexWhere((el) => el.name == item.name && el.isCold == item.isCold && el.volume == item.volume);
    if (index == -1){
      setState(() {
        _cart.add(item);
      });
    } else {
      setState((){
        _cart[index].amount += item.amount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions.elementAt(_selectedPage),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.coffee_rounded),
              label: "Напитки"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded),
              label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedPage,
        selectedItemColor: const Color.fromRGBO(181, 139, 80, 1.0),
        unselectedItemColor: const Color.fromRGBO(255, 238, 205, 1.0),
        backgroundColor: const Color.fromRGBO(44, 32, 17, 1.0),
        selectedLabelStyle:
            GoogleFonts.sourceSerif4(textStyle: const TextStyle()),
        unselectedLabelStyle:
            GoogleFonts.sourceSerif4(textStyle: const TextStyle()),
        onTap: _onItemTapped,
      ),
    );
  }
}
