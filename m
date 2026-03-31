Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6526F37AA9E
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948070; cv=none; b=VFY4yUDvWPCin/ZF559oqTRBI8BnDY4qQHAvYHbCYlCNGwYej8sinCgMNQHKlZjCx23+ByUy6G/Nwh9a5gdPF9idpyxKKceaRhTVoxhf+RlUFQg6ORoCT17gqiUN1KOKfSscG4QaT6TDVV4xQGEfPibQMlkF9kuInIdkmQYWZfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948070; c=relaxed/simple;
	bh=QfxfgIqGr2EaqZoPc1UOCdQPt96CMm7Fd37j8yqzT04=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iUAbLnUiVYKBeN9VQMRhQMlsGRq8EC9L4jFeIZr7jUsAlCVKLnpjeCtC0iwTQtH8t/LhT0m+P5DzToKse4AXwsTWwp/s34U14zukaO6ij0BaN+8Zlzi9CX3nhGBeN7buqCcplZExRwTq2Fdmn+KkQnjzv7rEe/updxjtWuUvYMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1w7V4Z-0004B8-8I; Tue, 31 Mar 2026 11:07:43 +0200
Message-ID: <79289b84c12ec32e8606f6fc2bd3d4dc8bd5a180.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] drm: lcdif: Set undocumented bit to clear FIFO at
 vsync
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
Date: Tue, 31 Mar 2026 11:07:40 +0200
In-Reply-To: <20260330224619.2620782-2-paulk@sys-base.io>
References: <20260330224619.2620782-1-paulk@sys-base.io>
	 <20260330224619.2620782-2-paulk@sys-base.io>
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
> There is an undocumented bit used in the NXP BSP to clear the FIFO
> systematically at vsync. In normal operation, the FIFO should already
> be empty but it doesn't hurt to add it as an extra safety measure.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 3 ++-
>  drivers/gpu/drm/mxsfb/lcdif_regs.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lc=
dif_kms.c
> index ef3250a5c54f..a00c4f6d63f4 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -338,7 +338,8 @@ static void lcdif_set_mode(struct lcdif_drm_private *=
lcdif, u32 bus_flags)
>  	 * Downstream set it to 256B burst size to improve the memory
>  	 * efficiency so set it here too.
>  	 */
> -	ctrl =3D CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
> +	ctrl =3D CTRLDESCL0_3_STATE_CLEAR_VSYNC |
> +	       CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
>  	       CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb->pitches[0]);
>  	writel(ctrl, lcdif->base + LCDC_V8_CTRLDESCL0_3);
>  }
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/l=
cdif_regs.h
> index c55dfb236c1d..17882c593d27 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
> +++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> @@ -190,6 +190,7 @@
>  #define CTRLDESCL0_1_WIDTH(n)		((n) & 0xffff)
>  #define CTRLDESCL0_1_WIDTH_MASK		GENMASK(15, 0)
> =20
> +#define CTRLDESCL0_3_STATE_CLEAR_VSYNC	BIT(23)
>  #define CTRLDESCL0_3_P_SIZE(n)		(((n) << 20) & CTRLDESCL0_3_P_SIZE_MASK)
>  #define CTRLDESCL0_3_P_SIZE_MASK	GENMASK(22, 20)
>  #define CTRLDESCL0_3_T_SIZE(n)		(((n) << 16) & CTRLDESCL0_3_T_SIZE_MASK)

