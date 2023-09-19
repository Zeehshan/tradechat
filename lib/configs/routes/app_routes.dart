abstract class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const signup = '/singup';
  static const forgotPassword = '/forgotPassword';

  ///parent
  static const scaffolNavbar = '/scaffoldNavbar';

  //// childs of scaffolNavbar
  static const chats = '/chats';
  static const myOrders = '/myOrders';
  static const myProfile = 'myProfile';

  ////
  ///
  static const addNewOrder = '/addNewOrder';
  static const contacts = '/contacts';
  static const myOrderDetails = '/myOrderDetails';
  static const createOrderProduct = '/createOrderProduct';
  static const addMultiProduct = '/addMultiProduct';
  static const invoices = '/invoices';
  static const invoiceDetails = '/invoiceDetails';

  static const myProducts = '/myProducts';
  static const addUpdateMyProduct = '/addUpdateMyProduct';

  static const editProfile = '/editProfile';

  static const chatPage = '/chatPage';

  static const videoPage = '/videoPage';

  static const payments = '/payments';
  static const wallet = '/wallet';
  static const bankPayments = '/bankPayments';
  static const newPayment = '/newPayment';

  static const paymentDetails = '/paymentDetails';
  static const settings = '/settings';
}
