Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDC07581A
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729511328; cv=none; b=Efle5mO2gkdhBnCCm0JFx9jWWrp4q8k13uOg6hiy6atq7iYcF1KfLQczQ5ShZ8vtFZdeK3PWUm2dyiGJYZnbckbhV5FMmZzE1LJfVYAnbDeElO5TSB52y0BJkA4dUc5X06LFe177Pfz8XZVAwrYaa4YtM5GnhRR2HzEOn5HwEAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729511328; c=relaxed/simple;
	bh=4imDbdbcRr/rcPfFf8p6R73xU94bD/Fg7qv/zrZw238=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFBHviZK3zTn45xdpQ5eDMn+Oo17uBbJQ7/VgjsDOYQMrmtO3jZi/qDZap0h8DO1Mnaa63DdBQrGpvYi9C24YGi5AUjADLcRXjRsT3cUdb0fKBTr0YuXG0Y5DKCivL30ebdvbeoOnSPF9pwLXih+X098pdF2t2w5OcwjK5kId/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJVr10Kx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJVr10Kx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0712C4CEC3;
	Mon, 21 Oct 2024 11:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729511328;
	bh=4imDbdbcRr/rcPfFf8p6R73xU94bD/Fg7qv/zrZw238=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nJVr10KxL0JzirH7dCBXHuCE6kQI2jwKbx4B+vOq0riewhdefh5KBRINnI20M4Ltj
	 WUZI2Wuthv5GOMKcwCc9dUVf5LD0RMDAxag3qZOEQvzO+fWcp/XLj/zHvhsbaO9Uci
	 bT8hQdFrKS2lB8a5RSVtiX2k+1yjVG3YZOnuYqlxyOpULqokP80Nv5pj/r25kJlvE3
	 XrQxqGSmUcF3fBxNZmc1TVGAKR2mI1GeWintHYEH0OMsV9+aBUgjTLqFVtXYkh/8gW
	 Nm+BLK8vmteWtVyC/pxBk24oCKABgN+Zi7+IMY2Otg71RMaQDrsn6POiXwvJKCcZ7W
	 eJwLI3ialdU5g==
Date: Mon, 21 Oct 2024 13:48:45 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Isaac Scott <isaac.scott@ideasonboard.com>, 
	Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Lucas Stach <l.stach@pengutronix.de>, "Lukas F.Hartmann" <lukas@mntmn.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, kernel@dh-electronics.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm: lcdif: Use adjusted_mode .clock instead of
 .crtc_clock
Message-ID: <20241021-silky-aspiring-bonobo-f4ecf7@houat>
References: <7ae0cd7774f4b3e30cc033a7e543546732dbced0.camel@ideasonboard.com>
 <de285fc0-728f-4ba0-86e0-0069d2cc9a35@denx.de>
 <64e18ceed5279a9346a6a1141f02ead93383bd1e.camel@ideasonboard.com>
 <84f505af-1066-4fcf-84b7-28c152c09b89@denx.de>
 <a7143bd9-a5e0-4afc-98ed-2d4d58171a32@nxp.com>
 <d70a9c51-6fd7-46fe-8009-b42d0ab4e142@denx.de>
 <23d9df90-cb80-4d97-afd6-5c573face4bc@nxp.com>
 <f4b083ec-58b5-477a-a0a4-c4c8d02027a7@denx.de>
 <172937454426.2485972.12472740284222343769@ping.linuxembedded.co.uk>
 <eee5649b-ca5a-42c5-a6ec-246ee21fb6e4@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ho5ibfuonweqf5yb"
Content-Disposition: inline
In-Reply-To: <eee5649b-ca5a-42c5-a6ec-246ee21fb6e4@denx.de>


--ho5ibfuonweqf5yb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: lcdif: Use adjusted_mode .clock instead of
 .crtc_clock
MIME-Version: 1.0

