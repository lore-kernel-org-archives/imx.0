Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AD63002BB
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189495; cv=none; b=IpHtuGumXaEag3T/b55bfXNU2yAoCI9shH8IKPJysDZ0nLOwlERZnpOTUE1H1w5m8qOGNVw6qq6BkQmIOri7bJj+5LSb6w/oVDfet5owQtc4OXltBSbqoQ8LPQckrRYdnnKpAi1RwJcVmlxNkgN/C9qKswtmy1u256iJYSCYzY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189495; c=relaxed/simple;
	bh=v/FW+vqvsZxAbpnLzr7nsboceDOJ2iSGDX50wWk77L4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GZM4TtNmjHUP/UbP/3duTE9XFwVgoe3VCEMDP5QcmsdFyjaz2PkYK4zl0ANXTYuJw4epX8XmoSx8wPPwRuPv+u2X6JocBtQwEPPHzXh1iLfsKALiiWJpuWc/UHDcwluvWrYlfXDNTyxZlR8jUpOjw1nX6ml3YB/555yZmqCgBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iu1ML6GV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iu1ML6GV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9C6C2BCB3;
	Tue, 19 May 2026 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189494;
	bh=v/FW+vqvsZxAbpnLzr7nsboceDOJ2iSGDX50wWk77L4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Iu1ML6GVxfZ/zZ+dez3zwQQv/DbbW+NGvNg6F9CBmLM0X0Arb9DtFZlH7u0MH26SK
	 9v74dKkH4bbQgo8zSKNy7WcLnT6zqQKKvSTY2fsIzZQriiEPRy5syvU3ttHelA6SkN
	 JWP8WJFL1NCG581mcf2FJVEMrEJ5+oyVBbQ6bMwq+uP/Q5XWDNJ6qar1Y4nDkR554e
	 S/ycjPcV0xTMEIy/xafOHdyyjHbEdFc7YPurzn76QJdvwx3IXb7CD1qrZQ5pV7rnkF
	 0vL5J7S4oQ/BZhtn5gGBu8Grt0+pXi95T50RBkSom8XLkOQwyvtp2JLDPjytXrM7eu
	 5HA6MCYVDSQmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/37] drm/display: bridge-connector: protect dynconn
 creation and destruction with a mutex
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519-drm-bridge-hotplug-v1-17-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-17-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:18:14 +0000
Message-Id: <20260519111814.BC9C6C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing state check inside the locked section of drm_bridge_connec=
tor_add_connector() allows overwriting an existing connector
- [High] Unprotected access to `dynconn` in drm_bridge_connector_handle_hpd=
() leads to NULL pointer dereference
- [High] Use-After-Free caused by mixing `drmm` cleanup actions with dynami=
cally freed connectors
- [Medium] Mixing goto-based error handling with scope-based guard() cleanu=
p in drm_bridge_connector_add_connector()
- [Medium] Missing mutex_destroy() or drmm_mutex_init() for `dynconn_mutex`
--

commit 83c9dccacbc0bf010c7c667632a3090398d3e6ed
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
drm/display: bridge-connector: protect dynconn creation and destruction wit=
h a mutex

This commit introduces a mutex to mutually exclude connector creation and
destruction based on bridge hotplug events. It adds dynconn_mutex to
the drm_bridge_connector structure and uses guard() to protect the
relevant sections.

> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index bd421b6beb7c4..b83da529cc7af 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -152,6 +153,11 @@ struct drm_bridge_connector {
>  	 * @dynconn: The DRM connector added by the drm_bridge_connector
>  	 */
>  	struct drm_bridge_connector_dynconn *dynconn;
> +	/**
> +	 * @dynconn_mutex: Protect @dynconn from concurrent creation and
> +	 * destruction
> +	 */
> +	struct mutex dynconn_mutex;
>  };

Does drm_bridge_connector_handle_hpd() need to use this new mutex?

Since the connector lifecycle is now dynamic, if an asynchronous HPD event
fires concurrently with a bridge detachment (which calls
drm_bridge_connector_dynconn_release() and sets dynconn to NULL under the
mutex), could drm_bridge_connector_handle_hpd() fetch the connector without
the lock and trigger a NULL pointer dereference or use-after-free?

Could the dynamic lifecycle of the connector also cause a use-after-free
with drmm cleanup actions?

drm_bridge_connector_add_connector() calls
drm_bridge_connector_init_hdmi_audio_cec(), which uses
drmm_connector_hdmi_cec_register() to register a cleanup action tied to the
drm_device's lifetime.

Because the connector is now dynamically managed and freed via kfree when a
bridge is detached, won't the drmm cleanup action hold a stale pointer and
execute on an already-freed connector when the DRM device is unregistered?

[ ... ]
> @@ -1050,6 +1058,8 @@ static int drm_bridge_connector_add_connector(struc=
t drm_bridge_connector *bridg
>  	int connector_type;
>  	int ret;
> =20
> +	guard(mutex)(&bridge_connector->dynconn_mutex);
> +

Does introducing guard() here violate the cleanup subsystem guidelines?

The kernel cleanup subsystem guidelines forbid mixing goto-based error
handling with scope-based cleanups like guard() in the same function because
it creates confusing ownership semantics.

Later in this function we see:

	if (ret)
		goto err_put;

	return 0;

err_put:
	drm_connector_put(connector);
	bridge_connector->dynconn =3D NULL;
	return ret;

Could this mix of guard() and goto cause issues?

>  	struct drm_bridge_connector_dynconn *dynconn =3D kzalloc_obj(*dynconn);

Could concurrent hotplug events overwrite an existing connector here?

While later patches in the series introduce
drm_bridge_connector_try_complete() which checks
if (bridge_connector->dynconn), that lockless check happens outside of
dynconn_mutex.

If two threads pass that check simultaneously, they will sequentially
acquire dynconn_mutex here. Would the second thread then unconditionally
overwrite bridge_connector->dynconn with a new allocation, leaking the
first connector's memory and leaving a dangling registered connector?

[ ... ]
> @@ -1177,6 +1187,7 @@ struct drm_connector *drm_bridge_connector_init(str=
uct drm_device *drm,
>  	if (!bridge_connector)
>  		return ERR_PTR(-ENOMEM);
> =20
> +	mutex_init(&bridge_connector->dynconn_mutex);

Should this be drmm_mutex_init() instead?

bridge_connector is allocated with drmm_kzalloc(), meaning its memory is
tied to the DRM device's lifecycle. Since the registered cleanup action
drm_bridge_connector_fini() does not call mutex_destroy(), could freeing
the structure leave an active mutex and trigger kernel debug warnings when
CONFIG_DEBUG_MUTEXES is enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D17
