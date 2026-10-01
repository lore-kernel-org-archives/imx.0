Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0F03C0A04
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860847; cv=none; b=suvZ5g8GauYUJOzFPBE3N/eQsOE+5W3WKNv54p8oyxEHB2ejhuMi/G+n41UJe4HwwE+hOThK/OzCCItmoALOEKG93CebMkwGTAxoI4M7MxfFjhFUr/AQb0Wxe8dWT3wskEngCriPs2l/u2QhcOfh5xA6IVDH9bEvm5QrJzVhQy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860847; c=relaxed/simple;
	bh=pIAafztl5UeCTDlJ+tynegxUBG2uCZh7Zu3ltrt5bzU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hw//HHlaTvN8zi5OAkALaGeohP+Sg5XhoOB7z3Wa+dtvyv5i9wMB/R3Ktl9MCw8X8Ol5l7XYpqoZchj0nWUZAEVV5tpaCHjCIXDFUJaPv4GE7h+Hw74oqoDh89MzlnG5UwvJlWM3iX1JrMk4pg9QTxF+oJRh3x1iEYRzt492M9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KarDmcX0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KarDmcX0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A2C51F000FF;
	Thu,  1 Oct 2026 13:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790860845;
	bh=Ix4sdki6oL8m7b+Fgxal19OG4zKC9Zat0nSmdfuifGI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KarDmcX01yDPYS458qHjGaVKK3s7Wk26qq1nrEdvKHvJGWEobAIbNmZsGhIdtF1Bv
	 Ntt8YGheFfbo8Od99DLTRqcjC3sFABr2G7CmN4hAdMKRvtLAZqzw+n2N6nHe9idCu5
	 vCdE1ZAPNcwRgRoxgiy+wiNbXUkNuJIB03ANFLE4Z/lP9AEkKawePt5kDLZ8A1iW6i
	 +JWu78TXbvsinfUy4O8VxT7RKHsdO/BWBgRG04f+224pCWA5xR/Nukg3gk+R76nzld
	 PSBPZKaWNomdj44eNWHFwZXdo8jI0Y59dDgEBVNcWczUnA6QpbmSUXk9QU93uANl1W
	 vdvRsAyB7BPVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 17/24] drm/bridge: add drm_bridge_get_next() and
 supporting func
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20261001-drm-bridge-hotplug-v2-17-8e34986dcb68@bootlin.com>
References: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
 <20261001-drm-bridge-hotplug-v2-17-8e34986dcb68@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:20:45 +0000
Message-Id: <20261001132045.7A2C51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Low] doc: get_next_bridge incorrectly specifies PTR_ERR instead of ERR_P=
TR
- [Low] kernel-doc: mismatch in enum drm_bridge_ops documentation for DRM_B=
RIDGE_OP_GET_NEXT_BRIDGE
- [Low] kernel-doc: missing @bridge parameter description in drm_bridge_get=
_next()
- [Low] typo: spelling errors in commit message and documentation
--

commit 3521ec7ceaf6e88e9c48a699f2fdf587e7cc4f93
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: add drm_bridge_get_next() and supporting func

For bridge hotplug we need to successfully probe a card with an incomplete
bridge chain, i.e. a chain whose last bridge currently in bridge_chain
needs another bridge at its output. Such a card would have no connector,
and be able to add one as soon as the followong bridges are added up to the
bridge that requires no further ones (like a panel or a connector_bridge).

So we need a way to know whether the pipeline is complete in the hardware
(all bridges probed)), in order to complete it in software (attach all
bridges not yet attached). Currently common DRM code has no way to know
that.

Add drm_bridge_get_next() and a supporting get_next_bridge func so each
bridge can expose its next bridge, and whether there's supposed to be one.

A subsequent commit will use this function to detect whether the pipeline
is complete in the hardware or not.

Link: https://lore.kernel.org/r/20260624-vagabond-neon-gorilla-cd6487@houat

