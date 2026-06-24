Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80E5259C80;
	Wed, 24 Jun 2026 13:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306263; cv=none; b=c8KZ72f6R2DVrlEWHlVCJmwiOWVvAQwkiCEuN1lAZa9pj1iLxdbHMYYp4O3AxXp82m2U77oL4f6Ux0pOfuOQDuWG7uAde9qgZjDPb7jKxHW5W/6C04ihEKYb+G2KgDdF/GqodGW3ygWIfS0OLMu98IkatPWQ5ldWsjgK2hi4FsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306263; c=relaxed/simple;
	bh=ffRaDjvCy9x1Qb7A599+eUpMi1nniGkrv/uTQ6dXYpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cl7+yEOAO81P2l748HVurx7IP0inrVSNWDItIREJ3jTrSTjD0gsBlFxidjr623uiYmt7Ss3Yw1wE/GwlM8BvpvhyFguQEL5uTKi1+UD1o50yWggUdqd7ylp5hTsNHA+WjDKTMEZ5f5uW2xtwLhDQKEiOp3Z4JlTKUaiQBZzPN4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVDAUURG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVDAUURG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30851F000E9;
	Wed, 24 Jun 2026 13:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782306262;
	bh=eWHl0udhvjCV2mjGVC5uD1U/TvHNrVW3aXd0HzDYa1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FVDAUURG5/OnVD/2XG5fzA49+V/z3pAgKME/Z9UXdbjAATGJL7M3qh98G+bnxhA8y
	 zvn8Vir+IzYGhhHsGRzq15UnjwPKF3AWWu37ET7ogGxEu95K7qdVsdQ4W2hTvJMESV
	 BCwWgJDd84CnVWefJoKqTcKxoZ5DOc0EgfqgJ6eedQs5wdcaHeFoUa+Htx2y3HpN3y
	 0ehEMWnE+LupoJaQcFZpdLLmP97qbW0M9g2fxDKXUKvgup+VBq3KxMNhTQyHyiZ5fL
	 AztfsXKYTjbMO6PWpYeSCHDEuxlk0qhkY5eU1VhvqfK7oFMtH/4wyCDTTa0+Fm3JHN
	 6INBjM3evlPJQ==
Date: Wed, 24 Jun 2026 15:04:19 +0200
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
Subject: Re: [PATCH 30/37] drm/bridge: add drm_bridge_is_tail() to know
 whether a bridge completes the pipeline
Message-ID: <20260624-vagabond-neon-gorilla-cd6487@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-30-45e2bdb3dfb4@bootlin.com>
 <20260608-shapeless-opal-ferret-c8b105@houat>
 <DJ4DGYZ3GQZH.3AZOC0Z69W92S@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="kbqprj5uqeblzkb7"
Content-Disposition: inline
In-Reply-To: <DJ4DGYZ3GQZH.3AZOC0Z69W92S@bootlin.com>


--kbqprj5uqeblzkb7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 30/37] drm/bridge: add drm_bridge_is_tail() to know
 whether a bridge completes the pipeline
MIME-Version: 1.0

On Tue, Jun 09, 2026 at 10:23:24AM +0200, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> thanks for the review of this long series!
>=20
> On Mon Jun 8, 2026 at 2:34 PM CEST, Maxime Ripard wrote:
> ...
> >> --- a/include/drm/drm_bridge.h
> >> +++ b/include/drm/drm_bridge.h
> >> @@ -78,6 +78,19 @@ struct drm_bridge_funcs {
> >>  	int (*attach)(struct drm_bridge *bridge, struct drm_encoder *encoder,
> >>  		      enum drm_bridge_attach_flags flags);
> >>
> >> +	/**
> >> +	 * @is_tail:
> >> +	 *
> >> +	 * Returns true if this is a tail bridge, i.e. it does not need a
> >> +	 * next bridge to work. E.g. a panel_bridge is a tail bridge, a
> >> +	 * DSI-to-LVDS bridge is not a tail bridge (no matter whether the
> >> +	 * next bridge is present or not).
> >
> > Why a DSI-to-LDVS bridge isn't a tail bridge? It only needs a panel
> > next, right?
>=20
> Uhm, good point, but I'd say it can be a tail bridge or not: in the
> ATTACH_NO_CONNECTOR case it will need a bridge (a panel_bridge most
> likely), no?

Yeah, I think it cannot (always) be a blanket statement from the driver.
For drivers that do not support ATTACH_NO_CONNECTOR, then it's always
going to be a tail, but if the driver supports it, we should use a
helper because it's going to depend on the DT, basically.

> However this is possibly irrelevant as the whole .is_tail is meant to
> disappear in v2, see below.
>
> >> +	 * The @is_tail callback is optional but it is required if the
> >> +	 * bridge is part of a pipeline with hot-pluggable components.
> >> +	 */
> >> +	bool (*is_tail)(struct drm_bridge *bridge);
> >> +
> >
> > I don't think that's the right way to think about it, if only because
> > you never really know at the driver level if you're supposed to be last
> > or not. A DSI-to-LVDS bridge might just as well be chained with an
> > LVDS-to-eDP bridge, or feed the panel directly without any additional
> > bridge.
> >
> > I *think* that what you're trying to find out here is whether the chain
> > is complete or not.
>=20
> You nailed it.
>=20
> That was the main point discussed during the Display Next Hackfest 2026
> (see the report [0]) and we all agreed the .is_tail along with the
> -EPROBE_DEFER changes (patches 20+35) are not a good approach.
>=20
> This is actually the most crucial aspect of the whole work still not havi=
ng
> no well-defined solution.

Ok

> > I think you can get the same information by checking
> > whether you have a connector for that bridge chain. If you don't, you
> > know the chain isn't complete, and if you do, it's supposed to be.
>=20
> There's a checken-egg problem here. Knowing whether the pipeline is
> complete or not is needed to know whether we have to create a
> connector. See patch 36:
>=20
>   +  if (drm_bridge_connector_pipeline_is_complete(bridge_connector))
>   +          drm_bridge_connector_add_connector(bridge_connector);
>=20
> So the question is still open, what I need the most right now is comments
> on the overall architecture of this aspecs. Maybe replying to [0] can be
> more effective than here.
>=20
> In a nutshell what we need is:
>=20
>  * when a bridge needs a following element (a bridge, or a panel which
>    however might/should have a panel_bridge), but that element is not
>    present, instead of deferring the whole card probe the card should be
>    allowed to probe but without a connector
>=20
>  * when something is added to an incomplete pipeline we need to know
>    whether the pipeline has become complete (in order to create the
>    connector)
>=20
> How to implement this is still an open point. I'll welcome proposals in
> addition to the ones in [0].

Thanks for the notes, I think I largely agree with the discussion.
Reading through it, I thought it would be nice for a new callback called
get_next_bridge or something that would return either an error, NULL or a
(refcounted) pointer to the next bridge in the chain. And have some kind
of special error (ENODEV?) when the bridge should be there but isn't
(and thus the chain isn't complete).

Maxime

--kbqprj5uqeblzkb7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCajvVzAAKCRAnX84Zoj2+
dlmUAYD85u1Hv2vXFhhpb6AcHYKPXjuNOtyNzQsT4JWMH1ryh7eB79pKZqOgRdEy
eq2O3/oBgPEWUBztGIVs76NR8fkCDIHxxd33fzv2OlQ6wFx/V7B8rXw601tQObK3
cTgu6ITMBQ==
=amXL
-----END PGP SIGNATURE-----

--kbqprj5uqeblzkb7--
