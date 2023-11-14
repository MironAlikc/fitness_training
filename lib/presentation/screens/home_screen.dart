import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/resources/resources.dart';
import 'package:fitness_training/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedPageIndex = 0;
  final Color _inactiveColor = const Color(0xFF1E1E1E);
  final Color _activeColor = const Color(0xFF587DBD);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        CalendarRoute(),
        ContactsRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final tabRouter = AutoTabsRouter.of(context);
        final mediaQuery = MediaQuery.of(context);
        final screenWidth = mediaQuery.size.width;
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: screenWidth > 600 ? 28 : 16,
            currentIndex: tabRouter.activeIndex,
            onTap: (index) => _openPage(index, tabRouter),
            backgroundColor: Colors.white,
            unselectedItemColor: const Color(0xFF1E1E1E),
            selectedItemColor: const Color(0xFF587DBD),
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppSvgs.calendar,
                  width: screenWidth > 600 ? 60 : 34,
                  height: screenWidth > 600 ? 60 : 34,
                  colorFilter: ColorFilter.mode(
                      _selectedPageIndex == 0 ? _activeColor : _inactiveColor,
                      BlendMode.srcIn),
                ),
                label: "Calendar",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppSvgs.contacts,
                  width: screenWidth > 600 ? 60 : 34,
                  height: screenWidth > 600 ? 60 : 34,
                  colorFilter: ColorFilter.mode(
                      _selectedPageIndex == 1 ? _activeColor : _inactiveColor,
                      BlendMode.srcIn),
                ),
                label: "Contacts",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppSvgs.settings,
                  width: screenWidth > 600 ? 60 : 34,
                  height: screenWidth > 600 ? 60 : 34,
                  colorFilter: ColorFilter.mode(
                      _selectedPageIndex == 2 ? _activeColor : _inactiveColor,
                      BlendMode.srcIn),
                ),
                label: "Settings",
              ),
            ],
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    setState(() => _selectedPageIndex = index);
    tabsRouter.setActiveIndex(index);
  }
}
