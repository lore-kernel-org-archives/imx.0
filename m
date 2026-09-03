Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2181241E6DC
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 07:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421430; cv=none; b=josCDX5Ynjjv+tR7QWICrhuRo+XvGPCeBsidwRAYSBPn3NbvuW0NSawPnWhD6zVyunXMXWy7YHYkOIRpvDBjrcCcmyujLKnIbizqTl8gCRG5zxvkJ4djUCZhQnRNxEB1Olc58mSlyJQhXnGbX24dSplvkU/Gc/3zhuUkAeOd4oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421430; c=relaxed/simple;
	bh=rbrPljI9rbpmeogOCg7pO3Hx76jHX6oXnC38YQkx6Rg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TD3ZnBw73AwW6fUgjHCWDN5zVbUf7P2xwdc8xF/Yj1JY6MKpWd4XNuJGik1O4Kf++1t5xTFAUY1uwsemSQ5qU2bJ0IxAQfVFEtl5l1OLjOcJbnhWqK76rOcRHF9U/JlwAxdEC+flSDRhnEnqwm1b03i4LmyvTMH8yeBMilmFo8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/NRNKyW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/NRNKyW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2DF1F000E9;
	Thu,  3 Sep 2026 07:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788421428;
	bh=LNzgMWU5EC+YkV6+QV3yh2zmUUEM7nyZ3f5IUo5WGLc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U/NRNKyWxKNJYzmw0FGHA4IDG3FX07hCLAU71PJqu14Mg0jvg+jSQSV+GAKk5O2f6
	 nsHDhwkCvF5524LaeONj1fkfRimMQ0hhFyTp61pa82YkmM9/B+ds2dMoS5j0Ph8dU4
	 A0/4boa+Byd8iaO8NYl/VIGaOCSV8uO088b90yzi06t7Jvcu9VON2zWulGWSxLK+B2
	 Gib3VwLbOjDTuRfrcMNfZ5OUItqah4j3s/iPu6y2m0b7RvY61j1IQMf/2O1t32rQ5n
	 PmClxEUmYOLQIXpTv9KgyQVNY3LEmIVs9mdyw3VA+b0gMOxTo0tmbHrlxxePzsZa8s
	 kpdcfTCyeFSDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE
 queries from the pad register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260903073143.2068494-2-mehmet.fide@gmail.com>
References: <20260903073143.2068494-1-mehmet.fide@gmail.com>
 <20260903073143.2068494-2-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 07:43:48 +0000
Message-Id: <20260903074348.8F2DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Unvalidated `pin_id` derived from the device tree causes out-o=
f-bounds access on `ipctl->pin_regs` and `info->pins`.
--

commit b6731ac627ae87e3857c262376df8e608a934f21
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad regist=
er

This patch updates the i.MX pinctrl driver to decode generic pinconfig
parameters for input and output enable. It answers these queries using the =
pad
register bits defined for specific SoCs. This allows chips like Vybrid to
report line directions correctly to gpio-mmio.

> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/fr=
eescale/pinctrl-imx.c
> index 9a45b376d36f9..f08ef52bf4f85 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c

[ ... ]

> @@ -312,16 +313,61 @@ static int imx_pinconf_get_mmio(struct pinctrl_dev =
*pctldev, unsigned pin_id,
>  	return 0;
>  }
> =20
> +static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev,
> +				unsigned int pin_id, unsigned long *config)
> +{
> +	struct imx_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
> +	const struct imx_pinctrl_soc_info *info =3D ipctl->info;
> +	const struct imx_pin_reg *pin_reg =3D &ipctl->pin_regs[pin_id];

[Severity: Critical]
This is a pre-existing issue, but can an unvalidated pin_id derived from the
device tree cause an out-of-bounds access on ipctl->pin_regs here?

During device probe, in drivers/pinctrl/freescale/pinctrl-imx.c in the
imx_pinctrl_parse_pin_mmio() function, the pin_id is computed directly from
register values in the fsl,pins property without bounding it to info->npins:

	*pin_id =3D (mux_reg !=3D -1) ? mux_reg / 4 : conf_reg / 4;
	pin_reg =3D &ipctl->pin_regs[*pin_id];
	pin->pin =3D *pin_id;
	pin_reg->mux_reg =3D mux_reg;
	pin_reg->conf_reg =3D conf_reg;

If an improperly formatted or malicious device tree provides an excessively
large mux_reg or conf_reg, couldn't this lead to out-of-bounds memory
corruption, cascading into functions like imx_pinconf_get_mmio() which
implicitly assume pin_id is within bounds?

> +	enum pin_config_param param =3D pinconf_to_config_param(*config);
> +	unsigned int mask;
> +	u32 raw;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903073143.2068=
494-1-mehmet.fide@gmail.com?part=3D1
