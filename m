Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6CA35970F
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 15:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574115; cv=none; b=NVAyAIMoa5qcxp//S9FTi8FxZiXs48WWnvtVHKcoQvvkRDgunYNl08wENpr0k19PoTZf1UuVrzU+NoGS3YEsaEv/YoMeuHI0xIQUwcxj84CNPQR/hJs65FzuVqWKnfMZqjDT5r99Kg/8Q+yUdQRRJ78wKbXvzd6XpUYL95l263s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574115; c=relaxed/simple;
	bh=iDOVNpgTm7E3bVzDquw0I4ESCYFkTOQqV/hyqBv/j+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cL1G1sFizBEoT9/wPxF4C5+tYSIXOQ139LuiNm1b9nbNetegVp0/z9cTfZkCtPVO9ESh0LUpfZhZf3YpZjBIJett+nkGw8tq+Kp+XX0eWa+cMuPBYB/cwH9gTAI/LjIi8IxHRF6wvsx9JMrSzwfCyqeb33uhHdfK6loiB4Np5Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id AF94E1F8005F
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 15:01:26 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id CE312B40194; Tue,  7 Apr 2026 15:01:24 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id C0656B4018A;
	Tue,  7 Apr 2026 15:01:22 +0000 (UTC)
Date: Tue, 7 Apr 2026 17:01:20 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v2 2/2] drm: lcdif: Wait for vblank before disabling DMA
Message-ID: <adUcQIor2tEMCn3R@shepard>
References: <20260402183351.3281123-1-paulk@sys-base.io>
 <20260402183351.3281123-3-paulk@sys-base.io>
 <d6bbf0c23dc5cf0c6ab0375fb1d2d3f6b4579737.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tr3oA7U7+SI63nqs"
Content-Disposition: inline
In-Reply-To: <d6bbf0c23dc5cf0c6ab0375fb1d2d3f6b4579737.camel@pengutronix.de>


--tr3oA7U7+SI63nqs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

On Tue 07 Apr 26, 10:28, Lucas Stach wrote:
> Am Donnerstag, dem 02.04.2026 um 20:33 +0200 schrieb Paul Kocialkowski:
> > It is necessary to wait for the full frame to finish streaming
> > through the DMA engine before we can safely disable it by removing
> > the DISP_PARA_DISP_ON bit. Disabling it in-flight can leave the
> > hardware confused and unable to resume streaming for the next frame.
> >=20
> > This causes the FIFO underrun and empty status bits to be set and
> > a single solid color to be shown on the display, coming from one of
> > the pixels of the previous frame. The issue occurs sporadically when
> > a new mode is set, which triggers the crtc disable and enable paths.
> >=20
> > Setting the shadow load bit and waiting for it to be cleared by the
> > DMA engine allows waiting for completion.
> >=20
> > The NXP BSP driver addresses this issue with a hardcoded 25 ms sleep.
> >=20
> > Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant=
")
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > Co-developed-by: Lucas Stach <l.stach@pengutronix.de>
>=20
> Looks good to me. Since the co-developed tag requires a sign-off from
> me, I'll add that instead of a review tag. And you might want to move
> your sign-off down, as you are the one submitting the patch.

Sounds good to me! This can probably be done when picking up the patch,
but if maintainers need me to respin the series to get all the tags in
order myself, just let me know!

All the best,

Paul

> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>
> > ---
> >  drivers/gpu/drm/mxsfb/lcdif_kms.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/=
lcdif_kms.c
> > index a00c4f6d63f4..0d04a0028671 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -375,14 +375,23 @@ static void lcdif_disable_controller(struct lcdif=
_drm_private *lcdif)
> >  	int ret;
> > =20
> >  	reg =3D readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > +	/* Disable the layer for DMA. */
> >  	reg &=3D ~CTRLDESCL0_5_EN;
> > +	/*
> > +	 * It is necessary to wait for the full frame to finish streaming
> > +	 * through the DMA engine before we can safely disable it by removing
> > +	 * the DISP_PARA_DISP_ON bit. Disabling it in-flight can leave the
> > +	 * hardware confused and unable to resume streaming for the next fram=
e.
> > +	 */
> > +	reg |=3D CTRLDESCL0_5_SHADOW_LOAD_EN;
> >  	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > =20
> > +	/* Wait for the frame to finish or timeout after 50 ms. */
> >  	ret =3D readl_poll_timeout(lcdif->base + LCDC_V8_CTRLDESCL0_5,
> > -				 reg, !(reg & CTRLDESCL0_5_EN),
> > -				 0, 36000);	/* Wait ~2 frame times max */
> > +				 reg, !(reg & CTRLDESCL0_5_SHADOW_LOAD_EN),
> > +				 200, 50000);
> >  	if (ret)
> > -		drm_err(lcdif->drm, "Failed to disable controller!\n");
> > +		drm_err(lcdif->drm, "Timed out waiting for final vblank!\n");
> > =20
> >  	reg =3D readl(lcdif->base + LCDC_V8_DISP_PARA);
> >  	reg &=3D ~DISP_PARA_DISP_ON;
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--tr3oA7U7+SI63nqs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnVHEAACgkQhP3B6o/u
lQx7KA/7BnpEWNIUmhxDgwURWcnToLoxc1aEBm/u/+bpY0PzQwdfdimZy7f8fR4h
PuxDVy7QBNZTag6cT6rcoJ9QoWw8Srx2docDOotHjGHMOjytxrv3KJ4KeN7kVlpH
EeuJNt8jWSulxNRiuEv85B6pFw9yUpwb1UCyiLx4H8jIHvOIxbPAOxc7f20PkCjP
Sbwx+0iSgxffcH0c++DlDONOOLj/3pjLtjw8K6MGXQtRXX0kIxU9lVI9SNgvaZlR
18xQ3n1Y92Zm/wOuN8tGB7VX3ILwYTXJYDU/qE3DSAzqRvLFFNTBAeBLPOVzTmhB
Pile1vjDAdO/A4YoV/pOUS0mt0lpT40dyEH2aDC5Rzty7w5s9VbPaE9AjnPLvEvY
GPCZ+Jcln2clHdhEEX3TiVyimht8j0GLtNtJ+Dl28b1GhYmJN6xouNNLMOvOikE3
RwCE8eq+ijQly5rxYwnpRONuHhAPWEMg10oayJiM6vhJ4xoBxgimChoF9Klvfqev
nbn5eOqezBWsPFx/AT53T1TJoP0kNwJLdu6HKNPIdEyWN3Fk0zbrD3kHDsPfvpDF
vHStdPI8fyeJygwslAKAgEJNv9Vj7OFWBYap3Hn70jkLR+zAMRsKr4Or3b4PQCKq
ZtOAvsX/zNSDVt50bwMhPmbWBE530bMy75n+cbLTPB1KgY1yT1o=
=Ted2
-----END PGP SIGNATURE-----

--tr3oA7U7+SI63nqs--
