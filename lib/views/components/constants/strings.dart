import 'package:flutter/foundation.dart' show immutable;

@immutable
class Strings {
  static const appName = 'Instant-gram';
  static const welcomeToAppName = 'Welcome to ${Strings.appName}';
  static const youHaveNoPosts =
      'You have not made a post yet. Press either the video-upload or the photo-upload  buttons to the top of the screen in order to uplaod your first post!';
  static const noPostAvailable =
      "Nobody seems to have made any posts yet. why don't you  take the first step and upload your first post?!";
  static const enterYourSearchTerm =
      'Enter your search term in order to get stater. you can search in the description of all poss availble in the systerm';

  static const comment = 'Comment';
  static const loading = 'Loading...';
  static const person = 'person';
  static const people = 'people';
  static const likedThis = 'liked this';

  static const delete = 'Delete';
  static const areYouSureYouWantToDeleteThis =
      'Are you sure you want to delete this';

  static const areYouSureThatYouWantToLogOutOfTheApp =
      'Are you sure that you want to log out of the app?.';

  static const cancel = 'Cancel';
  static const logOut = 'Log Out';

  static const facebook = 'Facebook';
  static const facebookSignupUrl = 'http://www.facebook.com/signup';
  static const google = 'Google';
  static const googleSignupUrl = 'https://accounts.google.com/signup';
  static const logIntoYourAccount =
      'Log into your account one of the options belows.';
  static const writeYourCommentHere = 'write your comment here...';
  static const checkOutThisPost = 'Check out this post!';
  static const postDetails = 'Post Details';
  static const post = 'post';

  static const createNewPost = 'Create New Post';
  static const pleasWriteYourMessageHere = 'Please write your message here';

  static const noCommentsYet =
      'Nobody has commented on this post yet. you can change that though, and be the first person who comments!';
  static const enterYourSearchTermHere = 'Enter your search here';
  static const dontHaveAnAccount = "Dont't have an account?\n";
  static const signUpOn = 'Sign Up on';
  static const orCreateAnAccountOn = 'or create an account on';

  const Strings._();
}
