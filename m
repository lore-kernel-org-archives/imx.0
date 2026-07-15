Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9893C2788
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 07:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784100488; cv=none; b=o4Ui1m3UWuZefq96Zc3dPLFBVkGUOkmxHqrUoHlFuTeG0WzdTEnVWcm9vGG31INQEujKjwe4EAbHY5pJvTmyn3VtK+/sRfMWfSYeJsJoI3fgVXFfIMcvrnHqscMd2mZa18Ucbla2kEnsypSpWrpfgBggjy+yXXPLgnLgwVef0l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784100488; c=relaxed/simple;
	bh=RsnH7esBwlHJ2o214Cd2HcGwXsgZztue8eNGCE1/7pw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ldNBXTWKcnV29NNwN1APGIhIHLEIz1+bs6Y8dWFXS6b/DsLjgdDAIZB0C8/xa7KIgNsDjJtMy4x6f/PGcz/HMxTv4URf1nYhrlyl5KGBMykrqyOmU1nRlSaCpzBqSvX+kvSuQ4OTOtmd/hLAzernV7p6otHHNgR6f90SKNWlac0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSHR7KYm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSHR7KYm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0DE1F000E9;
	Wed, 15 Jul 2026 07:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784100479;
	bh=ZV100NZH6fYlsHFcwq/W0reU7zzXlUUN8LJv2e9DhwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aSHR7KYmUwFN6UuTBNJ2xpWC7KBMWbzP8pchc1PPXyDjFXFKdsPHzBjaELLAEcOA0
	 xiSL3qn5rbomyjiJx8v0ST1Bm7MwQido8Vwx/n9FnFNwvGuiiMDN24J1iNZwI1d/X2
	 Bb10RtvgpXrC5XYdcAvfESppLqZY8OsSdbdAZys/n1PmBtPDAlUuXxa60OaE/6l/xI
	 Fa80TQoSCw8kDqiCrQKWPTPsHqpg5xY5lXXeVkLMnoWdn5JrOdvH2/6t25HwtXAYXe
	 JKeTxgdm8bWnaJZHVZx5qaIuHjis9MoAmbGddYhijk/hJdPUBNRz9RxRF6Mca3RJpz
	 /4kZfyJMnIUwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/8] mmc: sdhci-esdhc-imx: make non-fatal errors
 non-blocking in suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260715071818.272318-8-ziniu.wang_1@oss.nxp.com>
References: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
 <20260715071818.272318-8-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 07:27:58 +0000
Message-Id: <20260715072758.EF0DE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The return value of `pm_runtime_force_suspend()` is ignored during=
 system suspend, which can cause a kernel warning and a potential fatal cra=
sh on system resume if the suspend operation fails.
--

--- Patch [7]: [PATCH v7 7/8] mmc: sdhci-esdhc-imx: make non-fatal errors n=
on-blocking in suspend ---
commit 343530f069b563d297215c212283dc394ffae3fd
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: make non-fatal errors non-blocking in suspend

This commit modifies the suspend path to ensure that failures from certain
wakeup and pinctrl functions do not block the system suspend process. It
accomplishes this by treating these failures as non-fatal warnings and
always returning success.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c

[ ... ]

> @@ -2108,7 +2107,7 @@ static int sdhci_esdhc_suspend(struct device *dev)
>  	 */
>  	pm_runtime_force_suspend(dev);
> =20
> -	return ret;
> +	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but is it safe to ignore the return value of
pm_runtime_force_suspend() here?

If the driver's runtime suspend callback fails (for instance, due to a
cqhci_suspend error), pm_runtime_force_suspend() will return an error and
leave the device in the active state.

By returning 0 regardless of whether pm_runtime_force_suspend() succeeded,
the PM core is led to believe the device suspended successfully. On system
resume, pm_runtime_force_resume() would see the device is still active and
skip calling the runtime_resume callback.

Since the runtime_resume callback enables the clocks, skipping it means the
subsequent call to sdhci_esdhc_imx_hwinit() will attempt to access hardware
registers without clocks enabled. If the power domain was turned off during
sleep, wouldn't this unclocked register access trigger a synchronous extern=
al
abort and kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715071818.2723=
18-1-ziniu.wang_1@oss.nxp.com?part=3D7
