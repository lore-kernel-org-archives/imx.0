Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCC73C585E;
	Tue,  2 Jun 2026 08:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389113; cv=none; b=ou9fOm2BTCT06VMRIttVOS9WfVY7lJ7T35Zj5ZQc5Wbsn3gXdngOaC2gimxzoH1do3R4VrBVCF02eIFMXiAjZuxAF5qqWdIAE8ZomvAUI/0Pgo/QH+L8YYl6PlPp+yueCt+vOmL1UsWBh++Fet74IAFKHigIsGs6F3Q23WQSV54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389113; c=relaxed/simple;
	bh=izSHkkm7d7GlDsbfJwRs+TozxNUIHPfw0qxeD8ynKdE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SSw9HSwZt4nrSiYsI59KdDbHxpzyRONXwsdZyVhIunk6ObFtBwyMDZKDMzN0dxCslyjptIbTU3/1jyOorCOvkjqQp73wRyiDXoSHTGP1Py0M3OryMd5P8NOdyeGUtEADnZ7kWlb0llODzAT9aDCJUIrxJptHJCshAdHO4/QBB4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EwzIHx4v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EwzIHx4v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3AF1F00898;
	Tue,  2 Jun 2026 08:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780389111;
	bh=Dae3SFAVqrlmw/bPllmrei9FrFcBsPbVdSp13m5Zpkc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EwzIHx4vaCPDzuinlzsOErYLkUo04nM9OgA3hNIYl9o5slG7Fcwi8A+u2T7hSNdiQ
	 3K8kdTHLfMnXcRnLIVMZ3xue8ZzsPgA+bKQ1fx9A537KDlPIA/VxvMTfqZ0WXkDdkv
	 nTyuUMJtz2g2+3lBA7O0Ss88FTjfGhmmUMiHG5eFd/rBBVKLy+xt7InH0xPQXdf+l7
	 0kr4oplGgiRI3D8DotP1rYEIPRATDakcLk4+y3pduuGxEVGL42unAoLoYlxzcyEWki
	 K3S4KtY8KMn5xlGXmRb6fzfSNE3ei/Y8FldxSBgG3iNFaKeawd9P1r92iwP1loHVId
	 DxLAnQTpNrQRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 5/6] pinctrl: s32cc: implement GPIO functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260602080132.3256239-6-khristineandreea.barbulescu@oss.nxp.com>
References: <20260602080132.3256239-6-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 08:31:50 +0000
Message-Id: <20260602083151.5E3AF1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Removal of error checks for `s32_regmap_read()` causes uninitializ=
ed kernel stack memory to be saved during suspend and printed via debugfs.
- [High] The driver does not save and restore the PGPDO (Parallel GPIO Pad =
Data Out) registers across suspend and resume, causing output GPIOs to lose=
 their state.
- [Medium] `PINCTRL_S32CC` selects `GPIO_REGMAP` without fulfilling its dep=
endency on `GPIOLIB`, potentially causing build failures.
- [Medium] The virtual `s32-gpio` regmap forces GPIO operations to be sleep=
able, preventing usage from interrupt handlers.
--

commit 065b0eb13249298984a661238d8ddad54d7f31a4
Author: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: pinctrl: s32cc: implement GPIO functionality

The patch updates the S32CC SIUL2 driver to operate as a monolithic
pinctrl/GPIO driver. It adds GPIO data access and direction handling using
the gpio-regmap library backed by a virtual regmap. Support is also added
for both legacy pinctrl-only and extended bindings.

Link: https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristine=
andreea.barbulescu@oss.nxp.com/T/#m543c9edbdde74bdc68b6a2364e8b975356c33043
Link: https://lore.kernel.org/all/20260504131148.3622697-7-khristineandreea=
.barbulescu@oss.nxp.com/

> diff --git a/drivers/pinctrl/nxp/Kconfig b/drivers/pinctrl/nxp/Kconfig
> index abca7ef97003d..59fc6adf5b0bb 100644
> --- a/drivers/pinctrl/nxp/Kconfig
> +++ b/drivers/pinctrl/nxp/Kconfig
> @@ -5,6 +5,7 @@ config PINCTRL_S32CC
>  	select GENERIC_PINCTRL_GROUPS
>  	select GENERIC_PINMUX_FUNCTIONS
>  	select GENERIC_PINCONF
> +	select GPIO_REGMAP
>  	select REGMAP_MMIO

[Severity: Medium]
Does PINCTRL_S32CC also need to select or depend on GPIOLIB here?

Since GPIO_REGMAP is enclosed in an "if GPIOLIB" block in drivers/gpio/Kcon=
fig,
it implicitly depends on GPIOLIB. If a user disables GPIOLIB, Kconfig will
report an unmet direct dependency warning.=20

