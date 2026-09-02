Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A525B4A99A8
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 15:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364773; cv=none; b=uByCMXlXvtAy8NcEd05hKbQyjvHD8idPUBPoRo1DTb4pRERFW/i5C6GJLtUjZBGQybPOkgdxhY0SOCWt03KruhIoS+4kMnpvm0UAw4dPjBaEfLdosIhLE+SN2XkDJC9igqCuTbNfGIYIUxTKONSjmM2YUxagAHVE/Tv7lwQceQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364773; c=relaxed/simple;
	bh=50nl2XEV3DXCc8W6cfE/RRkCzo0dx2GKBp8EgKGjJV4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wni8swms7OcjOjOYNwNsCpzwyG9dkrpqYJRb73XmN5QsS4kjyP0tlQee1Wu0VfmDpazxjuHZNgj2y9XErk+8JqQEr5SIRxSbf88Tfs3U4KyqwTd9FSux/ZS7vP20KFNxJaOQv9M5tXRyC0lTi4Hml5piqody1On3E0q5lXA2U7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkIzb2xs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkIzb2xs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FCC1F000E9;
	Wed,  2 Sep 2026 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788364771;
	bh=0CEZhxFbbaaepRtYqDBzbriJL1kzyOEKonZu6cPNBag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dkIzb2xsxr/E7p5ufVnz9yagIYJjCe0G0dHJfaIMgO83qUn5vf+lOodjV/IghxLwQ
	 SJ4QqS8CS5brOb7lrKJ+zFYbz3KWJG3v0jjtVVfflOv1SdILmMqWDM95Que9CjvsFf
	 4IIruxEIDEzKSwHx66OCmYzgGnKBfONrgNe5VYOR3QwhQiN3zM2l4jxcOk4356lDp5
	 DI0SQ2ctKnkEiSEDf/RQSTSSUWupEW0f3bWSbmxjOJwnBAQCInWkQ3apoQuRbgSmsu
	 F6x4P49CGU8UIyBTpzmHcfd4LRPl383SuxKKN+b7At8pKvRQBrH0ffAlrNHhw011J+
	 ewOY1yVcdD1Nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE
 queries from the pad register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260902154525.4090276-2-mehmet.fide@gmail.com>
References: <20260902154525.4090276-1-mehmet.fide@gmail.com>
 <20260902154525.4090276-2-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 15:59:30 +0000
Message-Id: <20260902155931.38FCC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing bounds check for `pin_id` in `imx_pinconf_set()`, `imx_pin=
conf_set_mmio()`, and GPIO direction callbacks allows out-of-bounds array a=
ccess via malformed device tree inputs.
- [High] Missing bounds check during device tree parsing in `imx_pinctrl_pa=
rse_pin_mmio()` and `imx_pinctrl_parse_pin_scu()`.
- [High] Unprotected Read-Modify-Write (RMW) on shared general-purpose IOMU=
XC registers causes a race condition.
--

commit fdadfc4d7f207e1b65da9199ace383a6f7c5d92a
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

    pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad re=
gister
   =20
This patch updates the imx pinctrl driver to decode requested parameters and
answer PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_INPUT_ENABLE on SoCs that
declare where those bits live in the pad register. It also adds bounds chec=
king
to ensure that pin indices coming from gpio ranges do not read past the pin=
_regs
array during pin configuration gets.

> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/fr=
eescale/pinctrl-imx.c
> index 9a45b376d36f9..1bcb2f772d380 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
[ ... ]
> @@ -312,16 +313,63 @@ static int imx_pinconf_get_mmio(struct pinctrl_dev =
*pctldev, unsigned pin_id,
[ ... ]
>  static int imx_pinconf_get(struct pinctrl_dev *pctldev,
>  			   unsigned pin_id, unsigned long *config)
>  {
>  	struct imx_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
>  	const struct imx_pinctrl_soc_info *info =3D ipctl->info;
> =20
> +	if (info->flags & IMX_USE_SCU)
> +		return -ENOTSUPP;
> +	if (pin_id >=3D info->npins)
> +		return -EINVAL;
> +

[Severity: High]
This isn't a bug introduced by this patch, but since you are adding bounds
checking here, does imx_pinconf_set() also need this verification?

Without validation, a malformed gpio-ranges property in the device tree cou=
ld
translate to an invalid pin_id. Since imx_pinconf_set() lacks the
if (pin_id >=3D info->npins) check, this unvalidated pin_id could cause an
out-of-bounds array access in imx_pinconf_set_mmio():

	const struct imx_pin_reg *pin_reg =3D &ipctl->pin_regs[pin_id];

Could the same missing bounds check also cause out-of-bounds array accesses=
 to
ipctl->pin_regs in the GPIO direction callbacks like imx_pmx_gpio_set_direc=
tion()
and vf610_pmx_gpio_set_direction()?

[Severity: High]
This is another pre-existing issue, but does imx_pinctrl_parse_pin_mmio() a=
lso
lack bounds checking for *pin_id during device tree parsing?

The pin_id is derived algebraically from raw device tree properties:

	*pin_id =3D (mux_reg !=3D -1) ? mux_reg / 4 : conf_reg / 4;
	pin_reg =3D &ipctl->pin_regs[*pin_id];
	pin->pin =3D *pin_id;
	pin_reg->mux_reg =3D mux_reg;
	pin_reg->conf_reg =3D conf_reg;

If the parsed *pin_id exceeds info->npins, this uses the unverified index
directly on the ipctl->pin_regs array, leading to an immediate out-of-bounds
memory write.

Does imx_pinctrl_parse_pin_scu() have a similar vulnerability when indexing=
 the
info->pins array with an unverified pin->pin?

[Severity: High]
This is a pre-existing issue, but can concurrent driver probes cause
hardware state corruption of the shared input_reg in imx_pmx_set_one_pin_mm=
io()?

There is an unprotected read-modify-write on shared general-purpose IOMUXC
registers:

	val =3D readl(ipctl->base + pin_mmio->input_reg);
	val &=3D ~mask;
	val |=3D select << shift;
	writel(val, ipctl->base + pin_mmio->input_reg);

If two drivers concurrently request pinctrl states that share the same
general-purpose register, and the pinctrl core calls pinmux_enable_setting()
locklessly, will these RMW operations race and overwrite each other's
configurations?

> +	return imx_pinconf_get_mmio(pctldev, pin_id, config);
> +}
> +
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902154525.4090=
276-1-mehmet.fide@gmail.com?part=3D1
