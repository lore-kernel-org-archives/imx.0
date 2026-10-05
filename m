Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBC44746A6;
	Mon,  5 Oct 2026 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194986; cv=none; b=ISzTem+QWZDmJFlYwH6VkqdwvgfGIiE7ZsDvHJYKUv56HMkgxOPsHKrcxNlDuKURPhV4kVFok1Mvdo98xY8s1iyNC4YOjtbUNrWnPrvHaxkcZD4+KGfpJE0WmXGY4ududkRHe2ABJnvBCPFCevf1Y/qvF2YM5cnPmCYnwTufIrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194986; c=relaxed/simple;
	bh=9LuZcUmKFaW6b6u44pbfIklLepyRhBueefukwEOyVpg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nTPKsN1fPX56So7J6SxEAfbKC0DgGAIgWWP03MVVBPa6T9jBmJieu6jGSK5+SUXUz7FzoeNK5vOyZsE+JNyjLRrbyfDAgU1VAjaFpGAhkQigV3NbOCwVWvAvAVa0Ccesg3S1uTQCFV+SJDShJxTjqfSG3uFFrj9UHinbHHDKbRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8mAqxtF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8mAqxtF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2711F000FF;
	Mon,  5 Oct 2026 10:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791194983;
	bh=2YGeHChBvhA7K0WyoAvKXjOIqWOaj+obKZ1/E9sHY2c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N8mAqxtFYgraiFyK3Bw+4l/xGnKh+ZOeHrqFwo1CYS1MKIJ19XNilQJlR6Jz2Rpu4
	 WFGsMyNuEzSFJc5PAu2RmV4RdGz6BV5wrzxZFrH6+iIqsexDAHZY6ZNTb7QMpS8PlE
	 lon7nEUwXOOOF+ZFO/wh02qYK+LBhBwLZwaC5gWU3vco8hfkoqEN46fLoO3CnMbN7/
	 sEvKcK0leDhFnF1IBU9lX8vvXC8LxrjfTeclpkH42vJUl1tTQAssJ8cOs37lwDL9jg
	 bAT+PdCUUDIEiVWDwdMobB2zBP0ytMQW7OKKZmDia2yJ/fFIoqxhykCQqBPOU95YcD
	 Her2N4fk2GQKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] drm/bridge: Add THine THC63LVD827 LVDS encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Francesco Dolcini" <francesco@dolcini.it>
Cc: robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org
In-Reply-To: <20261005095006.20290-3-francesco@dolcini.it>
References: <20261005095006.20290-1-francesco@dolcini.it>
 <20261005095006.20290-3-francesco@dolcini.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 10:09:42 +0000
Message-Id: <20261005100943.1A2711F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/bridge: back-powering via GPIOs on unpowered chip
--

commit b3195cf0e052ea83d4890e15599f3b4469d3b2e4
Author: Francesco Dolcini <francesco.dolcini@toradex.com>

drm/bridge: Add THine THC63LVD827 LVDS encoder

This commit introduces a new DRM bridge driver for the THine THC63LVD827 DPI
to LVDS bridge. The driver provides support for configuring the LVDS data
mapping, GPIO-based control pins, and regulator power supplies.

> diff --git a/drivers/gpu/drm/bridge/thc63lvd827.c b/drivers/gpu/drm/bridg=
e/thc63lvd827.c
> new file mode 100644
> index 0000000000000..02b97d1cc71ea
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/thc63lvd827.c
[ ... ]
> +static void thc63lvd827_atomic_post_disable(struct drm_bridge *bridge,
> +					    struct drm_atomic_commit *state)
> +{
> +	struct thc63lvd827 *thc63lvd827 =3D bridge_to_thc63lvd827(bridge);
> +	int ret;
> +
> +	gpiod_set_value_cansleep(thc63lvd827->pd_gpio, 1);
> +
> +	ret =3D regulator_bulk_disable(ARRAY_SIZE(thc63lvd827_supplies),
> +				     thc63lvd827->supplies);

[Severity: Medium]
Does this sequence leave the chip exposed to back-powering?

The regulators are disabled here, cutting power to the chip, but the driver
does not reset the b6b8, map, or mode GPIOs to a safe physical low state fi=
rst.
These pins remain driven in their previously asserted physical HIGH states,
causing continuous back-powering while the display is disabled.

Hardware back-powering causes leakage current through ESD diodes into the
unpowered chip's VDD net, which can lead to latch-up, increased power
consumption during suspend, or improper power-on reset sequencing.

[ ... ]
> +static int thc63lvd827_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	thc63lvd827->map_gpio =3D devm_gpiod_get_optional(dev, "map", GPIOD_OUT=
_LOW);
> +	if (IS_ERR(thc63lvd827->map_gpio))
> +		return dev_err_probe(dev, PTR_ERR(thc63lvd827->map_gpio),
> +				     "failed to get MAP GPIO\n");
> +
> +	thc63lvd827->mode_gpio =3D devm_gpiod_get_optional(dev, "mode", GPIOD_O=
UT_HIGH);

[Severity: Medium]
Will this initialization also cause back-powering via GPIOs on the unpowered
chip?

This configures the mode GPIO to be driven logically HIGH in
thc63lvd827_probe(). Since the chip's regulators are not enabled until late=
r in
thc63lvd827_atomic_pre_enable(), this immediately sources voltage into the
unpowered IC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005095006.2029=
0-1-francesco@dolcini.it?part=3D2
