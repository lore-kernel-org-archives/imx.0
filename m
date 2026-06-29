Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FF83B7754
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727035; cv=none; b=t1n+141z1jYzJZ3IoI4t3mpdVRKgHY1zkwMwy2UpNLfLC6SFVmfgp+VE2TdEG7Jclr93U4mgMnVWX1oeR7wEM/VpYDlyvWtjcH1idNrRdke4eVKsske53vSkXOeDrqlDuFGVaIudPTuJ4XopF6TRWPnzk8wnVynzE8QIbKSVyYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727035; c=relaxed/simple;
	bh=9Td49V0zrDndLtVEThOBbOJAGJaN4gnHn2fSnzaNBNI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y11wJ9R6c7PnNOLgtU/Wd8MwOJaBwi9RUl8Uov8FBy2Qc72zLvbw2y2Exba6Vlss5qNfOPEEOZ1pVW4+CHC4YPz313Xw6NmzO/5d2o9Wv+/mv9bxbzGomCrx1UJ6CviwDvZRihLjMGyA2BN2NzEg99ZKy7mtPz34eY+me5EX1ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gd4nk/rA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gd4nk/rA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEFC1F00A3A;
	Mon, 29 Jun 2026 09:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782727034;
	bh=jezoQzqSceJfGC3lqbZ9dcJluYkzJNsAOiIzpzDnkSs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gd4nk/rAPGhYBGEMHAOvBxnhXxGduoMAImu2TLDCvGcUAcF1YejMzsU//37mt2v3E
	 eoR5RoLJmYyiAmJfzpdsNFkUxiZyI9wU9N/S1soHTTQdILfd8e9l6KbHTi4t1Q2s+X
	 CIQWjhd2s0kJYO68tsrKXUlLNovSnBovKimv7hBr60qzVk14aqxr9EJXxnDTFhwHRk
	 yF9HPRU3E2Yer+BjXfMyXmyw0dUVrWmBKBU3GuatWUDg55TJjmDN18TPZDPddXnoZY
	 yaCjtISCSTTg9PYvFGSH2qkMc09fVMJZIkOpVHjqyce4eD6lzgWqI9lx2RUUOwD0v/
	 WQOov1db8R9IA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] mmc: sdhci-esdhc-imx: make non-fatal errors
 non-blocking in suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260629091954.3227151-7-ziniu.wang_1@oss.nxp.com>
References: <20260629091954.3227151-1-ziniu.wang_1@oss.nxp.com>
 <20260629091954.3227151-7-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 09:57:13 +0000
Message-Id: <20260629095714.0FEFC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Early return in sdhci_esdhc_resume() upon pm_runtime_force_resume(=
) failure leaves PM usage counter leaked and IRQ permanently disabled.
--

commit 61953c1fd047583f443719985f25bd317c4b2b1b
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: make non-fatal errors non-blocking in suspend
   =20
Make pinctrl_pm_select_sleep_state() and mmc_gpio_set_cd_wake() failures
non-fatal in the suspend path to ensure they do not block system suspend.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 97ee3f933bda7..abee3d7a07a36 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c

[ ... ]

> @@ -2107,7 +2109,7 @@ static int sdhci_esdhc_suspend(struct device *dev)
>  	 */
>  	pm_runtime_force_suspend(dev);
> =20
> -	return ret;
> +	return 0;
>  }
> =20
>  static int sdhci_esdhc_resume(struct device *dev)

[Severity: High]
This is a pre-existing issue, but does the early return inside
sdhci_esdhc_resume() leave the IRQ permanently disabled and leak the PM
usage counter?

During sdhci_esdhc_suspend(), the driver increments the PM usage counter and
disables the IRQ:

    ret =3D pm_runtime_resume_and_get(dev);
    ...
    disable_irq(host->irq);

If pm_runtime_force_resume() fails later during sdhci_esdhc_resume(), the
function returns immediately:

    ret =3D pm_runtime_force_resume(dev);
    if (ret)
        return ret;

Does skipping the corresponding enable_irq() and pm_runtime_put_autosuspend=
()
calls leave the controller in an unusable state and prevent future runtime
PM transitions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629091954.3227=
151-1-ziniu.wang_1@oss.nxp.com?part=3D6
