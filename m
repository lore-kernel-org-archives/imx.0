Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91013C4551
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 16:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563647; cv=none; b=c8UkmAhtIFAd+7erj5INcN2EJCBBEtwxeyGBUNIgqEejOyscyp/R7gRX6p4wxNvh4aKY25y2eYzB0nImPf5SYKk7ahaCVjJztXDcB2cJ8F44tQsgg7qr/9RojcDu014PAOsiEmu6Gn5vID6Hoala/R5A/TzoEITsPdZ0pGSWq28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563647; c=relaxed/simple;
	bh=na12D40f4ttfQV+rUysmO9h6nH5lFPFIzcBpbuxMEf8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uebgra4L+HaoEF3uUckWPx1t/V99UEcaFV8KKMxps9bDUFpWXQQIpVMM7DGFapV7+do6IIrnWGfA83QeSLdMrWV9Yr62UAg9MApMu3PMT8sci58F27ID7yiqTO484pW0GLPzSNBXk0vnLoi6qK5QHR6I8dawSJk9NtoaasnoMWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmzVp+RI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmzVp+RI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26491F00A3A;
	Mon, 20 Jul 2026 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784563646;
	bh=JF6x3v05IF6JcSqACDd1Ioo37Y1aQR5NcKaWwtQBaB4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VmzVp+RI15t4zvpJkkWoY9d5TgC9d8RG2zYDlPpM2oK3npFP9nwgV3cXY+pke5mmq
	 vFo+jBvr17XZC09CRsqIaj2HYL30DebOdI7t48fRQQUFtvhdG6nDh24Ty1n+2cRYxM
	 /PyZnH7vNUnhJk0Gndyq94EpLFthhgQKiXWcEi0i2AQHeDzJSG7Dmld5uZGfUuFMQp
	 Du66Ttodx3dFesyvQ9GGRB0rkVaAz4NtLZIqmd4ZJfTYLDOPp+NuPK7XdiSU5awLT5
	 rKOmXx6cKBoL2RMl3f5NDn2TFhpMF8yRvGaMFI0tAURRhEicgYGSwpQpvbQh23OgkV
	 Beycik5fCTH2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/15] Documentation/gpu: remove completed
 drm_simple_encoder_init() todo
Reply-To: sashiko-reviews@lists.linux.dev
To: "Diogo Silva" <diogompaissilva@gmail.com>
Cc: linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com, dri-devel@lists.freedesktop.org, imx@lists.linux.dev
In-Reply-To: <20260720-drm_simple_encoder_init-v2-15-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
 <20260720-drm_simple_encoder_init-v2-15-5020b630668a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 16:07:25 +0000
Message-Id: <20260720160725.F26491F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incomplete refactoring causes build failure in the gma500 driver du=
e to unconverted usages of `drm_simple_encoder_init()`.
--

--- Patch [15]: [PATCH v2 15/15] Documentation/gpu: remove completed drm_si=
mple_encoder_init() todo ---
commit ecefbc42ff1cbd0e228a1785c066cd3cab8deafc
Author: Diogo Silva <diogompaissilva@gmail.com>

Documentation/gpu: remove completed drm_simple_encoder_init() todo

All drm_simple_encoder_init() users have been removed, so drop the
completed todo item.

> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 14cf37590fc7e..b7351467dc74c 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -29,21 +29,6 @@ refactorings already and are an expert in the specific=
 area
>  Subsystem-wide refactorings
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> =20
> -Open-code drm_simple_encoder_init()
> ------------------------------------
> -
> -The helper drm_simple_encoder_init() was supposed to simplify encoder
> -initialization. Instead it only added an intermediate layer between atom=
ic
> -modesetting and the DRM driver.
> -
> -The task here is to remove drm_simple_encoder_init(). Search for a driver

[Severity: Low]
Are there still remaining users of drm_simple_encoder_init() in the tree?

Looking at the gma500 driver, it appears there are several unconverted calls
remaining, such as in drivers/gpu/drm/gma500/cdv_intel_crt.c:

cdv_intel_crt_init() {
    ...
    ret =3D drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
    ...
}

There also seem to be similar calls in cdv_intel_dp.c, cdv_intel_hdmi.c,
cdv_intel_lvds.c, oaktrail_hdmi.c, oaktrail_lvds.c, and psb_intel_lvds.c.

Will this cause a build failure when compiling with CONFIG_DRM_GMA500 if the
underlying function is removed before these are converted?

> -that calls drm_simple_encoder_init() and inline the helper. The driver w=
ill
> -also need its own instance of drm_encoder_funcs.
> -
> -Contact: Thomas Zimmermann, respective driver maintainer
> -
> -Level: Easy
> -
>  Replace struct drm_simple_display_pipe with regular atomic helpers
>  ------------------------------------------------------------------

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-drm_simple=
_encoder_init-v2-0-5020b630668a@gmail.com?part=3D15
