class ApiRoutes {
  static const String baseUrl = "http://139.59.77.243:3000";
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
  static String chatBase = "$baseUrl/chats";
  static String sockeServertUrl = baseUrl;
}
