abstract class FireBaseAuthMethods {
  Future<void> sighnUpEmail(
    String email,
    String password,
  );
  Future<void> sighnInEmail(
    String email,
    String password,
  );
  Future<void> sighnOut();
  Future<void> verifyEmail();
  Future<void> signInWithGoogle();
  Future<void> forgetPassword(String email);
  Future<(String , int?)> signWithPhone(
    String phone,
  );
  Future<void> verifyOtp(String verificationId, String otp);
}
