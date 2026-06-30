Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55354192EE;
	Tue, 30 Jun 2026 13:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825749; cv=none; b=cOyQfGsp5xZ/ZKOU0LEDCSZDUmvujvZNnlWfddK+DLuFOjaBNFefwsOHsRT4Kfog4o9n0v9l3fHk8QaTcKsLk25cWIUj9VuxQ6HNva5X03wO+JKkckduwMHyk6fEOXoHQJLTwmIY4ALjUTvbS8AHxDeJbxWvcs1NkkcjUAVriLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825749; c=relaxed/simple;
	bh=Km/nPMavhXNUT8aZ7J55FPdRewGazMX2kAVRJN2HCso=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EJOzj2cXShgvJ29jxiHbYIUF+cBUcgZODtRHAXls6AvVB0LrbX9ACgF7zs2jV5SRNHdQgevy58wq3aFqaVzj4YEdwdsEPiTmmiS2VpLop3YDPkgOq+1TOaw28rabMJz02JBOvY9cGNdhvD686g0e1P37UtbB7OqD4Dbh31jDE/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXw2px8m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXw2px8m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFC11F00A3A;
	Tue, 30 Jun 2026 13:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782825747;
	bh=ujZhXBSXfj/9VrlLrSIS4Z90OF8oiVFp8/8nI29g8B0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aXw2px8mXWgtXftha/zROiNkPJxxDdLR3mfnWONh1WNoDzx4Pn4TanVFl/lhvNUMb
	 YF9xxO/6Lg+SPvxMwW5gKIxpNlllAFGgSABTU2OBTV/yEqkqo8ZxExDT+61VkFWZcC
	 ZEANVNsmZKBpAJp4IXRvKGfybLCaR6nXGxUqKclUqxTNiki9WrEbmZ37a5NduEIjs6
	 W8+m4QW/8ooGCjYzP0T2p+BKgJffGAU1MuTCySCdWqV3goJ3MDFHNHRDb9MZsjLxov
	 QhcyFXy/OjKf7b/pkDAbozLBGLzbxfRcowgcUCiHz5iLpP0Dj1Yh1gpqcz7oCvoXOZ
	 LHfbJNywI/9tQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 5/6] pinctrl: s32cc: implement GPIO functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260630125403.546375-6-khristineandreea.barbulescu@oss.nxp.com>
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260630125403.546375-6-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 13:22:27 +0000
Message-Id: <20260630132227.6DFC11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The GPIO output data registers (PGPDO) are not saved or restored d=
uring system suspend/resume, which will cause active GPIO outputs to glitch=
 or lose their state upon resume.
- [High] The pinctrl device is exposed to the system via `pinctrl_enable()`=
 before the newly added GPIO initialization is complete, creating a race co=
ndition if probe fails.
--

commit bb28a701f031ec673e77d3ce510a41fe2c84ffb3
Author: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: pinctrl: s32cc: implement GPIO functionality

The commit implements GPIO data access and direction handling using the
gpio-regmap library backed by a virtual regmap. It translates the
gpio-regmap register model to the underlying SIUL2 registers (MSCR,
PGPDI, PGPDO) and uses existing pinctrl GPIO callbacks for request/free
paths. Both legacy and extended DT layouts are supported.

Link: https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristine=
andreea.barbulescu@oss.nxp.com/T/#m543c9edbdde74bdc68b6a2364e8b975356c33043
Link: https://lore.kernel.org/all/20260504131148.3622697-7-khristineandreea=
.barbulescu@oss.nxp.com/

> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pi=
nctrl-s32cc.c
> index b9b757e28bff4..35e2f8a18ef23 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c

[ ... ]

> @@ -721,7 +1249,7 @@ int s32_pinctrl_suspend(struct device *dev)
> =20
>  		ret =3D s32_regmap_read(ipctl->pctl, pin->number, &config);
>  		if (ret)
> -			return -EINVAL;
> +			return ret;
> =20
>  		saved_context->pads[i] =3D config;
>  	}

[Severity: High]
Does this code miss saving the GPIO output data registers (PGPDO)?

Currently, only the MSCR pad configuration registers are saved. When the
system enters deep sleep and the SIUL2 hardware block loses context, the
GPIO output states would be lost.

[ ... ]

> @@ -745,7 +1273,7 @@ int s32_pinctrl_resume(struct device *dev)
>  			continue;
> =20
>  		ret =3D s32_regmap_write(ipctl->pctl, pin->number,
> -					 saved_context->pads[i]);
> +				 saved_context->pads[i]);
>  		if (ret)
>  			return ret;
>  	}

[Severity: High]
Will restoring the pad configurations without restoring the PGPDO registers
cause active GPIO outputs to glitch?

Since restoring the MSCR registers enables the output buffer, but the PGPDO
registers were not restored, GPIOs configured as outputs might drive a logic
level of 0 upon resume regardless of their previous state. This could
potentially break external peripherals.

[ ... ]

> @@ -995,7 +1535,42 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "Failed to enable pinctrl\n");

[Severity: High]
Could exposing the pinctrl device before completing GPIO initialization cau=
se
a use-after-free race condition if probe fails?

pinctrl_enable() makes the pinctrl device globally visible in pinctrldev_li=
st.
If a concurrent consumer acquires a reference to it, but a subsequent GPIO
initialization step fails:

> -	dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
> +	/* Setup GPIO if GPIO ranges are defined */
> +	if (!soc_data->gpio_ranges || !soc_data->num_gpio_ranges)
> +		return 0;
> +
> +	ret =3D s32_gpio_get_ngpio(soc_data, &ngpio);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Invalid GPIO ranges\n");

[ ... ]

> +	ipctl->gpio_rgm =3D devm_gpio_regmap_register(&pdev->dev, &gpio_cfg);
> +	if (IS_ERR(ipctl->gpio_rgm))
> +		return dev_err_probe(&pdev->dev,
> +				     PTR_ERR(ipctl->gpio_rgm),
> +				     "Unable to add gpio_regmap chip\n");

Could we be left with a dangling pointer when devres cleans up the unregist=
ered
pinctrl device on the error return path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630125403.5463=
75-1-khristineandreea.barbulescu@oss.nxp.com?part=3D5
