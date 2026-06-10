Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4375E40962C;
	Wed, 10 Jun 2026 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098301; cv=none; b=USNWSVtVcssYtyDhCqogkeDjRvg2rJkKA9DEtJ2mApaGSqktZN6Xgo1xjFyODx8jgV/nfjzDQmUzilBewQE3lL5+kUszOiryWAEEfr4w1NvR8GuErYicoUcBnX+KNv6Ba7uo5RQv8NXHC9Ri2N5p6yEtbR6e/kOcqQmTg+qTiZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098301; c=relaxed/simple;
	bh=oQCpKhWBwtVh0JsTn6jHZVfEmGacBLddhPZQLhcEGVg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=muEg67WITjd0C8wFCx3r4Z95AFk11Fa4Dsc12TvW1BPd7EHT74Hu3olL8xHiF40FgsUrLRgXJPuuK7Rb9hlBAUl2QgZNMZBKkPi0VSQZwkEbz5KNo7Jljo8KMQ+m339kyI+ll2GR9z53Ry05u+yiq5C3IsiomatNeah7Wc4vrsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XP72TJds; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XP72TJds"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5BCF1F00898;
	Wed, 10 Jun 2026 13:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781098293;
	bh=b7UFOALwLkdbKOAb5KOEAMVb/+D5+4m/g4RcElwMfGs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XP72TJdsQyhvKE7pSULgfThZrb5ULAoo7q8JmJnREqRn84DSETgKLmslAyDT/uBcL
	 bFcCFjmWNiYVSfCF71AtOwnMgkMfyV+P/cyHYhgow1lSOngxjtKQCdsulZsf1nvGWV
	 Aa6toqj1n81LUTxpFnLpGhaoBug7bX2YZlXULDb9Bpx2Zo/b4cYASn+I7F48FBGkxh
	 I8COTVUzvxSXqO5FPPQEnaRmac/wGJVe9o1sxk2KA1QI9BcmjsjXkcLEP9r1snXsBQ
	 BRJnT27EoKsnZnxKv5rHgPQvjDqtUQ65/U/MdN/smrGUhUzesJJYAweGOJKAuam1I1
	 63f+Qm022BFFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/6] pinctrl: s32cc: add/fix some comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260610132116.1998140-2-khristineandreea.barbulescu@oss.nxp.com>
References: <20260610132116.1998140-2-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 13:31:31 +0000
Message-Id: <20260610133132.B5BCF1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Kernel-doc style comments use `/*` instead of `/**`.
- [Low] Typo 'pards' instead of 'pads' in the `struct s32_pinctrl_context` =
comment.
- [Low] Stylistic regression: capitalizing the first letter of a log messag=
e in `dev_err_probe`.
--

commit 0e69d63aa3bf617928fdc20d2e9e07024a115811
Author: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.c=
om>

pinctrl: s32cc: add/fix some comments

This commit adds and fixes some comments and print statements in the
s32cc pinctrl driver.

> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pi=
nctrl-s32cc.c
> index fe7cd641fddd0..4f88c24e62a21 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -60,6 +60,12 @@ static u32 get_pin_func(u32 pinmux)
>  	return pinmux & GENMASK(3, 0);
>  }
> =20
> +/*
> + * struct s32_pinctrl_mem_region - memory region for a set of SIUL2 regi=
sters

[Severity: Low]
This isn't a bug, but since these comments are written in the kernel-doc
format, should they begin with "/**" instead of "/*"? Using "/*" prevents t=
he
scripts/kernel-doc parsing tool from reading them and integrating them into
the generated documentation.

> + * @map: regmap used for this range
> + * @pin_range: the pins controlled by these registers
> + * @name: name of the current range
> + */
>  struct s32_pinctrl_mem_region {
>  	struct regmap *map;

[ ... ]

> @@ -79,20 +85,22 @@ struct gpio_pin_config {
>  };
> =20
>  /*
> - * Pad config save/restore for power suspend/resume.
> + * struct s32_pinctrl_context - pad config save/restore for suspend/resu=
me
> + * @pads: saved values for the pards

[Severity: Low]
This isn't a bug, but there's a typo here. Should "pards" be "pads"?

>  */
>  struct s32_pinctrl_context {
>  	unsigned int *pads;
>  };
> =20
>  /*
> + * struct s32_pinctrl - private driver data

[Severity: Low]
This is another instance where a kernel-doc style comment begins with "/*"
instead of "/**". Does this need to be updated to match the standard
documentation style?

>   * @dev: a pointer back to containing device
>   * @pctl: a pointer to the pinctrl device structure
>   * @regions: reserved memory regions with start/end pin
>   * @info: structure containing information about the pin

[ ... ]

> @@ -974,7 +982,7 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>  					    ipctl);
>  	if (IS_ERR(ipctl->pctl))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
> -				     "could not register s32 pinctrl driver\n");
> +				     "Could not register s32 pinctrl driver\n");

[Severity: Low]
This isn't a bug, but the Linux kernel coding style generally prefers start=
ing
dev_err_probe messages with a lower-case letter. Is there a specific reason=
 to
capitalize "Could" here?

> =20
>  #ifdef CONFIG_PM_SLEEP
>  	saved_context =3D &ipctl->saved_context;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610132116.1998=
140-1-khristineandreea.barbulescu@oss.nxp.com?part=3D1
