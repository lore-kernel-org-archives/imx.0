Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB37F370AEC
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188345; cv=none; b=BuOWZaigB3adtqY8tlGql9QzVzP13hFbsjV1kstvAT1JP93pnG49h71laFf0OYuR2Ntj+vzJfx53bp4Yiub8FwmKf95pu1oSjb5jhJV7PCB2Jz8HmHYbb3MsjrSSzLsWkM3FnhAuQWO9y5khVXrht2/Kkv5201Hzt3mhMUKGzG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188345; c=relaxed/simple;
	bh=AWHHn4qjlMwPao9cNgyxj7N5+xJmRUEY4iKJvdHKgx4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u64fMcSpNH5NaYIVQpsgFnv5Q1iiB6fdSYIqLnABouCs5ki3EFES9+y85wHF8uwW555CrJ/WDKmaId/yD3o09XwMXp4h+lJFzFLAzxY0uKUw/eq/rWSJ2x1Peg1TsPFvAg1Ke0I9C+4ao9SfM22sPaXQ7YM1bzamUfUKexGvVKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mI+3jY2D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mI+3jY2D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3688C2BCB3;
	Tue, 19 May 2026 10:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779188345;
	bh=AWHHn4qjlMwPao9cNgyxj7N5+xJmRUEY4iKJvdHKgx4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=mI+3jY2DI38ZyhsC6ZRtPsyrEJ8jSm0NTLyBN0EswDzvKBeyo14VY/mFZRfEpGRhO
	 jmnd6lYSt3DI568W3P1sTTjzWhrfMdfx2PVH6hdgv2KQvB38kxi210RlU/Rwb0iEhN
	 7lESm33E/wLIYi9qqKWZlhUy4BUzfNPkN93u0nWTr6G9158YuufnEtroWVinH2phbe
	 RQ58ZRXW6MrZhiBMsQnNKEjWvViXdWvKMU1w8DiFQtmuYDnEqnFqOkWuXU6X7ObPkV
	 GJjMK0YBzUQ1Z2gefqXfGkZVRn9pV6QLcyfPS2O4nIkYFHooNlzUuYJX4z3Eu1EJ9+
	 Gv7SHOoCw+1Nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 30/37] drm/bridge: add drm_bridge_is_tail() to know
 whether a bridge completes the pipeline
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519-drm-bridge-hotplug-v1-30-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-30-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 10:59:04 +0000
Message-Id: <20260519105904.C3688C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm_bridge_is_tail() emits a kernel warning and defaults to false =
for bridges omitting the optional .is_tail callback.
--

commit 285e9eabd414f7b37079e41dd2875f7b3e588911
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: add drm_bridge_is_tail() to know whether a bridge completes the=
 pipeline

This commit introduces drm_bridge_is_tail() and an .is_tail callback to
determine if a bridge completes the display pipeline. This is useful for
handling bridge hotplug scenarios where a pipeline might initially be
incomplete.

> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 62413fff35fcb..10af107823902 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
[ ... ]
> @@ -646,6 +646,34 @@ void drm_bridge_detach(struct drm_bridge *bridge)
[ ... ]
> +bool drm_bridge_is_tail(struct drm_bridge *bridge)
> +{
> +	if (!(bridge->ops & DRM_BRIDGE_OP_IS_TAIL)) {
> +		drm_warn_once(bridge->dev, "is_tail func not implemented by bridge %ps=
!",
> +			      bridge->funcs);
> +		return false;
> +	}
> +
> +	return bridge->funcs->is_tail(bridge);
> +}
> +EXPORT_SYMBOL(drm_bridge_is_tail);

Will developers writing non-hot-pluggable bridges trigger spurious kernel
warnings at runtime here if they follow the documentation and omit this
callback?

Additionally, returning false when the callback is omitted means that legacy
static tail bridges that haven't been updated will be seen as needing a next
bridge. Could this result in display initialization failures for existing
drivers across the kernel?

> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index fdac9a526f387..0547d5010b080 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
[ ... ]
> @@ -78,6 +78,19 @@ struct drm_bridge_funcs {
[ ... ]
> +	/**
> +	 * @is_tail:
> +	 *
> +	 * Returns true if this is a tail bridge, i.e. it does not need a
> +	 * next bridge to work. E.g. a panel_bridge is a tail bridge, a
> +	 * DSI-to-LVDS bridge is not a tail bridge (no matter whether the
> +	 * next bridge is present or not).
> +	 *
> +	 * The @is_tail callback is optional but it is required if the
> +	 * bridge is part of a pipeline with hot-pluggable components.
> +	 */
> +	bool (*is_tail)(struct drm_bridge *bridge);

Since this documentation explicitly states the callback is optional for bri=
dges
that aren't part of a hot-pluggable pipeline, is it safe for
drm_bridge_is_tail() to default to false and warn when it is omitted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D30
