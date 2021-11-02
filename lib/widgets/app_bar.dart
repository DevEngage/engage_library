import 'package:engage_library/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class EngageAppBar extends StatefulWidget implements PreferredSizeWidget {
  double height = 58.0;
  final bool showProfile;
  final bool isModal;
  final bool isBack;
  final int? commentCount;
  final Function? handleCommentPress;
  final bool isSaved;
  final bool isWatched;
  final bool isFavorited;
  final bool hideLogo;
  final Function? handleSavedPress;
  final Function? handleWatchedPress;
  final Function? handleFavoritedPress;
  final Widget? leading;
  final Widget? actionArea;
  final dynamic backResult;
  final Widget? brand;
  EngageAppBar({
    Key? key,
    this.showProfile = false,
    this.leading,
    this.actionArea,
    this.commentCount,
    this.isSaved = false,
    this.handleSavedPress,
    this.handleWatchedPress,
    this.handleCommentPress,
    this.handleFavoritedPress,
    this.isModal = false,
    this.isBack = false,
    this.isWatched = false,
    this.isFavorited = false,
    this.hideLogo = false,
    this.backResult,
    this.brand,
  }) : super(key: key);

  @override
  _EngageAppBarState createState() => _EngageAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _EngageAppBarState extends State<EngageAppBar> {
  getLeading() {}

  share() {
    // Share.share('https://gamesrevealed.page.link/app');
    // Analytics.logShare('https://gamesrevealed.page.link/app');
  }

  @override
  Widget build(BuildContext context) {
    final EngageUserController usersController =
        Get.put(EngageUserController());
    return GFAppBar(
      // leading: GFIconButton(
      //   icon: Icon(
      //     Icons.message,
      //     color: Colors.white,
      //   ),
      //   onPressed: () {},
      //   type: GFButtonType.transparent,
      // ),
      title: Wrap(
        children: [
          if (widget.brand != null) widget.brand!
          // Image.asset(
          //   'assets/img/neon-red-logo-500px.png',
          //   height: 40,
          // ),
          // Container(
          //   margin: const EdgeInsets.only(top: 10, left: 10),
          //   child: Text(
          //     'Quizzes',
          //     style: TextStyle(fontSize: 18, color: AppThemes.secondaryColor),
          //   ),
          // ),
        ],
      ),
      actions: [
        if (widget.actionArea != null) widget.actionArea!,
        if (widget.showProfile ||
            (widget.handleSavedPress != null ||
                widget.handleCommentPress != null ||
                widget.handleWatchedPress != null ||
                widget.handleFavoritedPress != null))
          GetBuilder<EngageUserController>(
            builder: (_) => Wrap(
              children: [
                Wrap(
                  children: [
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () => share(),
                    ),
                    SizedBox(width: 4),
                  ],
                ),
                if (widget.showProfile && usersController.user?.uid != null)
                  Wrap(
                    children: [
                      IconButton(
                        icon: Icon(Icons.person),
                        onPressed: () => Get.toNamed('/profile'),
                      ),
                      SizedBox(width: 10),
                    ],
                  )
                else if ((widget.handleSavedPress != null ||
                        widget.handleCommentPress != null ||
                        widget.handleWatchedPress != null ||
                        widget.handleFavoritedPress != null) &&
                    usersController.user?.uid != null)
                  Wrap(
                    children: [
                      // if (widget.handleCommentPress != null)
                      //   FlatButton(
                      //     child: Wrap(
                      //       children: [
                      //         Container(
                      //           padding: EdgeInsets.only(top: 8, right: 2),
                      //           child: Icon(
                      //             Icons.comment,
                      //             color: AppThemes.white,
                      //             size: 28,
                      //           ),
                      //         ),
                      //         Container(
                      //           padding: EdgeInsets.only(top: 8, right: 0),
                      //           child: Text(
                      //             '${widget.commentCount ?? "0"}',
                      //             style: TextStyle(
                      //                 color: AppThemes.primaryColor,
                      //                 fontSize: 20),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     onPressed: () => widget.handleCommentPress!(),
                      //   ),
                      // if (widget.handleSavedPress != null)
                      //   Container(
                      //     padding: EdgeInsets.only(top: 2, right: 8),
                      //     child: IconButton(
                      //       icon: Icon(
                      //           widget.isSaved == true
                      //               ? Icons.bookmark
                      //               : Icons.bookmark_border,
                      //           size: 30,
                      //           color: widget.isSaved == true
                      //               ? AppThemes.primaryColor
                      //               : null),
                      //       onPressed: () => widget.handleSavedPress!(),
                      //     ),
                      //   ),
                      // if (widget.handleFavoritedPress != null)
                      //   Container(
                      //     padding: EdgeInsets.only(top: 2, right: 8),
                      //     child: IconButton(
                      //       icon: Icon(
                      //           widget.isFavorited == true
                      //               ? Icons.favorite
                      //               : Icons.favorite_border,
                      //           size: 30,
                      //           color: widget.isFavorited == true
                      //               ? AppThemes.secondaryColor
                      //               : null),
                      //       onPressed: () => widget.handleFavoritedPress!(),
                      //     ),
                      //   ),
                      // if (widget.handleWatchedPress != null)
                      //   Container(
                      //     padding: EdgeInsets.only(top: 2, right: 8),
                      //     child: IconButton(
                      //       icon: Icon(
                      //           widget.isWatched == true
                      //               ? Icons.notifications_active
                      //               : Icons.notifications_none,
                      //           size: 30,
                      //           color: widget.isWatched == true
                      //               ? AppThemes.primaryColor
                      //               : null),
                      //       onPressed: () => widget.handleWatchedPress!(),
                      //     ),
                      //   ),
                    ],
                  )
                else
                  FlatButton(
                    child: Text(
                      'Login',
                      // style: TextStyle(color: AppThemes.figmaWhite),
                    ),
                    onPressed: () => Get.toNamed('/login'),
                  ),
              ],
            ),
          ),
      ],
    );
    // AppBar(
    //     leading: Wrap(
    //       children: [
    //         if (widget.isBack == true)
    //           IconButton(
    //             icon: Icon(
    //               Icons.chevron_left,
    //               size: 40,
    //             ),
    //             onPressed: () {
    //               // if (!GetPlatform.isWeb) Ads().hideBanner();
    //               Get.back(result: widget.backResult);
    //             },
    //           ),
    //         widget.leading ?? SizedBox(),
    //         if (widget.isBack == false && widget.isModal == true)
    //           IconButton(
    //             icon: Icon(Icons.close),
    //             onPressed: () => Get.close(1),
    //           )
    //       ],
    //     ),
    //     title: widget.hideLogo == true
    //         ? null
    //         : Image.asset(
    //             'assets/img/neon-logo-500x.png',
    //             height: 40,
    //           ),
    //     actions: [
    //       if (widget.showProfile ||
    //           (widget.handleSavedPress != null ||
    //               widget.handleCommentPress != null ||
    //               widget.handleWatchedPress != null ||
    //               widget.handleFavoritedPress != null))
    //         GetBuilder<UsersController>(
    //           builder: (_) => Wrap(
    //             children: [
    //               if (widget.showProfile && usersController.user?.id != null)
    //                 IconButton(
    //                   icon: Icon(Icons.person),
    //                   onPressed: () => Get.toNamed('/profile'),
    //                 )
    //               else if ((widget.handleSavedPress != null ||
    //                       widget.handleCommentPress != null ||
    //                       widget.handleWatchedPress != null ||
    //                       widget.handleFavoritedPress != null) &&
    //                   usersController.user?.id != null)
    //                 Wrap(
    //                   children: [
    //                     if (widget.handleCommentPress != null)
    //                       FlatButton(
    //                         child: Wrap(
    //                           children: [
    //                             Container(
    //                               padding: EdgeInsets.only(top: 8, right: 2),
    //                               child: Icon(
    //                                 Icons.comment,
    //                                 color: AppThemes.white,
    //                                 size: 28,
    //                               ),
    //                             ),
    //                             Container(
    //                               padding: EdgeInsets.only(top: 8, right: 0),
    //                               child: Text(
    //                                 '${widget.commentCount ?? "0"}',
    //                                 style: TextStyle(
    //                                     color: AppThemes.primaryColor,
    //                                     fontSize: 20),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                         onPressed: () => widget.handleCommentPress!(),
    //                       ),
    //                     if (widget.handleSavedPress != null)
    //                       Container(
    //                         padding: EdgeInsets.only(top: 2, right: 8),
    //                         child: IconButton(
    //                           icon: Icon(
    //                               widget.isSaved == true
    //                                   ? Icons.bookmark
    //                                   : Icons.bookmark_border,
    //                               size: 30,
    //                               color: widget.isSaved == true
    //                                   ? AppThemes.primaryColor
    //                                   : null),
    //                           onPressed: () => widget.handleSavedPress!(),
    //                         ),
    //                       ),
    //                     if (widget.handleFavoritedPress != null)
    //                       Container(
    //                         padding: EdgeInsets.only(top: 2, right: 8),
    //                         child: IconButton(
    //                           icon: Icon(
    //                               widget.isFavorited == true
    //                                   ? Icons.favorite
    //                                   : Icons.favorite_border,
    //                               size: 30,
    //                               color: widget.isFavorited == true
    //                                   ? AppThemes.secondaryColor
    //                                   : null),
    //                           onPressed: () => widget.handleFavoritedPress!(),
    //                         ),
    //                       ),
    //                     if (widget.handleWatchedPress != null)
    //                       Container(
    //                         padding: EdgeInsets.only(top: 2, right: 8),
    //                         child: IconButton(
    //                           icon: Icon(
    //                               widget.isWatched == true
    //                                   ? Icons.notifications_active
    //                                   : Icons.notifications_none,
    //                               size: 30,
    //                               color: widget.isWatched == true
    //                                   ? AppThemes.primaryColor
    //                                   : null),
    //                           onPressed: () => widget.handleWatchedPress!(),
    //                         ),
    //                       ),
    //                   ],
    //                 )
    //               else
    //                 FlatButton(
    //                   child: Text(
    //                     'Login',
    //                     style: TextStyle(color: AppThemes.figmaWhite),
    //                   ),
    //                   onPressed: () => Get.toNamed('/login'),
    //                 ),
    //             ],
    //           ),
    //         ),
    //     ]
    //     // ],
    //     );
  }
}
