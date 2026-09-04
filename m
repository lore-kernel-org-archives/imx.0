Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360FF3DB64D;
	Fri,  4 Sep 2026 08:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509345; cv=none; b=HhVhEQ6Oja78gFRIPlIviheEloQhlCgHCeQFjRlUQodERBqInF5Ww7zLIZZHIJQKc/8j2iZrVMP3yDF+N6qpRLHCucEkSot/QbRYSrA0qD3OO5JqFxdPKQ73jMkQzVSNnrguNrKFrIGb6XO6bA4fMyjs635WWQZp9P/OY9bwZCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509345; c=relaxed/simple;
	bh=CG5u0VafvtFVsaUO711gKGQHb+GqsSmzD9moRdd2Tys=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Unil75mw4jVXiuGiUrZsYMgEcgPOnb4d1AWcB+2T9hirut4XYyk7pm+AcI/XZDtuhpaYxgBtAB7whv2EpP96FWEwZNlxSavc/ud3kJaEMKyOLgfbbkUExFXP6d2arX/VJl1qj9K43Pk0TIT3N0Sw/8O41nwhMwmARcqTZ4AqahM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CThWH89W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CThWH89W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23091F00A3E;
	Fri,  4 Sep 2026 08:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788509339;
	bh=PKvn2PlXM4yIZ7Gv5/PJgfWxGYRRvnmMZsyi3lKU/tM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CThWH89WZSIqBKb8nZW7Jx2x3m387DvB2Stgz61/Fnlrkm/XUqUVdwshr0Srfxt9b
	 +bzLmKxfVWfXyLiHJMeBE87El7wucPSEnk/0lNqM1uzGK6t5tTi8KpTVYollY4VPfa
	 qE8jY9S1k342IsWy1dFA1H1SzBRMJhubOk7+Y4EIHeB8/ZtlQdgKZQuwzmvpdXR3VR
	 uv5MoXEBHz2BWmMwHj/KPGpxJfNcyQoz8tkhY3Mv3u9s/quS2Me5AMMGGfyEfZmJR/
	 ASu2LA4aWJAyvDcm0VaNGatIVkFX+oE81c91oTYGNR83hydzxiMIPbg4wXmmjTpMjg
	 bPAr4Lczleu/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/13] drm/imx: dc: Add PRG support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Ying" <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260904-imx8-dc-prefetch-v6-5-26643e3f6cb7@nxp.com>
References: <20260904-imx8-dc-prefetch-v6-0-26643e3f6cb7@nxp.com>
 <20260904-imx8-dc-prefetch-v6-5-26643e3f6cb7@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 08:08:58 +0000
Message-Id: <20260904080858.E23091F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Sleeping functions called from atomic context in hardware programm=
ing path
- [High] Undefined behavior and potential integer overflow in burst size ca=
lculation.
- [High] Use-After-Free risk when returning an un-refcounted device pointer=
 from lookup.
- [Medium] Clock underflow warning triggered by unconditional clock disable=
 at boot.
- [Low] Uninitialized __free() variable declaration violates cleanup guidel=
ines.
--

commit 9751a7be8ad4e06c86087a3daf3b43e0c5ce886d
Author: Liu Ying <victor.liu@nxp.com>

drm/imx: dc: Add PRG support

This commit adds a platform driver to support the Display Prefetch Resolve
Gasket (PRG) for the i.MX display controller. It introduces the PRG
initialization, power management, clock handling, and configuration
functions.

> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.c b/drivers/gpu/drm/imx/dc/dc-=
prg.c
> new file mode 100644
> index 0000000000000..111ff026eec89
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dc/dc-prg.c

[ ... ]

> +void dc_prg_disable_at_boot(struct dc_prg *prg)
> +{
> +	regmap_write(prg->reg, PRG_CTRL, BYPASS);
> +
> +	clk_bulk_disable_unprepare(prg->num_clks, prg->clks);

[Severity: Medium]
Will this unconditionally disabled clock trigger a clock underflow warning
during boot?

If the bootloader leaves the display on, paths like dc_crtc_reset call
dc_prg_disable_at_boot. Since the clocks were just acquired during probe
with devm_clk_bulk_get_all, they haven't been prepared or enabled by this
driver yet. Calling clk_bulk_disable_unprepare without a matching enable
can cause a WARN_ON in the Common Clock Framework.

> +}
> +
> +static unsigned int dc_prg_burst_size_fixup(dma_addr_t baddr)
> +{
> +	unsigned int burst_size;
> +
> +	burst_size =3D 1 << __ffs(baddr);

[Severity: High]
Could this bit shift result in undefined behavior or an integer overflow?

If baddr is 0, which might happen if a buffer is allocated at IOVA 0 by
the IOMMU, __ffs(0) leads to undefined behavior. Additionally, if the
lowest set bit of baddr is 31 (like 0x80000000), 1 << 31 will overflow a
signed 32-bit integer.

[ ... ]

> +void dc_prg_configure(struct dc_prg *prg,
> +		      unsigned int width, unsigned int height,
> +		      unsigned int stride, unsigned int bits_per_pixel,
> +		      dma_addr_t baddr, bool start)
> +{
> +	struct device *dev =3D prg->dev;
> +	unsigned int burst_size;
> +	u32 val;
> +	int ret;
> +
> +	if (start) {
> +		ret =3D pm_runtime_resume_and_get(dev);

[Severity: High]
Is it safe to call sleeping functions from this execution path?

This function appears to be reachable from the plane atomic update
callback via dc_dprc_configure when start is true. Plane atomic updates
are executed in atomic context during non-blocking commits, but
pm_runtime_resume_and_get is a synchronous operation that can sleep.

Additionally, the runtime resume callback dc_prg_runtime_resume invokes
dc_prg_reset, which calls fsleep(10). Sleeping in an atomic path can
cause system instability, lockdep warnings, or deadlocks.

[ ... ]

> +struct dc_prg *
> +dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index)
> +{
> +	struct device_node *prg_node __free(device_node);

[Severity: Low]
Does this uninitialized variable declaration violate the cleanup subsystem
guidelines?

According to include/linux/cleanup.h and subsystem rules, variables
declared with __free should be defined and initialized in a single
statement. Keeping it uninitialized increases the risk of uninitialized
pointer dereferences if early returns are added later.

> +	struct dc_prg *prg;
> +
> +	prg_node =3D of_parse_phandle(dev->of_node, name, index);
> +	if (!prg_node)
> +		return NULL;
> +
> +	guard(mutex)(&dc_prg_list_mutex);
> +	list_for_each_entry(prg, &dc_prg_list, list) {
> +		if (prg_node =3D=3D prg->dev->of_node)
> +			return prg;

[Severity: High]
Does returning the raw pointer here create a use-after-free risk?

The returned device pointer is not pinned with a reference count
(like with get_device). After dropping dc_prg_list_mutex and returning,
the device could be concurrently unbound. This would cause dc_prg_remove
to free the object, leaving the caller holding a dangling pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-imx8-dc-pr=
efetch-v6-0-26643e3f6cb7@nxp.com?part=3D5
