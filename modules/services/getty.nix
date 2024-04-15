{ config, lib, ... }: { services.getty.autologinUser = lib.mkDefault "asynth"; }
