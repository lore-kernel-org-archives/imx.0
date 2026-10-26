Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014353;
	b=YespZayIyI+jpi0Bwi64pXjMHuUP43MPyI9khcuSfjC6u8FpQ+uJ+QHz2R3U9rsTbQLf
	 zdEWnZ1Tc4+NGOQ75XGy3wJwIJJGrPZIbiZ+VjpqT4+m2iA1Kr6cGFTZgADUPdC9tWb39
	 IDPbbnh3YpoQUj65R1K00QfJVUl8pYIMHLoi19f/QMlrsfIV9V7AvIvsGtQ0f5zqAM5ZH
	 F7DY2FbYUAqdN9nvKO1JokmrsiBzOJj5bmco1Srz6en1HjKeu8T+ql5Nmg4oTuplCRvpR
	 dAuy8NNiflCVGDr3zRqG+rnkTN2aQlEmf0RAinYxpUDo+xJetrXC9/2daA/2k6dVnxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014353;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=X4zJQKfHNJb3WKUmtI/VFAvfPiwg26ts+eWXqEEJD+Q=;
	b=b/Qvylh0tPzbhIQE2xO1/GlBTZTk547c/++FY9bP46lY5gwH+9Ni+EadLmEwVynpE/NE
	 IK78RNRiEd/Wp3Ql/iQ3B46tIf0Dy1VWPS+wamxVA6BVQ2c0dqoXqjqSFrwJtIvQDA2wk
	 04FXeLJs607fYnGTG9VJIHFIRWA5g0BgEVKXqfZoTbFzdGsPmAVoMBX9ldF7MRN9dYCrH
	 w/YfETBULFf4Adntr88aivK09qiSsJzj1GHbYKU0V+mhecHXYzZDVMjVQkyl7DpvAYNcJ
	 FXCY10bIqrsVje7WNqjCRgF0Przzxj2e/7kLjvjT39ce8UlJcfIS6iKkvnm/ruSE99Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ioW2gkQA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAFE606A31D;
	Mon, 26 Oct 2026 11:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ioW2gkQA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667A11F01825;
	Mon, 26 Oct 2026 11:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793014352;
	bh=X4zJQKfHNJb3WKUmtI/VFAvfPiwg26ts+eWXqEEJD+Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ioW2gkQAXjeY5842F9NweSJQ48YEqcy3Fc9d1f5Cajr+1zgkNUDgaiivjK+J9RosS
	 qFY1G2vgWbrZUn2YL/AjGo7BLYbjgBqF+ChkxXRkbfR6ptz8lTHHVT5l2u58N9Kmn2
	 UHDQlYpfX1CPFAJqOj5J0e2oT53vDqIWZwwjBAJtsTZFn/rXhdtxRhJSLy7hXr9SyD
	 THKH+xIi3ITkcU4CEdpw4CyN1qzGAPeKKmBIQuvq+vv+2bjPClBh8xHiR2l/sY82ff
	 NIIcic7Gz3XnTN3/J57wN9Zahy8X74ZDQ6E1l2QQAzY/uKQKJYqWGXEysTV0LhOFLM
	 YkK88NX8N86ng==
Message-ID: <sashiko-outbox-185106@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/15] drm/imx: dc: Add PRG support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Ying" <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261026-imx8-dc-prefetch-v7-7-a0b50cc4fc65@nxp.com>
References: <20261026-imx8-dc-prefetch-v7-0-a0b50cc4fc65@nxp.com>
 <20261026-imx8-dc-prefetch-v7-7-a0b50cc4fc65@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 11:32:32 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] drm/imx: dc-prg: unclocked MMIO and RPM underflow on dc_prg_config=
ure() error
- [Medium] drm/imx: dc: signed shift overflow in dc_prg_burst_size_fixup()
- [Medium] drm/imx: dc-prg: unchecked device_link_add() in dc_prg_lookup_by=
_phandle()
--

commit 7a29cff8d2e3466268f3191ce1679f0e57e395cf
Author: Liu Ying <victor.liu@nxp.com>

drm/imx: dc: Add PRG support

This commit adds a platform driver to support the Display Prefetch Resolve
Gasket (PRG), which sits between a Display Prefetch Resolve Channel (DPRC)
and a FetchUnit in the i.MX8 display controller prefetch engine.

> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.c b/drivers/gpu/drm/imx/dc/dc-=
prg.c
> new file mode 100644
> index 0000000000000..43df5683b24d1
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dc/dc-prg.c
> @@ -0,0 +1,314 @@

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
> +
> +void dc_prg_disable_at_boot(struct dc_prg *prg)
> +{
> +	regmap_write(prg->reg, PRG_CTRL, BYPASS);
> +
> +	clk_bulk_disable_unprepare(prg->num_clks, prg->clks);
> +}
> +
> +static unsigned int dc_prg_burst_size_fixup(dma_addr_t baddr)
> +{
> +	unsigned int burst_size;
> +
> +	if (baddr =3D=3D 0)
> +		return 128U;
> +
> +	burst_size =3D 1 << __ffs(baddr);
> +	burst_size =3D round_up(burst_size, 8);
> +	burst_size =3D min(burst_size, 128U);
> +
> +	return burst_size;
> +}

[Severity: Medium]
Can shifting 1 by __ffs(baddr) in dc_prg_burst_size_fixup() overflow a 32-b=
it
signed int when baddr has a high power-of-two alignment?

__ffs(baddr) takes an unsigned long and returns a bit index up to 63 on
arm64, while 1 is a 32-bit signed int. On i.MX8QXP and i.MX8QM where system
DRAM starts at 0x80000000, a framebuffer allocated at 0x80000000 (or any odd
multiple of 2 GiB) gives __ffs(baddr) =3D=3D 31, causing 1 << 31 to overflo=
w a
signed 32-bit int.

If baddr is 4 GiB-aligned (so its lower 32 bits are zero and __ffs(baddr) is
32 or greater), shifting a 32-bit int by >=3D 32 is undefined behavior and =
on
arm64 wraps the shift count modulo 32, producing a smaller burst_size (such
as 8 instead of 128U) before min(burst_size, 128U) runs.

Since burst_size is capped at 128U, would it make sense to bound the bit
search before shifting (for example, using 1U << __ffs(baddr | 128U) or
checking !(baddr & 0x7f))?

> +static unsigned int
> +dc_prg_stride_fixup(unsigned int stride, unsigned int burst_size)
> +{
> +	return round_up(stride, burst_size);
> +}
> +
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
What happens in the caller if pm_runtime_resume_and_get() fails here when
start is true?

Because dc_prg_configure() returns void, callers cannot tell that runtime
resume failed and that PRG clocks remain disabled. When called from the DPR
channel path on initial plane enablement, the caller immediately proceeds to
call dc_prg_enable() and dc_prg_reg_update() (and later
dc_prg_shadow_enable()), performing MMIO writes to PRG_CTRL and
PRG_REG_UPDATE while the PRG clocks and power domain are off.

When the plane or CRTC is later disabled, dc_prg_disable() will also write
PRG_CTRL while unclocked and call pm_runtime_put(prg->dev), underflowing the
device runtime PM usage count.

Should dc_prg_configure() return an error code or otherwise prevent
subsequent register accesses and the unpaired pm_runtime_put()?

[ ... ]

> +struct dc_prg *
> +dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index)
> +{
> +	struct device_node *prg_node __free(device_node) =3D
> +				of_parse_phandle(dev->of_node, name, index);
> +	struct dc_prg *prg;
> +
> +	if (!prg_node)
> +		return NULL;
> +
> +	guard(mutex)(&dc_prg_list_mutex);
> +	list_for_each_entry(prg, &dc_prg_list, list) {
> +		if (prg_node =3D=3D prg->dev->of_node) {
> +			device_link_add(dev, prg->dev,
> +					DL_FLAG_AUTOREMOVE_CONSUMER);
> +			return prg;
> +		}
> +	}
> +
> +	return NULL;
> +}

[Severity: Medium]
Should dc_prg_lookup_by_phandle() check the return value of
device_link_add()?

If device_link_add() fails and returns NULL, dc_prg_lookup_by_phandle() sti=
ll
returns prg without establishing the DL_FLAG_AUTOREMOVE_CONSUMER link. If t=
he
PRG device is later unbound via dc_prg_remove():

static void dc_prg_remove(struct platform_device *pdev)
{
	struct dc_prg *prg =3D dev_get_drvdata(&pdev->dev);

	guard(mutex)(&dc_prg_list_mutex);
	list_del(&prg->list);
}

the consumer will not be unbound and can retain a dangling pointer to the
devm-allocated struct dc_prg.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-imx8-dc-pr=
efetch-v7-0-a0b50cc4fc65@nxp.com?part=3D7
