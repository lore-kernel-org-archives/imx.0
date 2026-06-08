Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B3036D50D;
	Mon,  8 Jun 2026 11:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919615; cv=none; b=fS9PRoIOzZubs0F2hki5DKv8nGk2FqXeWwOZUauuhsfBR9I13EtHpBAz3cL0XCp7dpyvMS7m8n2PFdcndHfHue2qOAbM3bLcZT9jXLSqs7yui24T8S3mLfnDNj+VHZyVw4v3FjEjxHen1CKuk7xFeJlletZLfYB2ovbms1YcM4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919615; c=relaxed/simple;
	bh=jHG+AouR/VzGK2Hkh9amYXxN5fxLgsAwkBnimHVHPOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuJbkTSacbZcWmQ/ZAhbnJ2sla99F2WgL7nTir4qQY4BKCS7YrWO4qoFrI7WqjhWwkt5KtOu4b8qLW7wfYXmFO42QCb1LUAo9qvCnGq/Q44kEG1kg2Iqn6jmxbSn3ZRA/6fwmPNkKey6HhX9h/ScpQhE+WIOo8izu3E2kHdNp9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HHz2im2J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHz2im2J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4C91F00893;
	Mon,  8 Jun 2026 11:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780919613;
	bh=Aj7bQVlWFQNv8VwKQ8kn/+8ZTcRdK8ocAc+qPNt4aJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HHz2im2JGoSCgcPtSn+FZfxSldsc1iMYQKTmB9mqRCMGgfXsgCcHvaCPXkqM80kQQ
	 jk03kNKmU0L5hVvxNiJid4x2/4PEzKahsLNsChcw52HYwFq+S4UFq+vlzOQiIRZQZd
	 yZiTn0lVGQoXUw1kg7vZ0jPiz84pZ2bXYvqu4HUzK2shYCyFU8hmCY5iJyEcauARU5
	 1m4Kz0BY61rID2zqtnA5Ks8vwquYaq3HbaKhsQWnnZFmOxmXXwVTQasyLnw2KfC7wZ
	 tTwqrRXUWzf27RtD5MrSX88s+ku1OBd9lyhHCN7GK8j9hdYQKfFtZFwDxfKJE98y9y
	 UAGOVco1YfFtQ==
Date: Mon, 8 Jun 2026 13:53:31 +0200
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
Subject: Re: [PATCH 18/37] drm/bridge: samsung-dsim: remove the panel_bridge
 on host_detach
Message-ID: <20260608-nano-kangaroo-of-piety-b5ab3d@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-18-45e2bdb3dfb4@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="dxwy3zhqjuxn6deo"
Content-Disposition: inline
In-Reply-To: <20260519-drm-bridge-hotplug-v1-18-45e2bdb3dfb4@bootlin.com>


--dxwy3zhqjuxn6deo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 18/37] drm/bridge: samsung-dsim: remove the panel_bridge
 on host_detach
MIME-Version: 1.0

