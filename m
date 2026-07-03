Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCA73BCD33
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 11:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077515; cv=none; b=bCsDi0D0zfdOyJrVgzPfut7yHx28zsjFThV+LaKowxHNHTios/Bl0QAIWtC30/V/ajXaNmlhv9uognt5XKvwrbtufE2MDPhymhCyFEWqS3Vbv+dLF3GZswF9pB5+fKssU/+rfDV2wsBX4bqYfDhBmwkVLmkB8wUounbWUyMYWLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077515; c=relaxed/simple;
	bh=NS/JUynFXuWayy4G53UXT1RT41jGJ5ghB9PmTBWRSMs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qbHtBRCL4Om0olMleGfeMXEugU6qfbPA+4xZRBpwUbhUm1H8C2NazwvldYPlxr+cmbv/EJnTiBhs3V+Mqwn3Cd5NqMJqz/7pu40IHoPF/jlQ6eMYcOv5y7kWT67BgT0F7xJUZWRM03xYEJDp34Fr1Bc9AI1t1grJw6Hm7mpik+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkrirDRH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkrirDRH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0931F000E9;
	Fri,  3 Jul 2026 11:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783077514;
	bh=O/+gGkG28E4JMviuIuqhzRMuotCRP9w+57KcqxvFojM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KkrirDRHv+9tTMGBoZXFfQkeRglY/oQtmioSx5l/37yyjFBocOqIyzA5fIfSSMuAu
	 314xOHeVe2cHKcKZSTslPrF3xAF6uXQyj1kKLFbeu6pQ8uAvJaeLqjx5JEcXhP840s
	 Wm0Vqy81RENBHv4emLIad6ON4OgHxJyJmoyWS+RJdT5Pd5EyeKHvGqB9RA60KF8qOR
	 xpMjDDqCXMaQJXYM6RqaxGj+5/WPGmSpEvtYQk0CQERbPgU0lrYKfBawdQAdaoiGJd
	 cyDJcJFtr+iZ/xhvC9u8DVEAxmpARuKrQWTAVrtgZ9i+xjl4UyDJ72vSl7CZVSXu0D
	 V6FQjrxEQJWGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] mmc: sdhci-esdhc-imx: use
 pm_runtime_resume_and_get() in suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260703104208.3426374-6-ziniu.wang_1@oss.nxp.com>
References: <20260703104208.3426374-1-ziniu.wang_1@oss.nxp.com>
 <20260703104208.3426374-6-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 11:18:33 +0000
Message-Id: <20260703111833.CE0931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked `pm_runtime_get_sync()` in `sdhci_esdhc_imx_remove()` ca=
n lead to unclocked hardware register access and a kernel panic.
--

commit 27f08d0dd0a0d98186f1636e70aa4e0a00112c22
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: use pm_runtime_resume_and_get() in suspend

This patch replaces a call to pm_runtime_get_sync() with
pm_runtime_resume_and_get() during device suspend to simplify error handlin=
g.
It ensures that if the resume fails, the driver returns immediately instead
of proceeding to access unclocked hardware registers which would cause a
kernel panic.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index ade99dabdb5fd..30aef7bc1fc67 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2059,7 +2059,9 @@ static int sdhci_esdhc_suspend(struct device *dev)
>  	 * 2, make sure the pm_runtime_force_resume() in sdhci_esdhc_resume() r=
eally
>  	 *    invoke its ->runtime_resume callback (needs_force_resume =3D 1).
>  	 */
> -	pm_runtime_get_sync(dev);
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;

[Severity: High]
This is a pre-existing issue, and not a bug introduced by this patch, but
since you are fixing unchecked runtime PM calls here, could a similar panic
happen during device removal?

Looking at sdhci_esdhc_imx_remove(), there is an unchecked call to
pm_runtime_get_sync() right before reading from the hardware:

sdhci_esdhc_imx_remove() {
    ...
    pm_runtime_get_sync(&pdev->dev);
    dead =3D (readl(host->ioaddr + SDHCI_INT_STATUS) =3D=3D 0xffffffff);
    ...
}

If the runtime resume fails in the removal path, the clocks would remain
disabled.

Would the subsequent readl() trigger a bus fault for the same reason?=20

Should we add error handling or switch to pm_runtime_resume_and_get() in
sdhci_esdhc_imx_remove() as well?

> =20
>  	if ((imx_data->socdata->flags & ESDHC_FLAG_STATE_LOST_IN_LPMODE) &&
>  		(host->tuning_mode !=3D SDHCI_TUNING_MODE_1)) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703104208.3426=
374-1-ziniu.wang_1@oss.nxp.com?part=3D5
