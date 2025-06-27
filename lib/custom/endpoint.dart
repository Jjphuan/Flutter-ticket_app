class Endpoint{
  static String domain = 'http://10.0.2.2:8000/api';

  //login && register
  static String register = '/register';
  static String login = '/login';
  static String checkToken = '/user';
  static String logout = '/logout';

  //help center
  static String question = '/question';

  //home
  static String discount = '/discount';

  // ticket
  static String searchTickets = '/search_tickets';
  static String tickets = '/all_tickets';
}