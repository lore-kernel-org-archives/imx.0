Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354877;
	b=Dmy56bMQoVV+scL0xy6oqifuqC5mG+eoqsKEMMbh8HzDqWEXDuAp/LfWyBfJHw1lFgpQ
	 rXfGQ+1WGt6fmXRo3xPihNE0AgadKzMbp0OjkaXLMU5LAtmrr8JxYPboZL90OWaXnd5I2
	 LK41Kh4pB4sPx09esxon/o4M4AW3IQuueMOp88v9usQb+psChR1+vN20XedrM5o9oe3MT
	 7eQa6aGDx7jnzbM0fkuJpJVZX5T6fJ+cg2ksR2+EevqL7PNAE1Qhaoq4UA5EGIwgsw9mA
	 BZEJV9Z3mkhpHJsgr2KTeeCC9rAh/Vv62Ul5G2ry9mS9ZuEForFSvclkVENsJQUbiNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354877;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RRGG+nMF/kpQZTAaIuH7K29ONaEy1fhm7c9ASdHRyMg=;
	b=u3JN71uLxVXLUBGxV2p6i9dXy3jP+ciutABDhDBwhmqFR2+CNLvigo/Uadc///mHbBE5
	 mlIkcOazlOJPXMeLLKMfrKvTX8pdtMcQF6HbtMrmUI/Dq4gG1vtfNOeltikoONAN4RMoR
	 Si4RSKkv7/GbeefjpBOLygHESQ8fNxnaNUv6BuGttPF9aCo38qnH052LCp4HLySOBVe1D
	 kAayefl0449kZOrhakTHBzSII9zzjXN4aRNC6IrnDyFERbKug9z1nXc5LBltbd7SLolsi
	 Pz6ZMs0UxY4H3l0gF3hzzmokdmNTeSM3oTip7kDq6462QLPziksIbogB1u5cJG1OE3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k6eGCPHe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CD7606A31D;
	Fri, 30 Oct 2026 10:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k6eGCPHe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDB81F000C1;
	Fri, 30 Oct 2026 10:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793354876;
	bh=RRGG+nMF/kpQZTAaIuH7K29ONaEy1fhm7c9ASdHRyMg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k6eGCPHeYHUCC1GhjR6+/Skkub2YCoSEnGxiJEqCZAcHOctyckOPrDjBriTfVDwog
	 zN9rtOsWiATwu0l5KvrEgcoZYyPwJlPE36k1656y/ON3H3i+xYeTZZNEcSx0JRsna2
	 Pl2gN0X9CT5XclBIYOwDtJL2LotSIOQpQ20ybhLQ4kbO9JE1yxde2AyOpYDIzBmTPr
	 km4a3ks2/J7ztnvedEfP+V/ZIkKVUdQi2LaNT4DEHKnbpmobEwty1oSrRLTHAkJTEP
	 xJivHwhXm4yV2zmYHCcAgkJInvYaWcJkoRfLgag4n4a7R02IsJrY1MAqcq0YZjgstD
	 jT0rJIz/k30qQ==
Message-ID: <sashiko-outbox-190808@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 05/15] drm/imx: dc: Flag CRTC status in
 GERNERALPURPOSE register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Ying" <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261030-imx8-dc-prefetch-v8-5-c4f81afd4533@nxp.com>
References: <20261030-imx8-dc-prefetch-v8-0-c4f81afd4533@nxp.com>
 <20261030-imx8-dc-prefetch-v8-5-c4f81afd4533@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 10:07:55 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] drm/imx: dc: missing max_register_is_0 in dc_gp_regmap_config
- [Low] drm/imx: dc: commit message uses stale helper names and register ty=
po
--

commit 376ae6ee1d9ffb7f4790013466f30007db36afe6
Author: Liu Ying <victor.liu@nxp.com>

drm/imx: dc: Flag CRTC status in GERNERALPURPOSE register

This commit maps the Display Controller's GENERALPURPOSE register via an MM=
IO
regmap and adds helpers to set, clear, and query the CRTC enablement status=
 in
its 2 LSB bits.

>     drm/imx: dc: Flag CRTC status in GERNERALPURPOSE register
>    =20
>     Map Display Controller's register GERNERALPURPOSE at offset 0x100 and
>     create an MMIO regmap to access the register.  Create helpers
>     dc_drv_flag_crtc_{enable,disable}() with the 2 LSB bits in the regist=
er
>     to flag the CRTC enablement/disablement status.  Also, create a helper
>     dc_drv_crtc_was_enabled() so that the CRTC driver can use it to check
>     if the CRTC was enabled by a previous boot or not.  This is a prepara=
tion
>     for an upcoming patch to disable display controller at boot if the CR=
TC
>     was enabled by the driver during a previous boot instead of a bootloa=
der.
>    =20
>     Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
>     Signed-off-by: Liu Ying <victor.liu@nxp.com>

[Severity: Low]
This isn't a bug in the code, but should the commit message be updated to
match the current symbol names?

In drivers/gpu/drm/imx/dc/dc-drv.c and drivers/gpu/drm/imx/dc/dc-drv.h, the
helpers are named dc_drv_set_crtc_enable(), dc_drv_set_crtc_disable(), and
dc_drv_crtc_is_enabled(), rather than dc_drv_flag_crtc_{enable,disable}() a=
nd
dc_drv_crtc_was_enabled().

Also, the commit subject and body spell the register name as GERNERALPURPOS=
E,
whereas the macro in drivers/gpu/drm/imx/dc/dc-drv.c is defined as
GENERALPURPOSE.

> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-=
drv.c
> index 13795a2ad7350..9629beaed43c1 100644
> --- a/drivers/gpu/drm/imx/dc/dc-drv.c
> +++ b/drivers/gpu/drm/imx/dc/dc-drv.c
> @@ -13,6 +13,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> =20
>  #include <drm/clients/drm_client_setup.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -28,9 +29,21 @@
>  #include "dc-drv.h"
>  #include "dc-pe.h"
> =20
> +/* General Purpose register offset used to flag driver usage. */
> +#define GENERALPURPOSE		0x100
> +#define  CRTC_ENABLED(x)	BIT(x)
> +
>  struct dc_priv {
>  	struct drm_device *drm;
>  	struct clk *clk_cfg;
> +	struct regmap *gp_regmap;
> +};
> +
> +static const struct regmap_config dc_gp_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.val_bits =3D 32,
> +	.max_register =3D 0,
> +};

[Severity: Low]
Should dc_gp_regmap_config also set .max_register_is_0 =3D true here?

In dc_probe(), only a 4-byte MMIO region at r->start + GENERALPURPOSE is
mapped and passed to devm_regmap_init_mmio() for priv->gp_regmap, so offset=
 0
is the only valid register.

In __regmap_init(), map->max_register_is_set is initialized as:

    map->max_register_is_set =3D map->max_register ?: config->max_register_=
is_0;

Without .max_register_is_0 =3D true, regmap treats a zero .max_register as
unspecified and leaves map->max_register_is_set false, so regmap_writeable()
and regmap_readable() do not enforce the offset 0 bound.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-imx8-dc-pr=
efetch-v8-0-c4f81afd4533@nxp.com?part=3D5
