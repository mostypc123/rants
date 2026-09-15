import std.stdio;
import generator;
import gtk.Main;
import gtk.MainWindow;
import gtk.Box;
import gtk.Button;
import gtk.Image;
import gtk.ScrolledWindow;
import gtk.TextView;
import gtk.TextBuffer;
import gtkc.gtktypes;

string info = import("README.md");

void main(string[] args) {
  Main.init(args);

  auto win = new MainWindow("Tiktok Rant Generator");
  win.setDefaultSize(530, 300);
  win.setBorderWidth(8);

  auto vbox = new Box(GtkOrientation.VERTICAL, 8);
  win.add(vbox);

  // dont even read this part of the code, it is too bad.
  // i said dont
  // I SAID DONT
  // I SEE YOU
  // I HAVE SAID NO
  auto hbox = new Box(GtkOrientation.HORIZONTAL, 6);
  auto refreshButton = new Button();
  auto refreshIcon = new Image("view-refresh-symbolic", IconSize.BUTTON);
  refreshButton.add(refreshIcon);
  refreshButton.setTooltipText("Regenerate shit");
  auto infoButton = new Button();
  auto infoIcon = new Image("dialog-information-symbolic", IconSize.BUTTON);
  auto confButton = new Button();
  auto bookIcon = new Image("emblem-system-symbolic", IconSize.BUTTON);
  confButton.add(bookIcon);
  infoButton.add(infoIcon);
  infoButton.setTooltipText("Show information");
  confButton.setTooltipText("Show configuration");
  hbox.packStart(refreshButton, false, false, 0);
  hbox.packStart(infoButton, false, false, 0);
  hbox.packStart(confButton, false, false, 0);
  vbox.packStart(hbox, false, false, 0);

  auto scroll = new ScrolledWindow();
  scroll.setPolicy(PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
  scroll.setShadowType(ShadowType.IN);

  auto shitView = new TextView();
  shitView.setEditable(false);
  shitView.setCursorVisible(false);
  shitView.setWrapMode(WrapMode.NONE);
  auto buffer = shitView.getBuffer();

  scroll.add(shitView);
  vbox.packStart(scroll, true, true, 0);

  buffer.setText(generate());

  refreshButton.addOnClicked((Button b) {
    buffer.setText(generate());
  });

  infoButton.addOnClicked((Button b) {
    import std.array : replace;
    buffer.setText(info.replace("```\n", "").replace("**", ""));
  });

  confButton.addOnClicked((Button b) {
    string text = "current config:\n\n  intros:\n";
    foreach (intro; intros) text ~= "    " ~ intro ~ "\n";
    text ~= "\nopinions:\n";
    // was too lazy to not edit the name so it stays as intro.
    foreach (intro; opinions) text ~= "    " ~ intro ~ "\n";
    text ~= "\ndoes:\n";
    foreach (intro; does) text ~= "    " ~ intro ~ "\n";
    text ~= "\nso:\n";
    foreach (intro; so) text ~= "    " ~ intro ~ "\n";
    buffer.setText(text);
  });

  win.showAll();
  Main.run();
}
