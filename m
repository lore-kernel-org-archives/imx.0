Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7092A29D291;
	Mon, 18 May 2026 18:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130381; cv=none; b=mcuCYLedPXiHT334eqaUBexKDr5KZFLQajSpCm2VhC4JQ5Zwt1GjlBt30EutUDaxCjlRBAEbPiP0Wd6bCvLOT8oAg/6UUjvddZTmYiVAB27ycFeJH85OAOuC8yrzwroFNG7xtAiANZrzpAWIDgatn51sFkLzWMudubU2uS+kCmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130381; c=relaxed/simple;
	bh=4DaHqEpj3TMelD/uCH0T6WqVKDAv3bT1C1a4E2RlCgA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NUwGMphLkitj9SslyWzuzfazKJzSa2SCbjuMQfpMXkFx6Ai+ZUr7KqgKDYUWOnHWnis3fS9xtG3lijlNuWVtKzBBza+FR0Kp8sV89vPxrmSSSjq6cJsgGOoylttz1lvrNcm3J62J8H4FrXF1uhTElLUuGcfi0qX/ousaPbN72aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsEkwlwK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsEkwlwK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C749CC2BCB7;
	Mon, 18 May 2026 18:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779130381;
	bh=4DaHqEpj3TMelD/uCH0T6WqVKDAv3bT1C1a4E2RlCgA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=NsEkwlwKnXWhNk1X1k6myeUH95kydGj4oAY/GXDxlQk1P/9l0sSNAqgCq78U1TW7N
	 lQ+sSdvucYsCRO0P8DgBarV22iV1cSpmIA29bA19VhcLY+92yG3O/0LoKkeSxz+EOL
	 RCqjwfQo78hwpMFZZl3Zg/S5GAbjhmmysCaj/67ElUC09aO6lM/ghII4B1x01p/Svf
	 2eE95NXfsqcaMgO1yrDNFibbdLiUqwDXqCla6C9mb70FLb/Img+qu1pJqbCZdJWxdr
	 j2H7IpQOm7BkYv7e0aKpTm0G4sDB5rzy69Z6jS1GlN3ZbnnNzO9cX6Bqa3h09PaEPX
	 lXUKTI85zjHFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 15/23] drm: bridge: dw_hdmi: Use generic CEC notifier
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260518180206.2480119-16-jonas@kwiboo.se>
References: <20260518180206.2480119-16-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 18:53:00 +0000
Message-Id: <20260518185300.C749CC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Use-After-Free and memory leak due to drmm action lifetime mismatc=
h with the connector
--

commit 7a3d2d4c9ae6107ffef88b867d73cc39dd7e8567
Author: Jonas Karlman <jonas@kwiboo.se>
drm: bridge: dw_hdmi: Use generic CEC notifier helpers

This commit replaces the open-coded CEC notifier handling with the generic
DRM HDMI CEC notifier helpers.

> The drmm release action for the generic CEC notifier should run just
> before dw_hdmi_connector_destroy(), closely matching the lifetime of
> the replaced CEC notifier and the connector.

Is this assumption accurate for all drivers using dw_hdmi?

When master drivers like sun4i or imx are unbound, drm_mode_config_cleanup()
is often called synchronously, which in turn calls dw_hdmi_connector_destro=
y().

If a userspace process holds the DRM file descriptor open, the drm_device
outlives the unbind. Doesn't this mean the drmm release action will run
much later than dw_hdmi_connector_destroy(), rather than just before it?

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 0e84dff724706..37406555af7bc 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
[ ... ]
> @@ -2587,15 +2578,8 @@ static int dw_hdmi_connector_create(struct dw_hdmi=
 *hdmi)
> =20
>  	drm_connector_attach_encoder(connector, hdmi->bridge.encoder);
> =20
> -	cec_fill_conn_info_from_drm(&conn_info, connector);
> -
> -	notifier =3D cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
> -	if (!notifier)
> -		return -ENOMEM;
> -
> -	hdmi->cec_notifier =3D notifier;
> -
> -	return 0;
> +	return drmm_connector_hdmi_cec_notifier_register(connector, NULL,
> +							 hdmi->dev);
>  }

Could this cause a use-after-free when the drm_device is finally released?

Looking at dw_hdmi_connector_destroy(), it cleans up the connector state:

dw_hdmi_connector_destroy()
  drm_connector_cleanup(connector)
    ...
    memset(connector, 0, sizeof(*connector));

Since the connector is embedded in struct dw_hdmi which is managed by devres
and the bridge refcount, the memory will be freed when the platform device
unbind completes.

When the drmm action drm_connector_hdmi_cec_notifier_unregister() eventually
executes during drm_dev_release(), won't it attempt to dereference the
already freed connector pointer?

If the memory happens to still be accessible, won't it read the zeroed
connector->cec.data as a NULL pointer, silently leaking the CEC notifier?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518180206.2480=
119-1-jonas@kwiboo.se?part=3D15
