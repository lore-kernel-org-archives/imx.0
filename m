Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914E13DAAA8;
	Fri,  4 Sep 2026 08:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509442; cv=none; b=EAXbUcSYfMZraXObV8x1fwKHPF/1iJ3Kca6i10sjOv+XIqfLrhWvUlnpUugu1ZWVMh9HNCNO4xd5m4nJDhSC/E33rd5RgcZnf4m7gwFvON0K9gBjndplZl8xkrWN9k7n/j2hEZrdRKOwbbGzjxe7iK97jxbx6t8dA/URRRbKMKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509442; c=relaxed/simple;
	bh=ddptqAN33Ni9Obe1Esl6mAkB5ldWmuoP/LZYLJSMybw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=txliJZ72j+KXyyiKeVRz6ckMgz31z7EvfQmwwb4Nt8HB2qKPkBO2XPygs2td/q9FbH+7hlb951n2oNyc4BV768ZOM/LS0U7dmD5B2Nq/qxmB71VRTPVmPcEHSaArhEk3YOXhAqHvAecBUmJkdRVD7KOmMmldN/ck++0Rejpr5uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YegZH04P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YegZH04P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5CB61F00A3D;
	Fri,  4 Sep 2026 08:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788509440;
	bh=v6So+YAu3PDCWV3EJyMayPvQrnCFceKJSob9IyJGxdg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YegZH04PZB2PahZybmr/knHEaHrwXD+CCOC9Il3IdBd5uZaNs0phVgi3pwUB11KgH
	 jh7iMbvGvKoTdxaYgGAg7mEBNaod+wQmaB/lF7D9OvxG6zkZFxV5NCpQkP+SAHy0eA
	 lImqtjMdaXSvvuAIXxFfjtIToEtAnUy7jNTQHaxVZe1PIR5S0WGTkygEgG/b9zPle6
	 viiO7iYTsrsEdQji7n/E4fm+oONGiUoYu/ExOvUKDJD8euoyycQx+K6QEbMSHBvNwd
	 X6RlE979u1gzqv53qxMRZUnKojY1mNUF33vqoUfVwuL/dz73JfgrPwZ9n33Q3ziMG1
	 nix61ArLGUSwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/13] drm/imx: dc-crtc: Disable at boot
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Ying" <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260904-imx8-dc-prefetch-v6-4-26643e3f6cb7@nxp.com>
References: <20260904-imx8-dc-prefetch-v6-0-26643e3f6cb7@nxp.com>
 <20260904-imx8-dc-prefetch-v6-4-26643e3f6cb7@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 08:10:39 +0000
Message-Id: <20260904081039.D5CB61F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Manually disabling the Pixel Engine AXI clock in dc_crtc_disable_a=
t_boot() bypasses Runtime PM, causing hardware hangs on the next CRTC enabl=
e due to mismatched states.
- [Medium] Unconditional clk_disable_unprepare() causes CCF underflow warni=
ngs on clean boot.

Pre-existing issues:
- [High] __dc_crtc_disable_fg waits for a completion without calling reinit=
_completion() first.
--

commit 9e8abe6497b6dd773b877a4459824b20ea22a927
Author: Liu Ying <victor.liu@nxp.com>
Subject: drm/imx: dc-crtc: Disable at boot

This commit adds a helper dc_crtc_disable_at_boot() which is called before=
=20
advertising the DRM device to user-space. This addresses an imbalance in=20
the Pixel Engine AXI clock and pixel clock use counts caused when CRTCs=20
continue running after the DRM device is unplugged.

> diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc=
-crtc.c
> index 764510ff90a4a..71694f1244e17 100644
> --- a/drivers/gpu/drm/imx/dc/dc-crtc.c
> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c

[ ... ]

> @@ -293,6 +293,16 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct =
drm_atomic_commit *state)
>  	dc_crtc_queue_state_event(new_crtc_state);
>  }
> =20
> +static inline void __dc_crtc_disable_fg(struct drm_crtc *crtc)
> +{
> +	struct dc_crtc *dc_crtc =3D to_dc_crtc(crtc);
> +
> +	enable_irq(dc_crtc->irq_dec_seqcomplete);
> +	dc_fg_disable(dc_crtc->fg);
> +	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);

[Severity: High]
This is a pre-existing issue, but does this wait for completion need a call
to reinit_completion() first?

If a previous wait timed out but the hardware eventually signaled the
completion, the done counter remains greater than 0. Subsequent calls to
wait_for_completion_timeout() will return immediately instead of waiting
for the hardware, which could lead to premature disablement of hardware
clocks while the hardware is still processing the sequence.

> +	disable_irq(dc_crtc->irq_dec_seqcomplete);
> +}
> +

[ ... ]

> @@ -331,6 +337,37 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct=
 drm_atomic_commit *state)
>  	spin_unlock_irq(&crtc->dev->event_lock);
>  }
> =20
> +void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
> +{

[ ... ]

> +	dc_crtc_dbg(crtc, "disabling at boot\n");
> +	__dc_crtc_disable_fg(crtc);
> +	dc_fg_disable_clock(dc_crtc->fg);

[Severity: Medium]
Does this disable the frame generator clock without prior enablement?

On a clean boot where the bootloader left the display running, the code
detects the moving frame index and attempts to disable the clock. Since the
driver hasn't prepared/enabled it yet, the CCF enable_count is 0. This
will trigger a CCF underflow WARN_ON and abort the disablement.

> +
> +	if (!dc_drm->pe_clk_axi_disabled) {
> +		clk_disable_unprepare(dc_drm->pe->clk_axi);

[Severity: High]
Can manually disabling this clock bypass Runtime PM and cause hardware hangs
on the next CRTC enable?

If the DRM module is unloaded while active, the pe->dev usage count is
leaked and it remains in the RPM_ACTIVE state. When the module is reloaded,
this code physically disables the clock.

When the CRTC is next enabled, pm_runtime_resume_and_get() will return
immediately because the device is still RPM_ACTIVE. The clk_prepare_enable()
sequence will be skipped, and subsequent register accesses could hang the
system.

[Severity: Medium]
Similarly to the frame generator clock above, could this also trigger a CCF
underflow warning on a clean boot?

Since the AXI clock wasn't enabled by the driver yet, calling
clk_disable_unprepare() when the CCF enable_count is 0 will trigger a
WARN_ON and the clock won't actually be disabled.

> +		dc_drm->pe_clk_axi_disabled =3D true;
> +	}
> +
> +out:
> +	pm_runtime_put(dc_crtc->de->dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-imx8-dc-pr=
efetch-v6-0-26643e3f6cb7@nxp.com?part=3D4
