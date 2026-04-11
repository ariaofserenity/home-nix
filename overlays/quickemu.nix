final: prev: {
  quickemu = prev.quickemu.overrideAttrs (oldAttrs: {
    postPatch = (oldAttrs.postPatch or "") + ''
      substituteInPlace quickemu \
        --replace-fail \
          'args+=(-nic bridge,br=''${network},model=''${NET_DEVICE}''${MAC})' \
          'args+=(-nic bridge,br=''${network},helper=$(type -p qemu-bridge-helper),model=''${NET_DEVICE}''${MAC})'
    '';
  });
}