class ApiRoutes {
  static const String baseUrl = "https://febe-backend.onrender.com";
  static String userBase = "$baseUrl/api/users";
  static String authLogin = "$userBase/login";
  static String authVerifyOTP = "$userBase/verify-otp";
  static String enablerCategoryBase = "$baseUrl/api/enabler-categories";
  static String enablerDesignation =
      "$enablerCategoryBase/{categoryId}/enabler-designations";
  static String entrepreneurIndustryBase = "$baseUrl/api/entrepreneur-industry";
  static String fileBase = "$baseUrl/api/files";
  static String finderBase = "$baseUrl/api/finder";
  static String location = "$userBase/location";
}
 