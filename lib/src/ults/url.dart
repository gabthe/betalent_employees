enum LocalUrls {
  android,
  ios,
}

Map<LocalUrls, dynamic> urls = {
  LocalUrls.ios: 'http://localhost:3000/employees',
  LocalUrls.android: 'http://10.0.2.2:3000/employees',
};
