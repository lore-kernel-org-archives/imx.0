Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950322;
	b=XXlwl0O1pNXsPVC3vWeMek/PA3cMBskysAfBEgaOy3ItfjXmJgH6IGLmmGhoHNyLGyGW
	 lCMhXnJ64PgC2UILkzQHtWPfzriBYggfjNL+1jOQ9q7jN3Ueosk2zyX3xvKhBiWYLthSX
	 qkQXLxSEThQF/6GyqFUylCCR+5ZS5BQyqUNsWwxY5t5pHGH5JxkwitrTC1Sg4uQxLfqCp
	 QbsqTw3GmPxic+mydk9R4mhz/P0BxJ9xWJrHc1qzeydiY9uGyiVnFGUobXQdkA1lBRh2i
	 qkVZFRqj3d1huzatMVxdTfg5BtIADEcezYo2qJ7WSqwI1FPmHQtFWOVXFv/XFwFlmGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950322;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J26CElyGAMgILynoCQU6N9ZuMtxndWEd7lVSGneZhMk=;
	b=dY+bU4OtjBBWLlBDGAjC5+XuvwVzp/cga5/W9xiMen6fc+OCQddU3XC7vsgfgJxp1aRh
	 3IeMxhUFq7ihD4XgD/OvjiI1Mnjsdd5gWNpvdr65zV2nmavBqV/VPETUpE7qjXod/sqCP
	 P0B+0kw+olJSvd7qiymoTbHtBz/Hxb1TtrPB3SeQtIlRuD3r65ztmI7WQYkYvjbTcufCr
	 ATFgrR1Eh5Lazh10upPADgzx3dnsEMzsA02Y+M89sJcUeIlJbxTpSvirJ9JBiE2HbdM1L
	 RpAawuZIJfq49sCFsqVLqEv55vzl5UrHXjsab1aP1dRs9+mggTXN7CaYh6z8BZgCk7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ecf7q7pS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB20606A326;
	Fri,  6 Nov 2026 07:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ecf7q7pS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392021F008A3;
	Fri,  6 Nov 2026 07:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793950321;
	bh=J26CElyGAMgILynoCQU6N9ZuMtxndWEd7lVSGneZhMk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ecf7q7pSZPM79t0GKDwDB+AycXJ9vuAeAg9WTCIe+8P+JPwGUS2CLoRYMIfd/MNU2
	 gFfQ+d+aQJIaubb2KFRv1DhTTQmv1JlKeGhuElS5ILUXh45BCtCHRfaBuhMfgUdnzE
	 B727dPl/pzgePDIRkHG+eO6Jdyb+f+4yHTUfYCT0/AEB3bQ83ii6cNUIXBRQdUzivY
	 k0+u8IWh4XuutfpIUujWXGPfqjw2ltVR2K7Qt26rtxm3st9PZNrKcgyKr5QwhUJzii
	 dhfgBhTiY4hufaZwtNByWk0D3JeVcP1WWCZTZx8I4yT/5qS4F+SGt+j8bbBImx9jxH
	 +LJuqI/qTQJrw==
Message-ID: <sashiko-outbox-200995@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] i3c: master: svc: Add amlogic a9 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junyi Zhao" <junyi.zhao@amlogic.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261106-a9_i3c-v3-1-804b69b9095b@amlogic.com>
References: <20261106-a9_i3c-v3-0-804b69b9095b@amlogic.com>
 <20261106-a9_i3c-v3-1-804b69b9095b@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 07:32:00 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] i3c: master: svc: unbalanced fclk disable in
  aml_ao_i3c_tail_clocks()
- [Medium] i3c: master: svc: NULL dereference of clks[0].id in
  aml_i3c_init()
- [Medium] i3c: master: svc: unclocked MMIO read in
  aml_ao_i3c_tail_clocks()
- [Low] i3c: master: svc: duplicate fast_clk lookup in aml_i3c_init()
--

commit 13e8b1ef64cdb3b2e6850ddcbaa3e5a7ffee2a56
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i3c: master: svc: Add amlogic a9 support

