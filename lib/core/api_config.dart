
class ApiConfigration{
  static const kIpAddress = '10.4.4.2';
  static const kBaseUrl = "http://$kIpAddress:3500";
  static String vendor="/vendor";
  static const chat = "/chat";
  static const getUserConnections = '/getUserConnections/'; //you need to add user id after this
  static const getVendorConnections = '/getConnections/'; //you need to add user id after this
  static const getMessages = "/getMessage/";// you need to add user1Id/user2Id after this , user1Id means from,user2Id means to  
}