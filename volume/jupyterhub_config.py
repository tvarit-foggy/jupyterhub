c.JupyterHub.authenticator_class = 'nativeauthenticator.NativeAuthenticator'
c.Authenticator.admin_users = {'kamal', 'sumesh'}
c.Authenticator.check_common_password = True
c.Authenticator.minimum_password_length = 8
c.Authenticator.enable_signup = True

c.JupyterHub.spawner_class = 'nativespawner.NativeSpawner'
c.Spawner.storage = '/opt/jupyterhub/users'
c.Spawner.default_url = '/lab'

c.JupyterHub.template_paths = ['/opt/jupyterhub/nativeauthenticator/nativeauthenticator/templates']
