Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B8A2FD675
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190394; cv=none; b=UEDc+S6isM4md3JQVb9srtphxDipfP+LA97WKjOJ/7HFH3vI49MkSoFWLSnaPQ1ehHvz4W3GSABtA5KnazEx9p7T5V3iurP1vLUvJz+C5L+5ExaU7YxEG3YJAAMMZZWkcAFHO+N6ZLQlCnnQ+xqgp9b9Bc4mCgGd3mZQrFm6btQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190394; c=relaxed/simple;
	bh=r54uRwRqxpOQypX/frjfGN0PHmjLa3wNrR38hGtq0Jw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AtWFZ8WiWAWQqyWxK97o2y20v+jmTc7Z3XnsXSIJwYpTZ4+1711PgOt2hKEUE23QEmWr/1EmClreJniQ/C7EAmlTVCVq85tYL7HS3Rqolnpku+oWnOf8vi9t4wdwlOxwi40yYPKZFKootRDsQgXNFY7egh8paY6LLaViN1m3zUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sABc04NV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sABc04NV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E32BC2BCC6;
	Tue, 19 May 2026 11:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779190394;
	bh=r54uRwRqxpOQypX/frjfGN0PHmjLa3wNrR38hGtq0Jw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=sABc04NVPCF/EvAw+UvIiIdC0aQDHvHZfT+7o91IrwfF5vic9KjgtTCd6gspZkxlr
	 bK2FZ7gdnDhDayP7P6MW4bXSuw23iBXbhY2pfNChGrSHppP6d1DDdKIJ5jpsbPx/0g
	 bGMgAmkEYMCwLg/Ffh3ezCW0WDQfV3d4EG9I/Ey/M3HbE/I4QD5lPX879+6bHe2Oeo
	 EBeB09A9oZvyge1h+YR/DBU3hsYnRWvu2NFmYx7bO5X+H+9nsVHIOk58h09MokyU1a
	 +lGJwaZsj2X0EtW0cSS1Tw6Z6j/s2VvSF6SzfFLt8kI6Gs5TPtgiyqLiYQwBgfkmz6
	 XsxKRqor1pb9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 37/37] drm/mxsfb/lcdif: enable bridge hotplug
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519-drm-bridge-hotplug-v1-37-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-37-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:33:13 +0000
Message-Id: <20260519113314.0E32BC2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Use-After-Free via global DRM event notifier due to lifetime misma=
tch.
- [High] The newly introduced API `drmm_bridge_connector_init()` returns NU=
LL instead of the allocated pointer on success.
--

commit cc8f05ac9a777f8eb1ce4636df74812c2db5a92c
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/mxsfb/lcdif: enable bridge hotplug

This commit switches to the new drmm_bridge_connector_init() function
to allow the drm_bridge_connector to handle bridge hotplugging.

> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lc=
dif_drv.c
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
[ ... ]
> @@ -94,9 +94,9 @@ static int lcdif_attach_bridge(struct lcdif_drm_private=
 *lcdif)
>  					     "Failed to attach bridge for endpoint%u\n",
>  					     of_ep.id);
> =20
> -		connector =3D drm_bridge_connector_init(lcdif->drm, encoder);
> -		if (IS_ERR(connector))
> -			return dev_err_probe(dev, PTR_ERR(connector),
> +		bridge_connector =3D drmm_bridge_connector_init(lcdif->drm, encoder);

Could this regression lead to a use-after-free if the physical device
is unbound?

The encoder passed to drmm_bridge_connector_init() is allocated earlier in
this function using devm_kzalloc(), which ties its lifetime to the physical
device.

However, drmm_bridge_connector_init() ties the new bridge connector to the =
DRM
device's lifetime and registers a global hotplug notifier that references t=
his
encoder.

If the physical device is unbound while a userspace file descriptor is still
open, the DRM device and its notifier remain active after devres has freed =
the
encoder.

A subsequent bridge hotplug event (such as DRM_MIPI_DSI_ATTACHED) could then
trigger the notifier, causing it to dereference the freed encoder when lock=
ing
encoder->bridge_chain_mutex.

Would it be safer to allocate the encoder using drmm_encoder_alloc() instead
of devm_kzalloc() so its lifetime matches the DRM device?

> +		if (IS_ERR(bridge_connector))
> +			return dev_err_probe(dev, PTR_ERR(bridge_connector),

Does the new drmm_bridge_connector_init() API return a NULL pointer instead
of the allocated object on success?

Looking at the core implementation of drmm_bridge_connector_init(), it appe=
ars
to correctly allocate and initialize the bridge connector, but incorrectly =
ends
with return 0 instead of returning the allocated object.

Since IS_ERR() evaluates to false for NULL, the check here passes, but this
regression means any code trying to use the returned bridge_connector point=
er
later will encounter a NULL pointer dereference.

Does the implementation in drivers/gpu/drm/display/drm_bridge_connector.c
need to be updated to return the allocated object?

>  					     "Failed to init bridge_connector for endpoint%u\n",
>  					     of_ep.id);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D37
