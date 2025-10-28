Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777B1314B83
	for <imx@lists.linux.dev>; Tue, 28 Oct 2025 16:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761667340; cv=pass; b=gencdX0EdrT2dlZ9Z+rGKh4ktiuTM5+dM7zvVKSB6Rh9GtLeZcrAvoJDtBFEUHzcdYPFL+dcN+BdvZiph9FaJM4UmPA3Z2Z68FLFNmtcr6mAOLjbv2Me/lAnEXBSy2W6Q4gHUzpB9ZWj88XtM2vARIYB9XCS9k9Z+bvqyoggg2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761667340; c=relaxed/simple;
	bh=OZ0ZtiH9Ffd/H3YhMXhZvm8XE+UAipi6AHVisU+hxWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xxw1K0GhZccdT9+ZjRBlcjpohQgSQgLGcqRwRySyHgbTrr9lx+z+zZtjlz8SbnfYW5wzVn3GuWrd10vd1PO3ydfJqMoqFZCQlQBga8eSV07olr944Z33Xd8IDzxthe/505Dcn32WrYsyfBDj2fNmYHCmNZjMeGeOUJHRUB96VDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=hrAkJY8p; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=LAjIXLYA; arc=pass smtp.client-ip=185.56.87.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="hrAkJY8p";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="LAjIXLYA"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4wj9.prod.antispam.mailspamprotection.com; s=arckey; t=1761667338;
	 b=BH7nMiUaRal1ynC36fj8iROHmuv/dJW+BU9XySqeTlS+bbowQYc8DxTB2XxyI5/pDjOUGB4DMT
	  ne/4wLF9PjzD2kvKBRaoxnvbJKEQ6FDXfcYWzAGBdKHnPQ5LzHYEEuM+F1/WJnb3elzOC11QYS
	  vlvEr5vRxB0TK/uWuRtYRMtJRIJmqS7H7eNhr549JGorTRePItHhKCc+NyaOjJndZXsFC4TtxQ
	  AF9VhD1IVt4rV7sKcgefpgd9dRtX57mtzJtkadx9cEQGFTeUngMRhoxD9d5aTShiXPjLgIGMnH
	  lmxbUxkMmMc33w/y5c8POE7qL3rOkJclOfv2Uf2rQdI6HA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4wj9.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4wj9.prod.antispam.mailspamprotection.com; s=arckey; t=1761667338;
	bh=OZ0ZtiH9Ffd/H3YhMXhZvm8XE+UAipi6AHVisU+hxWU=;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	  To:From:DKIM-Signature:DKIM-Signature;
	b=f6R26IKfJBDpey6x0kBAU+nkXX1vuvjf5yfPNp+HbgHL4zmzJAO5cjKc36joAuAS4GYohOnzrk
	  KOQ4N3WTSrd9eN/MzbvgLopJ15OMKWgctjraPAfopoZa4qKgKbbOkKEDNT/IUynH7valoyDuk+
	  eHLU2+zta7nbG87+Nz8Vwa2upHlGFKfa0aWzm1IYVqybJS9q+kXJJjq737cC4oABx3gaxjSban
	  PpIDsHgWq+lJKgTeZJD1q0uFcq1qNLtKVHUQjIu+kCWkAyySw4k6ohzlVQhbUDgJ3HGrpAPwkn
	  pp3vOcQvh47Rlm1H0mP9td61BAR8yyypsItgvvIzIQmzTw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=nFXGsd0wvJCB2aoq6ydUjxoEpP8AS5JY0g0UJ7Jo4rk=; b=hrAkJY8pCL+4QPzYj8TOg13L6J
	lXHS6y3/+FGBiLT/WsqLIZey5PaIX9hl6rWhvF+D7jS7dC7SZGLwBt2rMp6eWBEyZd/XVy/ygq9tb
	xPWQggsuTonp95Ma6kpx22Y3WKX6ntMG90sdv13f0/wFCa1fYUjEx3NYouVFfiDthHdA=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4wj9.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vDm9G-0000000F3xW-1z28
	for imx@lists.linux.dev;
	Tue, 28 Oct 2025 16:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=nFXGsd0wvJCB2aoq6ydUjxoEpP8AS5JY0g0UJ7Jo4rk=; b=LAjIXLYAuKe+nn91fplPC8zwte
	Ub+TSBb3J+TqyLvVF4RU3DTnoGllzWP9T+jeUeALMF3MBgHttDcK3t6DYSFJnb/+D3Bp41AiTeG1l
	xWRwKT05PmIKAGN487/QO54yYlwiqTgVuLa29SgACOLG1ZQO7W3YCgvCS2xQGS4abhg0=;
Received: from [87.17.42.198] (port=63724 helo=fedora.localnet)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vDm8f-000000009YH-2cLa;
	Tue, 28 Oct 2025 16:01:37 +0000
From: Francesco Valla <francesco@valla.it>
To: Liu Ying <victor.liu@nxp.com>, Marek Vasut <marex@denx.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Fabian Pflug <f.pflug@pengutronix.de>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ldb: add support for an external bridge
Date: Tue, 28 Oct 2025 17:01:24 +0100
Message-ID: <2860884.vuYhMxLoTh@fedora>
In-Reply-To: <1944228.tdWV9SEqCh@steina-w>
References:
 <20251028-imx93_ldb_bridge-v1-1-fca2e7d60e0a@valla.it>
 <1944228.tdWV9SEqCh@steina-w>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5090209.OV4Wx5bFTl";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 1e7292c186969052159e77603f19859d
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vDm9G-0000000F3xW-1z28-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4wj9.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

