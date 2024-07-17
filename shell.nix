{pkgs, ...}: {
  default = {
    name = "Monkey Programming";
    commands = [
      {
        name = "r";
        category = "running";
        help = "Run go code";
        command = "go run main.go";
      }
      {
        name = "gt";
        category = "testing";
        help = "Test go code";
        command = "go test -v ./...";
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
      golines
      gopls
      gotools
    ];
  };
}
