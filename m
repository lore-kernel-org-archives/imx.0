Received: from mx-relay164-hz1.antispameurope.com (mx-relay164-hz1.antispameurope.com [94.100.133.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF923AE197
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772635087; cv=pass; b=bE54fWZvFl8qm7dlHfi3HzyGnk5aatiC4Y0PAPtuunrssRPE3HK1vB8u2x52w/cubmpzP6QApUkp07idJ8nynn0kGBPMqi5q+3eLgV7p53kD4DBohzSpwNV54VMsgXN9eBBU+tSazvwalz+is0jIpajyzVx0QqnE/EmRMjAoJZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772635087; c=relaxed/simple;
	bh=cql8O5MZyZWbwt5YpE0XpTU+Ie34brEDIkUwH6JkY5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D+/Tugkl2wxH0BEJyjRp9ijZZdH+fkD3V7tJHKvK5NQDP05ayeYvKQ1E4reVfZV31HVGfg/r934kFL5QAfedx2gNa8muzvjf3L+3raSibmtfqbf7jByUaot2T5AyJiWvCA7iCrsFRnukykYa5p+DRZGgNMl31+Yh6HhSJnyUaMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=NzkWaT0q; arc=pass smtp.client-ip=94.100.133.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="NzkWaT0q"
ARC-Authentication-Results: i=1; mx-gate164-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=S65+QOpEDDtGcLkv1l5kDyDDm+1HHGKbmX7NekvLsrU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772635024;
 b=I6cD926mltq37LbuOvm0DeE0PaxAzlUme5REM4XA19FfHeXCwRu2tapsIMiiyDuxwUo2SMzP
 aoJtbLlwYVPR97eh8g97PdJi1uh5jnIjU+Jqdt9u0zdI5yyPQQ93VR96GOo2X0HsyLF0cu32ID+
 ubyk3wE6btGsca6l2cZzRRbIXNfQZ3XKJeMezMqtrlPT125pDYyZBvM+dVyQN4Fn4QMlsD/8u3t
 KMl9iPJDctU4WLlIFBdMaF0u4okSGKgdYNKTqYVWoNjTOwj2sUhFwsS5C3oHpsNpxdnkETaPYU+
 b/qHB68bI4Qaa6IoCgZTUUr/6F8bWD9U0+qv1qdwzrU1Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772635024;
 b=T4W6WU49utpHw3RiCYFY/w8rP85RI8UcJEZVkTqcpvKzQJ80vFtjL0tp1afLweI0pUIAnEJ+
 ZQV5GYRoCH8VD0d51JPTx5vTK6QfPMCtvTbZJS/KD0ke8LCuJErVoj2O8WdCvKnnytBFHokpmlo
 hzVNu5LYZQY3EM+dnwFWftl6VJE4Y+4+02qaYuGfqmckI/7lLf3Rqav7UVZbTeXB3sI17/xk8N/
 jXB/k8aHmDRtlOiPtBTa5t7f707C3s4eZF9nURc26GYBUjLV91xriaW+RCqnj8Wa7eP86Owcxtt
 v3IaUBR/yRb0qVNKbvEODvd5kmqeQGhgQjvYiQJullzUg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay164-hz1.antispameurope.com;
 Wed, 04 Mar 2026 15:37:04 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id F2378A406A9;
	Wed,  4 Mar 2026 15:36:51 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-phy@lists.infradead.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND 1/1] phy: freescale: imx8qm-hsio: provide regmap names
Date: Wed, 04 Mar 2026 15:36:51 +0100
Message-ID: <4790031.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aYygzojdO0QACdqX@lizhi-Precision-Tower-5810>
References:
 <20260211144949.1128122-1-alexander.stein@ew.tq-group.com>
 <aYygzojdO0QACdqX@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart10034661.T7Z3S40VBb";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay164-hz1.antispameurope.com with 4fQwGr4Cjjz3xc4N
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:cc7fdbe6e2458b426077c21ba7604f44
X-cloud-security:scantime:6.857
DKIM-Signature: a=rsa-sha256;
 bh=S65+QOpEDDtGcLkv1l5kDyDDm+1HHGKbmX7NekvLsrU=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772635023; v=1;
 b=NzkWaT0qVFeKR/vGGjteg7RvUYIcKTU7FXGolKiYsHVEXxo2yRi7hppRVwEODXcuihoJA7nf
 C4H6ry6wlGv9bi37xHh3gBFEd9C9UrCQ1ZhRlpqy+snFT6Ig7t+AsvHdJElYHCRlPT6mmGftaod
 CpoBE+cdSSyjoQdVEP5vQIv/bTipoyFWinG7aj8bJBK0MPbhOr2DdyJdAqh4eqZsc7+EE/lzBPv
 MY8Sb1zmHGPy68IPp3xxihH12pp209MgPRGKbM1BHOIwDziaxDg0a25He57wYYvgt1YmP0LmXoS
 +vSa82pa1BoRjiRBWtR87FW5k1z1Ieh8pe19F48rIkP9A==

--nextPart10034661.T7Z3S40VBb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>, Vinod Koul <vkoul@kernel.org>
Date: Wed, 04 Mar 2026 15:36:51 +0100
Message-ID: <4790031.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aYygzojdO0QACdqX@lizhi-Precision-Tower-5810>
MIME-Version: 1.0

Hi,

Am Mittwoch, 11. Februar 2026, 16:31:26 CET schrieb Frank Li:
> On Wed, Feb 11, 2026 at 03:49:48PM +0100, Alexander Stein wrote:
> > This driver uses multiple regmaps, which will causes name conflicts
> > in debugfs like:
> >   debugfs: '5f1a0000.phy' already exists in 'regmap'
> > Fix this by using a dedicated regmap config for each resource, each
> > having a dedicated regmap name.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

gentle ping. Any additional feedback?

Best regards,
Alexander

> > Same as the one sent in December but with an updated CC list.
> >
> >  drivers/phy/freescale/phy-fsl-imx8qm-hsio.c | 23 +++++++++++++++++----
> >  1 file changed, 19 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/=
freescale/phy-fsl-imx8qm-hsio.c
> > index 279b8ac7822df..4ab45c9f53dff 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> > @@ -107,7 +107,22 @@ static const char * const lan2_pcieb_clks[] =3D {"=
apb_pclk2", "pclk2", "ctl1_crr",
> >  static const char * const lan2_sata_clks[] =3D {"pclk2", "epcs_tx", "e=
pcs_rx",
> >  					      "phy1_crr", "misc_crr"};
> >
> > -static const struct regmap_config regmap_config =3D {
> > +static const struct regmap_config regmap_phy_config =3D {
> > +	.name =3D "phy",
> > +	.reg_bits =3D 32,
> > +	.val_bits =3D 32,
> > +	.reg_stride =3D 4,
> > +};
> > +
> > +static const struct regmap_config regmap_ctrl_config =3D {
> > +	.name =3D "ctrl",
> > +	.reg_bits =3D 32,
> > +	.val_bits =3D 32,
> > +	.reg_stride =3D 4,
> > +};
> > +
> > +static const struct regmap_config regmap_misc_config =3D {
> > +	.name =3D "misc",
> >  	.reg_bits =3D 32,
> >  	.val_bits =3D 32,
> >  	.reg_stride =3D 4,
> > @@ -562,19 +577,19 @@ static int imx_hsio_probe(struct platform_device =
*pdev)
> >  		return PTR_ERR(priv->base);
> >
> >  	off =3D devm_platform_ioremap_resource_byname(pdev, "phy");
> > -	priv->phy =3D devm_regmap_init_mmio(dev, off, &regmap_config);
> > +	priv->phy =3D devm_regmap_init_mmio(dev, off, &regmap_phy_config);
> >  	if (IS_ERR(priv->phy))
> >  		return dev_err_probe(dev, PTR_ERR(priv->phy),
> >  				     "unable to find phy csr registers\n");
> >
> >  	off =3D devm_platform_ioremap_resource_byname(pdev, "ctrl");
> > -	priv->ctrl =3D devm_regmap_init_mmio(dev, off, &regmap_config);
> > +	priv->ctrl =3D devm_regmap_init_mmio(dev, off, &regmap_ctrl_config);
> >  	if (IS_ERR(priv->ctrl))
> >  		return dev_err_probe(dev, PTR_ERR(priv->ctrl),
> >  				     "unable to find ctrl csr registers\n");
> >
> >  	off =3D devm_platform_ioremap_resource_byname(pdev, "misc");
> > -	priv->misc =3D devm_regmap_init_mmio(dev, off, &regmap_config);
> > +	priv->misc =3D devm_regmap_init_mmio(dev, off, &regmap_misc_config);
> >  	if (IS_ERR(priv->misc))
> >  		return dev_err_probe(dev, PTR_ERR(priv->misc),
> >  				     "unable to find misc csr registers\n");
> > --
> > 2.43.0
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart10034661.T7Z3S40VBb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmmoQ4MACgkQaS+g2M0Z
/iXEwAf9GBONzrpx0QZxqc/tjXVVNBxtfFMIWIpmqhW2P3EqsUIygmNtmMcUnPel
7DAxvDtWy78DIFN+X25IKGbfsvNvtCwSk60RBJS/w5ZSIl3RrMUiaCjg73DKp615
E/4cBrbdhPzarLe4AbsYGqmOWh66JITuqA25STPr9TV3+n+fWLN8Yi4mBWO6159N
zGEORkXKrKIL9igOncF3N0twnqCBoD/PgKV98OABPY6gxEQRI6PiugImylCxDzNX
AzaAqwAdmRcgkpFemCGZ2VvCQmXgqmz8eHKr5cpBgQgob2n+MW2TPx2gTpsOopGz
XqbH935kCh8B2o+L29CoshVgIOpHEQ==
=XFgl
-----END PGP SIGNATURE-----

--nextPart10034661.T7Z3S40VBb--



