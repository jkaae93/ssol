enum IntroState {
  ready,
  loading,
  login,
}

extension IntroEx on IntroState {
  String get name {
    switch (this) {
      case IntroState.ready:
        return "ready";
      case IntroState.loading:
        return "loading";
      case IntroState.login:
        return "login";
      default:
        return '';
    }
  }
}
