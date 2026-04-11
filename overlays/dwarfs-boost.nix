# temporarily fix dwarfs not building on newer boost version
(final: prev: {
  dwarfs = prev.dwarfs.override {
    boost = prev.boost187;
  };
})
