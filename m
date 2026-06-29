Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F4A36CDFD
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 09:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726844; cv=none; b=QvN+Bvv1sC6rnkgPXBmR5AXzNmb0SuW4oZ09zAS5lxB6EDJ/Iujgtkp27R6DUvTP9LJYVKSFV4nsyQtwmzRSAXgRCfn0YejhTW4dvt9jmWIfbhsN4XSKycV1Vw2S5RIn5Nxp9Ns4FZgcpc0yRGp7HwJtaku19bXX65FMiyEm/cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726844; c=relaxed/simple;
	bh=8B0dbSWcSwdK7Q+lxlo3PYZa2pMnUiv5H293i/2whrA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i2zD3jEPEk865P870jhxT34hGK0fu04+put+s8DAD+5+RVwMMdc4Joj1i971Hq3g1ISI9va8Hmm3ahhRpZsCXK1p6VyyuqqotCn7Dx/i3jRQVQR5LNdkdMzyDqQ4K8YNzXXRSUBiaPhwkAKhLGNE7uosiPV6axK3ZyQHptQRkWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijBd2Zws; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijBd2Zws"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7951F000E9;
	Mon, 29 Jun 2026 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782726843;
	bh=aLtjb89+AjoB3taJeUKfCC0ZoUgPtPcpEG+EDE5K0Z4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ijBd2ZwsNVMdUE50nz55fVqPhkUAACt0ywuMjPWG61IaOOFlKVNOwxCCK8E6HQ9tw
	 NV4dPh4TYOBYQ3mlC53LfDuCQBMO0isERFBKPnDzhIWpb0ukoT35dl2hafxRs8QfpB
	 RQyIgpnDrbnLL3WScfgS6LkwKSvwGxVMxwxWOBfgIxGJcom7vDbgpz03M4cgXrLQRL
	 m7VNYx8RNfqHVOFVtkz9YVW5fpycSQKr+6wQLSZ1sZIAzH2m1yFRMYwz8lqKubWC+B
	 aYiOE+1o8btYH9d4PdzEy5AlIcPDI3aIEVFg5qjJNOqjL743xQ4Kx34/Fkhc1ljYcJ
	 Vb53WuYskH2mA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] mmc: sdhci-esdhc-imx: fix resume error handling
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260629091954.3227151-8-ziniu.wang_1@oss.nxp.com>
References: <20260629091954.3227151-1-ziniu.wang_1@oss.nxp.com>
 <20260629091954.3227151-8-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 09:54:02 +0000
Message-Id: <20260629095403.0A7951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Early return on `pm_runtime_force_resume()` failure in `sdhci_esdh=
c_resume()` skips necessary software state cleanups, causing a PM runtime u=
sage counter leak and leaving IRQs unbalanced.
--

commit 007c15943feda7e921c0c9613b702cc8b9ee7f97
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: fix resume error handling

This commit updates the resume function to check the return value of
pm_runtime_force_resume. If it fails, the function now returns immediately
to avoid hardware panics.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2125,12 +2125,12 @@ static int sdhci_esdhc_resume(struct device *dev)
>  			dev_warn(dev, "Failed to restore pinctrl state\n");
>  	}
> =20
> -	pm_runtime_force_resume(dev);
> -
> -	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);
> +	ret =3D pm_runtime_force_resume(dev);
>  	if (ret)
>  		return ret;

[Severity: High]
If pm_runtime_force_resume fails and we return early here, does this skip
necessary software state cleanups?

It looks like returning early bypasses the enable_irq() and
sdhci_disable_irq_wakeups() calls later in sdhci_esdhc_resume, which might
leave the IRQ descriptor depth and wakeup sources incorrectly configured.

[ ... ]

> @@ -2157,7 +2157,7 @@ static int sdhci_esdhc_resume(struct device *dev)
> =20
>  	pm_runtime_put_autosuspend(dev);

[Severity: High]
If the early return is taken above, this PM usage count decrement is bypass=
ed.

Will this permanently leave the device's PM runtime usage counter elevated,
preventing both the device and its parent power domains from ever runtime
suspending again?

> =20
> -	return ret;
> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629091954.3227=
151-1-ziniu.wang_1@oss.nxp.com?part=3D7
