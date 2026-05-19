Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B819F3B4EA5
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189317; cv=none; b=eAybZAIXY3GlToVBDYMx7GLGMVSHEoSEyM9zUDWdIxBG5hOIzH/P1nGh5KoH2Bc9RYozI1tctbrLCI7xCSJashpafqns7y8qvEe0nBG0WN/ExThP5+3Vh37nW07FjTaly9JaL0jnseiUHOD+peu+K0kCivRRddeS1SpfnBHzw3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189317; c=relaxed/simple;
	bh=YEWr3tHXty/Tty+EHyMIeZQMdq98VwWL9dnE5SvAzkg=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eyFKc2YH+7zv8s6ZflL+WTQSMpnnnuleLS9KXN+xxCXLumMrBrwB0F7YjfvA31QqdeDJZWtQlhJu4LrxQ7pu1JtqxMHY2PTQnll2w52FbFiDKPlA2XHmLOTG/O7BzbsaUW555tqVdb0rSzsbW6jaifFuUK/N8A0MMcVA53fucR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TyJKcPZA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TyJKcPZA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36699C2BCB3;
	Tue, 19 May 2026 11:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189317;
	bh=YEWr3tHXty/Tty+EHyMIeZQMdq98VwWL9dnE5SvAzkg=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date:From;
	b=TyJKcPZArRbXEBWkftCTmHmeNHiXx5eCl9157smUjHcR1tY3W62kBD42AxAhO90FE
	 Kd0CGKWwlSD5HwCKGw/gbp1N71XDUK78FarEeTFeZOz10KOi5uCK8j2QY7zAjCZMi6
	 yjJ37vxUV4tNsP7zYIuSxxXUBUTuURxB6SzROlwOJJNNV+HNxxSjBoopWkLoZALutU
	 EiVmm3X2qze46yXAITd5P/A2IyHgm7m3Mx1gfRcs+W1ulsRpktC1IDvR/iAhZh2Qs7
	 oLWGL3RbPZpbqqQQToRljGOuo/wk6VJ7YqIuK2fRrNMQzbah8STLOhgckUbWvn+hF7
	 HJNUTtA0vI/3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: mark I2C adapter when hardware is
 powered down
Reply-To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260519104106.2794103-1-carlos.song@oss.nxp.com>
References: <20260519104106.2794103-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:15:16 +0000
Message-Id: <20260519111517.36699C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect ordering of adapter suspension and hardware power-down c=
reates a race condition leading to deadlocks and kernel panics.
--

commit 4f51dfc32f43d5578829b4cc2fac1f8c956c3ca8
Author: Carlos Song <carlos.song@nxp.com>
Subject: i2c: imx-lpi2c: mark I2C adapter when hardware is powered down

This commit updates the suspend and resume routines to mark the I2C
adapter as suspended or resumed. This is intended to block transfers
while the hardware is powered down and prevent hangs.

> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index a01c236964819..bf8c1ce1c7ff0 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -1635,7 +1635,16 @@ static int __maybe_unused lpi2c_runtime_resume(str=
uct device *dev)
> =20
>  static int __maybe_unused lpi2c_suspend_noirq(struct device *dev)
>  {
> -	return pm_runtime_force_suspend(dev);
> +	struct lpi2c_imx_struct *lpi2c_imx =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_force_suspend(dev);
> +	if (ret)
> +		return ret;
> +
> +	i2c_mark_adapter_suspended(&lpi2c_imx->adapter);

Could this ordering cause a deadlock and external abort if an I2C transfer
is currently active during suspend?

When pm_runtime_force_suspend is called, it disables the controller clocks.
If a transfer is ongoing, the hardware will stop responding and the
transfer will hang waiting for a completion timeout.

Then, i2c_mark_adapter_suspended attempts to acquire the root adapter lock,
which is still held by the hanging transfer, causing the suspend path to
block.

When the hung transfer eventually times out, its error handling path will
try to reset or abort the transfer by writing to the hardware registers.
Since the clocks were already disabled by pm_runtime_force_suspend,
wouldn't accessing these registers trigger a synchronous external abort
and panic the kernel?

Should i2c_mark_adapter_suspended be called before pm_runtime_force_suspend
so it can safely acquire the bus lock, wait for active transfers to finish,
and reject new transfers before the hardware is powered down?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519104106.2794=
103-1-carlos.song@oss.nxp.com?part=3D1
