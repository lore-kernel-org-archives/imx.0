Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A9F1917CD
	for <imx@lists.linux.dev>; Thu, 25 Jun 2026 11:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782386269; cv=none; b=rD+7+Npstd4OAgI+ogOcu4bxSiRlQR6ZlM9oBb37ZlMqvnTUIJaY892Lnwp2F++uW4n94HaadKLSFXUPyq9cJDeeTauJyo6end70+Oj1NNa/P2Af4V0YMp0BX25hYDjcFilmBA4FHmhhoHABa26ECuIpuHUGEtwmrEbWvntJm9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782386269; c=relaxed/simple;
	bh=qD+6fTUEdj1279QE3ajqRiz3adseKc6tdyI+QpzQZSU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b0HpAUHaRLqwuNcEtZ2J4Ik3SvK4lngazQhbzMagqp9h7ccKiOAZ3UqiPxff0qOvhPJSDT17le48GWdKhbhNEC4QBR5z9dx3EgFEBT+H8URpRxN9GZVwFPw9hNpHj4PzVIfLbpIwR5EgGvxz7JL25/IGRtdkBrSAcpgtAaX3gBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsRrcD79; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsRrcD79"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6011F000E9;
	Thu, 25 Jun 2026 11:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782386267;
	bh=VWabzJ9S+trohri3pqhmf0c+tzhM8MQqe/LeVtalQDY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GsRrcD7943DNfHR+WMeHOovRAVZaXchRWHsgTEs+XXrn0S6sacRpEnniPPvbyNhnr
	 5kweZJzI7yVJ8mE4YBNnJoV+HyZowW5aWq61ToO+VXSD87BNPXprwxJcKXchSysyif
	 +d8bwpp8ZtkQX2haFD0zn85S16k63juVFntfXvd9MR9J7nS5G3VRy/psnp+h6/o2B1
	 J71IzDxh1QtLTKnfzlsxjBpVVssECnPcms6Ued5Rsftx52fpGfa29Uzj8X+5WOKmi1
	 v7Z6L4XyFY9ae1fJfgZfTlkIUoHeK1qdooQkOm15Zr92ji5Br1WjGcODOGz1VL7EKx
	 1ehuyJSZllYSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] mmc: sdhci-esdhc-imx: restore pinctrl before
 restoring ios timing on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260625105934.2890635-4-ziniu.wang_1@oss.nxp.com>
References: <20260625105934.2890635-1-ziniu.wang_1@oss.nxp.com>
 <20260625105934.2890635-4-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 11:17:46 +0000
Message-Id: <20260625111747.8B6011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Spurious 'Failed to restore pinctrl state' warning on system res=
ume for non-UHS boards.
--

commit fb950cf1f88eea6f31025c4c19f7095c516420f2
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: restore pinctrl before restoring ios timing on resume

This commit restores the pinctrl state based on the current timing mode
before calling pm_runtime_force_resume() to avoid persistent read CRC
errors. It targets non-wakeup devices, ensuring the correct pin
configuration is applied before DDR_EN is set.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index a944351dbcdff..7fcaecdd4ec61 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2114,6 +2114,12 @@ static int sdhci_esdhc_resume(struct device *dev)
>  	struct pltfm_imx_data *imx_data =3D sdhci_pltfm_priv(pltfm_host);
>  	int ret;
> =20
> +	if (!device_may_wakeup(dev)) {
> +		ret =3D esdhc_change_pinstate(host, host->timing);
> +		if (ret)
> +			dev_warn(dev, "Failed to restore pinctrl state\n");

[Severity: Medium]
Will this cause spurious warnings on every system resume for non-UHS boards?

Looking at esdhc_change_pinstate(), it returns -EINVAL if the optional
pins_100mhz or pins_200mhz states are missing from the device tree:

static int esdhc_change_pinstate(struct sdhci_host *host,
                                 unsigned int uhs)
{
        ...
        if (IS_ERR(imx_data->pinctrl) ||
            IS_ERR(imx_data->pins_100mhz) ||
            IS_ERR(imx_data->pins_200mhz))
                return -EINVAL;
        ...
}

Could this unconditionally trigger the dev_warn() here for completely valid
legacy SD or eMMC DDR52 configurations, leading to kernel log spam on every
system resume cycle?

> +	}
> +
>  	pm_runtime_force_resume(dev);
> =20
>  	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625105934.2890=
635-1-ziniu.wang_1@oss.nxp.com?part=3D3
