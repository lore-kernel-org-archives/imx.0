Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114B3429CDA
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423274; cv=none; b=LeJW4FyptLh6r3hXFThp+bAL0V92WbC8TTF2FIICYGPtTyJeXa5ir1eBobGg2H7tamikaukDdcVcCeXCPARa8m4Ah5TqwhswXmOgSUly44m4nkta0wRvUCik+NkSVuCcHEZUZOVYoawUKQA1WqeBBTO2xCvvpm1ciI797BM0B6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423274; c=relaxed/simple;
	bh=uExQBrwy5DpI8bvOjQCsIAK4NMeycus1q0TxZhZmCBY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DbFdmwnbGCViW9Pq1vy3qclAzAEmoYojG7jkhbiShFVl2lKJlQ5zq7Dd2fd3zk3MwHx7cakva09SKAyWlpOsjpUH+eMJK310eBZbRmCE45/24EK4iVy6pD5co/9Ddni3WZ+vR0MNsrfXIbPGTYIlO+8oYLELWzIMVcmsaSwULQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiT89GJd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiT89GJd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278721F00A3A;
	Thu,  3 Sep 2026 08:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788423272;
	bh=IIR29wRXCYJSFaMqGo1jg556ceiIFu/+ZjzhdKK3K0c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kiT89GJd4p6mTEPwql1t6FmAGeH2ZfYvZxIIC6Yp/HYZmS7ki2FypByaBdqsRybGx
	 qJMPEuYMfeKuy8E/yv8kIpcXEDJOilmk01KW79fED2W5z+jOl6K/THPtN+rbxMdaHu
	 D8x2kNM4fLTW/ZZOfpFBB/hM2U4glV0tJKU/dGua7WtocsenSiYGw/G1i553QbryZa
	 xPWqfJVb3HaYE0JjecUxLriii4iCTFoyV/BzhyDVf5eolf3l1YEHLo5arHjPWPm1K/
	 Q9jNDtXBPOrQ53+I72WQPNTE9ztLioZrT3BgDHtUz0jayL9Zz7jq+3soq35Nmy6fLI
	 mIZz50RbQArOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] gpiolib: add get_config() and
 gpiochip_generic_get_config()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260903075940.2089367-3-mehmet.fide@gmail.com>
References: <20260903075940.2089367-1-mehmet.fide@gmail.com>
 <20260903075940.2089367-3-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 08:14:31 +0000
Message-Id: <20260903081432.278721F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The fallback stub for `pinctrl_gpio_get_config()` returns 0 withou=
t modifying the output `config` parameter, causing callers to use query enu=
ms or uninitialized memory as hardware states.
- [High] `gpiochip_generic_config()` returns 0 (success) when `CONFIG_PINCT=
RL` is disabled, silently ignoring hardware configuration requests and crea=
ting an API inconsistency.
--

commit 5e30160f0acecf52b9ebfedbbaf09c6e99e8ce08
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: gpiolib: add get_config() and gpiochip_generic_get_config()

This commit introduces a new get_config() callback for gpiochip and provides
gpiochip_generic_get_config() as the generic pin control backend implementa=
tion.
This allows a chip to read back a line's configuration, which is useful for
determining line direction when the pin controller owns it.

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ef8ccaf17c9ce..fb3ef6754a9ee 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2440,6 +2440,29 @@ int gpiochip_generic_config(struct gpio_chip *gc, =
unsigned int offset,
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_generic_config);

[Severity: High]
This isn't a bug introduced by this patch, but right above this new functio=
n,
gpiochip_generic_config() delegates to pinctrl_gpio_set_config(). When
CONFIG_PINCTRL is disabled, it skips the pin_ranges check and calls the stu=
b,
which silently returns 0:

include/linux/pinctrl/consumer.h:pinctrl_gpio_set_config() {
    return 0;
}

Does this cause hardware configuration requests to be silently ignored while
reporting success to the caller? The new getter correctly avoids this by
returning -ENOTSUPP when the backend is disabled. Should the pre-existing
setter stub also be updated to return -ENOTSUPP to ensure consistent API
behavior?

> =20
> +/**
> + * gpiochip_generic_get_config() - read back the configuration of a pin
> + * @gc: the gpiochip owning the GPIO
> + * @offset: the offset of the GPIO to query
> + * @config: the packed parameter to query, replaced by its bare argument
> + *
> + * Returns:
> + * 0 on success, or negative errno on failure.
> + */
> +int gpiochip_generic_get_config(struct gpio_chip *gc, unsigned int offse=
t,
> +				unsigned long *config)
> +{
> +#ifdef CONFIG_PINCTRL
> +	if (list_empty(&gc->gpiodev->pin_ranges))
> +		return -ENOTSUPP;
> +
> +	return pinctrl_gpio_get_config(gc, offset, config);
> +#else
> +	return -ENOTSUPP;
> +#endif

[Severity: High]
This is a pre-existing issue, but I notice this helper explicitly works
around the behavior of the fallback stub for pinctrl_gpio_get_config().=20

Since the stub returns 0 without modifying the output config parameter:

include/linux/pinctrl/consumer.h:pinctrl_gpio_get_config() {
    return 0;
}

direct callers (such as pin_control_gpio_get_direction() in
drivers/gpio/gpio-by-pinctrl.c) are left reading uninitialized memory or
query enum values as hardware states when CONFIG_PINCTRL is disabled.=20

Should the root stub in include/linux/pinctrl/consumer.h be fixed to return
-ENOTSUPP directly to prevent other callers from breaking?

> +}
> +EXPORT_SYMBOL_GPL(gpiochip_generic_get_config);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903075940.2089=
367-1-mehmet.fide@gmail.com?part=3D2
