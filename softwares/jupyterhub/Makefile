.PHONY: all

all: nativeauthenticator nativespawner

nativeauthenticator:
	@rm -rf nativeauthenticator
	git clone -b master --single-branch https://github.com/jupyterhub/nativeauthenticator.git
	cd nativeauthenticator && git checkout 5d346286a3985de18d298d57f11f3f2dfea0fe90

nativespawner:
	@rm -rf nativespawner
	git clone -b master --single-branch https://github.com/KamalGalrani/jupyterhub-nativespawner.git nativespawner
	cd nativespawner && git checkout e6e93c70ad8f26fe000f871f9f87abda4330af02
