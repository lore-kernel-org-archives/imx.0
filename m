Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827558;
	b=cDIIgGf5gBfPm6THZu9fliTHPDg0pg4HaI15L2Bi5YHSh5YCOmyLbdCn/Ag+2J/16WP9
	 1wRXJpwbkeNa/mAG3N3pUtu4YBdagPUuE5nCSPl5bbpsdyBRVhq9tUsNAcGwhRstiL9rJ
	 nJXQk3xbmZnYIpNpBe4XDivPIL6Lpqg0rkIf5vYs0xfdxeZmcFN8c4n1vYV37nZlv3VtA
	 i0HeXtCXgzDJ9E6gG+VSpNNHixdyUrzzjprovX/cu2VH1aT5lfo4IXK8t6JFuqrR6nz89
	 SMfacecX4vDXS4BGeRtN1Z46/MesLfHeQKLAYgLKHFs3zKJIUjS9pYB8n7Jsm2U0uLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827558;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WQRQeJ+Gxgr7tiV9mblg5X2h9ycpLr64NDSACZWQz10=;
	b=fBvV+hXElf/3LjuWOJcvfHjdWVOKEdPg+eue7bJU9P8m0t1ZJ2k7wJf/O18DJYuEg4wZ
	 8QSAd09BPT955u2kPH1reeCYmpfet2DprRoZibk350hAfzawvxf23Q6D24e6xAyF+FUEV
	 MYrZl7f5wUa6/fuBS7/u4D5lZqlJOCOoL6nBlVu3kD7wzkFqwMBIAz92l9WN5E6PiUjxo
	 0ir0qhH/a43bHeiboUzYL8c2fnXtEZihoNmusaePPE8p32CZrWdLGtHOgK9uxY+J+v11c
	 5cGSVi3a4iUedBvyIBeWy5kBJH/6BzMUnuOF7cYgPki4n3KqNeZLojIj6IIrCASUS+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ibE8M9VW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C207A606A32C;
	Mon, 16 Nov 2026 11:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ibE8M9VW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2085E1F000C4;
	Mon, 16 Nov 2026 11:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794827558;
	bh=WQRQeJ+Gxgr7tiV9mblg5X2h9ycpLr64NDSACZWQz10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ibE8M9VWl3o019TmgaoqEW4JP4HQfCoRfObVrIfvp/TC09fV7qmjVj6CKRVNIf0GR
	 PjS5ouDBxXwqGa26XYOVs7fo18FhUFofWQ293UDuMlLj8NC43b6ca5EIFo0p242jv0
	 jkj85HKuT6pPmAcC/oBcZ5k8ZjjUvHfnMHdAggRnx7h4yTZn51N5Y/cC/PzKJLhmb5
	 d2HhVea+tck9yE3YyRcPFG5pB45YuWzMBVaqaw2BLRaQG9/GJhIo9/BK2/PEe+rFge
	 bGQ2eX6OhLxl2S6MosX0DyN47cns9ycbTTFR2mnf6rUoqYLYbr+LJ6iiUd6CfSLdCC
	 1ICvKhtMCSYfw==
Message-ID: <sashiko-outbox-216859@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] i3c: master: svc: Add amlogic a9 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junyi Zhao" <junyi.zhao@amlogic.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261116-a9_i3c-v4-2-3d3222b7128d@amlogic.com>
References: <20261116-a9_i3c-v4-0-3d3222b7128d@amlogic.com>
 <20261116-a9_i3c-v4-2-3d3222b7128d@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 11:12:37 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] i3c: master: svc: NULL dereference of clks[0].id in
  aml_i3c_init()
- [Medium] i3c: master: svc: clocks left enabled in
  svc_i3c_master_remove()
- [Low] i3c: master: svc: duplicate fast_clk lookup in aml_i3c_init()
--

commit 260aeb5a4d5c58d3bea32674062960231e4d4d2c
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i3c: master: svc: Add amlogic a9 support

This commit adds support for the Amlogic A9 EE-domain and AO-domain Silvaco
I3C controllers, introducing a vendor_init callback to register the AO
variant's internal clock divider chain and configure the fast_clk rate.

> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index e700392f0801f..0268fc713afdf 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c

[ ... ]

