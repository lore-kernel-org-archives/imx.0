Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FEB3DDB16
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 11:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679614; cv=none; b=YcwO+RoPpUW175wqyfSIpe7/3LmnneaWvrn2hL6HM7C3a8ZmKocJA6GtRSY42H+F4yofNk8WXraAYnn4hRxhw9bAuffHEGemtAirgvIy5iAAWfog5CV22SzcPUW3/PS9w4aBdy/BGNrULp9Hj2u0PQJx4p5QQqAutSSXiIsX6GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679614; c=relaxed/simple;
	bh=zcH86B3f9IVVYK+ALuNz7q6WeKZtflnpDgb/TZfacDI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DkLGcA6uoNoGcxLI0xxiBtozbFGLP+2/AMmN6B4OC2xYLwqAlSH/C250JPJx+F7z0IZwQdvCf0CmbAPOeh8jcjKmVdVH0MrsrWJiK6MJD5DtNp21AEEboTZHM++tIH4o8VM3PfQL6Z23ruPJT6xJSC1i9djobcoiHxcLxsJul4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOK6NnP4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOK6NnP4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADDE1F00893;
	Tue, 29 Sep 2026 11:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790679609;
	bh=+S0+caEP5Gva/ZrMGMescJUdcSTQZQa26qQT9etMrHU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YOK6NnP4sqZVgMQAI0vMHZiO9Nwz+0fOwzulWFNvKUu084t4w6r/tPl5NAs5z1rbh
	 ZFdnab2+dw5PREU4RCSKbsdvlld0/9r8KyMzGCKTzqjJBA8AS0SxhYMvI4HExk5h/U
	 17bpnQi4M19Vvw5PTEGCB+OmKkrUtajW+pc5NNXoH3kGpVR2Z3h4P1hx0NBY+reyqJ
	 5PfVgUmKw31T+aCcV6q6JPLh57+8sEe3NK/k0EJU6Y62juKQYJ0fCBpED17178G74F
	 42OKNatDQmG+GmdXMjk62q8SXQRGNVOwK7kNJ2/Zfr0immL3ZOVXsggGVdzrsKrwNZ
	 Cfglf+x0A9iCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] drm/bridge: dw-mipi-dsi: stop using deprecated
 devm_drm_of_get_bridge()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-3-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
 <20260929-drm-fix-of_get_bridge-build-regression-v1-3-ccb7e602daad@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 11:00:08 +0000
Message-Id: <20260929110008.AADDE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm: memory leak in dw_mipi_dsi_host_attach/detach due to missin=
g drm_bridge_put
--

commit 0d4a3bc896ba6f4b2176531a2fbcc45a4c4762cd
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: dw-mipi-dsi: stop using deprecated devm_drm_of_get_bridge()

This commit switches from the deprecated devm_drm_of_get_bridge() to
of_drm_get_bridge_by_endpoint(). It assigns the returned refcounted bridge =
to
dsi->bridge.next_bridge to handle cleanup.

Link: https://lore.kernel.org/r/20260928161605.2271412-1-arnd@kernel.org

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/=
drm/bridge/synopsys/dw-mipi-dsi.c
> index 5dd475fcaacf8..fad6c3f710324 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c

[ ... ]

> @@ -333,12 +332,12 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_=
host *host,
>  	dsi->format =3D device->format;
>  	dsi->mode_flags =3D device->mode_flags;
> =20
> -	bridge =3D devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
> +	bridge =3D of_drm_get_bridge_by_endpoint(dsi->dev->of_node, 1, 0);
>  	if (IS_ERR(bridge))
>  		return PTR_ERR(bridge);
> =20
>  	bridge->pre_enable_prev_first =3D true;
> -	dsi->panel_bridge =3D bridge;
> +	dsi->bridge.next_bridge =3D bridge;

[Severity: Medium]
Does this leak the bridge reference if the peripheral driver is manually
unbound and rebound?

Because of_drm_get_bridge_by_endpoint() returns a refcounted bridge, each
attach/detach cycle fetches a new reference. Overwriting next_bridge here
without releasing the previous reference could lead to a memory leak.

Also, what happens if the attach fails later in this function?

err_remove_bridge:
	drm_bridge_remove(&dsi->bridge);
	return ret;

It looks like the acquired bridge reference is left dangling in next_bridge
without being put on this error path.

> =20
>  	drm_bridge_add(&dsi->bridge);

[ ... ]

> @@ -368,8 +367,6 @@ static int dw_mipi_dsi_host_detach(struct mipi_dsi_ho=
st *host,
>  			return ret;
>  	}
> =20
> -	drm_of_panel_bridge_remove(host->dev->of_node, 1, 0);
> -
>  	drm_bridge_remove(&dsi->bridge);
> =20
>  	return 0;

[Severity: Medium]
Does this detach path leave the bridge reference unreleased?

The commit message notes that the bridge is put by using bridge.next_bridge,
but the host bridge (dsi->bridge) is not freed during peripheral detach, it
is only removed from the list.

Is a drm_bridge_put() needed here to balance the get from
of_drm_get_bridge_by_endpoint() in dw_mipi_dsi_host_attach()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-drm-fix-of=
_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com?part=3D3
