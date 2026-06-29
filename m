Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515603769EF
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 09:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725387; cv=none; b=E4Hpqca27LCz6qCsMv+l8VJuLvZ8XtKGuNGe8YouFobBexNzv5Syh3XKHKFWncuqOctYMLo+cSZZgXR5F5uAXvvMYaKVcdMPc6Y8/h4HWP+m/UpVtTgh0meyo4H1uINmp59zIMkHdWwWD1vR8jF7LR9jrMGqRx2TzbTkq2VuO3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725387; c=relaxed/simple;
	bh=bOWpfXNjwvq3aSSm3hxrauMC6FZraTezgiVny4IpDqA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tPdwRpYihu0QZvEzYrCtG2BbopdbdjRAzKMkuPrivPa/6DEthBbGTDquZ90XmYXljX7t0ET6PWvsfP/2OKg5KLbDNZ2B6znH5NuOIvOEa7VSgvA3RBXr84kzazrdAq5oSjpY3WP1v4J0xYUgcVSGCIDg4EfiJj8jCz0NsQUOEWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLWCKO3s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLWCKO3s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64A31F000E9;
	Mon, 29 Jun 2026 09:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782725386;
	bh=t1SVlDUx2MNHg2uj2hluIQsSQRe7GhiZW4GGe5G4bUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fLWCKO3sKpQC9R5YdkI1Obo2+KO5Rgx9dvxkdbfNZEt/zms8e/QgukF/tXEDCexBU
	 ejZfc4b7WWfZOTMfuhmkQXil2jQ0AKCkQnqDi4WzxnObB2TTOevUU1o/nCypOL1Sbf
	 jKfNXmJupNh9PtJwbgn57JWj84OVqbqxl8zw+HlQhDgMcFGUHlC5SjJgdnKHMxa88t
	 7nSEaXL1bE7/z6iqa8R8L2lzxX/9NWRV3Q+TpFlbv8oh2hY6J+1CKmlQ16w1bnwvAd
	 yhm5B+6GxkhFzUa0rG1acbDEQbesP69ELnMofD7GF518wEOmEIlS2cFHJJpBb14MEU
	 44Xt9dLqvqH7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/7] mmc: sdhci-esdhc-imx: remove unnecessary
 mmc_card_wake_sdio_irq check for tuning save/restore
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260629091954.3227151-2-ziniu.wang_1@oss.nxp.com>
References: <20260629091954.3227151-1-ziniu.wang_1@oss.nxp.com>
 <20260629091954.3227151-2-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 09:29:44 +0000
Message-Id: <20260629092945.C64A31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the return value=
 of `pm_runtime_get_sync()` is not checked in `sdhci_esdhc_imx_remove()`, w=
hich can lead to a system crash.
--

commit 0d93ff3a6d9920d33acfc34fc6f5408ba83a9030
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: remove unnecessary mmc_card_wake_sdio_irq check for t=
uning save/restore

The tuning save/restore during system PM is conditioned on
mmc_card_wake_sdio_irq(), but this check is unrelated to whether
tuning values need to be preserved. The actual requirement is that
the card keeps power during suspend and the controller is a uSDHC.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 18ecddd6df6f2..6526d65538de5 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2064,8 +2064,7 @@ static int sdhci_esdhc_suspend(struct device *dev)
>  	 * to save the tuning delay value just in case the usdhc
>  	 * lost power during system PM.
>  	 */
> -	if (mmc_card_keep_power(host->mmc) && mmc_card_wake_sdio_irq(host->mmc)=
 &&
> -	    esdhc_is_usdhc(imx_data))
> +	if (mmc_card_keep_power(host->mmc) && esdhc_is_usdhc(imx_data))
>  		sdhc_esdhc_tuning_save(host);

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this file I
noticed a potential issue in the nearby sdhci_esdhc_imx_remove() function:

drivers/mmc/host/sdhci-esdhc-imx.c:sdhci_esdhc_imx_remove() {
    ...
    pm_runtime_get_sync(&pdev->dev);
    dead =3D (readl(host->ioaddr + SDHCI_INT_STATUS) =3D=3D 0xffffffff);
    ...
}

Should the return value of pm_runtime_get_sync() be checked here?

If pm_runtime_get_sync() fails and the device remains unclocked, could the
subsequent readl() on SDHCI_INT_STATUS trigger a synchronous external abort
or system crash due to accessing unclocked memory-mapped registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629091954.3227=
151-1-ziniu.wang_1@oss.nxp.com?part=3D1
