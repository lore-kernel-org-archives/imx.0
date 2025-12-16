Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A343A34FF72
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 14:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765896656; cv=pass; b=heQsiBFPY+Q7SqosUvdJoSj+YROrjwq0Wd5ChgCEfgMDK942tqWtdqVMQqE3vqmOszxOLNeJaOisigbHYOUkbeeXvUZ204lhnvuG00BB4zD6wSPxgOp4ckG8UY7IS6epiz+jeJ3RWwRmI2CN7eMK7W/kOH9jR3JoM/ddws2WBsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765896656; c=relaxed/simple;
	bh=ojyXZFw2EK0ykeGRHp2mZUVQmws+fP/uW9L0WA3Y47w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D2v5vO4MieOviZl6jE5QNoA1zo1QhLZ5g9h9qAN57DmizzWJ3IjbTzZcDJ2gVUMy4M1hc6rl04xygJSj/DUU3Cd1wSm0sdtwX3zfZwBF9YNU7DYq4meY+zZJvSsRsMhJmby8JdkI2uTXvNZ4lnG341A/UdcEjlleIWkYntePRzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KnGRlsYN; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KnGRlsYN"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=mDzyPep7uIesiVN2Xu964DHIfly5zx/Rgp+gMAETLhI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765896626;
 b=F52nkuNi+jKXBZ7w11JwJnrcw3cJ7YOYv/1h0rbVOpkPlnOajtGxiBv2zfsrGRFDY6Ar0doL
 lZVkKGy+fa1okUjkX3XUbzBwz3W1ATDk5QA0Uxa4rGVVR6m9FwtA1SUueXf1OLx2F1BltaZ8IF1
 7aZSVHBAt74fyidyQMFU/QXUUARRvAtgzmCT+yfMAuDq6MszRjAH5osuNSVvks6RaMnhvLaEDab
 Byhrfx4QCAkUEhpVceOPZ6zeO45CJoCIH4qogPTHVoXkhjlczneRGqWfsxJtFLQzKRA5BoloNO3
 Wrqp3/Ixzo8bnK0tU8uiwYOSkrKXlJWjM0ScKVbyNJCzg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765896626;
 b=DAfL0Vv6vQK1c86BBKUXA9ouh3nHYJVRsaP0vhTed8CtBzHHA+HPX+mO/BAD0XS94Q/UfARu
 C2hmwm0XAQycIxr6+JwlKc2eqyfK/68qLPC+/uI+mN9XSAbRVKn4k90LiL4nWhxZXaWnRnfyL/R
 PZ4Np12qDdabmDqlPksI09bmhliACDChYomspu79WZ3RufHE6aL0/n3rCbZzxOnwJDpMSYyhjej
 QXnIMF6kBbmP8R8N66tE9EKKisOViaCwXybUluHFL0YcQLhByZPUvIe25ffQfzM91zeiZFYtpm+
 F1tAOP5PisFgS3CIOuTtG/l8nyTbr20YM7IBOnuGofWlA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Tue, 16 Dec 2025 15:50:26 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 4C793CC0CCA;
	Tue, 16 Dec 2025 15:50:18 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger-Novakovic <martink@posteo.de>,
 Purism Kernel Team <kernel@puri.sm>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] media: nxp: use dev_err_probe() to simplify code
Date: Tue, 16 Dec 2025 15:50:17 +0100
Message-ID: <13428800.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aUFwqMiYE+P+KdsO@lizhi-Precision-Tower-5810>
References:
 <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
 <5462566.31r3eYUQgx@steina-w> <aUFwqMiYE+P+KdsO@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6578227.DvuYhMxLoT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4dW0GM0Ps4z2nHdg
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:29b35c98ca747f9487b85b70588b948d
X-cloud-security:scantime:2.195
DKIM-Signature: a=rsa-sha256;
 bh=mDzyPep7uIesiVN2Xu964DHIfly5zx/Rgp+gMAETLhI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765896625; v=1;
 b=KnGRlsYNh7MyyG01f7IaA4Fm4o5n5S+81SvhGpLjsXV3wq0JyBpD7cMuadQGe4mXpaGLG3cW
 HUiLneBVPJF0akp/Q9mUWi6BT07/4YGRsuLItI80aKik+HYHQZnmyx7lQJZJ0FqBp9ncvTWgW0n
 uxTZWms8jd2nC5A5Rg2pf9on+q8SmGfrd3ZuAGNNI/HlFT4uWSCbMhhBDR24G3vhUVJy9RyLSyu
 7WUEjkLQWtSnN7InZOekAvJzZa8KhjhqOgzaVt7Xlbv5zYejVFf+EF1aukZ5m6NppHjKdnYoFu/
 cQG6U9X3jnTvG9Daq6loXE3Y/kZ5IhlVS739SvkzRyxZg==

