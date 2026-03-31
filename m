Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0623D342CBD
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970278; cv=none; b=esMf3ASTIFDpwMeMjUs6O/fl+lrlToZxvu0eabEpYPHBb+S1djUhgV0kuVVJydSN+QjM8s5Oa7HxSWSgev+ymxDVzXMCxXhuzOgnqvfNJlzHZzbzCtgDDV7ZjWA7CXS1Mjf6SPLPSVAPdDvym3QMFKTLnLhwjEam8J0B10GIl5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970278; c=relaxed/simple;
	bh=YpVdBdQWAmP40muXxVeAFS7k+EOrZV7ngM70e/TcQH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRDCQE7zb++w1U64dPSIQn/0+vj89pGDAv9mhhsJH4nUDJhGEiOgQVGbJwdnXWRAIR8MFHU99Rmg9cw6/RoqBd+WQ46+KNkYnUqoXuwS8GUK1YrF2uozn3D9xlgrkRt6Sh6AvEV/MU02bOJzIdxx+SWl3zEP74fBSnrM0CeCxh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 445451F8004A
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 15:17:47 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 45472B2EFD5; Tue, 31 Mar 2026 15:17:45 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 41E46B2EFC8;
	Tue, 31 Mar 2026 15:17:43 +0000 (UTC)
Date: Tue, 31 Mar 2026 17:17:41 +0200
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
Subject: Re: [PATCH 2/3] drm: lcdif: Use dedicated set/clr registers for
 polarity/edge
Message-ID: <acvllbRTHyVFTgmS@collins>
References: <20260330224619.2620782-1-paulk@sys-base.io>
 <20260330224619.2620782-3-paulk@sys-base.io>
 <f5b628f50def756da356184ff6febb11cc9aaa68.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Y3a12dyBXGbAn3r"
Content-Disposition: inline
In-Reply-To: <f5b628f50def756da356184ff6febb11cc9aaa68.camel@pengutronix.de>


--/Y3a12dyBXGbAn3r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

Le Tue 31 Mar 26, 11:09, Lucas Stach a =C3=A9crit :
> Hi Paul,
>=20
> Am Dienstag, dem 31.03.2026 um 00:46 +0200 schrieb Paul Kocialkowski:
> > The lcdif v3 hardware comes with dedicated registers to set and clear
> > polarity bits in the CTRL register. It is unclear if there is a
> > difference with writing to the CTRL register directly.
> >=20
> > Follow the NXP BSP reference by using these registers, in case there is
> > a subtle difference caused by using them.
> >=20
> I don't really like that patch, as it blows up what is currently a
> single register access to three separate ones. If there is no clear
> benefit (as in it has been shown to fix any issue), I would prefer this
> code to stay as-is.

Well I guess the cost of a few writes vs a single one is rather
negligible. I'm rather worried that there might be an undocumented
reason why these registers exist in the first place and why they are
used in the BSP.

But yes this is only speculation and I could not witness any actual
issue. My setup (lcdif3 with hdmi) uses all positive polarities which is
the default state, so not a good way to check.

It would be great if somebody from NXP could confirm whether this is
needed or not. In the meantime I guess we can drop the patch. It'll stay
on the list in case someone has polarity issues later :)

All the best,

Paul

> Regards,
> Lucas
>=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> >  drivers/gpu/drm/mxsfb/lcdif_kms.c | 23 ++++++++++++++++-------
> >  1 file changed, 16 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/=
lcdif_kms.c
> > index a00c4f6d63f4..1aac354041c7 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -296,18 +296,27 @@ static void lcdif_set_formats(struct lcdif_drm_pr=
ivate *lcdif,
> >  static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_fl=
ags)
> >  {
> >  	struct drm_display_mode *m =3D &lcdif->crtc.state->adjusted_mode;
> > -	u32 ctrl =3D 0;
> > +	u32 ctrl;
> > =20
> >  	if (m->flags & DRM_MODE_FLAG_NHSYNC)
> > -		ctrl |=3D CTRL_INV_HS;
> > +		writel(CTRL_INV_HS, lcdif->base + LCDC_V8_CTRL + REG_SET);
> > +	else
> > +		writel(CTRL_INV_HS, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> > +
> >  	if (m->flags & DRM_MODE_FLAG_NVSYNC)
> > -		ctrl |=3D CTRL_INV_VS;
> > +		writel(CTRL_INV_VS, lcdif->base + LCDC_V8_CTRL + REG_SET);
> > +	else
> > +		writel(CTRL_INV_VS, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> > +
> >  	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
> > -		ctrl |=3D CTRL_INV_DE;
> > -	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> > -		ctrl |=3D CTRL_INV_PXCK;
> > +		writel(CTRL_INV_DE, lcdif->base + LCDC_V8_CTRL + REG_SET);
> > +	else
> > +		writel(CTRL_INV_DE, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> > =20
> > -	writel(ctrl, lcdif->base + LCDC_V8_CTRL);
> > +	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> > +		writel(CTRL_INV_PXCK, lcdif->base + LCDC_V8_CTRL + REG_SET);
> > +	else
> > +		writel(CTRL_INV_PXCK, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> > =20
> >  	writel(DISP_SIZE_DELTA_Y(m->vdisplay) |
> >  	       DISP_SIZE_DELTA_X(m->hdisplay),
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--/Y3a12dyBXGbAn3r
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnL5ZQACgkQhP3B6o/u
lQxgrw//a0o+aXG0xYeofhRxty58+PDTHipKdthiX6kA1F3s9h+oFSlsP7xo65CW
Bf+q9KrUXxRmSwKbVLNwNv2rD2QgBso6MboJh1tZxgu5zfyMPe06Y2a4Dv8TLBV8
4tKTxd8qKZ/dv3lUzkXHRilotZfDr2rktpmrI5f3Ur4bqNBWUTUyslGeE1E0jn0a
dRDw1gbXp3AunYTca1Nuc+VN/EfvcACOra4dtzlnY5woQTOrQ8Po6GUmy3gTY/vd
P+hEzKrIDbUG9WKym/b+eHoT/2LM1+g0QiWc2Y7mWTYnMeXwEkdPL7H0mCqeionu
hegWBbQHvSljPBj/mZiWkHlu+ZPq4V6XsZsBEXztZ9oqVHRH3/8/6/HlBxVszgZc
Fg3zeMvhgd8arvlz/c23BgoYjYkIIjRDluUFan/+t2hzNKBgUVDfOivdmuRsnaPg
nejYqNEocGX/kkn8rXNg1P723L4Hwvrn9ClmTlN+ilTTpEHtIRrFnbMYJnC49bdh
42BeP2Ne2z56Ly8r6f/uoCYKj0kQTUk+pNjGYLnE+V5sBk9TmiZVif75WTlDiqPp
r2zFGQnbINtq3KVIe13i+yrxTVTBe5bUVtGc4qjCnQjIBDUYXXiJa599Dx78pagB
JqdGrYggUEwWL+6Sq3YVDInit8khsTwHuoypi3/HcuRF49RMDMw=
=YlyP
-----END PGP SIGNATURE-----

--/Y3a12dyBXGbAn3r--
