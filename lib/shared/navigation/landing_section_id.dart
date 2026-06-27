enum LandingSectionId {
  features,
  triage,
  protocols,
  decisionTrack,
  platform,
  mobile,
  contact,
}

extension LandingSectionIdLabel on LandingSectionId {
  String get label => switch (this) {
        LandingSectionId.features => 'Funcionalidades',
        LandingSectionId.triage => 'Triagem NEWS2',
        LandingSectionId.protocols => 'Protocolos',
        LandingSectionId.decisionTrack => 'Decision Track',
        LandingSectionId.platform => 'Plataforma Web',
        LandingSectionId.mobile => 'Aplicativo',
        LandingSectionId.contact => 'Contato',
      };
}