--nextPart6578227.DvuYhMxLoT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Date: Tue, 16 Dec 2025 15:50:17 +0100
Message-ID: <13428800.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aUFwqMiYE+P+KdsO@lizhi-Precision-Tower-5810>
MIME-Version: 1.0

Hi Frank,

Am Dienstag, 16. Dezember 2025, 15:46:00 CET schrieb Frank Li:
> On Tue, Dec 16, 2025 at 08:34:18AM +0100, Alexander Stein wrote:
> > Hi,
> >
> > Am Montag, 15. Dezember 2025, 23:49:53 CET schrieb Frank Li:
> > > Use dev_err_probe() to simplify the code. Drop the explicit error mes=
sage
> > > after returning from imx8mq_mipi_csi_parse_dt(), as the error is alre=
ady
> > > reported by this helper.
> > >
> > > No functional change.
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > change in v2:
> > > - add  Laurent Pinchart review tags
> > > - wrap error message to new line
> > > - remove error code print in dev_err_probe();
> > > - drop error messaage at imx8mq_mipi_csi_parse_dt()
> > > ---
> > >  drivers/media/platform/nxp/imx-mipi-csis.c    |  6 ++---
> > >  drivers/media/platform/nxp/imx7-media-csi.c   | 14 ++++--------
> > >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 33 ++++++++++++-----=
=2D---------
> > >  3 files changed, 21 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/med=
ia/platform/nxp/imx-mipi-csis.c
> > > index 088b2945aee33731c565f049dd17721356300b84..ce93d868746f002c22e2f=
86b1e0aa84ec1a76061 100644
> > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > @@ -1547,10 +1547,8 @@ static int mipi_csis_probe(struct platform_dev=
ice *pdev)
> > >  	/* Now that the hardware is initialized, request the interrupt. */
> > >  	ret =3D devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
> > >  			       dev_name(dev), csis);
> > > -	if (ret) {
> > > -		dev_err(dev, "Interrupt request failed\n");
> > > -		return ret;
> > > -	}
> > > +	if (ret)
> > > +		return dev_err_probe(dev, ret, "Interrupt request failed\n");
> > >
> > >  	/* Initialize and register the subdev. */
> > >  	ret =3D mipi_csis_subdev_init(csis);
> > > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/me=
dia/platform/nxp/imx7-media-csi.c
> > > index 933a5f39f9f4c9b43ca8d2a1819d0145981266e6..7ddc7ba06e3d4e0070138=
21f67d783898a15461f 100644
> > > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > > @@ -2218,11 +2218,9 @@ static int imx7_csi_probe(struct platform_devi=
ce *pdev)
> > >
> > >  	/* Acquire resources and install interrupt handler. */
> > >  	csi->mclk =3D devm_clk_get(&pdev->dev, "mclk");
> > > -	if (IS_ERR(csi->mclk)) {
> > > -		ret =3D PTR_ERR(csi->mclk);
> > > -		dev_err(dev, "Failed to get mclk: %d", ret);
> > > -		return ret;
> > > -	}
> > > +	if (IS_ERR(csi->mclk))
> > > +		return dev_err_probe(dev, PTR_ERR(csi->mclk),
> > > +				     "Failed to get mclk\n");
> > >
> > >  	csi->irq =3D platform_get_irq(pdev, 0);
> > >  	if (csi->irq < 0)
> > > @@ -2236,10 +2234,8 @@ static int imx7_csi_probe(struct platform_devi=
ce *pdev)
> > >
> > >  	ret =3D devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0, "c=
si",
> > >  			       (void *)csi);
> > > -	if (ret < 0) {
> > > -		dev_err(dev, "Request CSI IRQ failed.\n");
> > > -		return ret;
> > > -	}
> > > +	if (ret < 0)
> > > +		return dev_err_probe(dev, ret, "Request CSI IRQ failed.\n");
> > >
> > >  	/* Initialize all the media device infrastructure. */
> > >  	ret =3D imx7_csi_media_init(csi);
> > > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/=
media/platform/nxp/imx8mq-mipi-csi2.c
> > > index 0851f4a9ae52d3096f454da643cfdc5017e000b1..a007c582b4d91660a9791=
0a6a0d53c9b6fcd73e9 100644
> > > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > @@ -951,10 +951,9 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_s=
tate *state)
> > >  	int ret =3D 0;
> > >
> > >  	state->rst =3D devm_reset_control_array_get_exclusive(dev);
> > > -	if (IS_ERR(state->rst)) {
> > > -		dev_err(dev, "Failed to get reset: %pe\n", state->rst);
> > > -		return PTR_ERR(state->rst);
> > > -	}
> > > +	if (IS_ERR(state->rst))
> > > +		return dev_err_probe(dev, PTR_ERR(state->rst),
> > > +				     "Failed to get reset\n");
> > >
> > >  	if (state->pdata->use_reg_csr) {
> > >  		const struct regmap_config regmap_config =3D {
> > > @@ -977,24 +976,22 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_=
state *state)
> > >
> > >  	ret =3D of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
> > >  					 ARRAY_SIZE(out_val));
> > > -	if (ret) {
> > > -		dev_err(dev, "no fsl,mipi-phy-gpr property found: %d\n", ret);
> > > -		return ret;
> > > -	}
> > > +	if (ret)
> > > +		return dev_err_probe(dev, ret, "no %s property found\n",
> > > +				    "fsl,mipi-phy-gpr");
> >
> > Do you really need to pass the (fixed) property name as an argument? Why
> > not move into the const string directly? I would also rephrase it a bit:
> > "property fsl,mipi-phy-gpr not found"
>=20
> Laurent Pinchart provide comments at previous version. The same
> "fsl,mipi-phy-gpr" share one entry at RO region. slice save RO region
> space.
>=20
> https://lore.kernel.org/imx/20251119043307.GH17526@pendragon.ideasonboard=
=2Ecom/

