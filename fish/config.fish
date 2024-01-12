if status is-interactive
  set -g fish_greeting
  colorscript -e suckless
	alias vim "nvim"
  alias ls "exa --icons -l"
  alias ll "exa --icons -al -T -L=2"
  alias pc "sudo pacman -Sc"
  set PATH ~/.emacs.d/bin/ $PATH
  set PATH /home/shane/Development/rustlings/target/release $PATH
  set -x https_proxy http://127.0.0.1:7890
  set -x http_proxy http://127.0.0.1:7890
  set -x all_proxy socks5://127.0.0.1:7890
end
fish_add_path /home/shane/.spicetify
