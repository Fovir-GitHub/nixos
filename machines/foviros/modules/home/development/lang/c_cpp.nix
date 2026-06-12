{pkgs, ...}: {
  home.packages = with pkgs; [
    # LSP, compliers and formatter.
    clang-tools
    gcc

    # Debuggers.
    gdb
    cgdb

    # Make tools.
    cmake
    gnumake
  ];

  home.file.".clang-tidy".text = ''
    Checks:
      - '*'
      - -llvm*
      - -altera*
      - -google*
      - -fuchsia*
      - -boost*
      - -cppcoreguidelines*
      - -modernize-use-trailing-return-type
      - -modernize-use-nodiscard
      - -hicpp-special-member-functions
      - -hicpp-explicit-conversions
      - -readability-identifier-length
      - -readability-isolate-declaration
      - -readability-static-definition-in-anonymous-namespace
      - -misc-non-private-member-variables-in-classes
      - -misc-no-recursion
      - -misc-use-anonymous-namespace
      - -misc-use-internal-linkage
      - -readability-implicit-bool-conversion
      - -readability-convert-member-functions-to-static
      - -bugprone-easily-swappable-parameters
  '';

  home.file.".clang-format".text = ''
    BasedOnStyle: LLVM
    AccessModifierOffset: -4
    IndentCaseLabels: true
    IndentWidth: 4
    PointerAlignment: Middle
    BreakTemplateDeclarations: true
  '';
}