"assuming it's worth it". Do you have any numbers? I doubt there is a
significant benefit, but I don't have strong opinion here.
But the grammar should still be improved.

Best regards
Alexander

> Frank
>=20
> >
> > With that fixed:
> > Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >
> > >
> > >  	ph =3D *out_val;
> > >
> > >  	node =3D of_find_node_by_phandle(ph);
> > > -	if (!node) {
> > > -		dev_err(dev, "Error finding node by phandle\n");
> > > -		return -ENODEV;
> > > -	}
> > > +	if (!node)
> > > +		return dev_err_probe(dev, -ENODEV,
> > > +				     "Error finding node by phandle\n");
> > > +
> > >  	state->phy_gpr =3D syscon_node_to_regmap(node);
> > >  	of_node_put(node);
> > > -	if (IS_ERR(state->phy_gpr)) {
> > > -		dev_err(dev, "failed to get gpr regmap: %pe\n", state->phy_gpr);
> > > -		return PTR_ERR(state->phy_gpr);
> > > -	}
> > > +	if (IS_ERR(state->phy_gpr))
> > > +		return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
> > > +				     "failed to get gpr regmap\n");
> > >
> > >  	state->phy_gpr_reg =3D out_val[1];
> > >  	dev_dbg(dev, "phy gpr register set to 0x%x\n", state->phy_gpr_reg);
> > > @@ -1017,10 +1014,8 @@ static int imx8mq_mipi_csi_probe(struct platfo=
rm_device *pdev)
> > >  	state->pdata =3D of_device_get_match_data(dev);
> > >
> > >  	ret =3D imx8mq_mipi_csi_parse_dt(state);
> > > -	if (ret < 0) {
> > > -		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> > > +	if (ret < 0)
> > >  		return ret;
> > > -	}
> > >
> > >  	/* Acquire resources. */
> > >  	state->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > >
> > >
> >
> >
> > --
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> > http://www.tq-group.com/
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart6578227.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmlBcakACgkQaS+g2M0Z
/iWs0AgAm/CIWXGJuDcv8AoIXo0TmsKXj6Cdikafe2JqBAacZBFZjB1VyLMxIexD
F2Bh5Y/DLkwoEcZ3it4pwvCHOcG6a3xi/6KYd1lAi7BpmpUqV1LJe+MG8Qmxc5S/
t7/12HYy7t+W51fKe7SLXrn9o/oR0ya+ClAYkxDjVb4TykYu89cZkap/vZ8nW/qx
4rPnQU00NvhAu2VAnmG+zOvJPnOFkKYJ+hXfbO42mLarQOvG1hC6WL4YG4B3nrC1
sQbYnbKOVma9pBxejdzQOgxe4Uj2qFH6gwlTF1zkN/YPrLOfnCGTTs9Ejx3Ree2y
2C+48juYlTtNVy3NqlBxGdqpNrq7GQ==
=Qw+7
-----END PGP SIGNATURE-----

--nextPart6578227.DvuYhMxLoT--



