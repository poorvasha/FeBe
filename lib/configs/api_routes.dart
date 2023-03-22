class ApiRoutes {
  static const String baseUrl = "http://192.168.202.193:3000";
  static String userBase = "$baseUrl/api/users";
  static String authLogin = "$userBase/login";
  static String authVerifyOTP = "$userBase/verify-otp";
}
