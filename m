Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C77734C134
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402286; cv=none; b=ltykuaawNtcoS8gL7aZ8Ct40rilgaRNndwgOl2cybuWJotiFgQ5b0v0g/xQCOgEgYwlZvOfbRqXe0k5cn99BedBQKhYfd0Kt/JDQTuij5lwkIv5oyYt7kVJsctnSbI9yTadQ2mH/WYloBHk0acUWt1m6JJiagVt/2utWaQFuY8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402286; c=relaxed/simple;
	bh=FnpUNmu/3A3bJcIhQuDM8nfzAXpcewIDLmWAVdI9IMM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dqBytc/DzRzulPDoWP/ImNB9n/D7KYqBbFppmb760VPWNGomUPMwPIXHsNugmVvS85FN5HGN5JWUNpU2N2aNkyuacZEpR6ybLe8hyY8WTawhubLjzYMnCy/gCwq04+Y3N59NlY12fW37nC0D4fGwOqbNRWlk8tyCJeczzAy0oQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qr+CYu3P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qr+CYu3P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD951F000E9;
	Thu, 30 Jul 2026 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785402283;
	bh=iY1TlW6zqczmttJ3vystQZf5zLNVwM926ot632reqNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qr+CYu3PV4IDStgWqma4DAXDrARz7Rt8z9OP76FBnq8A6tFeOBv0fikqyNT4SE6Je
	 G4yP76UbQslg2NL+9ZX7AGXFeYZfv7uF/zBLvVZCBVQ21Rn6dHmOc1RI15UOm2Fpwq
	 +m4i/1OHaTNiLQIxyoYYxC4K7RorMZNXHFNqYaQZchGpE0b0vk+fSCAuPYWax/mG4k
	 jFTuYaQUepBXS1OxnW4jr2oYtI+iHEKK1IXpDUXzNvIT3zQqufnX+sb6ycQB0KPG8O
	 0K2WGJmAvuFSCS0Qh2MYKPuRAVQ4qYLl5whI/FUplzZFbN+VxIU3VUoSIrW5vMQGwc
	 FKMJXZN8Zdokw==
From: sashiko-bot@kernel.org
Subject: Re: [RESEND v1] clk: imx95-blk-ctl: Add func_out_en clock for
 i.MX9x PCIe
Reply-To: sashiko-reviews@lists.linux.dev
To: hongxing.zhu@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260730085542.263025-1-hongxing.zhu@oss.nxp.com>
References: <20260730085542.263025-1-hongxing.zhu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 09:04:42 +0000
Message-Id: <20260730090442.CBD951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The newly added clock is named `func_out_en`, which is too gener=
ic for the global Common Clock Framework (CCF) namespace.

Pre-existing issues:
- [High] The driver lacks a `.remove` callback but does not suppress sysfs =
unbinding, causing use-after-free and I/O page faults on unbind.
- [High] The `netcmix_dev_data` specifies an incorrect `.clk_reg_offset`, c=
orrupting Ethernet clock state on suspend/resume.
--

--- Patch [1]: [RESEND v1] clk: imx95-blk-ctl: Add func_out_en clock for i.=
MX9x PCIe ---
commit 5827f093c090c0f0800defab20d47c7314cbe3c9
Author: Richard Zhu <hongxing.zhu@nxp.com>

clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x PCIe

The patch adds a func_out_en clock gate that serves as the parent of the=20
existing CREF_EN gate clock for i.MX9x PCIe, reducing unnecessary power=20
consumption.

> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-im=
x95-blk-ctl.c
> index 56bed44719954..1f9259f456079 100644
> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c

[ ... ]

