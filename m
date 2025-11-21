Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411F01B4156
	for <imx@lists.linux.dev>; Fri, 21 Nov 2025 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738345; cv=none; b=XUsqQ049F4UeE8IR+H1FMriV42JgcbrdjyYJq3GbJ0uWGaxVZH/8eFKonWE8/RxE9RUmILzzFSVDZDcEop/heG4iEbK42VKHjkRTeTTMexIpCu4i1BBsYRC7Aq7OSRtEYLek/9LYjvGid1WdQ/1aKDPK/ftbG8jKtf7MsHIqfWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738345; c=relaxed/simple;
	bh=8I1kaW4tw6ShabGBn192g00Jq5dnD0vAxiZk8PSuTMo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aKbnTvtDiIVLPUv8r408iDUYVJVumyBfruZFMG9r8/EjWzFpRgYTcxRMtrtjtziYHq82IOZMT/RWccYXWsJdpLXKmPIrsmixxuc5YrxlRxcr1SFPGuTslybJB9BkwhvQi/ZiUeVdxLC8rfBwptyldYwlUuBB/SOvbGZYXWqnPJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMSuQ-0001mM-AS; Fri, 21 Nov 2025 16:18:50 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMSuP-001bmX-2X;
	Fri, 21 Nov 2025 16:18:49 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMSuP-0000000096L-2pSt;
	Fri, 21 Nov 2025 16:18:49 +0100
Message-ID: <24e594539714c5997545414d084a60128673a50b.camel@pengutronix.de>
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
Date: Fri, 21 Nov 2025 16:18:49 +0100
In-Reply-To: <3959e908-ae61-4424-a8ef-89f655a4de8c@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
	 <20251114133738.1762-5-laurentiumihalcea111@gmail.com>
	 <8b225c56612ff01845a90388be0945c7d0b3f0d2.camel@pengutronix.de>
	 <3959e908-ae61-4424-a8ef-89f655a4de8c@gmail.com>
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

On Fr, 2025-11-21 at 01:29 -0800, Laurentiu Mihalcea wrote:
> On 11/14/2025 8:02 AM, Philipp Zabel wrote:
> > On Fr, 2025-11-14 at 05:37 -0800, Laurentiu Mihalcea wrote:
> > > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > >=20
> > > Switch to per-device reset map to allow reusing the driver for other =
NXP
> > > block control IPs.
> > >=20
> > > Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > > ---
> > >  drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
> > >  1 file changed, 16 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/re=
set-imx8mp-audiomix.c
> > > index 35df9bd5f71a..d3396f37d1ff 100644
> > > --- a/drivers/reset/reset-imx8mp-audiomix.c
> > > +++ b/drivers/reset/reset-imx8mp-audiomix.c
> > > @@ -24,7 +24,12 @@ struct imx8mp_reset_map {
> > >  	bool active_low;
> > >  };
> > > =20
> > > -static const struct imx8mp_reset_map reset_map[] =3D {
> > > +struct imx8mp_reset_info {
> > > +	const struct imx8mp_reset_map *map;
> > > +	int num_lines;
> > > +};
> > > +
> > > +static const struct imx8mp_reset_map imx8mp_reset_map[] =3D {
> > >  	[IMX8MP_AUDIOMIX_EARC_RESET] =3D {
> > >  		.offset	=3D IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
> > >  		.bit =3D 0,
> > > @@ -42,9 +47,15 @@ static const struct imx8mp_reset_map reset_map[] =
=3D {
> > >  	},
> > >  };
> > > =20
> > > +static const struct imx8mp_reset_info imx8mp_reset_info =3D {
> > > +	.map =3D imx8mp_reset_map,
> > > +	.num_lines =3D ARRAY_SIZE(imx8mp_reset_map),
> > > +};
> > > +
> > >  struct imx8mp_audiomix_reset {
> > >  	struct reset_controller_dev rcdev;
> > >  	struct regmap *regmap;
> > > +	const struct imx8mp_reset_info *rinfo;
> > Since only rinfo->map is used in imx8mp_audiomix_update(), you could
> > directly store a
> >=20
> > 	const struct imx8mp_reset_map *map;
>=20
>=20
> hm, that is true, but I wonder if instead of replacing "rinfo" with "map"=
, it would be better to
>=20
> keep "rinfo" and add an out-of-bounds check for the reset ID in imx8mp_au=
diomix_update().
>=20
> Something like:
>=20
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (id >=3D priv-=
>rinfo->num_lines)
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
urn -EINVAL;
>=20
>=20
> we are stuck with "struct imx8mp_reset_info" so might as well fully make =
use of it?

There is no need to check this again. You copy rinfo->num_lines into
rcdev.nr_resets, which is checked in of_reset_simple_xlate() before the
reset_control is even handed to the consumer.

regards
Philipp
