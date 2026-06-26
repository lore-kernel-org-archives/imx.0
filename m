Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750353DA7F2;
	Fri, 26 Jun 2026 11:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782474272; cv=none; b=r+DCQsT5WNvTZwYTLXXEhdCT73Yl33+IyoOZkkBP7QqdyMppRJ4hAA3HtLUIHbxyN6x2/dCtztV4SLpmU+FkXhg1FqIClY1gHjbCQrgxAM7aoRPpD+iplHAntv7tzVwa744GLIeqrpwayEQnejdyFeTk2PcPHBx5W0lERdVpOj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782474272; c=relaxed/simple;
	bh=uDud4QbyYyHyoPaDvt2SXTy2nOOy+5o8vCEYXG41ZBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acfiKDEhSiojS3woOQOR1rPXAxaINqsKSGkC6gjYkZKSP434pN78gS/c2Hb1dt8wJWxEv7CZwlEO9o1Us9jsW4l/HwCCgbGL/1e84CWAcXet411Nv6tVMG2k7aczDPa07n9IxKYdKK6I/1Bg40X/HW8aXIVhpFLptrBpsgoWtXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMrCwO2p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMrCwO2p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26091F000E9;
	Fri, 26 Jun 2026 11:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782474271;
	bh=/EzMymxSUM5VRHbvfwnomvo7p7AG4LxoHMkA4hDGBI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fMrCwO2pP0ZceLP1QpT/U1z6q/JXr09+ePTb2Ziqm9erGt8yebbW0hqeMmzmmWb4O
	 assosyXSeaB1lnCbmy5dKGSrcjdhNq4eK7FKqV0PlbekGzjMC3z3wP7daMwjfxCRU1
	 ApX7mdKhlodBF1jL9yyvBHP0DSouh/If9UszYulMaT9Fv7IwfGVj8AQx6bWIspmwTy
	 D5jNwZJogr2BgoexQg+uWxc/xxp5Bh4THYKQtmK9uJ2bVYiJTqSy0Jz3umL47d7SPN
	 gyzkHbnGc0kI9+N0zaOmncPEz122A9Js9v8e1+KvGfnmxmF0n1H1ZiYCTii+jrH2dR
	 bfpqdHfTyqQyw==
Date: Fri, 26 Jun 2026 13:44:29 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 15/37] drm/display: bridge-connector: allocate the
 connector dynamically
Message-ID: <20260626-falcon-of-unmatched-whirlwind-2fbbbf@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-15-45e2bdb3dfb4@bootlin.com>
 <20260608-rustling-infrared-turkey-e09af8@houat>
 <DJ72WOUW5FA2.G1MPCAHJQ13F@bootlin.com>
 <20260624-judicious-enigmatic-hippo-b13ffe@houat>
 <DJHE108R7TU6.35ECAUQ8ZX041@bootlin.com>
 <DJI0YM93PKAM.TMLLL1394R5D@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="efk5uu5pc7hesw2a"
Content-Disposition: inline
In-Reply-To: <DJI0YM93PKAM.TMLLL1394R5D@bootlin.com>


--efk5uu5pc7hesw2a
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 15/37] drm/display: bridge-connector: allocate the
 connector dynamically
MIME-Version: 1.0

On Thu, Jun 25, 2026 at 11:32:32AM +0200, Luca Ceresoli wrote:
> On Wed Jun 24, 2026 at 5:34 PM CEST, Luca Ceresoli wrote:
> > Hi Maxime,
> >
> > thanks for the feedback.
> >
> > On Wed Jun 24, 2026 at 1:48 PM CEST, Maxime Ripard wrote:
> >> On Fri, Jun 12, 2026 at 02:44:43PM +0200, Luca Ceresoli wrote:
> >>> On Mon Jun 8, 2026 at 1:46 PM CEST, Maxime Ripard wrote:
> >>> > On Tue, May 19, 2026 at 12:37:32PM +0200, Luca Ceresoli wrote:
> >>> >> Currently the drm_bridge_connector has an embedded drm_connector, =
so their
> >>> >> allocation lifetimes are tied to each other. This is insufficient =
to
> >>> >> support DRM bridge hotplugging, which requires the connector to be=
 added
> >>> >> and removed dynamically at runtime multiple times based on hotplug=
/unplug
> >>> >> events while the drm_bridge_connector is persistent.
> >>> >>
> >>> >> Moreover the drm_connector is exposed to user space and thus an on=
going
> >>> >> operation (e.g. an ioctl) might last for an arbitrarily long time =
even
> >>> >> after the hardware gets removed. This means a new connector might =
have to
> >>> >> be added when the previous one is still referenced by user space.
> >>> >>
> >>> >> In preparation to handle hotplug, allocate the drm-connector dynam=
ically,
> >>> >> to allow:
> >>> >>
> >>> >>  * creating and destroying a connector multiple times during a sin=
gle
> >>> >>    drm_bridge_connector lifetime
> >>> >>  * creating a new connector even though the previous one is still =
in use
> >>> >>    and thus still refcounted and not yet freed
> >>> >>
> >>> >> This commit does not introduce the actions in the two bullets (it =
will
> >>> >> happen in a later commit), it only moves to dynamic APIs for conne=
ctor
> >>> >> allocation and init.
> >>> >>
> >>> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >>> >
> >>> > I think this patch should be split in half, with the switch to using
> >>> > destroy first, and then the actual move to the dynamically allocated
> >>> > connector API.
> >>>
> >>> Is it doable? drm_connector_dynamic_init() mandates a .destroy callba=
ck,
> >>> drm_connector_init() forbids it.
> >>
> >> drmm_connector_init forbids it. drm_connector_init mandates it.
> >
> > Something bogus in my reply, sorry. :)
> >
> > So you mean splitting in:
> >
> >  * first patch: move from drmm_connector[_hdmi]_init() to
> >    drm_connector[_hdmi]_init() and add a .destroy
> >  * second patch: move from drm_connector[_hdmi]_init() to
> >    drm_connector[_hdmi]_dynamic_init() +
> >    drm_connector_dynamic_register/unregister()
>=20
> Ah, no, there's an annoyance here. drm_connector_hdmi_init() does not
> exist, so it'd have to be created just for the sake of splitting this
> patch, sitting unused after the second patch.
>=20
> I don't think it's worth implementing (and maybe deleting) it just for
> that, so I'm leaving this patch as is unless you have counteraguments.

If it's just to ease the transition, you can have two different set of
drm_connector_funcs for HDMI vs !HDMI, one with destroy and the other
using drmm while you rework the init function

Maxime

--efk5uu5pc7hesw2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaj5mGAAKCRAnX84Zoj2+
dnJMAYDonRDM7lYwChQvQtwXC8KltmCs4qQ0NQD1obaIE5je/j+3uLNA3Zwa/0QD
Nr64eHkBf2a3n1y/O3BApWQ00QFwjbklQKszO9JRCcBkAyS8zUaJ11TbFPP2Tqxb
BP0SynMxDQ==
=2ozk
-----END PGP SIGNATURE-----

--efk5uu5pc7hesw2a--