This commit adds Amlogic A9 and A9 AO I3C controller support to the
Silvaco I3C master driver, including a vendor_init callback that registers
the AO variant's internal clock divider chain and configures the fast_clk
rate.

> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index e700392f0801f..aef56286ecfa8 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
[ ... ]
> @@ -2019,27 +2049,43 @@ static int svc_i3c_master_probe(struct platform_d=
evice *pdev)
>  	if (master->num_clks < 0)
>  		return dev_err_probe(dev, -EINVAL, "can't get I3C clocks\n");
> =20
> +	ret =3D clk_bulk_prepare_enable(master->num_clks, master->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "can't enable I3C clocks\n");
> +
> +	/*
> +	 * Vendor specific setup may register additional clocks (e.g. the
> +	 * internal divider chain of the AO variant) and program clock rates,
> +	 * so it must run with the clocks enabled.
> +	 */
> +	if (master->drvdata->vendor_init) {
> +		ret =3D master->drvdata->vendor_init(master);
> +		if (ret)
> +			goto err_disable_clks;
> +	}
> +
>  	for (i =3D 0; i < master->num_clks; i++) {
>  		if (!strcmp(master->clks[i].id, "fast_clk"))
>  			break;
>  	}
> =20
> -	if (i =3D=3D master->num_clks)
> -		return dev_err_probe(dev, -EINVAL,
> -				     "can't get I3C peripheral clock\n");
> +	if (i =3D=3D master->num_clks) {
> +		ret =3D dev_err_probe(dev, -EINVAL,
> +				    "can't get I3C peripheral clock\n");
> +		goto err_disable_clks;
> +	}
> =20
>  	master->fclk =3D master->clks[i].clk;
> -	if (IS_ERR(master->fclk))
> -		return PTR_ERR(master->fclk);
> +	if (IS_ERR(master->fclk)) {
> +		ret =3D PTR_ERR(master->fclk);
> +		goto err_disable_clks;
> +	}
[ ... ]
> @@ -2163,9 +2209,213 @@ static const struct svc_i3c_drvdata npcm845_drvda=
ta =3D {
[ ... ]
> +static int aml_ao_i3c_tail_clocks(struct svc_i3c_master *master, struct =
clk *parent)
> +{
> +	struct device *dev =3D master->dev;
> +	struct clk_bulk_data *new_clks;
> +	struct clk_init_data init =3D {};
> +	struct aml_i3c_ao_clk *ao;
> +	struct clk *fclk;
> +	char name[64];
> +	int ret;
> +
> +	ao =3D devm_kzalloc(dev, sizeof(*ao), GFP_KERNEL);
> +	if (!ao)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&ao->lock);
> +
> +	snprintf(name, sizeof(name), "%s#div_en", dev_name(dev));
> +	init.name =3D name;
> +	init.ops =3D &clk_gate_ops;
> +	init.flags =3D CLK_IGNORE_UNUSED;
> +	init.parent_data =3D &(struct clk_parent_data) {
> +		.index =3D -1,
> +		.hw =3D __clk_get_hw(parent),
> +	};
> +	init.num_parents =3D 1;
> +
> +	ao->div_en.reg =3D master->regs + AML_AO_I3C_FCLK_DIV_CTRL;
> +	ao->div_en.bit_idx =3D AML_AO_I3C_FCLK_DIV_EN_SHIFT;
> +	ao->div_en.hw.init =3D &init;
> +	ao->div_en.lock =3D &ao->lock;
> +
> +	ret =3D devm_clk_hw_register(dev, &ao->div_en.hw);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register %s\n", name);
> +
> +	snprintf(name, sizeof(name), "%s#div", dev_name(dev));
> +	init.name =3D name;
> +	init.ops =3D &clk_divider_ops;
> +	init.flags =3D 0;
> +	init.parent_data =3D &(struct clk_parent_data) {
> +		.index =3D -1,
> +		.hw =3D &ao->div_en.hw,
> +	};
> +	init.num_parents =3D 1;
> +
> +	ao->div.reg =3D master->regs + AML_AO_I3C_FCLK_DIV_CTRL;
> +	ao->div.shift =3D AML_AO_I3C_FCLK_DIV_SHIFT;
> +	ao->div.width =3D AML_AO_I3C_FCLK_DIV_WIDTH;
> +	ao->div.hw.init =3D &init;
> +	ao->div.lock =3D &ao->lock;
> +
> +	ret =3D devm_clk_hw_register(dev, &ao->div.hw);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register %s\n", name);
> +
> +	snprintf(name, sizeof(name), "%s#gate", dev_name(dev));
> +	init.name =3D name;
> +	init.ops =3D &clk_gate_ops;
> +	init.flags =3D CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED;
> +	init.parent_data =3D &(struct clk_parent_data) {
> +		.index =3D -1,
> +		.hw =3D &ao->div.hw,
> +	};
> +	init.num_parents =3D 1;
> +
> +	ao->gate.reg =3D master->regs + AML_AO_I3C_FCLK_DIV_CTRL;
> +	ao->gate.bit_idx =3D AML_AO_I3C_FCLK_EN_SHIFT;
> +	ao->gate.hw.init =3D &init;
> +	ao->gate.lock =3D &ao->lock;
> +
> +	ret =3D devm_clk_hw_register(dev, &ao->gate.hw);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register %s\n", name);

[Severity: Medium]
Can the clock framework read AML_AO_I3C_FCLK_DIV_CTRL while pclk is
disabled during runtime suspend?

svc_i3c_master_probe() invokes vendor_init() before calling
pm_runtime_enable(), so clk_pm_runtime_init() sees
pm_runtime_enabled(dev) =3D=3D false and leaves core->rpm_enabled unset for
div_en, div, and gate, and none of the three clocks sets
CLK_OPS_PARENT_ENABLE.  Once svc_i3c_runtime_suspend() disables pclk,
any clock query (such as reading /sys/kernel/debug/clk/clk_summary)
calls clk_gate_ops.is_enabled or clk_divider_ops.recalc_rate and performs
an unclocked MMIO read of AML_AO_I3C_FCLK_DIV_CTRL.

> +	fclk =3D devm_clk_hw_get_clk(dev, &ao->gate.hw, NULL);
> +	if (IS_ERR(fclk))
> +		return dev_err_probe(dev, PTR_ERR(fclk),
> +				     "tail i3c fast clock failed\n");
> +
> +	new_clks =3D devm_kcalloc(dev, master->num_clks + 1, sizeof(*new_clks),
> +				GFP_KERNEL);
> +	if (!new_clks)
> +		return -ENOMEM;
> +
> +	memcpy(new_clks, master->clks,
> +	       master->num_clks * sizeof(*master->clks));
> +	new_clks[master->num_clks].id =3D "fast_clk";
> +	new_clks[master->num_clks].clk =3D fclk;
> +	master->clks =3D new_clks;
> +	master->num_clks++;
> +
> +	/*
> +	 * Keep the clk bulk state balanced for the following
> +	 * clk_bulk_disable_unprepare() calls (error paths and runtime PM).
> +	 */
> +	ret =3D clk_prepare_enable(fclk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "can't enable fast_clk\n");
> +
> +	return 0;
> +}

[Severity: Medium]
If clk_prepare_enable(fclk) fails here, does the err_disable_clks path in
svc_i3c_master_probe() call clk_bulk_disable_unprepare() on an unprepared
and disabled fclk?  master->clks and master->num_clks are updated to
include fclk before clk_prepare_enable(fclk) succeeds, which will trigger
WARN() assertions in clk_core_disable() and clk_core_unprepare().

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
Can this dereference a NULL pointer if the DT node omits clocks or
clock-names?

devm_clk_bulk_get_all() returns 0 with master->clks =3D=3D NULL when no
clocks are present in DT (passing the master->num_clks < 0 check in
svc_i3c_master_probe()), and leaves master->clks[0].id as NULL if
clock-names is missing.

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
This isn't a bug, but this fast_clk lookup and IS_ERR() check duplicate
the identical loop that runs in svc_i3c_master_probe() right after
vendor_init() returns.  Could master->fclk be resolved once in a helper
or before setting the clock rate?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-a9_i3c-v3-=
0-804b69b9095b@amlogic.com?part=3D1
