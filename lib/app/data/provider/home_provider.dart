

import '../../utils/protocol_constants.dart';
import '../api/api_connect.dart';
import '../model/user.dart';

class HomeProvider {
  HomeProvider();

  // Get request
  Future<User> getUser() async {
    return User.fromJson(
      (await ApiConnect.instance.get(ProtocolConstants.user)).getBody(),
    );
  }
}
