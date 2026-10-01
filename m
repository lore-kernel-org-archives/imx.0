Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850514A5C23
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 13:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861252; cv=none; b=MFqlBZCN25G/5pfPqlOTN1mNqhd5gN6cqorWdXY7ZnRsT85SEpSy1USTpoMnDgf9Jl/1m+JO2l4K81iQ8SyeOEnleHli9VCM+axyRWR2Y2jg9VQ8jyk9D09qe157f7gk+5gCBJHX4gZdtAvks2cP9sOdtYpbdUF4UALQJEohbL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861252; c=relaxed/simple;
	bh=18g9UKNPiR7gaYHeO/IYtQ29ORdmVVO0Q9qSgSmBXoE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qsw84D4uo32MZIG6kZkn2XLaU37glHd3dRaMdJRRMcXmmoGUtZ7dEwh4X92tfosK0NutbDt4oCDcuru4MwPlPymOjJxr1tVzvJagOg6Ayp6ohWANBcqhXnZ5is5df7lP6gppVfttrkkA475L7R6NV6yE9cQvxkLzJBRwFNHFovc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pa9BcazJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pa9BcazJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E711F000FF;
	Thu,  1 Oct 2026 13:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790861251;
	bh=g9il4cbwoU1fhJmz9TvaRAyVPdF5h2lFWl/R+mRFJAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pa9BcazJTWJmftG6IFaA7HKuis0U8BnQh5oMqhQuUtWhgbUaYuXoQzjHd8mNWjvQG
	 fHPbI75p4FWHavlxJgiX53BxqFMB0AUil5G9JS0jOezhDwOlTnv/7bKBzxj91BQSPW
	 PcTM1vqobcDUh4UNdbDMItKpNccquURf5+jZCs6WTK//TgUF+3zviL+CmSsJFNWDrA
	 zzBJav3OGO/nXDQjz1UMucN2DfkRUdk9AhHjOOHqg3YM2kner5wrN95W7C0bR5R1HP
	 LvpLzO53USxi5TdtUvIShRoIPmGPUphY5+loSEEK1V09DrVEE3iAYWXZmEl6L5SKib
	 HiLoW4cF3lqkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 22/24] drm/bridge: samsung-dsim: implement
 .get_next_bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20261001-drm-bridge-hotplug-v2-22-8e34986dcb68@bootlin.com>
References: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
 <20261001-drm-bridge-hotplug-v2-22-8e34986dcb68@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:27:30 +0000
Message-Id: <20261001132730.D9E711F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/bridge: UAF in samsung_dsim_get_next_bridge() due to missing r=
efcount increment
--

commit ff84bc6df44d9112a31ddd636aeba9815e9fc90e
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: samsung-dsim: implement .get_next_bridge

This commit adds a get_next_callback function to expose the next bridge in =
the
samsung-dsim driver.

> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index b2de447dc6f43..de64d036b89bf 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1821,6 +1821,13 @@ static void samsung_dsim_mode_set(struct drm_bridg=
e *bridge,
>  	drm_mode_copy(&dsi->mode, adjusted_mode);
>  }
> =20
> +static struct drm_bridge *samsung_dsim_get_next_bridge(struct drm_bridge=
 *bridge)
> +{
> +	struct samsung_dsim *dsi =3D bridge_to_dsi(bridge);
> +
> +	return dsi->bridge.next_bridge ?: ERR_PTR(-ENODEV);

[Severity: High]
Does samsung_dsim_get_next_bridge() in drivers/gpu/drm/bridge/samsung-dsim.c
need to increment the reference count of the returned bridge?

The DRM core API drm_bridge_funcs.get_next_bridge mandates that the returned
bridge pointer must have its reference count incremented (for example via
drm_bridge_get()), as the caller is expected to call drm_bridge_put() when
done.

By returning dsi->bridge.next_bridge directly without taking a new referenc=
e,
when callers (such as drm_hotplug_helper_pipeline_is_complete() introduced
later in this series) use drm_bridge_get_next() and automatically drop the
reference using __free(drm_bridge_put), they will drop the reference
originally owned by the samsung_dsim struct.

Later, when the driver tears down and tries to release its own reference via
drm_bridge_clear_and_put(), could this trigger a double-put or
use-after-free condition?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-drm-bridge=
-hotplug-v2-0-8e34986dcb68@bootlin.com?part=3D22
