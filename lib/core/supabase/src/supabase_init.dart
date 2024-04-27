part of supabase;

class SupabaseInit {
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: SupabaseSecrets.url,
      anonKey: SupabaseSecrets.anon,
    );
  }
}