Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5049E130495
	for <imx@lists.linux.dev>; Mon, 24 Jun 2024 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719220783; cv=none; b=dSJjGsvrLMZW6TrD7l3qDTm57TZRc3XXEuSEjcKsqErCY+YUEy5rBW2oOnslI0pTY8ybn/R8yCT+Q5wGt+nhJSWv0g1b1436s79ZKTAKhJmpM4c0Its8yYE8Af1cYd3cXLb+Al2yp1k/dZLG1V+spHyY8cAGbooU/xYC5YEcRWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719220783; c=relaxed/simple;
	bh=sINm+sQHFrY44EfnWrAkDK7SNTdTvLpj8rB7H6Xg2I4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gge8bwGCiH/zKNX0Re4Mlup1j4XGZY8Fe7HrxqS8vPc6PcghgAu+UKUd43KuHSLp3Zle91TguZ01yU9benOloMAwn4dwXkHBYukVs5VMefL9MjZ5Tu6ASrJHe2BlE8X3Rz8qeBsz+tmIoCesQMIoUq7c6lUg4ep8uTXIqsoGXTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=BTebwJMQ; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=mk0rGT56 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="BTebwJMQ";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="mk0rGT56"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1719220779; x=1750756779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uJW3zLdz7y8+GEGkB3RFqz/8yBoXrC/7C7PphqWWonM=;
  b=BTebwJMQpQa2PqGydvSIS3oecPNQMPMHvOewm4mEhCY+Os8Ah/6dfpnN
   DXyb3imFdITUugsYNhk0sDG39ajkBZ7LlTdh7UubZV1cLNieXufnX1vnL
   WPStJtHKX+PQqyl0LWxJD84jk2ncsof5fpsz6OeeOtixlJXNWahwaueiC
   jweuzqcTex1LwYnR/gnJx6rq0rAddn5xGUJB2Ea8/pIxvorFctvR3gw7C
   +5L2Nhlb2d5RINhDhjUsg59QJZqi5UAKziAF05Lct4JW0M29SCIaBnSQG
   vVNxzZfxtOS9O6RJDnZabLP/Mja+Ta9ah75SfVSSsIbzo7y4wBFtE++3H
   Q==;
X-CSE-ConnectionGUID: BkJsueitROW81l3R/C86nw==
X-CSE-MsgGUID: J+yHdkulRb+CPQUvJuzl1Q==
X-IronPort-AV: E=Sophos;i="6.08,261,1712613600"; 
   d="scan'208";a="37547624"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Jun 2024 11:19:35 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29F94165926;
	Mon, 24 Jun 2024 11:19:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1719220770;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uJW3zLdz7y8+GEGkB3RFqz/8yBoXrC/7C7PphqWWonM=;
	b=mk0rGT56lQculyO1b1QLG4ZJ+l8y6ZfvbcMypcZZz5GIc5+yGTh6KVJMQ8XqA8d+DzA8sx
	Qxwpsk6RsbOu9tf42+v76lCnXAmBeu3gdJmKSqIGuIU2IIMhshqabxw1yJiooilm8saFfy
	iVAhsz02HQg8TqN1V0VblkWTEMJ829EI3KG2/Qv9HGa8yOiGJDyWnblaRbVBGeKDzHxNVr
	G/yl6p7mTd0Izeil+uXyxSjqE0gQB75Dc7ehw2WmcUrtMWPEaNU9oFep0VxGRAgWxcdOo5
	zfTCcmNysdQKRbuPvvadCNkXIVRTEiefKLSuyROTNohGMprwzONlnxLVWuNjLQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, "Lukas F . Hartmann" <lukas@mntmn.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm: lcdif: Use adjusted_mode .clock instead of .crtc_clock
Date: Mon, 24 Jun 2024 11:19:33 +0200
Message-ID: <1897634.CQOukoFCf9@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240531202813.277109-1-marex@denx.de>
References: <20240531202813.277109-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Freitag, 31. Mai 2024, 22:27:21 CEST schrieb Marek Vasut:
> In case an upstream bridge modified the required clock frequency
> in its .atomic_check callback by setting adjusted_mode.clock ,
> make sure that clock frequency is generated by the LCDIFv3 block.
>=20
> This is useful e.g. when LCDIFv3 feeds DSIM which feeds TC358767
> with (e)DP output, where the TC358767 expects precise timing on
> its input side, the precise timing must be generated by the LCDIF.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

With the other rc358767 patches in place, this does the trick.
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Lukas F. Hartmann <lukas@mntmn.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lc=
dif_kms.c
> index 2541d2de4e45f..dbd42cc1da87f 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -407,8 +407,7 @@ static void lcdif_crtc_mode_set_nofb(struct drm_crtc_=
state *crtc_state,
>  	struct drm_display_mode *m =3D &crtc_state->adjusted_mode;
> =20
>  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual: %dkHz)\n",
> -			     m->crtc_clock,
> -			     (int)(clk_get_rate(lcdif->clk) / 1000));
> +			     m->clock, (int)(clk_get_rate(lcdif->clk) / 1000));
>  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Bridge bus_flags: 0x%08X\n",
>  			     lcdif_crtc_state->bus_flags);
>  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);
> @@ -538,7 +537,7 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc =
*crtc,
>  	struct drm_device *drm =3D lcdif->drm;
>  	dma_addr_t paddr;
> =20
> -	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
> +	clk_set_rate(lcdif->clk, m->clock * 1000);
> =20
>  	pm_runtime_get_sync(drm->dev);
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