> For bridge hotplug we need to successfully probe a card with an incomplete
> bridge chain, i.e. a chain whose last bridge currently in bridge_chain
> needs another bridge at its output. Such a card would have no connector,
> and be able to add one as soon as the followong bridges are added up to t=
he

[Severity: Low]
This isn't a bug, but there's a typo ("followong") in the commit message.

> bridge that requires no further ones (like a panel or a connector_bridge).
>=20
> So we need a way to know whether the pipeline is complete in the hardware
> (all bridges probed)), in order to complete it in software (attach all

[Severity: Low]
This isn't a bug, but there's a typo ("probed))") in the commit message.

> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c84129100d20a..97a142ef0348e 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -706,6 +706,34 @@ void drm_bridge_detach(struct drm_bridge *bridge)
>  	drm_bridge_put(bridge);
>  }
> =20
> +/**
> + * drm_bridge_get_next - return the bridge at this bridge's output port
> + *
> + * Return the next bridge, i.e. the bridge that is connected at the outp=
ut
> + * port of @bridge. The next bridge might or not be in the encoder chain.
> + *

[Severity: Low]
Could we add a description for the @bridge parameter in this kernel-doc
block? Omitting it causes a warning when building kernel documentation.

> + * Returns:
> + * * Pointer to a bridge connected to the output port of this bridge,
> + *   with refcount incremented; call drm_bridge_put() when done
> + * * ERR_PTR(-ENODEV): this bridge has an output port where a next bridge
> + *                     needs to be present for video output, but the next
> + *                     bridge is not currently available
> + * * NULL: this bridge does not have an output port where a next bridge
> + *         is expected
> + * * ERR_PTR(-ENOENT): the bridge does not implement the func
> + * * Another negative error returned by the bridge func
> + */
> +struct drm_bridge *drm_bridge_get_next(struct drm_bridge *bridge)

[ ... ]

> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 1981d24a700d2..f020e0c2a2684 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -62,6 +62,26 @@ enum drm_bridge_attach_flags {
>   * struct drm_bridge_funcs - drm_bridge control functions
>   */
>  struct drm_bridge_funcs {
> +	/**
> +	 * @get_next_bridge:
> +	 *
> +	 * Return a pointer to the bridge connected at the output port of
> +	 * this bridge.
> +	 *
> +	 * Returns:
> +	 * * Pointer to a bridge connected to the output port of this bridge,
> +	 *   with refcount incremented; call drm_bridge_put() when done
> +	 * * PTR_ERR(-ENODEV): this bridge has an output port where a next

[Severity: Low]
Does this documentation incorrectly specify PTR_ERR instead of ERR_PTR?
Following this kernel-doc would result in returning an integer as a pointer,
causing compilation errors.

> +	 *                     bridge needs to be present for video output,
> +	 *                     but the nextbridge is not currently

[Severity: Low]
This isn't a bug, but there's a typo ("nextbridge") here.

> +	 *                     available
> +	 * * NULL: this bridge does not have an output port where a next
> +	 *         bridge
> +	 *         is expected
> +	 * * Another negative error returned by the bridge func
> +	 */
> +	struct drm_bridge *(*get_next_bridge)(struct drm_bridge *bridge);
> +

[ ... ]

> @@ -1021,6 +1041,11 @@ enum drm_bridge_ops {
>  	 * &drm_bridge_funcs->hdmi_clear_spd_infoframe callbacks.
>  	 */
>  	DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME =3D BIT(10),
> +	/**
> +	 * @DRM_BRIDGE_GET_NEXT_BRIDGE: The bridge implements the

[Severity: Low]
Does this documented name mismatch the actual enum value
DRM_BRIDGE_OP_GET_NEXT_BRIDGE? This mismatch causes an unresolved reference
during kernel-doc generation.

> +	 * &drm_bridge_funcs->get_next_bridge callback.
> +	 */
> +	DRM_BRIDGE_OP_GET_NEXT_BRIDGE =3D BIT(11),
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-drm-bridge=
-hotplug-v2-0-8e34986dcb68@bootlin.com?part=3D17
