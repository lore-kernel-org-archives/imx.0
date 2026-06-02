Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D84233D51A;
	Tue,  2 Jun 2026 08:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387612; cv=none; b=fB412oHNu3oBSLLtn/QGIcSqgQ5Lx+PclOEFODFQAd8/LkknJMWkiR8540OdIxIJPtSHXa+BZYuMff+G5+VxGD5FqoCSQKo++0Kuy+il0SJ8GGXRzsXoOz6rQ0wE9RyMXH7CHaN9qNVaci6XODsmFc1BZAjOBfDFMs31yN10xTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387612; c=relaxed/simple;
	bh=SA3/YKlab2TVUKqjNO+G2x5l+v2KK5/dVdR8g1uIGZM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KjoCOhf/JtKTLwNk6E6pwKccQZzzsFcwhEEm1A8i/KfMrY6LI4JjycrpOaJa9xdU7vx84wCEckeZ9wQH7ZXrB95IKs37GVMKDyHg2RMOQJvENH+Zfu9G9fLw+91tQ/9vpI/HlnPH5dgDWsF89Rv+YSi6CPw8vC5vLLAjRkPVsyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flu+JdQb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flu+JdQb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC861F00893;
	Tue,  2 Jun 2026 08:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780387610;
	bh=B+QTt9O0bWTfpiutZRk92oLuXwC7p/addxsH7yIaxBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=flu+JdQbRAlqXvaahphORXLBZ9mJYP/UqV7o09tL50QE6EgL49J7ZLc1goWcuI8hR
	 82gtosU99AH+fdPFqGbk7oxuKm+Qn2+vBocvcoPfrHb4M5iuXqwCpaeQ3uD5EQuqtg
	 UFR+zlF6LDQpOwyeKjQeXcUCLxObKtnW2HJSjh8hK0xAZJKHIRnjsXXyrM8dabSN/3
	 PYLXBwIHOFXXyRlVGTAfzyqmJm240ph/NxHEFgf4u/N+6Dwtn7qxK5+G63oLD0uDaG
	 zB6CldykVm6Kl9a9VeTyDEy884gYD/rXafNUyk0TxQ1WlLgxW4zmH/XuTGErGzGGlK
	 SAdZchAOAvVpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/6] pinctrl: s32cc: add/fix some comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260602080132.3256239-2-khristineandreea.barbulescu@oss.nxp.com>
References: <20260602080132.3256239-2-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 08:06:50 +0000
Message-Id: <20260602080650.8EC861F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Typo in the newly added documentation for `struct s32_pinctrl_conte=
xt`.
- [Low] Invalid kernel-doc comment block syntax.
- [Low] Inconsistent error message capitalization.
--

commit a7822dc8d9c7d5010c39b80aee179b5ec0735e03
Author: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.c=
om>

pinctrl: s32cc: add/fix some comments

Add/fix some comments and print statements.

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

[Severity: Low]
This isn't a bug, but should this start with /** instead of /*?

The newly added comment for struct s32_pinctrl_mem_region follows the
kernel-doc format, but because it begins with /* rather than /**, the
kernel-doc scripts will likely ignore it.

> + * struct s32_pinctrl_mem_region - memory region for a set of SIUL2 regi=
sters
> + * @map: regmap used for this range
> + * @pin_range: the pins controlled by these registers
> + * @name: name of the current range
> + */
>  struct s32_pinctrl_mem_region {

[ ... ]

> @@ -67,7 +73,7 @@ struct s32_pinctrl_mem_region {
>  };
> =20
>  /*
> - * Holds pin configuration for GPIO's.
> + * struct gpio_pin_config - holds pin configuration for GPIO's

[Severity: Low]
This isn't a bug, but this comment also follows the kernel-doc format
without starting with /**. Should it be updated to /** so it can be picked =
up
by the documentation tools?

>   * @pin_id: Pin ID for this GPIO
>   * @config: Pin settings
>   * @list: Linked list entry for each gpio pin

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
This isn't a bug, but there's a typo here (pards instead of pads).

Additionally, this comment block also lacks the /** prefix required for
kernel-doc.

>   */
>  struct s32_pinctrl_context {
>  	unsigned int *pads;
>  };
> =20
>  /*
> + * struct s32_pinctrl - private driver data
>   * @dev: a pointer back to containing device

[Severity: Low]
This isn't a bug, but this comment block is also missing the /** prefix.

>   * @pctl: a pointer to the pinctrl device structure
>   * @regions: reserved memory regions with start/end pin

[ ... ]

> @@ -974,7 +982,7 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>  					    ipctl);
>  	if (IS_ERR(ipctl->pctl))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
> -				     "could not register s32 pinctrl driver\n");
> +				     "Could not register s32 pinctrl driver\n");

[Severity: Low]
This isn't a bug, but does changing "could" to "Could" break consistency
with the rest of this file?

Other error messages in s32_pinctrl_probe() start with lowercase letters
(e.g., "wrong pinctrl info", "fail to probe dt properties"). Should this be
kept lowercase to match the rest of the file and standard kernel practice?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602080132.3256=
239-1-khristineandreea.barbulescu@oss.nxp.com?part=3D1
