Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669673F6C4B
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 08:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226866; cv=none; b=txfwPBDKoIkUjiU/Df/IP/BzffkNqYQ3zi0DUgQjnM70lguHTvoktnWHKscrGtLkQePWieW07YrqSisD8DmQwonlThDWrTV1q1IP0+XCQ2fJ5PvF9OL1q9NntHvAGI+oqdILuT41s8ckq5yUT/UZOTcSZy1MTNR1wErU/mxEW78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226866; c=relaxed/simple;
	bh=pcXQQNP4q73BqwJldYZv8tDhTVk0+5tWl/r+eJhFIpE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UORX54XP8EjbYAsMCpEUM+4aT4U/3tIxooobfSCSfSuGwcsPtTjqrwo/V2JfAFvtYjB4maL1Cd1MeMGHjSjuUIbLh9mLgq8JgiMVZhaiswuU6RUCwm0XJcUOKe1HleFcqPhFX8h9xdo/aIxsl4r4FyS8QIUmJvUvHDVA4KVRYZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnFUHd6K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnFUHd6K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE14F1F00ACA;
	Tue, 28 Jul 2026 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785226865;
	bh=CkJWpHeGz/FMT7RVYbHdHw2b2jYwDBv5FuJWA2wrtoc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OnFUHd6KyFh0zusDF8kS1KWgsiVrDMvPesOGBUc0aytzZ15a5F6kNIC5xaR8Pguts
	 DZfSyOPixp7Xkt2P9N32YDtcZaafG88wqqlVaBwuIiLruZFckl4L0IRD6AK6R21cBJ
	 YQvtBOza1n+ACAj9OTfW4Tn/2MyMfelPsScUEKDesCLFb0Y64bgaBhT72hmgHIDZqE
	 H8ayJukrY9oEfwBEmI1efUAPuO/e9COhUztDV9PpcaDuuSJ+cLTDYtAEhW373QRPO+
	 T3Gux3ZSVcZa5tGT4/P/Xs6LByuo20/1ldYiHOzL4xWFBkjkEYQbkuYGbQH+qgl4nd
	 uFIFeBQAujjAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] spi: nxp-fspi: use devm runtime PM enablement
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiawen Liu" <1298662399@qq.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <tencent_D07D657D7D49113424BFAEA7931F60DB2F06@qq.com>
References: <20260728080443.153827-1-1298662399@qq.com>
 <tencent_D07D657D7D49113424BFAEA7931F60DB2F06@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 08:21:04 +0000
Message-Id: <20260728082104.BE14F1F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing pm_runtime_disable() from nxp_fspi_cleanup() while keepin=
g manual clock disablement causes a deterministic double clock disable (ref=
erence count underflow) on driver unbind and probe error paths.
--

--- Patch [1]: [PATCH v2 1/3] spi: nxp-fspi: use devm runtime PM enablement=
 ---
commit 274e174a430a74bbdd5c40d6aaca37aea56ac764
Author: Jiawen Liu <1298662399@qq.com>

spi: nxp-fspi: use devm runtime PM enablement

This commit replaces open-coded runtime PM enablement with
devm_pm_runtime_enable() and uses PM_RUNTIME_ACQUIRE_AUTOSUSPEND() to
simplify the error path and avoid leaving runtime PM state behind on
failure.

> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> index 1e36ae084dd86..6be78712b5343 100644
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c
> @@ -1275,7 +1275,6 @@ static void nxp_fspi_cleanup(void *data)
>  	/* disable the hardware */
>  	fspi_writel(f, FSPI_MCR0_MDIS, f->iobase + FSPI_MCR0);
> =20
> -	pm_runtime_disable(f->dev);
>  	pm_runtime_put_noidle(f->dev);
>  	nxp_fspi_clk_disable_unprep(f);

[Severity: High]
Does removing pm_runtime_disable() here cause a double clock disable
during driver unbind or late probe failure?

When devres executes nxp_fspi_cleanup(), it drops the usage count via
pm_runtime_put_noidle() and manually disables the clocks with
nxp_fspi_clk_disable_unprep(). However, the device remains in the
RPM_ACTIVE state.

Later in the devres cleanup phase, the action registered by
devm_pm_runtime_enable() executes and clears autosuspend. Because the PM
usage count is 0 and autosuspend is now disabled, the PM core
synchronously transitions the device to RPM_SUSPENDED by executing the
driver's runtime suspend callback.

Will the runtime suspend callback then blindly invoke
nxp_fspi_clk_disable_unprep() a second time, triggering a clock reference
count underflow?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728080443.1538=
27-1-1298662399@qq.com?part=3D1