On Tue, May 19, 2026 at 12:37:35PM +0200, Luca Ceresoli wrote:
> In preparation for DRM bridge hot-plugging, we need to handle the dynamic
> lifetime of the following bridge in case the samsung-dsim is always prese=
nt
> and the following bridge (next_bridge) is hot-unplugged.
>=20
> Based on the 'if (!IS_ERR(panel))' check in samsung_dsim_host_attach(), t=
he
> next_bridge could be A) a panel bridge created by this driver via
> devm_drm_panel_bridge_add() or B) a pre-existing bridge obtained via
> of_drm_find_and_get_bridge().
>=20
> For case B) we need to put that reference when the next_bridge is removed,
> which is already handled by calling drm_bridge_clear_and_put() in
> samsung_dsim_host_detach() and in the samsung_dsim_host_attach() error
> management code.
>=20
> In case A) we additionally have to remove the panel bridge. Currently it =
is
> created by devm_drm_panel_bridge_add(), which adds two devm actions with
> the refcounted panel bridge:
>=20
>  - drm_bridge_put_void() via devm_drm_bridge_alloc() on panel->dev
>  - devm_drm_panel_bridge_release() via devm_drm_panel_bridge_add_typed()
>    on the consumer device (samsung-dsim)
>=20
> The first action is OK: being tied to panel->dev it will happen when the
> panel is unplugged.
>=20
> The second action is bound to the consumer device, so the devm semantics =
is
> not useful here when introducing hotplug. Indeed we need to drop the
> next_bridge in samsung_dsim_host_detach() anyway, before the driver .remo=
ve
> function, in order to support {add, {attach, detach} x N, remove} hotplug
> event sequences.
>=20
> Thus move to the non-devm drm_panel_bridge_add() along with the matching
> drm_panel_bridge_remove(), so the lifetime of the panel-bridge is tied to
> the host_attach/host_detach cycle and not the whole samsung-dsim device
> lifetime.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> In a previous discussion with Maxime he mentioned a plan to make every
> drm_panel always have a wrapping bridge. With that done, all the code
> handling the panel and adding the panel_bridge would become useless here
> (and in many other places) and could be entirely removed. This patch is a
> temporary solution until that happens. The best pointer I could find to
> that discussion is [0], but there might be more recent material I could n=
ot
> find at the moment.
>=20
> [0] https://lore.kernel.org/lkml/20250218-faithful-white-magpie-da9ac9@ho=
uat/
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 17 ++++++++++++++---
>  include/drm/bridge/samsung-dsim.h     |  2 ++
>  2 files changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 5b799619e07e..2af287221e22 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1951,14 +1951,16 @@ static int samsung_dsim_host_attach(struct mipi_d=
si_host *host,
>  	if (!remote)
>  		return -ENODEV;
> =20
> +	dsi->panel_bridge_added =3D false;
>  	panel =3D of_drm_find_panel(remote);
>  	if (!IS_ERR(panel)) {
> -		next_bridge =3D devm_drm_panel_bridge_add(dev, panel);
> +		next_bridge =3D drm_panel_bridge_add(panel);
>  		if (IS_ERR(next_bridge)) {
>  			ret =3D PTR_ERR(next_bridge);
>  			next_bridge =3D NULL; // Inhibit the cleanup action on an ERR_PTR
>  		} else {
>  			drm_bridge_get(next_bridge);
> +			dsi->panel_bridge_added =3D true;
>  		}
>  	} else {
>  		next_bridge =3D of_drm_find_and_get_bridge(remote);
> @@ -1989,7 +1991,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi=
_host *host,
>  	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
>  		ret =3D samsung_dsim_register_te_irq(dsi, &device->dev);
>  		if (ret)
> -			goto err_remove_bridge;
> +			goto err_remove_panel_bridge;
>  	}
> =20
>  	// The next bridge can be used by host_ops->attach
> @@ -2011,8 +2013,12 @@ static int samsung_dsim_host_attach(struct mipi_ds=
i_host *host,
>  	drm_bridge_clear_and_put(&dsi->bridge.next_bridge);
>  	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO))
>  		samsung_dsim_unregister_te_irq(dsi);
> -err_remove_bridge:
> +err_remove_panel_bridge:
>  	drm_bridge_remove(&dsi->bridge);
> +	if (dsi->panel_bridge_added) {
> +		drm_panel_bridge_remove(next_bridge);
> +		dsi->panel_bridge_added =3D false;
> +	}

This is a pretty big abstraction leak. We don't want to have that in
everything driver. The removal path should be the same for both cases,
and it's not something the driver should take care of.

Maxime

--dxwy3zhqjuxn6deo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaiatOwAKCRAnX84Zoj2+
dlskAYCkDRVrRaOT9QEf6bN7blo5ubgn6P4DjTZC5WS9t6AOTUw/jfbxUc5X8PkB
I7DGQ6gBgI242/+Oks43pPtigXgReHroGkM1vbQpEWoat9coaP3xXJHoSJ5vkNsg
CefYSt/vug==
=UKF1
-----END PGP SIGNATURE-----

--dxwy3zhqjuxn6deo--
