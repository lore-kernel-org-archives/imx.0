Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618299;
	b=IeUE17QmDzgHU33P2SWxDC7gbbo6FjqX7I01DTqOns2zQtL4s9nPN3VGwkhJzLDPk8q8
	 3eXoWdZQcjf5c80YiEGxL62QAPQVBYkyDrd9SCb6w+zoP8OnOO6GFbwKNIPdkZjAxh5y7
	 9YMoBvVneZN7ymgGuswsBGECErvkx+bZu+r/Vh380DedsTUyaqI5OYBfyPv8/nap6qit/
	 qtACTAVWpDfiBlwPZMSYYCUI9lwYaggFrg+t2QQi+22zFc3tJms8Vkz/0wXIqiFmz9cr8
	 i4YZNNAviy1ZIwAxQsiZvR0o2+3ACRhSykbgmzJleDNShQrrij7W06chbrvMlq5QgRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618299;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0wHbwkyIp2jpgTD4783b7gznc0vB6QVgAcGDjNYbaJE=;
	b=un/Ht1djPZMEPCOMGMvmNN7tPYzqD2Yh1LBMVZlMLcUVnRC6ZBM2IXtpsNYV2yO8/+1q
	 v+F09haVr8iFxHzKfUpp3+H9kPxtJ35KOXD0iLNuSkvJjZJb3qh+SP1zhGin4Ik1ZjEtN
	 vHvFdLGIl1GaivBtho5x9/qtIgKI0e4UPOPkU2Q0alRAHMNgtbyIo7AXRBzEGOlovjWML
	 NUNb0AbL7zRlna5nuqMRTszHyTvmdOdPdqWQLwhmM0JXbBIlETOiLxm2DnRCd+a2de+Gu
	 Myn+6ToOybIz5VLqyk/jOgZ1GnIYUND44rO3cc7bSghqWgVAEKFdpT5OQzYC2Xwvolw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="l/XA7NAf";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D027760A2630;
	Mon,  2 Nov 2026 11:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l/XA7NAf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C92A1F00A16;
	Mon,  2 Nov 2026 11:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793618298;
	bh=0wHbwkyIp2jpgTD4783b7gznc0vB6QVgAcGDjNYbaJE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l/XA7NAfKmmN5xqkQ96dray/l1fSKUCygTZyL6sBzth0z8yla5WWTlwsdwltBKExs
	 gxtGJzSDS4nnoenKB1gR3+nJM4GA0/XNq/SO9J1r/EHR7HlD+lCaCNdvilmblK+ImD
	 2waINuB01veg+1yD75pUXuwatNDDDN5mgubUEovfpAAdSx/zanwe9ZHGOR5T4oXKHn
	 MUbT1uhVGlGhQrSDi/a2ZyHvCwCVsHfwJ6RE1GQPL8IiQJNwLDeOaIxCkM1v135nQa
	 v2A8ikxWw/6RQ8/Drlgoglwd3ysor8fzavQnvw25vigIjV1TzbnTbXQjnW8CQhcIP7
	 SqL+mE0xyaFGw==
Message-ID: <sashiko-outbox-193327@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] i3c: master: svc: Add amlogic a9 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junyi Zhao" <junyi.zhao@amlogic.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261102-a9_i3c-v2-1-0c474bfccffa@amlogic.com>
References: <20261102-a9_i3c-v2-0-0c474bfccffa@amlogic.com>
 <20261102-a9_i3c-v2-1-0c474bfccffa@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 11:18:17 +0000
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
- [High] i3c: master: svc: NULL dereference on unchecked devm_kcalloc() in =
aml_ao_i3c_tail_clocks()
- [High] i3c: master: svc: unclocked MMIO access to AML_AO_I3C_FCLK_DIV_CTR=
L in aml_i3c_init()
- [Low] i3c: master: svc: missing COMMON_CLK dependency for aml_ao_i3c_tail=
_clocks()
--

commit 5d539aa0589681cba0b31f37c581a2a552c6d504
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i3c: master: svc: Add amlogic a9 support

This commit adds support for the Silvaco I3C master controller on Amlogic
a9 SoCs (both EE-domain and AO-domain variants). It introduces a
vendor_init callback and vendor_quirks to register the AO-domain internal
clock divider chain and configure the fast_clk rate during probe.

> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index e700392f0801f..98aa6eb0f49ca 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -9,6 +9,7 @@
> =20
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
> +#include <linux/clk-provider.h>

[ ... ]

