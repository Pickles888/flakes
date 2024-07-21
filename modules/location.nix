{
  config,
  lib,
  ...
}: {
  options = {
    location.timeZone = lib.mkOption {
      type = lib.types.str;
      default = "America/Los_Angeles";
      description = "Main location in time zone";
    };

    location.locale = lib.mkOption {
      type = lib.types.str;
      default = "en_US.UTF-8";
      description = "System language";
    };
  };

  config = {
    time.timeZone = config.location.timeZone;
    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = 
      let 
	locale = config.location.locale;
      in {
	LC_ADDRESS = locale;
	LC_IDENTIFICATION = locale;
	LC_MEASUREMENT = locale;
	LC_MONETARY = locale;
	LC_NAME = locale;
	LC_NUMERIC = locale;
	LC_PAPER = locale;
	LC_TELEPHONE = locale;
	LC_TIME = locale;
      };
    };
  };
}