On Sun, Oct 20, 2024 at 04:49:29AM +0200, Marek Vasut wrote:
> On 10/19/24 11:49 PM, Kieran Bingham wrote:
> > Quoting Marek Vasut (2024-10-12 21:37:59)
> > > On 10/11/24 5:10 AM, Liu Ying wrote:
> > >=20
> > > Hi,
> > >=20
> > > > > > > This Video PLL1 configuration since moved to &media_blk_ctrl =
{} , but it is still in the imx8mp.dtsi . Therefore, to make your panel wor=
k at the correct desired pixel clock frequency instead of some random one i=
nherited from imx8mp.dtsi, add the following to the pollux DT, I believe th=
at will fix the problem and is the correct fix:
> > > > > > >=20
> > > > > > > &media_blk_ctrl {
> > > > > > >   =A0=A0=A0 // 506800000 =3D 72400000 * 7 (for single-link LV=
DS, this is enough)
> > > > > > >   =A0=A0=A0 // there is no need to multiply the clock by * 2
> > > > > > >   =A0=A0=A0 assigned-clock-rates =3D <500000000>, <200000000>=
, <0>, <0>, <500000000>, <506800000>;
> > > > > >=20
> > > > > > This assigns "video_pll1" clock rate to 506.8MHz which is curre=
ntly not
> > > > > > listed in imx_pll1443x_tbl[].
> > > > >=20
> > > > > Since commit b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic ra=
tes") the 1443x PLLs can be configured to arbitrary rates which for video P=
LL is desirable as those should produce accurate clock.
> > > >=20
> > > > Ack.
> > > >=20
> > > > >=20
> > > > > > Does the below patch[1] fix the regression issue? It explicitly=
 sets
> > > > > > the clock frequency of the panel timing to 74.25MHz.
> > > > > >=20
> > > > > > [1] https://patchwork.freedesktop.org/patch/616905/?series=3D13=
9266&rev=3D1
> > > > > That patch is wrong, there is an existing entry for this panel in=
 panel-simple.c which is correct and precise, please do not add that kind o=
f imprecise duplicate timings into DT.
> > > >=20
> > > > At least the patch[1] is legitimate now to override the display
> > > > timing of the panel because the override mode is something
> > > > panel-simple.c supports.
> > >=20
> > > It may be possible to override the mode, but why would this be the
> > > desired if the panel-simple.c already contains valid accurate timings
> > > for this particular panel ?
> >=20
> > I'm confused a little here. Why is it that setting the panel timings in
> > the DT as per [1] make the display work, while the panel timeings in
> > panel-simple alone are not enough?
> >=20
> > Is there some difference in code path for 'how' the panel timings are
> > set as to whether they will apply fully or not ?
> Because [1] sets inaccurate pixel clock of 74.25 MHz, which can be divided
> down from random default Video PLL setting of 1039.5 MHz set in imx8mp.dt=
si
> media_blk_ctrl , 1039.5 / 74.25 =3D 14 .
>=20
> The panel-simple pixel clock are 72.4 MHz, to achieve that accurately, it=
 is
> necessary to reconfigure the Video PLL frequency to 506.8 MHz , which
> LCDIFv3 can do, but LDB can not, hence it has to be done in DT for now.

That the clock driver is broken and thus should be fixed through the DT is a
bit backward, don't you think?

AFAIU, the clock can't reach the ideal pixel clock panel-simple has. Do
you have the datasheet for that panel?

If so, using display_timings and shortening/extending the blanking
timings to match the clock that can be provided seems like a more robust
solution.

Maxime

--ho5ibfuonweqf5yb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxY/lwAKCRAnX84Zoj2+
djQkAX9pau0RK4avN6KXYqDPuudxIDGUmhGo2wFADyiSsh+KOHNKfeoiyZWGuJkE
J7jkTNgBfj2uJ4GaH+pTnvQGNCZmM6hf/T2rUJRm2JaiExu5jUEPzRhGp4lN8fVl
luAfNx27XA==
=i+ss
-----END PGP SIGNATURE-----

--ho5ibfuonweqf5yb--
