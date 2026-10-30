Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354815;
	b=dtb3gB3L7DE4l7IWdazfSmVrAkr5cfrt3Za8nM1Hf1/frnkjzM5PJITBc9ECvFvMuKaa
	 NRbp71/ayj+cKOYEVrrZpx1vJoCIF8dmJhsiApUPchDFCnLF62VpiLX8FblemPOJEqIpP
	 kkE0S3L4CajcKS7/yqLtwUXm7sNvkOOsYNB9152cSTtZH8Zo/EgCwM8Gq5KLkf97g2n3O
	 bhSt+lWrgGpfr6SHFdE7ddGQm5+U1Ipii2mvpbjxQ5MVvYXKajCYS1CgvLE8hV5V7Cg0+
	 2u4khCT1MIWTbvvnLSVYHKxikbefHLq1mbUgXuItM6OL9gYjpHERoDcB/9NZ9hZzTYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354815;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/izgrK6v27WkW3THcSs7ChQLAe5vIDUskUWOQj+Numg=;
	b=JNTH6jyNJK7+mk6A5xxh/t4ry8hwSGM/BtxadGKyO7v9eevjaHtBTvhQSGMWb2L5p0mP
	 0Hf8TjSfUlTjBw51/eIIJubejxjLOsY4DM3xhss1idXluixc7QYqQby4WexhLZsJkpK9l
	 QbcJUZqvNEwsb1l27mLKsUAPDJ+FNI6r7oqLDj38sIOAo8tU6lzIVVgfHVmjROqVTU+Lf
	 8DfvWWAh7ox9VB+eQJC7/V+C719Zz5juzZalDlFuHWE6z/Zw5itfiAFtF6xl8PjIYTL/d
	 WT4AB7JfQcRMoYF8VknJf92/uf877USaPTM1zYXvrOkesOcCOvRh0qtsAi8a3jc4wxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eXval44d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B50606A31D;
	Fri, 30 Oct 2026 10:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eXval44d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2BE1F000C1;
	Fri, 30 Oct 2026 10:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793354814;
	bh=/izgrK6v27WkW3THcSs7ChQLAe5vIDUskUWOQj+Numg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eXval44dP5XsXrc2cM3mZeVMEmZqjiiPmkq7bouFGbkdT+WNPKISCjaHiEUDx8E5J
	 7mDlbh8N9jySURg6W67jqI58A233NupfRIPKGFqjnPb7eEUrQgY/i2MaKCyevuxVqg
	 KP/KrA+LE9SFbYrIbV0uwKP6aVV7109EuuI83WLHRfSp/lNNklpsqJ6ADyAImnDhh9
	 +PbiJceryXtQEnq3K8KhkChUIzTLiayqZim+MMgdD1hsxF+n3o63WYGyN+CXhy5iZJ
	 USUKmP1pHZQEsxHCqTAxyG9lAQa8J9K0m+aIlgy92vyPSQ6I79+IULR+p0AXchzQeo
	 gaiioEn4sMnHg==
Message-ID: <sashiko-outbox-190806@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/15] drm/imx: dc: Add PRG support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Ying" <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261030-imx8-dc-prefetch-v8-7-c4f81afd4533@nxp.com>
References: <20261030-imx8-dc-prefetch-v8-0-c4f81afd4533@nxp.com>
 <20261030-imx8-dc-prefetch-v8-7-c4f81afd4533@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 10:06:53 +0000
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
- [High] drm/imx: dc-prg: unclocked MMIO and RPM underflow on dc_prg_config=
ure() error
--

commit dc9803b183fdde7606d3c14739f864581b99c2a3
Author: Liu Ying <victor.liu@nxp.com>

drm/imx: dc: Add PRG support

This commit adds a platform driver to support the Display Prefetch Resolve
Gasket (PRG), which sits between a Display Prefetch Resolve Channel (DPRC)
and a FetchUnit.

> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.c b/drivers/gpu/drm/imx/dc/dc-=
prg.c
> new file mode 100644
> index 0000000000000..46108f7e09af3
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dc/dc-prg.c
[ ... ]
> +void dc_prg_enable(struct dc_prg *prg)
> +{
> +	regmap_write(prg->reg, PRG_CTRL + CLR, BYPASS);
> +}
> +
> +void dc_prg_disable(struct dc_prg *prg)
> +{
> +	regmap_write(prg->reg, PRG_CTRL, BYPASS);
> +
> +	pm_runtime_put(prg->dev);
> +}
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
> +		if (ret < 0) {
> +			dev_err(dev, "failed to get RPM: %d\n", ret);
> +			return;
> +		}
> +	}

[Severity: High]
As reported by Sashiko on v7 [1], what happens if pm_runtime_resume_and_get=
()
fails in dc_prg_configure() in drivers/gpu/drm/imx/dc/dc-prg.c when start is
true?

Because dc_prg_configure() returns void, the caller is not notified that the
PRG device remains runtime-suspended with its clocks disabled. Subsequent
calls to dc_prg_enable(), dc_prg_reg_update(), dc_prg_shadow_enable(), or
later dc_prg_configure() updates with start set to false will perform MMIO
writes to PRG registers while the hardware is unclocked and unpowered, which
can trigger a bus abort on i.MX8 SoCs.

Additionally, when the plane or CRTC is later disabled, dc_prg_disable()
writes to PRG_CTRL while unclocked and unconditionally calls
pm_runtime_put(prg->dev), underflowing the runtime PM usage counter on
prg->dev.

Should dc_prg_configure() return an error code or track the active state so
callers do not access unclocked registers or drop an unacquired runtime PM
reference?

[1] https://lore.kernel.org/r/20261026-imx8-dc-prefetch-v7-7-a0b50cc4fc65@n=
xp.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-imx8-dc-pr=
efetch-v8-0-c4f81afd4533@nxp.com?part=3D7