Because drivers/gpio/Makefile is gated by CONFIG_GPIOLIB, gpio-regmap.c
won't compile in that case, potentially leading to linker errors for
devm_gpio_regmap_register() in the pinctrl driver.

> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pi=
nctrl-s32cc.c
> index 89a4eb2000ee7..8843926345ec8 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
[ ... ]
> @@ -662,15 +717,13 @@ static void s32_pinconf_group_dbg_show(struct pinct=
rl_dev *pctldev,
>  	struct s32_pin_group *grp;
>  	unsigned int config;
>  	const char *name;
> -	int i, ret;
> +	int i;
> =20
>  	seq_puts(s, "\n");
>  	grp =3D &info->groups[selector];
>  	for (i =3D 0; i < grp->data.npins; i++) {
>  		name =3D pin_get_name(pctldev, grp->data.pins[i]);
> -		ret =3D s32_regmap_read(pctldev, grp->data.pins[i], &config);
> -		if (ret)
> -			return;
> +		s32_regmap_read(pctldev, grp->data.pins[i], &config);
>  		seq_printf(s, "%s: 0x%x\n", name, config);
>  	}
>  }

[Severity: High]
Is it safe to remove the return value check for s32_regmap_read() here?

If s32_regmap_read() fails, it returns a negative error code and leaves
config unmodified. Because config is an uninitialized local variable, this
could leak kernel stack memory to userspace via seq_printf().

[ ... ]
> +static const struct regmap_config s32_gpio_regmap_config =3D {
> +	.name =3D "s32-gpio",
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 1,
> +	.max_register =3D S32_GPIO_OP_SET | S32_GPIO_BANK_MASK | S32_GPIO_REG_M=
ASK,
> +	.cache_type =3D REGCACHE_NONE,
> +};

[Severity: Medium]
Should this virtual regmap configuration specify .disable_locking =3D true?

Without .fast_io =3D true or .disable_locking =3D true, devm_regmap_init()
protects the map with a mutex. When gpio-regmap registers this, it detects
the mutex and unconditionally sets chip->can_sleep =3D true.

Consumers typically expect an on-SoC MMIO GPIO controller to be fast and
non-sleeping for use in interrupt contexts. Using a mutex breaks this
assumption and might trigger might_sleep() warnings.

[ ... ]
> @@ -710,7 +1207,6 @@ int s32_pinctrl_suspend(struct device *dev)
>  	const struct s32_pinctrl_soc_info *info =3D ipctl->info;
>  	struct s32_pinctrl_context *saved_context =3D &ipctl->saved_context;
>  	int i;
> -	int ret;
>  	unsigned int config;
> =20
>  	for (i =3D 0; i < info->soc_data->npins; i++) {
> @@ -719,9 +1215,7 @@ int s32_pinctrl_suspend(struct device *dev)
>  		if (!s32_pinctrl_should_save(ipctl, pin->number))
>  			continue;
> =20
> -		ret =3D s32_regmap_read(ipctl->pctl, pin->number, &config);
> -		if (ret)
> -			return -EINVAL;
> +		s32_regmap_read(ipctl->pctl, pin->number, &config);
> =20
>  		saved_context->pads[i] =3D config;
>  	}

[Severity: High]
Can this save uninitialized stack garbage into the suspend context?

By removing the error check, if s32_regmap_read() fails, the uninitialized
config variable is stored in saved_context->pads[i] and will be written
back to the hardware during system resume.

[Severity: High]
Does this suspend/resume implementation also need to save and restore the
PGPDO (Parallel GPIO Pad Data Out) registers?

Currently, only the MSCR configuration (direction/pull state) via
mem_pin_ranges appears to be saved. If power is lost during suspend, the
PGPDO registers will reset to 0. Any GPIO configured as an output and driven
HIGH before suspend might glitch LOW upon resume since its output line
value is lost.

> @@ -736,7 +1230,7 @@ int s32_pinctrl_resume(struct device *dev)
>  	const struct s32_pinctrl_soc_info *info =3D ipctl->info;
>  	const struct pinctrl_pin_desc *pin;
>  	struct s32_pinctrl_context *saved_context =3D &ipctl->saved_context;
> -	int ret, i;
> +	int i;
> =20
>  	for (i =3D 0; i < info->soc_data->npins; i++) {
>  		pin =3D &info->soc_data->pins[i];
> @@ -744,10 +1238,8 @@ int s32_pinctrl_resume(struct device *dev)
>  		if (!s32_pinctrl_should_save(ipctl, pin->number))
>  			continue;
> =20
> -		ret =3D s32_regmap_write(ipctl->pctl, pin->number,
> -					 saved_context->pads[i]);
> -		if (ret)
> -			return ret;
> +		s32_regmap_write(ipctl->pctl, pin->number,
> +				 saved_context->pads[i]);
>  	}
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602080132.3256=
239-1-khristineandreea.barbulescu@oss.nxp.com?part=3D5
