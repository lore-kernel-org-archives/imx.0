Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE5B2BE7BA
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948180; cv=none; b=DH43tRVRrc1dUk/G9Wv0Z/ouNK64vlmYl2RsVgO90DLMLcItRytcSXgfgFPyariZrS403MxPa6LqBal0IlzEpAsAgRJ0E9fMTmvgpioYFVa+cm0RLAzO57i/NtOnUVaT1t+U+6gWbGXJ+L2GN1h/TUGI4A4k/zJr0fwrRr9/9C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948180; c=relaxed/simple;
	bh=Q4k3p2GKdLly5VAb2s0QC8UB3+VnjY8rPzaatfFjXC4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VrH6b41ZVW/Mj9TKgXoGEI+8gTm56W+6mMNRwnaQ3wjTJEqwwiBEpeyOJb2AeoRa6S1LucWjMS2OTtMWZTpoYJ2EMQLTVzekOiq3J+I5JRb4Sibh3EkZrsfgvd71TYTXR9UW+4xU79WoxQAaBDSOmZ+ODLDIstTX18VySkPueA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1w7V6O-0004Pv-N3; Tue, 31 Mar 2026 11:09:36 +0200
Message-ID: <f5b628f50def756da356184ff6febb11cc9aaa68.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] drm: lcdif: Use dedicated set/clr registers for
 polarity/edge
From: Lucas Stach <l.stach@pengutronix.de>
To: Paul Kocialkowski <paulk@sys-base.io>, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, Marco Felsch
 <m.felsch@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
Date: Tue, 31 Mar 2026 11:09:35 +0200
In-Reply-To: <20260330224619.2620782-3-paulk@sys-base.io>
References: <20260330224619.2620782-1-paulk@sys-base.io>
	 <20260330224619.2620782-3-paulk@sys-base.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Paul,

Am Dienstag, dem 31.03.2026 um 00:46 +0200 schrieb Paul Kocialkowski:
> The lcdif v3 hardware comes with dedicated registers to set and clear
> polarity bits in the CTRL register. It is unclear if there is a
> difference with writing to the CTRL register directly.
>=20
> Follow the NXP BSP reference by using these registers, in case there is
> a subtle difference caused by using them.
>=20
I don't really like that patch, as it blows up what is currently a
single register access to three separate ones. If there is no clear
benefit (as in it has been shown to fix any issue), I would prefer this
code to stay as-is.

Regards,
Lucas

> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lc=
dif_kms.c
> index a00c4f6d63f4..1aac354041c7 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -296,18 +296,27 @@ static void lcdif_set_formats(struct lcdif_drm_priv=
ate *lcdif,
>  static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flag=
s)
>  {
>  	struct drm_display_mode *m =3D &lcdif->crtc.state->adjusted_mode;
> -	u32 ctrl =3D 0;
> +	u32 ctrl;
> =20
>  	if (m->flags & DRM_MODE_FLAG_NHSYNC)
> -		ctrl |=3D CTRL_INV_HS;
> +		writel(CTRL_INV_HS, lcdif->base + LCDC_V8_CTRL + REG_SET);
> +	else
> +		writel(CTRL_INV_HS, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> +
>  	if (m->flags & DRM_MODE_FLAG_NVSYNC)
> -		ctrl |=3D CTRL_INV_VS;
> +		writel(CTRL_INV_VS, lcdif->base + LCDC_V8_CTRL + REG_SET);
> +	else
> +		writel(CTRL_INV_VS, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> +
>  	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
> -		ctrl |=3D CTRL_INV_DE;
> -	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> -		ctrl |=3D CTRL_INV_PXCK;
> +		writel(CTRL_INV_DE, lcdif->base + LCDC_V8_CTRL + REG_SET);
> +	else
> +		writel(CTRL_INV_DE, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> =20
> -	writel(ctrl, lcdif->base + LCDC_V8_CTRL);
> +	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> +		writel(CTRL_INV_PXCK, lcdif->base + LCDC_V8_CTRL + REG_SET);
> +	else
> +		writel(CTRL_INV_PXCK, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> =20
>  	writel(DISP_SIZE_DELTA_Y(m->vdisplay) |
>  	       DISP_SIZE_DELTA_X(m->hdisplay),

