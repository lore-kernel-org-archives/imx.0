Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5AB23D7D4
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 08:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770278538; cv=none; b=Wb9YNStSCj1x8ALUbPgCPp8dRl2v6igef3amBd3e9IBcNnDKzWtHxljIBermpZbpBf/lR8Kg0Vh8QqI3BjhouN7Z/JXrTNoQ+LMrVyxx0cv1SlJ32rcQc4xnWQzOwmWNTY4gH9gIEbGe2kb0YnTq6NsYLrQoB3xGxGYTgEp4PgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770278538; c=relaxed/simple;
	bh=q66+6EJer6x9TcQVCaoeA95KZvCa5WUv7O6/OYltWfc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iVFV0pnp10A9fwD/NzKjoxcMrN/TB8yki6FRzNEdMB6JHyZk+/CRpE4W9mM1oMczJlLxPLoDiCwcPgvbhlUJ8DXqEbMnBtret6grAC7caXUs7eXjc8Te76JlXwGuKVY7tBGxAVO+ItELs+OkNOBrCH6T1FgcpEzdriWeiaBIE24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vnuJT-0001FB-3r; Thu, 05 Feb 2026 09:02:07 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vnuJT-004Ciy-1W;
	Thu, 05 Feb 2026 09:02:06 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vnuJS-000000001Wv-33Rb;
	Thu, 05 Feb 2026 09:02:06 +0100
Message-ID: <68979ef7dbd839e4e601bd579f2d3b199a0d350e.camel@pengutronix.de>
Subject: Re: [PATCH] reset: imx7: Check return value of regmap_attach_dev()
 in imx7_reset_probe()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Chen Ni <nichen@iscas.ac.cn>, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 05 Feb 2026 09:02:06 +0100
In-Reply-To: <20260205034219.2531280-1-nichen@iscas.ac.cn>
References: <20260205034219.2531280-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Do, 2026-02-05 at 11:42 +0800, Chen Ni wrote:
> Add error checking for regmap_attach_dev() call in imx7_reset_probe()
> function to ensure proper error propagation.
>=20
> Return the value of regmap_attach_dev() if it fails to prevent
> proceeding with an incomplete regmap setup.
>=20
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/reset/reset-imx7.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
> index dd01fe11c5cb..59d0435302bb 100644
> --- a/drivers/reset/reset-imx7.c
> +++ b/drivers/reset/reset-imx7.c
> @@ -364,6 +364,7 @@ static int imx7_reset_probe(struct platform_device *p=
dev)
>  	struct device *dev =3D &pdev->dev;
>  	struct regmap_config config =3D { .name =3D "src" };
>  	const struct imx7_src_variant *variant =3D of_device_get_match_data(dev=
);
> +	int ret;
> =20
>  	imx7src =3D devm_kzalloc(dev, sizeof(*imx7src), GFP_KERNEL);
>  	if (!imx7src)
> @@ -375,7 +376,9 @@ static int imx7_reset_probe(struct platform_device *p=
dev)
>  		dev_err(dev, "Unable to get imx7-src regmap");
>  		return PTR_ERR(imx7src->regmap);
>  	}
> -	regmap_attach_dev(dev, imx7src->regmap, &config);
> +	ret =3D regmap_attach_dev(dev, imx7src->regmap, &config);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "regmap attach failed\n");

regmap_attach_dev() only returns -ENOMEM errors. The dev_err_probe() is
unnecessary here, as it does not print anything [1].

[1] 2f3cfd2f4b7c ("driver core: Make dev_err_probe() silent for -ENOMEM")

regards
Philipp