> @@ -286,18 +286,28 @@ static const struct imx95_blk_ctl_dev_data netcmix_=
dev_data =3D {

[Severity: High]
This is a pre-existing issue, but does netcmix_dev_data specify an
incorrect .clk_reg_offset that could corrupt Ethernet clock state on
suspend and resume?

The clocks for netcmix_dev_data are all at offset 4:

drivers/clk/imx/clk-imx95-blk-ctl.c:netxmix_clk_dev_data[] =3D {
	[0] =3D {
		...
		.reg =3D 4,

However, .clk_reg_offset is initialized to 0:

drivers/clk/imx/clk-imx95-blk-ctl.c:netcmix_dev_data =3D {
	.num_clks =3D ARRAY_SIZE(netxmix_clk_dev_data),
	.clk_dev_data =3D netxmix_clk_dev_data,
	.clk_reg_offset =3D 0,
};

This offset is used by the suspend and resume routines to save and restore
the clock register state:

drivers/clk/imx/clk-imx95-blk-ctl.c:imx95_bc_runtime_suspend() {
	...
	bc->clk_reg_restore =3D readl(bc->base + bc->pdata->clk_reg_offset);
	...
}

Will this cause the driver to save and restore register 0 instead of
register 4, causing Ethernet RMII clock muxes to lose their configured stat=
e?

>  static const struct imx95_blk_ctl_clk_dev_data hsio_blk_ctl_clk_dev_data=
[] =3D {
>  	[0] =3D {
>  		.name =3D "hsio_blk_ctl_clk",
> -		.parent_names =3D (const char *[]){ "hsio_pll", },
> +		.parent_names =3D (const char *[]){ "func_out_en", },
>  		.num_parents =3D 1,
>  		.reg =3D 0,
>  		.bit_idx =3D 6,
>  		.bit_width =3D 1,
>  		.type =3D CLK_GATE,
>  		.flags =3D CLK_SET_RATE_PARENT,
> +	},
> +	[1] =3D {
> +		.name =3D "func_out_en",

[Severity: Medium]
Will this name conflict with other clocks in the global Common Clock
Framework (CCF) namespace?

Because "func_out_en" lacks a subsystem or block-specific prefix
(like "hsio_func_out_en"), it might cause namespace collisions if another
hardware block registers a clock with the same generic name.

> +		.parent_names =3D (const char *[]){ "hsio_pll", },
> +		.num_parents =3D 1,
> +		.reg =3D 0,
> +		.bit_idx =3D 2,
> +		.bit_width =3D 1,
> +		.type =3D CLK_GATE,
> +		.flags =3D CLK_SET_RATE_PARENT,
>  	}
>  };
> =20
>  static const struct imx95_blk_ctl_dev_data hsio_blk_ctl_dev_data =3D {
> -	.num_clks =3D 1,
> +	.num_clks =3D ARRAY_SIZE(hsio_blk_ctl_clk_dev_data),
>  	.clk_dev_data =3D hsio_blk_ctl_clk_dev_data,
>  	.clk_reg_offset =3D 0,
>  };

[Severity: High]
This isn't a bug introduced by this patch, but could this driver cause a
use-after-free and I/O page faults on unbind?

The driver registers non-devm clock providers and clocks in imx95_bc_probe(=
):

drivers/clk/imx/clk-imx95-blk-ctl.c:imx95_bc_probe() {
	...
		} else {
			hws[i] =3D clk_hw_register_gate(dev, data->name, data->parent_names[0],
						      data->flags, reg, data->bit_idx,
						      data->flags2, &bc->lock);
		}
	...
	ret =3D of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get, clk_hw=
_data);
	...
}

However, it does not provide a .remove callback or suppress sysfs unbinding:

drivers/clk/imx/clk-imx95-blk-ctl.c:imx95_bc_driver =3D {
	.probe =3D imx95_bc_probe,
	.driver =3D {
		.name =3D "imx95-blk-ctl",
		.of_match_table =3D imx95_bc_of_match,
		.pm =3D &imx95_bc_pm_ops,
	},
};

If the driver is unbound, devres will automatically free the driver state a=
nd
unmap I/O memory, but the clocks remain registered with CCF.  Will subseque=
nt
CCF operations access freed memory and unmapped registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730085542.2630=
25-1-hongxing.zhu@oss.nxp.com?part=3D1
