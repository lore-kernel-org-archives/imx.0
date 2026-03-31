Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4D42989B7
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 09:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948447; cv=none; b=EL48HIoal4UajcZScITQoMF+GXp6rfUZhYaOwdjiK9yEi1izOsmzVVUFazIgD7VdVTSV7NbDXSxOrs9N/V1Jp5vjvxUm/nC4rz1H1tGFE0UZkQN20/un1ic3JL54IU/dtxs4KVZobsrm/YhWJN/l0PeYLLtBCYdu3Gq4FGwFEe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948447; c=relaxed/simple;
	bh=uQFhuYHKGeTd9a04gGwQaIkE4FHZw7JCoI00O9lemig=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EqHrrCSjEyhdx4Gr1EceX/DKXZv4EjIT9DI7SUCxD53oKTb56PxWi+nqSNViLMFf0/KISCvfrwV1dQLBsZkEYDlJWfyWcREqpacDgiDRfUSp9HkMdDh7qP8FlGzOeXlEmg0Av9GMFyf4vil+C1bhqZkRzxg7RILPsoKf5ZTxKZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1w7VAh-0004po-K9; Tue, 31 Mar 2026 11:14:03 +0200
Message-ID: <3305c7ec621987a30043f274b2705f739bddd497.camel@pengutronix.de>
Subject: Re: [PATCH 3/3] drm: lcdif: Wait for vblank before disabling DMA
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
Date: Tue, 31 Mar 2026 11:14:01 +0200
In-Reply-To: <20260330224619.2620782-4-paulk@sys-base.io>
References: <20260330224619.2620782-1-paulk@sys-base.io>
	 <20260330224619.2620782-4-paulk@sys-base.io>
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

Am Dienstag, dem 31.03.2026 um 00:46 +0200 schrieb Paul Kocialkowski:
> It is necessary to wait for the full frame to finish streaming
> through the DMA engine before we can safely disable it by removing
> the DISP_PARA_DISP_ON bit. Disabling it in-flight can leave the
> hardware confused and unable to resume streaming for the next frame.
>=20
> This causes the FIFO underrun and empty status bits to be set and
> a single solid color to be shown on the display, coming from one of
> the pixels of the previous frame. The issue occurs sporadically when
> a new mode is set, which triggers the crtc disable and enable paths.
>=20
> Setting the shadow load bit and waiting for it to be cleared by the
> DMA engine allows waiting for completion.
>=20
> The NXP BSP driver addresses this issue with a hardcoded 25 ms sleep.
>=20
> Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> Co-developed-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lc=
dif_kms.c
> index 1aac354041c7..7dce7f48d938 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -393,6 +393,22 @@ static void lcdif_disable_controller(struct lcdif_dr=
m_private *lcdif)
>  	if (ret)
>  		drm_err(lcdif->drm, "Failed to disable controller!\n");
> =20
You can drop this no-op poll above...

> +	/*
> +	 * It is necessary to wait for the full frame to finish streaming
> +	 * through the DMA engine before we can safely disable it by removing
> +	 * the DISP_PARA_DISP_ON bit. Disabling it in-flight can leave the
> +	 * hardware confused and unable to resume streaming for the next frame.
> +	 */
> +	reg =3D readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +	reg |=3D CTRLDESCL0_5_SHADOW_LOAD_EN;
> +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +
.. then setting the shadow load enable bit can be merged with the
access clearing the DMA enable bit.

> +	ret =3D readl_poll_timeout(lcdif->base + LCDC_V8_CTRLDESCL0_5,
> +				 reg, !(reg & CTRLDESCL0_5_SHADOW_LOAD_EN),
> +				 0, 36000);	/* Wait ~2 frame times max */

I know this is just a copy from the existing poll, but I don't think
the busy looping makes a lot of sense. I guess relaxing the poll by a
100us or even 200us wait between checks wouldn't hurt.

> +	if (ret)
> +		drm_err(lcdif->drm, "Failed to disable controller!\n");
> +
>  	reg =3D readl(lcdif->base + LCDC_V8_DISP_PARA);
>  	reg &=3D ~DISP_PARA_DISP_ON;
>  	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);

