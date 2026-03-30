Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9366E377034
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 16:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887638; cv=none; b=ItSuRw0fpOnZxTa6N2nzPLO348oI93aYQRtO9/wBmdaBpfDVlDQJ6SthFy2RoYQLXLD9AYo3Y1kiAlpvlYr3UjW6xHjMtX9Zx/SrLSYafgNVV15zXhODdSeLychyVv6SjWbRTsMHZZxR2LJIkYkkW8Pi4UubPionlvtE/aZRPKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887638; c=relaxed/simple;
	bh=K57gBoEH23N47yL4eS1KgvYp+ek/MERU4XfTzzMtrgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTXpkhHygJywPmEhEC87kNzFFuGaxeRppe+UJw5o84J5LqlTboSephz1DPmzJD/ZQIPM+9Zx5XN2GYas5clgBylbxEGW7iAn4o8Sj+goU68KPkWpTRi7gB6ZcKAX9tdpIziWf0twGYVHzf+HTIhfRTJLyaA+oFS2nzhxFrbjaDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 377561F8004D
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 16:20:30 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id CD2ADB2EA6F; Mon, 30 Mar 2026 16:20:28 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 3490AB2EA45;
	Mon, 30 Mar 2026 16:20:27 +0000 (UTC)
Date: Mon, 30 Mar 2026 18:20:24 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Liu Ying <victor.liu@nxp.com>, Maxime Ripard <mripard@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marek Vasut <marex@nabladev.com>, Stefan Agner <stefan@agner.ch>,
	Simona Vetter <simona@ffwll.ch>, imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Lucas Stach <l.stach@pengutronix.de>
Subject: Re: i.MX8MP: Fix HDMI LCDIF FIFO underruns
Message-ID: <acqiyNHYsNFa7LxM@shepard>
References: <m3ms04caaj.fsf@t19.piap.pl>
 <32317022-3c44-4ead-9e2d-04caa12b28cb@nabladev.com>
 <m36pvjbo4xy2rtdymshjpmwu7icl3wlyiwcmmjaozo7jpe5lqk@zt7byx7iwmym>
 <20260320-amiable-hairy-bullfinch-28bfda@houat>
 <m3a4w2d4ds.fsf@t19.piap.pl>
 <ecd02f87-c4b7-44ed-8ecf-98e0990af34a@nxp.com>
 <m35x6mpuya.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="irefZmrCtKVlvx7w"
Content-Disposition: inline
In-Reply-To: <m35x6mpuya.fsf@t19.piap.pl>


--irefZmrCtKVlvx7w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 23 Mar 26, 13:54, Krzysztof Ha=C5=82asa wrote:
> Liu Ying <victor.liu@nxp.com> writes:
> > If you may use a display mode with low resolution, say 640x480p60, and
> > the issue still happens, then I bet it's not related to the panic
> > threshold settings, but more likely related to KMS detail control seqeu=
nce.

I've also seen the same behavior. The NoC panic thresholds are meant to
temporarily increase the NoC master priority if the FIFOs are not able to
fetch data in time because too much data is moving on the NoC interconnect
and the display engine may be starved and fail to fetch data in time for
scanout.

The fact that our issue also happens with low sizes means that NoC access is
probably not the bottleneck that causes the FIFO errors and that tweaking t=
he
thresholds probably has no effect. I've also made my experiments with pretty
much nothing running on the system, so the NoC has no reason to be busy.

One issue I had with this issue is that it sometimes feels like certain cha=
nges
make the issue less frequent, but it is often just variability due to the s=
mall
numbers of tries.

It's true however that the nxp bsp does use different thereshold values for
lcdif3, which are probably tweaked for specific use cases with high load on
the interconnect. But I'm not sure it's very important to have them in main=
line
for now.

All the best,

Paul

> > This reminds me that Lucas had a patch series[1] to try to fix the
> > sequence, but it seems that it didn't fix i.MX93 LCDIF according to [2]
> > hence no landing.
>=20
> It seems it depends on resolution: at 1080p60 with the DIV_ROUND_UP
> (thresholds increased by 1) it seems to work fine. At 2160p30 (twice the
> clock) there are frequent underruns. Now with thresholds increased to
> 2/4 and 3/4, weston started fine 10/10, while shutdowns were 8/10.
> 4/6 and 5/6 made it worse, though.
>=20
> I don't know now. I will try to investigate a bit more tomorrow.
> Perhaps the sequence of register writes could be better, indeed.
>=20
> The following doesn't fix it for me either:
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -358,34 +358,27 @@ static void lcdif_enable_controller(struct lcdif_dr=
m_private *lcdif)
>  	writel(INT_ENABLE_D1_PLANE_PANIC_EN,
>  	       lcdif->base + LCDC_V8_INT_ENABLE_D1);
> =20
> -	reg =3D readl(lcdif->base + LCDC_V8_DISP_PARA);
> -	reg |=3D DISP_PARA_DISP_ON;
> -	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
> -
>  	reg =3D readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
>  	reg |=3D CTRLDESCL0_5_EN;
>  	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +
> +	reg =3D readl(lcdif->base + LCDC_V8_DISP_PARA);
> +	reg |=3D DISP_PARA_DISP_ON;
> +	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
>  }
> =20
>=20
> --=20
> Krzysztof "Chris" Ha=C5=82asa
>=20
> Sie=C4=87 Badawcza =C5=81ukasiewicz
> Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--irefZmrCtKVlvx7w
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnKosgACgkQhP3B6o/u
lQyrMg//TlCsn7dGmVsLb+l/eFqPgGfIXFW9p/661KXp7XAuNpRqEWnruc+hXoPk
RRKUOKWZKfUsoGjE1IY78Wsdk1mgkG1i5ZpbW3Bq8ACU1yaFrKbF/WDgzoRUd+B6
rjt0b19rn58nURb1cNCSwFR1Cmy6XuKyrLeHvP3+n1PRZN+IqSN52Q4JM+DXICbt
emOiVq7mBvJFxOFaD/qGPOqj/l1sjHui7xj79411Lx/ZXR5ffmrRwlYLk2bhpeSa
sV5UvaI1U4LEaHoPsqHoIluhqDQ87Lq8yhXW4/kVBKhfYbqSRiEDybIKjztfrPDx
bKl+lZ0eftuYBGLL0fxgl3x7G4FpgV1gv2qY+kWyo6+GPbFTQJ7Zs5Lloij0xy1O
7vBzi4xSZyFqQWa5DkYWZzAYWizLls63MB8c+5eyWglHFPgqsSV2AnkId1C5kQmv
4iUJe0MzuZgOtXlvYuon2DHw3e5Kvu/XnZPb2kAgZLUK5VnANRni2DJsQHQOZSYF
sCgJa1arM50b0ftO6iAdXZ4wnI6htNd2t6ca8k1SyKF8OI9rMzTW888x3WRNMcDg
nyB/+NCZCE4jkA1Fgvs0AA8oTkmo1Opl5SXvCc4CCB9ftPsCPgQBER35KYQTzvkq
XxXaLNhv2T+SFidzLdF7jebBNPHw1NfJWDKeSuzMtvCHbXi3kBs=
=q6XA
-----END PGP SIGNATURE-----

--irefZmrCtKVlvx7w--
