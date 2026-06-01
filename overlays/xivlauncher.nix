(final: prev: {
  xivlauncher-rb = prev.xivlauncher-rb.overrideAttrs (old: {
    dotnet-sdk     = prev.dotnetCorePackages.dotnet_9.sdk;
    dotnet-runtime = prev.dotnetCorePackages.dotnet_9.runtime;
    dotnetFlags = [
      "-p:BuildHash=1.4.0"
      "-p:PublishSingleFile=false"
    ];
  });
})