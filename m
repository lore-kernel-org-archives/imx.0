Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49BF35979
	for <imx@lists.linux.dev>; Thu, 21 May 2026 00:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779322851; cv=none; b=sC7X0ZyFUSVaCix0KMTG1fJ7JN+2+0DrK1L4bWDN6bBhrdKXxwyMdYQAlgejE9+mH+/kTCAdX807hlzAnSahLuwa9BzIBHJF5a8SH4GXkF6onrDnCt0FKnDi68RCWFyOYhmAu3+8Gb3ecTrPTCpoxNTYemGjnEdrPNd2Qh6QmiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779322851; c=relaxed/simple;
	bh=4xRv+KeUmJfOHMcDQwSE4m634AFfQ9398kp8aHhhp2c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ucOHscCFk2BEBviUQRHrcFf2p+WS3HQRj3DYS8PETCWo2wyB0MLCU+3k9vVxP+HKlvl5nC2RRN3GCkU5ZiLqiUabJhkxXv1FhzIn6PWrTXKvXofG3+/vWkolAT7x1E2VO9V1JvJj7j4kdICBW7sjiPjdI955ldFWdHZZcGibn7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPNFqeEM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPNFqeEM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFE81F000E9;
	Thu, 21 May 2026 00:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779322850;
	bh=zfjfq/0Wwx8kfF9HVx8zOey8T1SbdNZKf7RkyEDzmJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MPNFqeEMlkFKsOsTgES/fuTU+4l8rqoMENMt9zt2KPK/Bp3XMj1zGpu+K8go2uLEi
	 AcQO199rF/a3RBSs43oDCXFKSe5ONf6JEZaubC7DoEQchcpL1H8szn6p6fjaXLumDT
	 4D8qc5qvgiL2upi2nRZybMQghhOwBJ0RQmJtOVpYFl87ILVRkZQPlHwb5crB6pr6Pu
	 TtCClN9IHxx6MKfhrtaCHcA8ZWdn0GZwFAXXuRARmOLFZMD46LycSJhd9wo49AWsrP
	 9Y99FVYRWqLywFuJrRVIRfGHGxLqFDkCJB+hAyegitr6GgUpj6D6XIAyycDEVY4vbH
	 xXxumGfzF024A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pwm: imx27: Fix variable truncation in .apply()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronaldo Nunez" <rnunez@baylibre.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260521000054.4790-1-rnunez@baylibre.com>
References: <20260521000054.4790-1-rnunez@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 00:20:49 +0000
Message-Id: <20260521002050.4CFE81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The function uses `clkrate` as a divisor without verifying if it i=
s zero, leading to a potential kernel panic.
--

commit 1f32437ab37043997a359448a95a1484d3eb1fbd
Author: Ronaldo Nunez <rnunez@baylibre.com>

pwm: imx27: Fix variable truncation in .apply()

This patch fixes a variable truncation issue in the PWM .apply() callback
for iMX27 by changing the tmp variable to a u64. This prevents a 32-bit
overflow when calculating the period, ensuring the ERR051198 errata
workaround logic evaluates correctly.

> diff --git a/drivers/pwm/pwm-imx27.c b/drivers/pwm/pwm-imx27.c
> index 3d34cdc4a3a51..c8b801fcb5251 100644
> --- a/drivers/pwm/pwm-imx27.c
> +++ b/drivers/pwm/pwm-imx27.c
> @@ -208,6 +208,7 @@ static int pwm_imx27_apply(struct pwm_chip *chip, str=
uct pwm_device *pwm,
>  	int val;
>  	int ret;
>  	u32 cr;
> +	u64 tmp;
> =20
>  	clkrate =3D clk_get_rate(imx->clks[PWM_IMX27_PER].clk);
[ ... ]
> @@ -249,6 +250,11 @@ static int pwm_imx27_apply(struct pwm_chip *chip, st=
ruct pwm_device *pwm,
>  	val =3D readl(imx->mmio_base + MX3_PWMPR);
>  	val =3D val >=3D MX3_PWMPR_MAX ? MX3_PWMPR_MAX : val;
>  	cr =3D readl(imx->mmio_base + MX3_PWMCR);
> +
> +	/*
> +	 * tmp stores period in nanoseconds. Result fits in u64 since
> +	 * val <=3D 0xfffe and prescaler in [1, 0x1000].
> +	 */
>  	tmp =3D NSEC_PER_SEC * (u64)(val + 2) * MX3_PWMCR_PRESCALER_GET(cr);
>  	tmp =3D DIV_ROUND_UP_ULL(tmp, clkrate);

[Severity: High]
This is a pre-existing issue, but could this division trigger a kernel panic
if the clock subsystem fails to initialize or the hardware clock is
unexpectedly disabled?

Earlier in this function, clkrate is fetched using clk_get_rate(), which
might return 0 if the clock is unavailable. If clkrate is 0, using it as a
divisor in DIV_ROUND_UP_ULL() will cause a division-by-zero CPU exception.

Would it be safer to add a sanity check (e.g., returning -EINVAL if clkrate
is 0) immediately after fetching the clock rate?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521000054.4790=
-1-rnunez@baylibre.com?part=3D1
