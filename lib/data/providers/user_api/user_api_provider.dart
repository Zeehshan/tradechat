import '../../../models/models.dart';

abstract class UserApiProvider {
  Future<ProfileModel?> login(
      {required String email, required String password});

  Future signup({required String email, required String password});

  Future<ProfileModel?> profile();

  Future forgotPassword({required String email});

  Future resetPassword(
      {required String oldPassword, required String newPassword});

  Future updateProfile({
    String? firstanme,
    String? lastname,
    String? phone,
    String? username,
    String? profilePic,
  });

  Future<CompanyModel> getCompany();

  Future updateCompany({required CompanyModel company});
}
