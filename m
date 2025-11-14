Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB96329C63
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 16:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763136142; cv=none; b=VTu6V/XHlTKPPEEiSw1XqszHfWatfiHvlqso7fdx1j8j+vt19dkldeWIxh+hWnFhAgQgOgMB/tRNOTTv5/9GGpo1uFRkQSfDt+NaRFGx7+7haK92Uky6HIAX8gIpAtj4ph9vcF6jyZk70MtUlyrf0ZIV0fXf0q0+c9HAvsCFC6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763136142; c=relaxed/simple;
	bh=GlJM4v8Q4C8qanB/6f3se2hzgWUzzVrsHajuU/sBlwE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FJjT+va9I2w2YQV3lrXuaaCU0AeLapkV5Gn3B3aM1tObv3JJ5i5OZsrktgIqOW9Sf/ocIKkUdHausLHSf2qBMHhxAFmOnosbA6z+CLg543X9xjdo/qlhU5AjBPMg9zYgYkCYcC7t703UTuCyPJEISVid2z6Mnn1ssuck8sTtqQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJwFX-0001tc-Ks; Fri, 14 Nov 2025 17:02:11 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJwFX-000RjJ-0w;
	Fri, 14 Nov 2025 17:02:11 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJwFX-00000000Ags-0qAH;
	Fri, 14 Nov 2025 17:02:11 +0100
Message-ID: <8b225c56612ff01845a90388be0945c7d0b3f0d2.camel@pengutronix.de>
Subject: Re: [PATCH v5 4/6] reset: imx8mp-audiomix: Extend the driver usage
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	 <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Daniel Baluta
	 <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li
	 <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team
	 <kernel@pengutronix.de>
Date: Fri, 14 Nov 2025 17:02:11 +0100
In-Reply-To: <20251114133738.1762-5-laurentiumihalcea111@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
	 <20251114133738.1762-5-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
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

On Fr, 2025-11-14 at 05:37 -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>=20
> Switch to per-device reset map to allow reusing the driver for other NXP
> block control IPs.
>=20
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-=
imx8mp-audiomix.c
> index 35df9bd5f71a..d3396f37d1ff 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -24,7 +24,12 @@ struct imx8mp_reset_map {
>  	bool active_low;
>  };
> =20
> -static const struct imx8mp_reset_map reset_map[] =3D {
> +struct imx8mp_reset_info {
> +	const struct imx8mp_reset_map *map;
> +	int num_lines;
> +};
> +
> +static const struct imx8mp_reset_map imx8mp_reset_map[] =3D {
>  	[IMX8MP_AUDIOMIX_EARC_RESET] =3D {
>  		.offset	=3D IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
>  		.bit =3D 0,
> @@ -42,9 +47,15 @@ static const struct imx8mp_reset_map reset_map[] =3D {
>  	},
>  };
> =20
> +static const struct imx8mp_reset_info imx8mp_reset_info =3D {
> +	.map =3D imx8mp_reset_map,
> +	.num_lines =3D ARRAY_SIZE(imx8mp_reset_map),
> +};
> +
>  struct imx8mp_audiomix_reset {
>  	struct reset_controller_dev rcdev;
>  	struct regmap *regmap;
> +	const struct imx8mp_reset_info *rinfo;

Since only rinfo->map is used in imx8mp_audiomix_update(), you could
directly store a

	const struct imx8mp_reset_map *map;


regards
Philipp
