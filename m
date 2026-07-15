Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E0E175A9C
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 07:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784100600; cv=none; b=psorCINI5de8DfTY22SS1BR6qq4aoDDQdw0P20cKMkPQahxab/1iVjkfFMjbR15Xe7ijWl7Ins9kEHx8O+TJjNRfi3KNDtaaF3I1DmLPmMGxjLTo7PNGDf1UMcHge0DpQnMuGKrAjnL2yYee00xaWth3N0dJkb10s+sEPsBCDzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784100600; c=relaxed/simple;
	bh=uzhnKonygJZsdDv/B5u+cyzPGpGCZeMGo18uOBpkWUA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CKHgGxolrgdMMr/lj2PfHwHQY7jTZV43azD4k4EyNVaGos/tq2dFPZ/EUuB78SvMwEeJCMdI9LW0vSrDzkuYfIr83C/34rErNUArxZtnK3RvZ1IlHddHyTDlxVJmu2bMnkKP6L3oOW2Uqc4n616jtzZv7w3Cy3OK0sjSOnydWKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O53xTKu0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O53xTKu0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1404A1F000E9;
	Wed, 15 Jul 2026 07:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784100599;
	bh=FrnZ18Xvem0T/4WzLz+4Dat5qtL1RyeR8beMeg+wzyU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O53xTKu0BLFciyBRqAFYBiiAFqHA2zBmPG/3skEmaAcxRYPRgsciltQESjNHKlUak
	 tpwcPYBaFPsriJMegRvC1oYI0gwwmAVEVdGP5+HQzZV51zS8/LQ69OUuymS1+qqD3T
	 ULibQSmHxII4Nc0lqk84qiHueN5iBM3G3TKKOnFOohH2cVgoOgVWnaQw0SSW0Op1SK
	 SiWXWvRAbtUdtZq7ScFTUKF01lMTFIqlnXtkG8zInS6krIh9QTNa3i9wQXqCmEww/H
	 mmBaehw+PPrc2f3YMdQDK2A1VCHVp0tTBtGJPhQ6ZQqp/1wlP2qDa55mFqyqy6801N
	 sg4WI6hYNS1xA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/8] mmc: sdhci-esdhc-imx: use
 pm_runtime_resume_and_get() in suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260715071818.272318-7-ziniu.wang_1@oss.nxp.com>
References: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
 <20260715071818.272318-7-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 07:29:58 +0000
Message-Id: <20260715072959.1404A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked pm_runtime_get_sync() in sdhci_esdhc_imx_remove() leads =
to kernel panic on failure.
--

--- Patch [6]: [PATCH v7 6/8] mmc: sdhci-esdhc-imx: use pm_runtime_resume_a=
nd_get() in suspend ---
commit f0a062e3623dc14c66d429be48e9ae36028fd188
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: use pm_runtime_resume_and_get() in suspend

This patch replaces pm_runtime_get_sync() with pm_runtime_resume_and_get() =
in
sdhci_esdhc_suspend(). It properly returns an error if resuming fails,
preventing a kernel panic caused by accessing hardware registers when the
device is unclocked.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 6e792bee25bfa..ec531a9451c4e 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2061,7 +2061,9 @@ static int sdhci_esdhc_suspend(struct device *dev)
>  	 * 2, make sure the pm_runtime_force_resume() in sdhci_esdhc_resume() r=
eally
>  	 *    invoke its ->runtime_resume callback (needs_force_resume =3D 1).
>  	 */
> -	pm_runtime_get_sync(dev);
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;

[Severity: High]
This is a pre-existing issue, but since the commit message notes that acces=
sing
hardware registers while the device is unclocked causes a kernel panic, cou=
ld
this same panic occur in sdhci_esdhc_imx_remove()?

Looking at the device removal path:

drivers/mmc/host/sdhci-esdhc-imx.c:sdhci_esdhc_imx_remove() {
	...
	pm_runtime_get_sync(&pdev->dev);
	dead =3D (readl(host->ioaddr + SDHCI_INT_STATUS) =3D=3D 0xffffffff);
	...
}

If pm_runtime_get_sync() fails to resume the device here, execution proceed=
s to
readl() on the unclocked hardware. Should we also use
pm_runtime_resume_and_get() and check the return value in the remove path to
avoid a panic during unbind?

> =20
>  	if ((imx_data->socdata->flags & ESDHC_FLAG_STATE_LOST_IN_LPMODE) &&
>  		(host->tuning_mode !=3D SDHCI_TUNING_MODE_1)) {
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715071818.2723=
18-1-ziniu.wang_1@oss.nxp.com?part=3D6
