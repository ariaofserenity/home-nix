                # temporary workaround for picosvg failing to build
                (final: prev: {
                  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
                    (python-final: python-prev: {
                      picosvg = python-prev.picosvg.overridePythonAttrs (oldAttrs: {
                        doCheck = false;
                      });
                    })
                  ];
                })