> @@ -2163,9 +2209,215 @@ static const struct svc_i3c_drvdata npcm845_drvda=
ta =3D {

[ ... ]

> +	/*
> +	 * Keep the clk bulk state balanced for the following
> +	 * clk_bulk_disable_unprepare() calls (error paths and runtime PM).
> +	 */
> +	ret =3D clk_prepare_enable(fclk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "can't enable fast_clk\n");
> +
> +	new_clks =3D devm_kcalloc(dev, master->num_clks + 1, sizeof(*new_clks),
> +				GFP_KERNEL);
> +	if (!new_clks) {
> +		clk_disable_unprepare(fclk);
> +		return -ENOMEM;
> +	}
> +
> +	memcpy(new_clks, master->clks,
> +	       master->num_clks * sizeof(*master->clks));
> +	new_clks[master->num_clks].id =3D "fast_clk";
> +	new_clks[master->num_clks].clk =3D fclk;
> +	master->clks =3D new_clks;
> +	master->num_clks++;
> +
> +	return 0;
> +}

[Severity: Medium]
Can unbinding the driver leave fclk and the input clocks enabled when the
device is not runtime-suspended?

svc_i3c_master_remove() calls pm_runtime_dont_use_autosuspend() and
pm_runtime_disable(), relying on svc_i3c_runtime_suspend() to call
clk_bulk_disable_unprepare().  If CONFIG_PM is disabled, runtime PM is
forbidden via sysfs, or hotjoin is enabled (which holds a runtime PM
reference not released by i3c_master_unregister()), runtime suspend does
not run during remove.  When devres then unregisters ao->gate.hw,
ao->div.hw, and ao->div_en.hw while they are still prepared and enabled,
clk_unregister() triggers a kernel warning and leaks the prepare and
enable counts on the parent pclk.

> +
> +/**
> + * aml_i3c_init - Amlogic A9 specific init, called with the clocks enabl=
ed
> + * @master: I3C master controller
> + *
> + * Register the AO variant's internal divider chain and round/set the fa=
st
> + * clock rate for both variants.
> + *
> + * Return: 0 on success, or a negative error code.
> + */
> +static int aml_i3c_init(struct svc_i3c_master *master)
> +{
> +	struct device *dev =3D master->dev;
> +	struct clk *fclk;
> +	long fin_freq;
> +	int ret, i;
> +
> +	if (svc_has_quirk(master, AML_I3C_QUIRK_AO)) {
> +		/*
> +		 * clk_bulk_get_all() preserves the DT order, and the
> +		 * binding restricts the AO variant to exactly one clock,
> +		 * which is always "pclk".  So clks[0] is the input of the
> +		 * internal divider chain.
> +		 */
> +		if (strcmp(master->clks[0].id, "pclk"))
> +			return dev_err_probe(dev, -EINVAL,
> +					     "invalid AO input clock\n");

[Severity: Medium]
Can this trigger a NULL pointer dereference on master->clks or
master->clks[0].id?

When a device tree node has no clocks, devm_clk_bulk_get_all() returns 0
and leaves master->clks as NULL, which passes the master->num_clks < 0
check in svc_i3c_master_probe().  Previously, the fast_clk loop in probe
ran zero iterations and returned -EINVAL, but aml_i3c_init() now runs
first and indexes master->clks[0] without checking that master->num_clks
is at least 1 (or equal to 1 as required by the AO binding).  In addition,
of_clk_bulk_get() leaves clks[i].id as NULL if clock-names is missing or
shorter than clocks, which would cause strcmp() here and in the fast_clk
loop below to dereference NULL.

> +
> +		ret =3D aml_ao_i3c_tail_clocks(master, master->clks[0].clk);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for (i =3D 0; i < master->num_clks; i++) {
> +		if (!strcmp(master->clks[i].id, "fast_clk"))
> +			break;
> +	}
> +
> +	if (i =3D=3D master->num_clks)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "can't get I3C fast clock\n");
> +
> +	fclk =3D master->clks[i].clk;
> +	if (IS_ERR(fclk))
> +		return PTR_ERR(fclk);

[Severity: Low]
This isn't a bug, but this fast_clk lookup and validation duplicates the
identical loop in svc_i3c_master_probe() that runs right after
vendor_init() returns.  Could a shared helper or resolving master->fclk
once avoid repeating the lookup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-a9_i3c-v4-=
0-3d3222b7128d@amlogic.com?part=3D2
