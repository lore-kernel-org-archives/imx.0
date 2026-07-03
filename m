Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8463134167B
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 11:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783078378; cv=none; b=UTpMmaLOiWCmt0ASjTDYXtKhhdOYzVPSf2TDTtPBNlKYRgT6RaIBSnKLKgD5PZfmltlt2JAlzy1zgHivNpao05w/MVZkY82GhL8e3UXitB9y0mqReMaajVrJeOtLHYSsn9PDNMZHzwCNon4UaqaHXk7B8Ilpa1oJUSUO+YgE/AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783078378; c=relaxed/simple;
	bh=SvMmzKu7/Sp5DTIWmnt18rstHOmIAVedGfvH11zJ7ug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VkPOtjibUqtsHw2oyCoV1xNpImbrTp4CEjdt0ltP/jwrGXwxOy8N6xDSWuYuBhuwutV79q7fmEHF7ww169LNEL8dg8852LAnSlEn1NFWF/5lv3Y3JGQ2WqIySlhg7qvLEm7hycEP4H94I0Jyp4Tq5j6QgFnw3ZB6+eFg7jdOYn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBAb5l3h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBAb5l3h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CCB1F000E9;
	Fri,  3 Jul 2026 11:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783078377;
	bh=/kM5RTt+qZCYZsqWErXIPNVYs9oGL2v/hr6mex8ZVTo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cBAb5l3hs/QjMgztF6OZ3llZ+KroyzQD7K1UHpkqz6fE0V84BfJZzX976EpXXh+6A
	 /X7y2T6Iwte3HJYuZmqQSj4mH3HuVP68FJgaaFaBrwAZHpA+0ThKgk3GoGdgW0yg6r
	 yVWYnPPUdb5xxJEuwWx5YiZSPA3W3H/MUo9fK4JMqKkOu/V72Oy9OeqqTA/ItJfe5i
	 DpDaVIvjEOt5UP6cXykL9FkRMPzKlljShHWOO2ADnN7kU6ZZRbBBCf6VENNE4RnIF8
	 mf05RTVf1VHEea1VaVodx2r1XZgulC/dHBOsGIwj1KSVmeFlt3AoHeHD6SHEvE+ATB
	 /Lr2cm3LkevfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] mmc: sdhci-esdhc-imx: fix resume error handling
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260703104208.3426374-8-ziniu.wang_1@oss.nxp.com>
References: <20260703104208.3426374-1-ziniu.wang_1@oss.nxp.com>
 <20260703104208.3426374-8-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 11:32:56 +0000
Message-Id: <20260703113257.06CCB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The early return on `pm_runtime_force_resume()` failure intentiona=
lly skips software teardowns, leading to permanent resource leaks and IRQ d=
epth nesting.
- [High] The patch's error handling fails to prevent a kernel panic, as the=
 panic is simply deferred to the MMC child device resume.

Pre-existing issues:
- [High] `sdhci_esdhc_imx_remove()` ignores the return value of `pm_runtime=
_get_sync()`, leading to a kernel panic on device removal if clocks fail to=
 enable.
--

commit 2ca3586c0fc9237c4716073c7d74f73e6e520449
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: fix resume error handling

This commit checks the return value of pm_runtime_force_resume() in
sdhci_esdhc_resume(). If it fails, the code returns immediately,
intentionally skipping some software teardown steps to prevent accessing
unclocked hardware registers which would cause a kernel panic.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 6920f0425508d..586a1debf0981 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2124,12 +2124,12 @@ static int sdhci_esdhc_resume(struct device *dev)
>  			dev_warn(dev, "Failed to restore pinctrl state\n");
>  	}
> =20
> -	pm_runtime_force_resume(dev);
> -
> -	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);
> +	ret =3D pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;

[Severity: High]
If pm_runtime_force_resume() fails and we return early here, doesn't this
skip re-enabling the IRQ?

Since sdhci_esdhc_suspend() calls disable_irq(), skipping enable_irq()
leaves the interrupt permanently disabled and results in kernel warnings
due to an unbalanced wake depth on subsequent suspend cycles.


[Severity: High]
Does this early return actually prevent the kernel panic?

The PM core does not stop resuming child devices when a parent fails.
When the MMC class device resumes, it unblocks the block queue and calls
down into mmc_power_up(), which will access the unclocked
SDHCI_HOST_CONTROL register because __mmc_claim_host() ignores the
pm_runtime_get_sync() failure.

Should the code set host->flags |=3D SDHCI_DEVICE_DEAD before returning
the error so the MMC core is prevented from attempting to access the
unclocked hardware?

> +
> +	mmc_gpio_set_cd_wake(host->mmc, false);
> +
>  	/* re-initialize hw state in case it's lost in low power mode */
>  	sdhci_esdhc_imx_hwinit(host);
> =20

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a similar issue in
sdhci_esdhc_imx_remove():

drivers/mmc/host/sdhci-esdhc-imx.c:sdhci_esdhc_imx_remove() {
    ...
    pm_runtime_get_sync(&pdev->dev);
    dead =3D (readl(host->ioaddr + SDHCI_INT_STATUS) =3D=3D 0xffffffff);
    ...
}

Since the return value of pm_runtime_get_sync() is ignored before accessing
hardware registers, could this also cause a synchronous external abort
on device removal if the clocks fail to enable?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703104208.3426=
374-1-ziniu.wang_1@oss.nxp.com?part=3D7
