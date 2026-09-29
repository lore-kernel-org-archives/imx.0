Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A3C52CCD9
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690080; cv=none; b=BqZfDps7OBqCQ1sF3sw6u5Std2plFf8oCl26RAxOcyrJ3/z+LOwcUiLKaKg9+QQrGWEQQWx5qulPi1Bavr9Re2Bj0L7AXtW8mPsTNayhj6XJZZT8tfxiwlv1DmfQ+17/YEqwPD8F2JyN14531sWxQ1mwOMI4jC6DOFZjilMmop4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690080; c=relaxed/simple;
	bh=wHOsyfpQyHe4xVn8W8V8CpD3mj7JLdLTSfgGZrndRXo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H4tw346lRx6qQW82MK7TfAtHGB8Xd3mA8A50q/SyTQLAHWxgORtFobZzjSe3Xdt4P0nKEesEbNBw/wma5I4A/vfM3bxbr/tvhHIXhyLTK+LXFcb3CGFWDNssHyy/ctlwT4zUBnpX/wkmrtABP6DJ/4bysikNZ7ZM7PFKgTr96mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6jMg8Yu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6jMg8Yu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6B21F000FF;
	Tue, 29 Sep 2026 13:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790690071;
	bh=VKPVzKnYqo0bbVCgvn/jt9QsuxNgYAd7D2WGX2Kb188=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H6jMg8YumCyAZJjIBscffb/PQgVk7SeVKy1z9xpBVt66an2NP2FWP0d5a4+rfsawr
	 8nHU+h9GaNO3Xv2JXLlpdKScNnbD14wR8Bd1Fxt7p802WsOfDCT/or9k3YmRvHUK12
	 JS38rkhhntGg+UihK6nEyiv5Wpf1lq9j2h3t3ED1ACmQE4qXRs3I3g1epqO+hib+Xu
	 AU70lfNsUXYtkJv9hEPgcKkUNnToVeY/vFriB0Rd4E+TZplX3R5xwpOHStU3+8keLT
	 VfEIDcS+V+PfFfNZrbF57DrmS5C5+d1t8n/6D8va6KgjZ3fg+D+oJ1w7fbyU/we8vH
	 /t+SS7uJqKDxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] drm/vc4: dsi: stop using deprecated
 drmm_of_get_bridge()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v2-6-6da431d8f180@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
 <20260929-drm-fix-of_get_bridge-build-regression-v2-6-6da431d8f180@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 13:54:31 +0000
Message-Id: <20260929135431.6B6B21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/vc4: bridge reference leak on component bind failure or rebi=
nd
--

commit 583ab26f73be63066db6ca20da5c1de3ee1767ef
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/vc4: dsi: stop using deprecated drmm_of_get_bridge()

This commit replaces the deprecated drmm_of_get_bridge() with
of_drm_get_bridge_by_endpoint() to acquire the DRM bridge. It assigns the
returned refcounted bridge to dsi->bridge.next_bridge to rely on automatic
cleanup upon destruction.

> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 0148f2befed14..30598738cfcf3 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c

[ ... ]

> @@ -1749,9 +1747,9 @@ static int vc4_dsi_bind(struct device *dev, struct =
device *master, void *data)
>  		return ret;
>  	}
> =20
> -	dsi->out_bridge =3D drmm_of_get_bridge(drm, dev->of_node, 0, 0);
> -	if (IS_ERR(dsi->out_bridge))
> -		return PTR_ERR(dsi->out_bridge);
> +	dsi->bridge.next_bridge =3D of_drm_get_bridge_by_endpoint(dev->of_node,=
 0, 0);
> +	if (IS_ERR(dsi->bridge.next_bridge))
> +		return PTR_ERR(dsi->bridge.next_bridge);
> =20
>  	/* The esc clock rate is supposed to always be 100Mhz. */
>  	ret =3D clk_set_rate(dsi->escape_clock, 100 * 1000000);

[Severity: Medium]
Does this code leak the bridge reference if vc4_dsi_bind() fails here or in
subsequent initialization steps?

Since of_drm_get_bridge_by_endpoint() returns a refcounted pointer (unlike
the previous devm-managed drmm_of_get_bridge()), if clk_set_rate() fails
just below this hunk, the function returns without putting the newly
acquired reference.

If the aggregate DRM device defers probe and retries binding components,
vc4_dsi_bind() could run again, overwriting dsi->bridge.next_bridge and
permanently leaking the previous reference. The automatic cleanup of
next_bridge only happens when dsi->bridge is destroyed, which does not
occur during component bind failures or component unbinds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-drm-fix-of=
_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com?part=3D6
