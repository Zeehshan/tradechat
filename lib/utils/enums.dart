enum SocialLoginType { gmail, apple, facbook, google }

enum AuthScreenType { login, signup }

// This handles building the widget in response to new states.
// Use in [BlocBuilder] or [BlocConsumer].
enum GetStateUIStatus { loading, loaded, error }

// Invokes the listener in response to state changes in the bloc.
// It should be used for functionality that needs to occur once per state change
// such as navigation, showing a SnackBar, showing a Dialog, etc...
// Use in [BlocListener] or [BlocConsumer].
enum GetStateUIActionType {
  none,
  inProgress,
  completed,
  failure,
  navigateToNext,
  navigateToBack,
}

enum AlertBannerLocation {
  top,
  bottom,
}

enum PostsType { promoted, post }
