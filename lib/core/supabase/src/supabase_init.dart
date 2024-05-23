import 'package:supabase_flutter/supabase_flutter.dart';

import '../supabase.dart';

class SupabaseInit {
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: SupabaseSecrets.url,
      anonKey: SupabaseSecrets.anon,
    );
  }
}
