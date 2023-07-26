import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/pages/pages.dart';
import '../bindings/bindings.dart';
import 'app_routes.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

NavigatorState get navigator => _navigatorKey.currentState!;

final routes = [
  GetPage(name: AppRoutes.splash, page: () => const SplashPage()),
  GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding()),
  GetPage(
      name: AppRoutes.signup,
      page: () => const SignUpPage(),
      binding: SignupBinding()),
  GetPage(
      name: AppRoutes.forgotPassword, page: () => const ForgotPasswordPage()),
  GetPage(
      name: AppRoutes.scaffolNavbar,
      page: () => const ScaffolWithNavbarWidget(),
      binding: ScaffoldNavbarBinding()),
  GetPage(
      name: AppRoutes.addNewOrder,
      page: () => const AddNewOrderPage(),
      binding: AddnewOrderBinding()),
  GetPage(
    name: AppRoutes.contacts,
    page: () => const ContacsPage(),
  ),
  GetPage(
      name: AppRoutes.myOrderDetails,
      page: () => const OrderDetailsPage(),
      binding: OrderDetailsBinding()),
  // CreareOrderProductPage
  GetPage(
    name: AppRoutes.createOrderProduct,
    page: () => const CreareOrderProductPage(),
  ),

  GetPage(
    name: AppRoutes.addMultiProduct,
    page: () => const AddMultiProductPage(),
  ),
  GetPage(
    name: AppRoutes.invoices,
    page: () => const InvoicesPage(),
  ),
  GetPage(
    name: AppRoutes.myProducts,
    page: () => const MyProductsPage(),
  ),
  GetPage(
    name: AppRoutes.addUpdateMyProduct,
    page: () => const AddUpdteMyProductPage(),
  ),
];
