{pkgs, ...}: {
  default = {
    name = "Monkey Programming";
    commands = [
      {
        name = "gt";
        category = "testing";
        help = "Test go code";
        command = "go test -v";
      }
      {
        name = "fmt";
        category = "formatting";
        help = "Format all code properly";
        command = "nix fmt";
      }
    ];

    ## TODO: how to properly pin the used go version?
    ## https://blog.mplanchard.com/posts/installing-a-specific-version-of-a-package-with-nix.html
    packages = with pkgs; [
      go
      gopls
      gotools
    ];
  };
}
