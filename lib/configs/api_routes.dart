class ApiRoutes {
  static const String base_url = "http://192.168.26.247:3000";

  static String auth_register_APIURL = "$base_url/api/users/register";
  static String auth_login_APIURL = "$base_url/api/users/login";
  static String contacts_fetch_all_APIURL = "$base_url/api/contacts";
  static String contacts_fetch_specific_APIURL = "$base_url/api/contacts/:contactId";
  static String contacts_add_APIURL = "$base_url/api/contacts";
  static String contacts_update_APIURL = "$base_url/api/contacts/:contactId";
  static String contacts_delete_APIURL = "$base_url/api/contacts/:contactId";
  static String contacts_delete_all_APIURL = "$base_url/api/contacts";  
}
