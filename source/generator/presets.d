module generator.presets;

static immutable string[] intros = [
  "hot take, but",
  "hot take:",
  "it seems weird but",
  "",
  "it sucks, but",
  "massive hot take:",
  "boiling hot take but",
  "you will call me crazy but",
  "its crazy but"
];

static immutable string[] opinions = [
  "saying the N-word",
  "eating white chocolate",
  "ranting on TikTok",
  "wearing socks with sandals",
  "putting pineapple on pizza",
  "using comic sans unironically",
  "microwaving fish at the office",
  "clapping when the plane lands",
  "leaving one star reviews for spite",
  "using VS Code",
  "writing code in D",
  "writing code in C++",
  "being a C++ dev",
  "living on the earth",
  "taking a bath",
  "telling your kids to shower",
  "hating on indie shows",
  "if you hate double fedora"
];

static immutable string[] does = [
  "makes you",
  "is normal and you are",
  "means you are"
];

static immutable string[] so = [
  "a pussy",
  "racist",
  "racist, homophobic, xenophobic, dumb, stupid, and transphobic",
  "homophobic",
  "transphobic",
  "spoiled",
  "dumb",
  "doing child abuse",
  "xenophobic",
  "wasting my water i need to talk on c.ai",
  "hating a ship"
];

string random_option(string[] options) {
  import std.random;

  int index = uniform(0, cast(int) options.length);
  return options[index];
}

unittest {
  assert(random_option([".", ".", "."]) == ".");
}
