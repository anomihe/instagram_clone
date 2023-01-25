import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_riverpod/state/auth/provider/authStateProvider.dart';
import 'package:instagram_clone_riverpod/state/image_upload/helpers/image_picker_helper.dart';
import 'package:instagram_clone_riverpod/state/image_upload/models/file_type.dart';
import 'package:instagram_clone_riverpod/state/post_setting/providers/post_settings_provider.dart';
import 'package:instagram_clone_riverpod/views/components/constants/strings.dart';
import 'package:instagram_clone_riverpod/views/components/dialog/alert_dialog_model.dart';
import 'package:instagram_clone_riverpod/views/components/dialog/logout_dialog.dart';
import 'package:instagram_clone_riverpod/views/create_new_post/create_new_post_view.dart';
import 'package:instagram_clone_riverpod/views/tabs/user_posts/user_posts_view.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(Strings.appName),
            actions: [
              IconButton(
                  onPressed: () async {
                    final videoFile =
                        await ImagePickerHelper.pickVideofromGallery();
                    if (videoFile == null) {
                      return;
                    }
                    ref.refresh(postSettingProvider);

                    //go to the screen to create a new post
                    if (!mounted) {
                      return;
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return CreateNewPostView(
                        fileToPost: videoFile,
                        fileType: FileType.video,
                      );
                    }));
                  },
                  icon: const FaIcon(FontAwesomeIcons.film)),
              IconButton(
                  onPressed: () async {
                    //pick an image file
                    final imageFile =
                        await ImagePickerHelper.pickImageFromGallery();
                    if (imageFile == null) {
                      return;
                    }
                    ref.refresh(postSettingProvider);
                    if (!mounted) {
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return CreateNewPostView(
                              fileToPost: imageFile, fileType: FileType.image);
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.add_photo_alternate_outlined)),
              IconButton(
                  onPressed: () async {
                    final shouldLogOut =
                        await const LogoutDialog().present(context).then(
                              (value) => value ?? false,
                            );
                    if (shouldLogOut) {
                      await ref.read(authStateProvider.notifier).logOut();
                    }
                  },
                  icon: const Icon(Icons.logout))
            ],
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.person),
              ),
              Tab(
                icon: Icon(Icons.search),
              ),
              Tab(
                icon: Icon(Icons.home),
              ),
            ]),
          ),
          body: const TabBarView(children: [
            UserPostView(),
            UserPostView(),
            UserPostView(),
          ]),
        ));
  }
}