--nextPart5090209.OV4Wx5bFTl
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Francesco Valla <francesco@valla.it>
Date: Tue, 28 Oct 2025 17:01:24 +0100
Message-ID: <2860884.vuYhMxLoTh@fedora>
In-Reply-To: <1944228.tdWV9SEqCh@steina-w>
MIME-Version: 1.0

Hi,

On Tuesday, 28 October 2025 at 13:27:37 Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
> Hi Francesco,
> 
> Am Dienstag, 28. Oktober 2025, 13:12:29 CET schrieb Francesco Valla:
> > One option for the LVDS port of the LDB is to be connected to an
> > additional bridge, such as a LVDS to HDMI converter. Add support for
> > such case, along with the direct connection to a panel.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> > I was trying to add display support for the i.MX93 FRDM on top of the
> > patch sent some time ago by Fabian Pflug [1], using some of the work
> > already done by Alexander Stein but not yet merged [2], but then I
> > noticed that the support for LVDS-HDMI converter bridges was missing
> > from the LDB driver already present for the i.MX93.
> > 
> > Not a fail of the driver itself, obviously, but I wonder if/how the
> > existing i.MX8MP setups (e.g.: [3]), which use the same driver, work
> > correclty. Unfortunately I don't have the i.MX8MP hardware to test them.
> > 
> > Anyhow, a patch for such setup is attached; it was tested on the i.MX93
> > FRDM using [1] and [2] plus some more devicetree modifications.
> > 
> > [1] https://lore.kernel.org/all/20251022-fpg-nxp-imx93-frdm-v3-1-03ec40a1ccc0@pengutronix.de
> > [2] https://lore.kernel.org/all/20250304154929.1785200-1-alexander.stein@ew.tq-group.com
> > [3] https://elixir.bootlin.com/linux/v6.17.5/source/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
> > 
> > Regards,
> > Francesco
> > ---
> >  drivers/gpu/drm/bridge/fsl-ldb.c | 26 +++++++++++++++++---------
> >  1 file changed, 17 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> > index 5c3cf37200bcee1db285c97e2b463c9355ee6acb..fad436f2e0bfac8b42096a6fcd0022da0f35284e 100644
> > --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> > +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> > @@ -294,7 +294,6 @@ static int fsl_ldb_probe(struct platform_device *pdev)
> >  	struct device *dev = &pdev->dev;
> >  	struct device_node *panel_node;
> >  	struct device_node *remote1, *remote2;
> > -	struct drm_panel *panel;
> >  	struct fsl_ldb *fsl_ldb;
> >  	int dual_link;
> >  
> > @@ -335,15 +334,24 @@ static int fsl_ldb_probe(struct platform_device *pdev)
> >  		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
> >  		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
> >  
> > -	panel = of_drm_find_panel(panel_node);
> > -	of_node_put(panel_node);
> > -	if (IS_ERR(panel))
> > -		return PTR_ERR(panel);
> > -
> > -	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> > -	if (IS_ERR(fsl_ldb->panel_bridge))
> > -		return PTR_ERR(fsl_ldb->panel_bridge);
> > +	/* First try to get an additional bridge, if not found go for a panel */
> > +	fsl_ldb->panel_bridge = of_drm_find_bridge(panel_node);
> > +	if (fsl_ldb->panel_bridge) {
> > +		of_node_put(panel_node);
> > +	} else {
> > +		struct drm_panel *panel;
> >  
> > +		panel = of_drm_find_panel(panel_node);
> > +		of_node_put(panel_node);
> > +		if (IS_ERR(panel))
> > +			return dev_err_probe(dev, PTR_ERR(panel),
> > +					     "Failed to find panel");
> > +
> > +		fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> > +		if (IS_ERR(fsl_ldb->panel_bridge))
> > +			return dev_err_probe(dev, PTR_ERR(fsl_ldb->panel_bridge),
> > +					     "Failed to add panel bridge");
> > +	}
> 
> Without looking into the details this somehow looks similar to
> drm_of_find_panel_or_bridge(), or drmm_of_get_bridge for the managed variant.
> 
> Best regards,
> Alexander
> 
> >  
> >  	if (fsl_ldb_is_dual(fsl_ldb)) {
> >  		struct device_node *port1, *port2;
> > 
> > ---
> > base-commit: fd57572253bc356330dbe5b233c2e1d8426c66fd
> > change-id: 20251028-imx93_ldb_bridge-3c011e7856dc
> > 
> > Best regards,
> > 
> 
> 
> 

Well, I did not know of devm_drm_of_get_bridge(), and unfortunately the
driver I checked (Samsung DSIM) has not yet been updated to use it.
Sorry for the noise.

I'll wait for more feedback (if any) and then send a v2 - which looks
much cleaner now.

Thank you!

Regards,
Francesco

--nextPart5090209.OV4Wx5bFTl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRUrtjevJ039mawAeLir2xSXEi5AAUCaQDo1AAKCRDir2xSXEi5
AA83AP0VODlMOPiFo+Etj7oaFVsgFDTnwBhEX54ICokuPyWjewEA/RnsnW2CT6zy
NlUewINvfCea60Pz3od7UPV/AbPhvgg=
=eIuv
-----END PGP SIGNATURE-----

--nextPart5090209.OV4Wx5bFTl--



