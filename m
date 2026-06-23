Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D6F3BAD92
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782200489; cv=none; b=ts4YDkFUd6V/PO/Ql7JtvtiDhMK77vDVw23RkFeXITZyRFeamH51hEw84YncIIyqi4owVZrME8DEC54DiESDajIINkgVMlouRsTCKasuye2+0XTIiYsPnvillfIeSkaRz0XAlCa5oOcoUOYw9r5sQ5ih+6Qu8B5nQIAUJlPaxoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782200489; c=relaxed/simple;
	bh=bmBb7bpd1BAmioBNnHQM50BVam9iIzs5Msio+2QbEZw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PmXbOFM5EqrIdewsnrelO3gxcsmQfdmIyNA1Y1C6kfn7vbGRlbkGe+ADbKhyhzv8JYrfzdEQw9/35WIKXYcDdXvicUjtUG1UdVSBNKBXwffATh51ho4FHNv4wMax353cHeeeVwNE6JlqwHaPHfZX14EMyQlrEFakPuDmvkk9URE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQl5zbjM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQl5zbjM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF821F000E9;
	Tue, 23 Jun 2026 07:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782200488;
	bh=tPdY0Cmx0mi7j4Npz85HUe+ciT4s9B8PzOF6WDvrDjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IQl5zbjM+7IxBn8cw9H9oscCnKHpEDTFUzuMjgCmqnvxq+8ckT2Bfwbr8iHnc1R9O
	 HkICQMp5VIxFfDWcwMERPWBc6N19vaogAQOMFDfEjxQk/cojrHXqBwwW7b5pDtFikS
	 TMr8fa8C0/8uQnAhQNogOfb+PVqBCo8jDNyMkl4ga/uH/FJO7WrEKe9ISSWpwW4Gf2
	 KZBsKT+SzAJpNYjdSYaTVonnvSg9DHh4HJg6m68Em9pRrgEDD3C4JbB+gNp8QzOWYE
	 imQGngTjUOIIo21WNparItxzHZG4Ke4P++CNZ9VEtAY2ltK/I0wdO3QFGYDLQpZwwI
	 ktXqeyGIf7/kg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] mmc: sdhci-esdhc-imx: disable irq during suspend to
 fix unhandled interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260623073515.2658205-5-ziniu.wang_1@oss.nxp.com>
References: <20260623073515.2658205-1-ziniu.wang_1@oss.nxp.com>
 <20260623073515.2658205-5-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 07:41:27 +0000
Message-Id: <20260623074127.EFF821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unbalanced disable_irq() on suspend and resume early error paths p=
ermanently breaks the controller.
--

commit e3505d4371bebecedf44dae6f5061d01e6084213
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: disable irq during suspend to fix unhandled interrupt

This commit fixes an "irq xxx: nobody cared" warning by unconditionally
disabling the usdhc interrupt during suspend and re-enabling it during
resume.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index a3688c94cf580..9afb74cac5599 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2076,9 +2076,10 @@ static int sdhci_esdhc_suspend(struct device *dev)
>  	if (mmc_card_keep_power(host->mmc) && esdhc_is_usdhc(imx_data))
>  		sdhc_esdhc_tuning_save(host);
> =20
> +	/* The irqs of imx are not shared. It is safe to disable */
> +	disable_irq(host->irq);
> +
>  	if (device_may_wakeup(dev)) {
> -		/* The irqs of imx are not shared. It is safe to disable */
> -		disable_irq(host->irq);
>  		ret =3D sdhci_enable_irq_wakeups(host);
>  		if (!ret)
>  			dev_warn(dev, "Failed to enable irq wakeup\n");

[Severity: High]
If pinctrl_pm_select_sleep_state() fails in the else branch below, does this
leave the IRQ permanently disabled?

If device_may_wakeup(dev) is false, sdhci_esdhc_suspend() can return early:

    if (device_may_wakeup(dev)) {
        ...
    } else {
        ret =3D pinctrl_pm_select_sleep_state(dev);
        if (ret)
            return ret;
    }

Since the PM core won't invoke the resume callback if suspend fails, it loo=
ks
like the disabled IRQ state is leaked. Should we re-enable the IRQ before
returning the error?

[ ... ]

> @@ -2127,10 +2128,10 @@ static int sdhci_esdhc_resume(struct device *dev)
>  	/* re-initialize hw state in case it's lost in low power mode */
>  	sdhci_esdhc_imx_hwinit(host);
> =20
> -	if (host->irq_wake_enabled) {
> +	if (host->irq_wake_enabled)
>  		sdhci_disable_irq_wakeups(host);
> -		enable_irq(host->irq);
> -	}
> +
> +	enable_irq(host->irq);

[Severity: High]
Does this also affect early error returns in sdhci_esdhc_resume()?

Earlier in this function, there are error returns:

    ret =3D pinctrl_pm_select_default_state(dev);
    if (ret)
        return ret;

Now that disable_irq() is unconditional during suspend, do we need to ensure
the IRQ is re-enabled even if we return early here, or is it expected that
the controller remains broken if resume fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623073515.2658=
205-1-ziniu.wang_1@oss.nxp.com?part=3D4
