(use-modules
 (gnu home services shells)
 (gnu home)
 (gnu packages base)
 (gnu packages)
 (gnu services)
 (guix gexp))

(define colin-locales
  (make-glibc-utf8-locales
   glibc
   #:locales '("en_US")
   #:name "glibc-us-utf8-locales"))

(home-environment
 (packages
  (cons colin-locales
        (specifications->packages
         (list
          ;; --- Applications --- ;;
          ;; "krita"  ; pulls a lot of KDE
          "libreoffice"
          "sway"
          ;; --- Programming --- ;;
          "clojure"
          "sbcl"
          ;; --- System Tools --- ;;
          "foot"
          "git"
          "git:send-email"
          "grimshot"
          "htop"
          "i3status"
          "mpv"
          "ncdu"
          "ripgrep"
          "swaybg"
          "yt-dlp"
          "zsh"
          "zsh-autosuggestions"
          "zsh-completions"
          "zsh-syntax-highlighting"
          ;; --- Wayland --- ;;
          ;; Pinned to 5.x for Calibre
          "qtwayland@5"
          ;; --- Misc --- ;;
          ;; For git to work.
          "nss-certs"))))

 (services
  (list
   (service
    home-zsh-service-type
    (home-zsh-configuration
     (zprofile (list (local-file "/home/colin/dotfiles/zsh/.zprofile" "zprofile")))
     (zshenv   (list (local-file "/home/colin/dotfiles/zsh/.zshenv" "zshenv")))
     (zshrc    (list (local-file "/home/colin/dotfiles/zsh/.zshrc" "zshrc"))))))))
