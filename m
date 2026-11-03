Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687905;
	b=qbK4ZOB5/jzYK3BsI/NXlOdP4QQbJp2Xq6pPVT++o/jMRTTolPdRAdM7ukRZVcYympic
	 QMZs1MpcXRXfU/eCmcHMad3WLFRYm+AtlqutaWUr3KHu6biADVND3vnTUfJFfYAce5cYy
	 p8V/jXZLx0NAJSFuQb2qmUgxuOR8GnrldJYDCY0yCbDb/gYfk5/nhJTDgSPVGbu8fOhUR
	 zbr5zWZeKPs6W3ecBvauu01+HvYvlLghb4DqFmkz08Tk0smD8LbCFZ7F2lZh+a0deo7rT
	 K4Xnw0f+h+UBf+DJBL9TtYxKmPSK1ir5Dmn4whH1rEZ+ZNihYn26tC2paUYs1HRKEkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687905;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aaWCfGlD/ElpPzhqwGaseutr4BAEcSt9Xfs6Ov5LsBc=;
	b=KqKlomhT6kio9XHWC9gN/00oIpVAwXMmiOc3dBJi1jdROolLDND4tWOektdOfPOlnN04
	 x/DZrAbXRo4LKCRLXdyyn/LhCSNX2Wa4Tu10nDS2WKlKvAbfG9/T1DBEAu0IMEOF7jQRH
	 rzNFzgNyjlNi4kcrSkXzyanmUGi4wqZKIyqbYci8LgLtQ4Vkqazv9r3RlC5hmB0LDGmme
	 F4IgTIsAzybU5F9rI3szYsANzXniXcb4h2nHnE16696NWv39sajHQMW+6FRIghVX5dGXA
	 HjNSfNPfzsRK5j4UBZ7YnqdQeW+6OQejVuw7Q1EcTWPHepAqwZ05Dyobvwn64wckZRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZpYUNvkn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDC5606A32F;
	Tue,  3 Nov 2026 06:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZpYUNvkn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74DE1F000C1;
	Tue,  3 Nov 2026 06:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793687905;
	bh=aaWCfGlD/ElpPzhqwGaseutr4BAEcSt9Xfs6Ov5LsBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZpYUNvkn5Vw0LjhsklvsD0oN3SIAaEcU/WL/P+hJSpop/t/Ag4VgW3q5t0aQy2/im
	 5+OYfRPxHlu8fvwFCB7Ug18k1AcuYOeKoeEZdJN5dMPTrzibYdNVe+ql/LexOBZrMW
	 H3fTtEdq/37tFudzArAslIlAaOUEYIgff4SZ25FJT7WBh/kg3IiymESOiWU8sxvxY/
	 1hozewicvn9D+uad1sj8N1sFuKnrU3CTEK/91HslcAcDZWwu5d3ULpzF55WVmErORI
	 rdyE5rZPZB2arB7Z54mMUuuvjz5gZ/vN+ibX/qLrpCOIkxAWm5eUnYDSIuYLA2lwHr
	 Vrh4gwvJQLL5w==
Message-ID: <sashiko-outbox-194648@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 07/16] drm/imx: dc-crtc: Disable at boot
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Ying" <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261103-imx8-dc-prefetch-v9-7-3b985e7636e2@nxp.com>
References: <20261103-imx8-dc-prefetch-v9-0-3b985e7636e2@nxp.com>
 <20261103-imx8-dc-prefetch-v9-7-3b985e7636e2@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:38:24 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/imx: dc-crtc: premature clk_axi disable in dc_crtc_disable_a=
t_boot()
--

commit 8bca21cfc221adc6d10d2019ff78d5b2dc5c6e91
Author: Liu Ying <victor.liu@nxp.com>

drm/imx: dc-crtc: Disable at boot

This commit adds a dc_crtc_disable_at_boot() helper and calls it for each
CRTC during driver bind to disable any running CRTCs and balance display
and AXI clock usage counts before registering the DRM device.

> diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc=
-crtc.c
> index 0d64186a99018..5bc952d6883e1 100644
> --- a/drivers/gpu/drm/imx/dc/dc-crtc.c
> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c

[ ... ]

> @@ -331,6 +341,48 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct=
 drm_atomic_commit *state)
>  	spin_unlock_irq(&crtc->dev->event_lock);
>  }
> =20
> +int dc_crtc_disable_at_boot(struct drm_crtc *crtc)
> +{
> +	struct dc_drm_device *dc_drm =3D to_dc_drm_device(crtc->dev);
> +	struct dc_crtc *dc_crtc =3D to_dc_crtc(crtc);
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dc_crtc->de->dev);
> +	if (ret < 0) {
> +		dc_crtc_err(crtc, "failed to get DC display engine RPM: %d\n",
> +			    ret);
> +		goto out1;
> +	}
> +
> +	if (!dc_fg_wait_for_frame_index_moving(dc_crtc->fg)) {
> +		dc_crtc_dbg(crtc, "FrameGen frame index isn't moving\n");
> +		goto out2;
> +	}
> +
> +	dc_crtc_dbg(crtc, "disabling FrameGen at boot\n");
> +	__dc_crtc_disable_fg(crtc);
> +
> +	if (!dc_drv_crtc_is_enabled(dc_drm, drm_crtc_index(crtc)))
> +		goto out2;
> +
> +	dc_crtc_dbg(crtc, "disabling clocks at boot\n");
> +
> +	dc_fg_disable_clock(dc_crtc->fg);
> +
> +	dc_drm->pe_clk_axi_needs_disable =3D true;
> +
> +	dc_drv_set_crtc_disable(dc_drm, drm_crtc_index(crtc));
> +
> +out2:
> +	pm_runtime_put(dc_crtc->de->dev);
> +out1:
> +	/* Let CRTC(with index =3D=3D 1) disablement path disable AXI clock. */
> +	if (dc_drm->pe_clk_axi_needs_disable && drm_crtc_index(crtc) =3D=3D 1)
> +		clk_disable_unprepare(dc_drm->pe->clk_axi);
> +
> +	return ret;
> +}

[Severity: Medium]
As reported by Sashiko on v8 [1], can dc_crtc_disable_at_boot() in
drivers/gpu/drm/imx/dc/dc-crtc.c prematurely disable dc_drm->pe->clk_axi
when disabling CRTC 1 fails?

In dc_drm_bind(), drm_for_each_crtc() invokes dc_crtc_disable_at_boot()
for CRTC 0 and then CRTC 1. When CRTC 0 was active at boot, its call sets
dc_drm->pe_clk_axi_needs_disable =3D true and clears CRTC_ENABLED(0).

When dc_crtc_disable_at_boot() then runs for CRTC 1, if
pm_runtime_resume_and_get(dc_crtc->de->dev) fails and jumps to out1,
CRTC 1's FrameGen has not been stopped and CRTC_ENABLED(1) has not been
cleared. However, at out1, dc_drm->pe_clk_axi_needs_disable is already
true from CRTC 0 and drm_crtc_index(crtc) =3D=3D 1, so
clk_disable_unprepare(dc_drm->pe->clk_axi) is called unconditionally.

If CRTC 1 was also active at boot, wouldn't this gate the Pixel Engine
AXI clock while CRTC 1 is still scanning out from the Pixel Engine, and
leave CRTC_ENABLED(1) set in the general purpose register so that a
subsequent bind retry disables dc_drm->pe->clk_axi a second time?

[1] https://lore.kernel.org/r/20261030-imx8-dc-prefetch-v8-6-c4f81afd4533@n=
xp.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-imx8-dc-pr=
efetch-v9-0-3b985e7636e2@nxp.com?part=3D7
