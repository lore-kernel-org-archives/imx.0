Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3585C318EC5
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 13:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861013; cv=none; b=KsRE89YG965CpIKoCwoh1vFhwpNmCGGcFZth83vQUtVPzTSBYik5YzTVZwwhFaSgu2PkWrMTN3zyan6CHqZvWlU7VbIDrYvVCRxuBO5bRVtNzHXajrzX8jYKqSMYbPNp3cg4OOpN1CPmQGF05LID7Za1snSVLfyuh7/wxM9NoCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861013; c=relaxed/simple;
	bh=557KNANGYzATVmcfl4XH4nN4Qy+fFqLfFGNKb9zOsaI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cYXWt7iOW0cNPZ8ZUW0kXuObKKP7xYgpSfwwyeISUuCADJvhx/t20kBUEZBaszvVP5fbyNlQODkR4s5+WWOe+EP+AR3sPqpg0bIt6F0HwgmonbOPsIihtYlzd1BdH9S0S1gkCG5l35nSXfYqAvLb4p5uqbkJxFdKiGsZpQzbxMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YS0Q1KkA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YS0Q1KkA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3521F000FF;
	Thu,  1 Oct 2026 13:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790861011;
	bh=1KhjO7Ve+bwC1EXPvDPnP9O0N3bQ4V/TYRMKRG3+ks4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YS0Q1KkArPuhX28FaP5MSKeMIOxhmSz/MgC7f/XUGMCYq7AKbd51rdhaYAHfeC/LE
	 UTxPev2x8J0uQO4f8YvbX7ffMwCNGjP6tjZr6djv4JE81b1l+YippKo4Rh8CgfzawJ
	 l9pcva8RIALWf/df7HDoZtWbbO5y9fKGLY15HmNok+lCOCU5deHuJ7O+QE7XfUDF78
	 w8oJGZM7o+YZBoYiRtyg0CkzHfx/YbNcTc83dXkQFxOAkYk6qLWDH8fciv+NkgTYLK
	 kADqL3fjjxVJfSdAbJYwaLWsHa6H9zUIYYCX57PtD7HsCdlx2gx0QZop5ojRJUcdcY
	 nf6IaBbOzg++Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 20/24] drm/bridge: ti-sn65dsi83: implement
 .get_next_bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org
In-Reply-To: <20261001-drm-bridge-hotplug-v2-20-8e34986dcb68@bootlin.com>
References: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
 <20261001-drm-bridge-hotplug-v2-20-8e34986dcb68@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:23:31 +0000
Message-Id: <20261001132331.9D3521F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/bridge: ti-sn65dsi83: missing refcount increment in get_next_b=
ridge
--

commit cea7189b53e4a71deaaf15ff6f56ed70a0d97448
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: ti-sn65dsi83: implement .get_next_bridge

This commit adds the get_next_bridge callback to expose the next bridge in
the chain for the ti-sn65dsi83 driver.

> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi83.c
> index eb5b249cc43c7..76fc0ca8cd196 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -295,6 +295,13 @@ static struct sn65dsi83 *bridge_to_sn65dsi83(struct =
drm_bridge *bridge)
>  	return container_of(bridge, struct sn65dsi83, bridge);
>  }
> =20
> +static struct drm_bridge *sn65dsi83_get_next_bridge(struct drm_bridge *b=
ridge)
> +{
> +	struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> +
> +	return ctx->panel_bridge ?: ERR_PTR(-ENODEV);
> +}

[Severity: High]
Does this need to increment the refcount of the returned panel bridge?

The API contract for the get_next_bridge callback in include/drm/drm_bridge=
.h
states that it must return a bridge with its refcount incremented, as calle=
rs
are expected to invoke drm_bridge_put() when they are done.

Since ctx->panel_bridge is returned directly without calling drm_bridge_get=
(),
could a caller traversing the chain cause a refcount underflow? This could
potentially lead to a use-after-free of the panel bridge object when the
caller drops its reference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-drm-bridge=
-hotplug-v2-0-8e34986dcb68@bootlin.com?part=3D20
