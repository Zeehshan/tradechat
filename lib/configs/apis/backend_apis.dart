class BackendApis {
  static String baseUrl = 'http://54.169.73.169:3000/api';
  //// user
  static String login = '/auth/login';
  static String signUp = '/auth/signup';
  static String forgotPassword = '/auth/forgot-password';
  static String resetPassword = '/auth/reset-password';
  static String profile = '/auth/user';
  static String updateProfile = '/auth/profile';
  static String addProduct = '/product';
  static String myProducts = '/product/list';
  static String getUsersAPI = '/auth/users';
  static String deleteProduct = '/product/{productId}';
  static String updateProduct = '/product/{productId}';
  static const order = '/order';

  static const invoice = '/invoice';

  static const file = '/file';

  static const fileDelete = '/file/delete';

  static const displayFile = '/file/download?filename=';

  static const company = '/company';
}
