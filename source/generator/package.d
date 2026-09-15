module generator;

import generator.presets;

string generate() {
  auto intro   = random_option(cast(string[]) intros);
  auto opinion = random_option(cast(string[]) opinions);
  auto does_   = random_option(cast(string[]) does);
  auto so_     = random_option(cast(string[]) so);

  return intro ~ " " ~ opinion ~ " " ~ does_ ~ " " ~ so_ ~ "\n";
}
