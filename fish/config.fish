if status is-interactive
  status --is-interactive; and source (pyenv init - | source)
  nitch
  set -g fish_greeting
  alias vim "nvim"
  alias ls "exa --icons -l"
  alias ll "exa --icons -al"
  alias pc "sudo pacman -Sc"
  alias se "sudoedit"
  alias code "codium --unity-launch --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime"
  # alias cat "bat"
  set -x https_proxy http://localhost:7897
  set -x http_proxy http://localhost:7897
  set -x all_proxy http://localhost:7897
  set -gx EDITOR nvim
  set -gx GIT_EDITOR nvim
end
