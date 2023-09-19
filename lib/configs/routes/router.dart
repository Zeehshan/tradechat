import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/pages/pages.dart';
import '../bindings/bindings.dart';
import 'app_routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

NavigatorState get navigator => navigatorKey.currentState!;

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
    binding: UsersBinding(),
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

  GetPage(
    name: AppRoutes.invoiceDetails,
    page: () => const InvoiceDetailsPage(),
  ),

  GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfilePage(),
      binding: EditProfileBinding()),

  GetPage(
      name: AppRoutes.chatPage,
      page: () => const ChatPage(),
      binding: ChatBinding()),
  GetPage(
    name: AppRoutes.videoPage,
    page: () => const VideoPage(),
  ),

  GetPage(
    name: AppRoutes.payments,
    page: () => const PaymentsPage(),
  ),

  GetPage(
    name: AppRoutes.wallet,
    page: () => const WalletPage(),
  ),

  GetPage(
    name: AppRoutes.bankPayments,
    binding: PaymentsBinding(),
    page: () => const BankPaymentsPage(),
  ),

  GetPage(
      name: AppRoutes.newPayment,
      page: () => const NewPaymentPage(),
      binding: NewPaymentBinding()),
  GetPage(
    name: AppRoutes.paymentDetails,
    page: () => const PaymentDetailsPage(),
  ),
  GetPage(
    name: AppRoutes.settings,
    page: () => const SettingsPage(),
  ),
];