> @@ -2019,6 +2043,12 @@ static int svc_i3c_master_probe(struct platform_de=
vice *pdev)
>  	if (master->num_clks < 0)
>  		return dev_err_probe(dev, -EINVAL, "can't get I3C clocks\n");
> =20
> +	if (master->drvdata->vendor_init) {
> +		ret =3D master->drvdata->vendor_init(master);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	for (i =3D 0; i < master->num_clks; i++) {
>  		if (!strcmp(master->clks[i].id, "fast_clk"))
>  			break;
> @@ -2036,7 +2066,6 @@ static int svc_i3c_master_probe(struct platform_dev=
ice *pdev)
>  	if (master->irq < 0)
>  		return master->irq;
> =20
> -	master->dev =3D dev;
>  	ret =3D clk_bulk_prepare_enable(master->num_clks, master->clks);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "can't enable I3C clocks\n");
> @@ -2163,9 +2192,184 @@ static const struct svc_i3c_drvdata npcm845_drvda=
ta =3D {
> =20
>  static const struct svc_i3c_drvdata svc_default_drvdata =3D {};
> =20
> +/*
> + * Container for the tail clocks of the AO domain variant. The clock HW
> + * structures are registered with the clock framework and must stay alive
> + * for the whole driver lifetime, so they are kept along with the shared
> + * lock used by their gate/divider operations.
> + */
> +struct aml_i3c_ao_clk {
> +	struct clk_gate div_en;
> +	struct clk_divider div;
> +	struct clk_gate gate;
> +	spinlock_t lock;
> +};
> +
> +/*
> + * aml_ao_i3c_tail_clocks - register the internal divider chain that
> + * produces the AO variant's fast_clk, and append it to the clk bulk
> + * array as "fast_clk".  @parent must be "pclk", the only clock the AO
> + * variant exposes (see silvaco,i3c-master.yaml).
> + */
> +static int aml_ao_i3c_tail_clocks(struct svc_i3c_master *master, struct =
clk *parent)
> +{
> +	struct device *dev =3D master->dev;
> +	struct aml_i3c_ao_clk *ao;
> +	struct clk_init_data init =3D {};
> +	char name[64];
> +	int ret;
> +	struct clk_bulk_data *new_clks;
> +	struct clk *fclk;
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
> +
> +	fclk =3D devm_clk_hw_get_clk(dev, &ao->gate.hw, NULL);
> +	if (IS_ERR(fclk))
> +		return dev_err_probe(dev, PTR_ERR(fclk),
> +				     "tail i3c fast clock failed\n");

[Severity: Low]
Will this fail to link when the common clock framework is disabled?

aml_ao_i3c_tail_clocks() unconditionally references clk_gate_ops,
clk_divider_ops, devm_clk_hw_register(), and devm_clk_hw_get_clk(), which do
not have stub definitions in include/linux/clk-provider.h when common clock
support is not enabled.

In drivers/i3c/master/Kconfig, the driver currently has:

    config SVC_I3C_MASTER
        tristate "Silvaco I3C Dual-Role Master driver"
        depends on HAS_IOMEM
        depends on !(ALPHA || PARISC)

Should the Kconfig entry also depend on common clock support?

> +
> +	new_clks =3D devm_kcalloc(dev,
> +				master->num_clks + 1,
> +				sizeof(*new_clks),
> +				GFP_KERNEL);
> +	memcpy(new_clks, master->clks,
> +			master->num_clks * sizeof(*master->clks));
> +	new_clks[master->num_clks].id =3D "fast_clk";
> +	new_clks[master->num_clks].clk =3D fclk;

[Severity: High]
What happens if devm_kcalloc() returns null in aml_ao_i3c_tail_clocks()?

new_clks is passed directly to memcpy() and dereferenced at
new_clks[master->num_clks] without checking whether the allocation succeede=
d.
Should this return -ENOMEM if !new_clks?

> +	master->clks =3D new_clks;
> +	master->num_clks++;
> +
> +	return 0;
> +}
> +
> +static int aml_i3c_init(struct svc_i3c_master *master)
> +{
> +	struct device *dev =3D master->dev;
> +	long fin_freq;
> +	int ret, i;
> +	struct clk *fclk;
> +
> +	if (vendor_has_quirk(master, AML_I3C_QUIRK_AO)) {
> +		/*
> +		 * clk_bulk_get_all() preserves the DT order, and the
> +		 * binding restricts the AO variant to exactly one clock,
> +		 * which is always "pclk".  So clks[0] is the input of the
> +		 * internal divider chain.
> +		 */
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
> +
> +	fin_freq =3D clk_round_rate(fclk, 25000000);
> +	if (fin_freq <=3D 0) {
> +		dev_err(dev, "invalid fast_clk\n");
> +		return fin_freq ? fin_freq : -EINVAL;
> +	}
> +
> +	ret =3D clk_set_rate(fclk, fin_freq);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "setting fast_clk rate failed\n");

[Severity: High]
On the AO variant, is it safe to access master->regs + AML_AO_I3C_FCLK_DIV_=
CTRL
before pclk is prepared and enabled?

In svc_i3c_master_probe(), master->drvdata->vendor_init(master) is called r=
ight
after devm_clk_bulk_get_all(), before clk_bulk_prepare_enable() enables pclk
and before pm_runtime_enable() is called:

    svc_i3c_master_probe()
        devm_clk_bulk_get_all()
        aml_i3c_init()
            aml_ao_i3c_tail_clocks()
                devm_clk_hw_register(&ao->div.hw)
                    __clk_core_init()
                        clk_divider_recalc_rate()
            clk_set_rate(fclk, fin_freq)
                clk_divider_set_rate()
        ...
        clk_bulk_prepare_enable()
        ...
        pm_runtime_enable()

Both devm_clk_hw_register(&ao->div.hw) and clk_set_rate(fclk, fin_freq) read
and write master->regs + AML_AO_I3C_FCLK_DIV_CTRL while pclk is still
disabled, and none of the registered AO clocks set CLK_OPS_PARENT_ENABLE.

In addition, because devm_clk_hw_register() runs before pm_runtime_enable(),
runtime PM is not bound to the registered clocks, so reading debugfs
clk_summary while the controller is runtime-suspended (and pclk is gated by
svc_i3c_runtime_suspend()) will also read master->regs +
AML_AO_I3C_FCLK_DIV_CTRL with pclk disabled.

Should pclk be enabled before registering and programming the internal divi=
der
clocks (or should the AO clocks use CLK_OPS_PARENT_ENABLE / runtime PM)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-a9_i3c-v2-=
0-0c474bfccffa@amlogic.com?part=3D1
