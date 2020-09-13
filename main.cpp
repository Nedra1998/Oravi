#include <cstdio>
#include <cxxopts.hpp>

#include <string>
#include <vector>

#include "version.hpp"

enum Prompt { BASH, ZSH, FISH };

static bool prompt_first_section = false;
static bool display_prefix = true;
static bool display_suffix = true;
static Prompt prompt = Prompt::ZSH;

static std::string user = std::getenv("USER");

std::string get_prefix() {
  switch (prompt) {
  case Prompt::BASH:
    return "\\";
  case Prompt::ZSH:
    return "%";
  case Prompt::FISH:
    return "(FISH)";
  }
}
// StyleBuilder &color(std::string value) {
//   if (value.length() == 7 && value[0] == '#') {
//     value.erase(value.begin());
//   }
//   if (value.length() == 6 &&
//       std::all_of(value.begin(), value.end(), [](char &c) {
//         return (c > 47 && c < 58) || (c > 64 && c < 71) ||
//                (c > 96 && c < 103);
//       })) {
//     uint32_t r, g, b;
//     std::sscanf(value.c_str(), "%02x%02x%02x", &r, &g, &b);
//     m_style.color = ((r & 0xFF) << 16) | ((g & 0xFF) << 8) | (b & 0xFF);
//   } else {
//     std::for_each(value.begin(), value.end(),
//                   [](char &c) { c = ::tolower(c); });
//     if (value == "black") { m_style.color = 0xFFFFFF
//   }
//   return *this;
// }

struct Style {
  bool bold, underline, dimmed, italic, blinking;
  std::string fg, bg;

  static std::string reset() {
    if (prompt == Prompt::BASH) {
    } else if (prompt == Prompt::ZSH) {
      return "%{%b%f%k%}\033[0m";
    }
    return "";
  };

  std::string format() const {
    std::string out;
    if (prompt == Prompt::BASH) {
    } else if (prompt == Prompt::ZSH) {
      out += "%{";
      if (bold)
        out += "%B";
      if (dimmed)
        out += "\033[2m";
      if (italic)
        out += "\033[3m";
      if (underline)
        out += "\033[4m";
      if (blinking)
        out += "\033[5m";
      if (!fg.empty())
        out += "%F{" + fg + "}";
      if (!bg.empty())
        out += "%K{" + bg + "}";
      out += "%}";
    }
    return out;
  }
};

std::ostream &operator<<(std::ostream &out, const Style &style) {
  return out << style.format();
}

struct StyleBuilder {
  Style m_style;
  StyleBuilder &bold(bool value = true) {
    m_style.bold = value;
    return *this;
  }
  StyleBuilder &dimmed(bool value = true) {
    m_style.dimmed = value;
    return *this;
  }
  StyleBuilder &italic(bool value = true) {
    m_style.italic = value;
    return *this;
  }
  StyleBuilder &underline(bool value = true) {
    m_style.underline = value;
    return *this;
  }
  StyleBuilder &blinking(bool value = true) {
    m_style.blinking = value;
    return *this;
  }
  StyleBuilder &fg(std::string value) {
    m_style.fg = value;
    std::for_each(m_style.fg.begin(), m_style.fg.end(),
                  [](char &c) { c = ::tolower(c); });
    return *this;
  }
  StyleBuilder &bg(std::string value) {
    m_style.bg = value;
    std::for_each(m_style.bg.begin(), m_style.bg.end(),
                  [](char &c) { c = ::tolower(c); });
    return *this;
  }
  Style build() { return m_style; }
};

struct Section {
  Section(std::string prefix = "", std::string suffix = "",
          bool display = false, Style style = Style())
      : prefix(prefix), suffix(suffix), display(display), style(style) {}
  virtual ~Section() {}

  std::string prefix, suffix;
  bool display;
  Style style;

  virtual std::string format() const { return ""; }
};

std::ostream &operator<<(std::ostream &out, const Section &section) {
  if (!section.display)
    return out;

  out << "%{%B%}";
  if (prompt_first_section && display_prefix) {
    out << section.prefix;
  } else {
    prompt_first_section = true;
  }
  out << "%{%b%}" << section.style << section.format() << Style::reset()
      << "%{%B%}";
  if (display_suffix) {
    out << section.suffix;
  }
  out << "%{%b%}";
  return out;
}

struct Time : public Section {
  Time()
      : Section("at ", " ", true, StyleBuilder().bold().fg("yellow").build()) {}

  std::string format() const {
    if (!time_format.empty()) {
      return get_prefix() + "D{" + time_format + "}";
    } else if (use_12hr) {
      return get_prefix() + "D{%r}";
    } else {
      return get_prefix() + "D{%T}";
    }
  };

  bool use_12hr = false;
  std::string time_format = "";
};

struct User : public Section {
  User()
      : Section("with ", " ", true,
                StyleBuilder().bold().fg("yellow").build()) {}

  std::string format() const {
    if (user == "root") {
      return root_style.format() + "%n" + root_style.reset();
    } else {
      return "%n";
    }
  };

  bool show_always = false;
  Style root_style = StyleBuilder().bold().fg("red").build();
};

struct Dir : public Section {
  Dir() : Section("in ", " ", true, StyleBuilder().bold().fg("cyan").build()) {}

  std::string format() const {
  };

  std::uint8_t truncate = 3;
  std::string trunc_prefix = "";
  bool trunc_repo = true;
  std::string lock_symbol = " ";
  Style lock_style = StyleBuilder().bold().fg("red").build();
};

int main(int argc, const char *argv[]) {
  cxxopts::Options options("Oravi", "Cross-Shell Prompt");

  options.add_options()("h,help", "display this help message")(
      "v,version", "display version information")(
      "s,shell", "shell to generate prompt for",
      cxxopts::value<std::string>()->default_value("zsh"));

  auto result = options.parse(argc, argv);

  if (result.count("help")) {
    std::cout << options.help() << std::endl;
    exit(0);
  } else if (result.count("version")) {
    std::cout << "Oravi: v" << ORAVI_VERSION << std::endl;
  }

  std::string shell = result["shell"].as<std::string>();
  std::for_each(shell.begin(), shell.end(), [](char &c) { c = ::tolower(c); });

  if (shell == "bash") {
    prompt = Prompt::BASH;
  } else if (shell == "zsh") {
    prompt = Prompt::ZSH;
  } else {
    std::cout << "shell must be one of [bash, zsh]" << std::endl
              << options.help() << std::endl;
    exit(1);
  }

  std::vector<std::shared_ptr<Section>> sections;

  sections.push_back(std::make_shared<Time>());
  sections.push_back(std::make_shared<User>());

  for (auto section : sections) {
    std::cout << *section << ' ';
  }

  return 0;
}
