Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B70B3002BB
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189340; cv=none; b=mKaA9m2J+HJgO2rVfDVm0FHEEtzbkZOARJ0z/KXUB/iLMB/FgCGjtHvICHwz/D1cK+yk+uZN6bFBN8hh6VN8z5YpSxXKAu7fmmTEBym3S9gp4qN0MtArrST2CdelhOaFb+488fUR5bBlnWCeohY9qdSIYSv6PrgBEfIZ/Tlgac4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189340; c=relaxed/simple;
	bh=UrbXv6C0nGGjR/JZjJa90su4I9GSrmqhGT9Mq/U6Drc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aBFgMKvkMNibuIOjQTwF5acy3FcnPcJ0bhaiY70rF8oJ9B9IXRaptpjoQm4v5Xu8x+ZphJiwsg66iKLtH+cE0aZJiYXVwKYzX138mkTuzHSWPMa6ZTcfBDILhJIT2zsuY/zj6f1wWpqRxOdsK8EzrhxPSt7HA5QCNzUso5Xx05o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+Lqq2oG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+Lqq2oG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9325C2BCB3;
	Tue, 19 May 2026 11:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189340;
	bh=UrbXv6C0nGGjR/JZjJa90su4I9GSrmqhGT9Mq/U6Drc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=k+Lqq2oG9I3qcwBiZlf05n0D81HqothuRHBwE49zgcw6qV7IIuujqmcTvPcAwfDS+
	 CbikGbLDmprMkrGjqvg7n+x+YH6tMo6W2j44/vr8BSOuF3ddGusMmildILlD6nbr7z
	 6ewYRBR/dlzdlppLGFIrFV8RAdbMqLSahSzmRPpEPkranfYExso1WWoxcgAbRzwcSR
	 0nog3yVDNXQTu72/j5WJ6iK8qK0oLsepEbUL19mpxuJ5HOYoi8EqZDYrOWuxM4bAY3
	 knQs/K5ZYOULRbjorPJtRd87/NOMIfn2z/No/AmkQKPGpDTx+q/52deqY1ZrQ8p6jy
	 z4UYcsgfvGk7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/37] drm/display: bridge-connector: allocate the
 connector dynamically
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519-drm-bridge-hotplug-v1-15-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-15-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:15:39 +0000
Message-Id: <20260519111539.D9325C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Dynamic connector is passed to `drmm_` CEC cleanup actions, leadin=
g to a Use-After-Free if initialization fails.
- [High] Unconditional dereference of `dynconn` in the HPD handler causes a=
 potential NULL pointer dereference.
- [Medium] Bridge references acquired during connector initialization are l=
eaked on error paths.
--

commit b1940f18716e1942290e7aa7cf6a8cdaa0380840
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/display: bridge-connector: allocate the connector dynamically

This commit changes drm_bridge_connector to allocate its drm_connector
dynamically instead of embedding it. This allows recreating the connector
during hotplug events while the bridge connector object remains persistent.

> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index 1fd104f1647b8..b4e2c8f1d32d6 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
[ ... ]
> @@ -179,7 +194,7 @@ static void drm_bridge_connector_hpd_notify(struct dr=
m_connector *connector,
>  static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector =
*bridge_connector,
>  					    enum drm_connector_status status)
>  {
> -	struct drm_connector *connector =3D &bridge_connector->base;
> +	struct drm_connector *connector =3D &bridge_connector->dynconn->connect=
or;

Since the connector is now allocated dynamically, is it possible for a
hotplug event to trigger when bridge_connector->dynconn is NULL? If so,
will dereferencing dynconn here cause a NULL pointer dereference?

[ ... ]
> @@ -1009,13 +1046,20 @@ static int drm_bridge_connector_add_connector(str=
uct drm_bridge_connector *bridg
[ ... ]
> -	ret =3D drm_bridge_connector_get_bridges(bridge_connector, &connector_t=
ype,
> +	ret =3D drm_bridge_connector_get_bridges(dynconn, &connector_type,
>  					       &supported_formats, &max_bpc, &ddc,
>  					       &panel_bridge, &support_hdcp);
> -	if (ret)
> +	if (ret) {
> +		kfree(dynconn);
>  		return ret;
> +	}

If drm_bridge_connector_get_bridges() encounters an error and returns early,
it may have already acquired some bridge references. Are those references
leaked here since drm_bridge_connector_put_bridges() isn't called before
returning?

[ ... ]
> @@ -1072,9 +1125,25 @@ static int drm_bridge_connector_add_connector(stru=
ct drm_bridge_connector *bridg
> =20
>  	ret =3D drm_connector_attach_encoder(connector, bridge_connector->encod=
er);
>  	if (ret)
> -		return ret;
> +		goto err_put;
> +
> +	ret =3D drm_connector_dynamic_register(connector);
> +	if (ret)
> +		goto err_put;
> =20
>  	return 0;
> +
> +err_put:
> +	drm_connector_put(connector);
> +	bridge_connector->dynconn =3D NULL;
> +	return ret;
> +}

If drm_connector_dynamic_register() fails, the code goes to err_put and
calls drm_connector_put(connector), which will drop the refcount and free
dynconn.

However, drm_bridge_connector_init_hdmi_audio_cec() registers cleanup
actions tied to the drm_device using drmm_connector_hdmi_cec_register() and
drmm_connector_hdmi_cec_notifier_register().

Will those drmm actions cause a use-after-free when the drm_device is
eventually released, since they will attempt to dereference the already
freed connector?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D15
