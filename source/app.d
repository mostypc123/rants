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

  auto hbox = new Box(GtkOrientation.HORIZONTAL, 6);
  auto refreshButton = new Button();
  auto refreshIcon = new Image("view-refresh-symbolic", IconSize.BUTTON);
  refreshButton.add(refreshIcon);
  refreshButton.setTooltipText("Regenerate shit");
  auto infoButton = new Button();
  auto infoIcon = new Image("dialog-information-symbolic", IconSize.BUTTON);
  infoButton.add(infoIcon);
  infoButton.setTooltipText("Show information");
  hbox.packStart(refreshButton, false, false, 0);
  hbox.packStart(infoButton, false, false, 0);
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

  win.showAll();
  Main.run();
}
