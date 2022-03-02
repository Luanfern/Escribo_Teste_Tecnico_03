import 'package:dependency_module/dependency_module.dart';

import '../../../avatar_customization_module.dart';

part 'avatar.store.g.dart';

class AvatarStore = _AvatarStore with _$AvatarStore;

abstract class _AvatarStore with Store {
  late final ISaveAvatar saveavatar;
  late final IUpdateAvatar updateavatar;
  late final ICurrentAvatar currentavatar;

  _AvatarStore({
    required this.saveavatar,
    required this.updateavatar,
    required this.currentavatar,
  });

  @action
  Future<void> updateAvatar(String avatar) async {
    Avatar avatarInsert = Avatar(
        avatar 
      );
    await updateavatar.update(avatarInsert, 1);
  }

  @action
  Future<void> verifyExist(int id, String avatar) async {
    List<Avatar> returndata = await currentavatar.readCurrent(id);
    if (returndata.length == 1) {
      print('ja existe');
    } else if(returndata.length > 1){
      print('muitos registros');
    }else{
      Avatar avatarInsert = Avatar(
        avatar 
      );
      await saveavatar.save(avatarInsert);
    }
  }
}