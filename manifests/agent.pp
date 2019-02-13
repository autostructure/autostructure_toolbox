# Contains agent to be installed on target machine
class autostructure_toolbox::agent (
  String $access_token,
  String $secret_key,
  String $download_url,
  ) {

  class { 'pipelines::agent':
    access_token => Sensitive($access_token),
    secret_key   => Sensitive($secret_key),
    download_url => $download_url,
  }
}
