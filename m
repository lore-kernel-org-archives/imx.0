Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99873F65EA
	for <imx@lists.linux.dev>; Tue,  7 Jul 2026 11:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422773; cv=none; b=DQg2mCoFvrw/zOesxnjKpV9mv+apUv8WLzyrLJoJ/NbFlxYFl/EWLLSwR5kXl6PWIf8wJkU+veKVdcmHSfdOK9BcNoDCmOZUHWa1I+UV549GCMu5XtqN9ecajtM4s7rJd9u0MkAixmiYQ3XGGVLYhIS2k77r8dncZadpHM6YWLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422773; c=relaxed/simple;
	bh=RBV+VdFVgYBiC02M4cD5KNOimloccn9w41l3y2Eqago=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GGgwPGeyjuK7YLXACY1D6W1KbJym9TY/19DWxJoFyw7eXghClvx7nGl8+Y6RsgBAsRsmr7vOEkGcJSvcqQCEHcG7Aa+pGy21xmCPIwXQqYvDAsfnxM48KANowMiom9BKEK6YripkWrTGLjonZImtnyLXycPymNFoPh0gugR7gi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQn/Y8rh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQn/Y8rh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38781F000E9;
	Tue,  7 Jul 2026 11:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783422770;
	bh=KgMnKplG+tQP2ffS0Fw6DJn4nZfJdIz9ZMxkZm7hbIc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VQn/Y8rhIAlp+BmU2S+HNstbIVJacvnrd3np3kQm4e4ag6AFcQdMY8/f4kdna7cwS
	 99wmwej3gM++7UXsojw8AneAabPgWSkTcOJyQQH79d0xjDxr8i0GszSzsrTclSGZa6
	 Egyv6cLpW860NgsoC60+P9ET9w98vkLNOCK0cVZZjhrgf9YlkWdMYboPi85x53hG6m
	 b4j8letVwCsE2f01MT1kAKXoeiZA94PySKVXySn+9dSUw4oAkMEijc/nquS+Ncvymi
	 eLWVCBjLAx2HQrDNSw26aR9Ma9dXPIBoJr+eiAGpgeVwV6qWtqvSegL63821JCbEHf
	 wfqZzdaEew6rg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/8] mmc: sdhci-esdhc-imx: use
 pm_runtime_resume_and_get() in suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260707110303.3779799-7-ziniu.wang_1@oss.nxp.com>
References: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
 <20260707110303.3779799-7-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 11:12:49 +0000
Message-Id: <20260707111249.F38781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The exact same unchecked pm_runtime_get_sync() bug that this patch=
 fixes in sdhci_esdhc_suspend() is present in sdhci_esdhc_imx_remove().
- [High] Ignoring pm_runtime_force_resume() failure in sdhci_esdhc_resume()=
 can lead to unclocked register access and a kernel panic.
--

--- Patch [6]: [PATCH v5 6/8] mmc: sdhci-esdhc-imx: use pm_runtime_resume_a=
nd_get() in suspend ---
commit 96d8d6ad1f0e2f2a06d51f1a48050880d936f2ca
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: use pm_runtime_resume_and_get() in suspend

Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() to
simplify error handling. pm_runtime_resume_and_get() automatically
drops the usage counter on failure, avoiding the need for a separate
pm_runtime_put_noidle() call. If it fails, the device is unclocked and
accessing hardware registers would cause a kernel panic, so return the
error immediately.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index d980dea9cad1f..7818f351a58ae 100644
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
> =20
>  	if ((imx_data->socdata->flags & ESDHC_FLAG_STATE_LOST_IN_LPMODE) &&
>  		(host->tuning_mode !=3D SDHCI_TUNING_MODE_1)) {

[Severity: High]
This is a pre-existing issue, but I noticed similar unchecked runtime PM ca=
lls
in this driver that could lead to the same unclocked register access panics
mentioned in the commit message.

In sdhci_esdhc_imx_remove(), the return value of pm_runtime_get_sync() is
ignored immediately before performing a hardware register read:

drivers/mmc/host/sdhci-esdhc-imx.c:sdhci_esdhc_imx_remove() {
	...
	pm_runtime_get_sync(&pdev->dev);
	dead =3D (readl(host->ioaddr + SDHCI_INT_STATUS) =3D=3D 0xffffffff);
	...
}

If pm_runtime_get_sync() fails to resume the device (for example, due to
clk_prepare_enable() failing) during driver unbind, it returns an error. Do=
es
ignoring this error and immediately reading SDHCI_INT_STATUS cause a
synchronous external abort that crashes the system?

[Severity: High]
This isn't a bug introduced by this patch, but a similar issue exists in the
system resume path.

In sdhci_esdhc_resume(), pm_runtime_force_resume() is called and its error =
is
ignored immediately before hardware register initialization:

drivers/mmc/host/sdhci-esdhc-imx.c:sdhci_esdhc_resume() {
	...
	pm_runtime_force_resume(dev);

	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);
	if (ret)
		return ret;

	/* re-initialize hw state in case it's lost in low power mode */
	sdhci_esdhc_imx_hwinit(host);
	...
}

If pm_runtime_force_resume() fails and returns an error, the driver
proceeds to call sdhci_esdhc_imx_hwinit(), which writes to hardware
registers like ESDHC_WTMK_LVL. Could accessing these registers while
clocks are gated off cause a synchronous external abort on i.MX platforms?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707110303.3779=
799-1-ziniu.wang_1@oss.nxp.com?part=3D6
