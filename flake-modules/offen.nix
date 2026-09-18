{ lib, ... }:
{
  perSystem = {
    forge.apps.offen = {
      # services.components.apps.offen.process.environment.MY_VAR = lib.mkForce "value";
      description = lib.mkForce "Custom offen service configuration.";
      services.components.offen.process = {
        # https://docs.offen.dev/running-offen/configuring-the-application/
        environment = {
          OFFEN_SERVER_PORT = lib.mkForce "9000";

          # What is "account id"? From <https://docs.offen.dev/running-offen/embedding-the-script/>:
          # > Your Account ID and the entire snippet can be found when
          # > you log in to the Auditorium and select the account you want
          # > use.

          # Oooh, `offen setup` might be the way to get admin access to the metrics:
          # <https://docs.offen.dev/running-offen/using-the-command/#offen-setup>
          # Oh, or going to /setup one it's running.

          # <<< OFFEN_SERVER_REVERSEPROXY = "true";
          # ???
          # <<< If set to true the application will assume it is running
          # behind a reverse proxy. This means it does not add caching or
          # security related headers to any response. Logging information
          # about requests to stdout is also disabled.
          # ooh so they would rather you *not* run behind a reverse proxy:
          # <https://docs.offen.dev/running-offen/installation-requirements/#running-the-application-behind-a-reverse-proxy>
          # we must, though, as we already have nginx bound on 80 and 443. or
          # we need another IP address to bind on 80 and 443.

          # nix run github:ngi-nix/forge#pkgs.offen secret
          # <<< TODO: generate + encrypt >>>
          # <<< OFFEN_SECRET = "...";

          # <<< TODO: email >>>
          # https://docs.offen.dev/running-offen/tutorials/configuring-deploying-offen-ubuntu/#setting-up-email

          # <<< TODO: persistent db? >>>
          # https://docs.offen.dev/running-offen/configuring-the-application/#database
          # but https://docs.offen.dev/running-offen/installation-requirements/#choosing-a-datastore says something different?

          # <<< OFFEN_APP_LOGLEVEL = "debug";

          # <<< monitoring: <https://docs.offen.dev/running-offen/monitoring-offen/> >>>

          # <<< backups? >>>
        };

        # >>> TODO: explain the foo:bar syntax here <<<
        ports = lib.mkForce [ "9000:9000" ];
      };
    };
  };
}
