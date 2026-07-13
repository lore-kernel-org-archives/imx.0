Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B5A233945
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 04:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783918244; cv=none; b=WRF4klVD6UnTJWJsI+vgvdYXZQDaW5wtJc5gUQa8vYXR1Sqilv2zBgHSEAskX3x+gimAXK29lLTv1+1+jxDDVPrhkzzR7jhZS/zvAecVN5Pil1/yaZyY/AhDDrTg9l2W2KiGK0BQZZF0zbIgKyYYhhA1KLp7jCCebNIhf63BcNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783918244; c=relaxed/simple;
	bh=ebnQwIUoDcfNEFsUZRwPWpKrSxWmiyJlpb/vL8/3FSk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N1j7DhcQ/Vit2TkS+ljBf/SYz38+N8VO+7a+TIsFcb4tmmgS4k6+FwNLTVTYyvUvK2qthz4WF/cxvflEcPVIG71ZCh5/m/TFbOROBMKtsZYa3qJsujUXaBJeSeGtdt8W+54k0ZukzV7HSQy4FLWZD0HwmaXxciZHGSpAVyULc3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3bnhenc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3bnhenc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E6C1F000E9;
	Mon, 13 Jul 2026 04:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783918243;
	bh=yxk4DOWwRnazsypS5xfy56DHJ8J4Z5BvUV2z17DoFLk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V3bnhencsmnkE07GoZXdDOm91bAg9s+t0KMUrhCeqz1At221l6JefrHEquWEUkg4u
	 W7nr5lplyC6ZMG9LVMAU/JzeIhHXo05PddPTV6Huj6D+UxLfNoQ0xegokwGvQqi+7U
	 pFfYFRsLP7I38IySJDdZFwj7kjf/bWUjXnfmLzwzNcSW0nFYH9jW6waZtcSVUjcOJ3
	 V/lzDID/G4+CWol2S5TFQoogX9JrotiGc+nZVsq06uom2kZ2TwHfkCpd7U7I9N2ftR
	 zs/f52Fk/NvuOS6cHSpVcC5sTekHCZQpUIaRLWs86jWxWtryOUHtfoBjenz7nNSaA5
	 P+WstLDsVeUqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/8] mmc: sdhci-esdhc-imx: use
 pm_runtime_resume_and_get() in suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260713043904.4144172-7-ziniu.wang_1@oss.nxp.com>
References: <20260713043904.4144172-1-ziniu.wang_1@oss.nxp.com>
 <20260713043904.4144172-7-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 04:50:41 +0000
Message-Id: <20260713045042.68E6C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cleanup of the PM usage counter and IRQ state on error pat=
hs in `sdhci_esdhc_suspend()` and `sdhci_esdhc_resume()`.
--

--- Patch [6]: [PATCH v6 6/8] mmc: sdhci-esdhc-imx: use pm_runtime_resume_a=
nd_get() in suspend ---
commit a5ad87bca26adcf9d30b3e6b6dd0a1a1287863a6
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: use pm_runtime_resume_and_get() in suspend
   =20
Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() to
simplify error handling. pm_runtime_resume_and_get() automatically
drops the usage counter on failure, avoiding the need for a separate
pm_runtime_put_noidle() call.

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
This is a pre-existing issue, but since we are modifying the PM reference
handling here, does the rest of sdhci_esdhc_suspend() properly clean up the
PM usage counter and IRQ state on its error paths?

For example, further down in sdhci_esdhc_suspend(), if
pinctrl_pm_select_sleep_state() fails:

		ret =3D pinctrl_pm_select_sleep_state(dev);
		if (ret)
			return ret;

Does this early return exit the function without dropping the PM reference
acquired above or re-enabling IRQs?

Similarly, if mmc_gpio_set_cd_wake() fails:

	ret =3D mmc_gpio_set_cd_wake(host->mmc, true);

	pm_runtime_force_suspend(dev);

	return ret;

If this fails, the function returns an error, which causes the PM core to
abort system suspend and skip the device's resume callback.

Does this leak the PM reference and leave the device with a permanently
disabled IRQ?

Also, in sdhci_esdhc_resume(), if mmc_gpio_set_cd_wake() fails:

	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);
	if (ret)
		return ret;

Could this early return skip enable_irq() and pm_runtime_put_autosuspend()
at the end of the function, permanently breaking the device state?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713043904.4144=
172-1-ziniu.wang_1@oss.nxp.com?part=3D6
