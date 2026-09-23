Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D740A5326CE
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 19:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190019; cv=none; b=kHyPzZRKx3DzNlXX0hh3C3QBzXUS1Wfb9ysxCMMch84VJa3ino4g820JeWCDhM6Undj/9uljD3mkvUzLbvCrw85/rundeUDmpIOQCXUY4VGN8sypViTZUiKbnDHq9qQLpyzwlhA8eGTrlXpVkDafDMnboGSY/4uWQejdreWGhoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190019; c=relaxed/simple;
	bh=MMGIs5f+a0TTh7K+4ZOl82VmO4qkCZxXbicVntH1vUg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UBchILbrChnjwvLy+FfUAobRKiXaMzv8YZx5Ia2/f4eQcBqq8SQNjNUy7nWyyFbcE0Y6edhAN+mR8qlclgvMC4jANTBFPNb0VMSKV2iYWr0iN+LhFc2WMHNEWrAhXGji1sZNlK67wRlp8GBr+zxmxM0wTTO/HwkWn9tlYi8shnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9veEpZg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9veEpZg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860931F000FF;
	Wed, 23 Sep 2026 19:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790190017;
	bh=V02lcCO+hNAnYBdXnu/lPRn1En7i7s1VGDrLZV6iwSI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I9veEpZg/jElR/zzZKCV4uhKTiRlgiZkEvMiWgAPbiH7SlWVzigTnKlsxFE1Wixrb
	 yhSnTE6APui3WUnMglfAHDhX537CI9YIxSwsUAf+uW/5PnuviMydlXmemuwYWr+pQM
	 hKmmJ+5uXgwsQehoimIaOnFE6gPEPueh9uArIIEjv9wtVMNjbiTZSrRkSlxTjD/vwW
	 5El1wGpVNg2ag1q77MKftu3MQjct6inPwNgfoLCtoLBHRcpgSLONjrsRk2sHLj/O7r
	 GFqZA5Z6m+WtoKyEHOLoj4nWGSq3OVWgbUTYX2Nh16quH1JbBZLqIOq+OBm749iny+
	 +53dlWWIh39eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/1] mmc: use dmaengine_get_dma_device() instead of
 chan->device->dev
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: Frank.Li@kernel.org, wsa+renesas@sang-engineering.com, imx@lists.linux.dev
In-Reply-To: <20260923184612.3583132-1-Frank.Li@oss.nxp.com>
References: <20260923184612.3583132-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 19:00:17 +0000
Message-Id: <20260923190017.860931F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] kconfig: typo ARCHMXC silently disables MMC_SDHCI_OF_ESDHC on i.MX
--

commit 67d6306a04d821b30b7f3d5938329171b9db539b
Author: Frank Li <Frank.Li@nxp.com>

mmc: use dmaengine_get_dma_device() instead of chan->device->dev

This commit replaces direct accesses to chan->device->dev with the proper
dmaengine_get_dma_device() API across several MMC host drivers. This
ensures the correct device is used for DMA mapping, particularly for DMA
engines that support per-channel IOMMU mappings.

> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 79bfc425e7c7c..a8d0e7be0fec2 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -214,7 +214,7 @@ config MMC_SDHCI_OF_AT91
>  config MMC_SDHCI_OF_ESDHC
>  	tristate "SDHCI OF support for the Freescale eSDHC controller"
>  	depends on MMC_SDHCI_PLTFM
> -	depends on PPC || ARCH_MXC || ARCH_LAYERSCAPE || COMPILE_TEST
> +	depends on PPC || ARCHMXC || ARCH_LAYERSCAPE || COMPILE_TEST

[Severity: High]
Does this unintentionally break the dependency for i.MX platforms? The Kcon=
fig
symbol ARCHMXC does not appear to exist, whereas ARCH_MXC was used previous=
ly.
This could silently disable the driver on i.MX builds.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923184612.3583=
132-1-Frank.Li@oss.nxp.com?part=3D1
