if status is-interactive
  set -g fish_greeting
  colorscript -e elfman
  alias vim "nvim"
  alias ls "exa --icons -l"
  alias ll "exa --icons -al"
  alias pc "sudo pacman -Sc"
  alias se "sudoedit"
  alias ya "yazi"
  set PATH /home/shane/Code/rustlings/target/release $PATH
  set PATH /home/shane/.config/emacs/bin $PATH
  set -x https_proxy http://localhost:20171
  set -x http_proxy http://localhost:20171
  set -x all_proxy http://localhost:20171
  set -gx EDITOR nvim
  set -gx GIT_EDITOR nvim
end
