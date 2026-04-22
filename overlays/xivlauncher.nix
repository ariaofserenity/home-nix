(final: prev: {
    xivlauncher-rb = prev.xivlauncher-rb.overrideAttrs (old: {
      dotnet-sdk     = prev.dotnetCorePackages.dotnet_9.sdk;
      dotnet-runtime = prev.dotnetCorePackages.dotnet_9.runtime;
    });
  })