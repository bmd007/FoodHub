import 'package:flutter/material.dart';

void main() => runApp(const NeighbourFoodApp());

class NeighbourFoodApp extends StatelessWidget {
  const NeighbourFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeighbourFood',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/mealDetails': (context) => const MealDetailsScreen(),
        '/orderConfirmation': (context) => const OrderConfirmationScreen(),
        '/profile': (context) => const UserProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const Center(
        child: Text('Login Screen'),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> meals = ['Pasta', 'Sushi', 'Burger', 'Pizza'];

  HomeScreen({super.key}); // Replace this with actual meal data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(meals[index]),
            subtitle: const Text(
                'Neighbor\'s name and price here'), // Replace with actual details
            trailing: ElevatedButton(
              child: const Text('Order'),
              onPressed: () {
                Navigator.pushNamed(context, '/mealDetails');
              },
            ),
          );
        },
      ),
    );
  }
}

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Details'),
      ),
      body: const Center(
        child: Text('Meal Details Screen'),
      ),
    );
  }
}

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Confirmation'),
      ),
      body: const Center(
        child: Text('Order Confirmation Screen'),
      ),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: const Center(
        child: Text('User Profile Screen'),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}
