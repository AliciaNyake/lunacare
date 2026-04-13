import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'daily_info_screen.dart';
import 'moon_info_screen.dart';
import 'my_info_screen.dart';
import 'settings_screen.dart';
import 'account_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget buildTopBarButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: AppTheme.primaryPurple,
      child: IconButton(
        icon: Icon(icon, size: 16, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  Widget buildRoundedButton({
    required String text,
    required VoidCallback onPressed,
    double width = double.infinity,
    double height = 42,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  Widget buildSquareButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 95,
        height: 95,
        decoration: BoxDecoration(
          color: AppTheme.primaryPurple.withOpacity(0.35),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget buildMiniCalendar() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppTheme.softPink, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: Text(
                  'Date',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              Expanded(
                child: Text('cycle en cours'),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('SUN'),
              Text('MON'),
              Text('TUE'),
              Text('WED'),
              Text('THU'),
              Text('FRI'),
              Text('SAT'),
            ],
          ),
          const SizedBox(height: 6),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 35,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: AppTheme.softPink.withOpacity(0.35),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 320,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F1F8),
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'LUNA CARE',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    buildTopBarButton(
                      icon: Icons.person,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AccountScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    buildTopBarButton(
                      icon: Icons.settings,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                buildRoundedButton(
                  text: 'Accueil',
                  onPressed: () {},
                  height: 34,
                ),
                const SizedBox(height: 12),
                buildMiniCalendar(),
                const SizedBox(height: 14),
                buildRoundedButton(
                  text: 'Bouton info du jour',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DailyInfoScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildSquareButton(
                      text: 'Infos lune',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MoonInfoScreen(),
                          ),
                        );
                      },
                    ),
                    buildSquareButton(
                      text: 'Mes infos',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyInfoScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                buildRoundedButton(
                  text: 'Réglages',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}