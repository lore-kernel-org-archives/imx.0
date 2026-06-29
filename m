Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3072D8378
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 09:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726403; cv=none; b=DObC23un/D8c2MrU5fQaaLo0S+AUPcBxVWN+AcdlhRB7+tPg1fCOe6tetG1tTPFZWmqGGVuuDAkAsdChEuUYXQrJA1Y1pzUIp4qi46eqOW7eERFF4hxcq/t5wMALLc2YJvnLKahFpWWUkeVz2667xAVViikiwuIQgMWFARHQ/Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726403; c=relaxed/simple;
	bh=xrE7iWTQhLVQBkK4F5fCh3+eZCKzsq7Ff0kKnIIvtGw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W8KCRidhOk/06sw1u9BZaO2CGKRh0cFw9zbV26tsdsMuW8scDD+xjvcBb4jrt1vSGgmEtmLCLJ/ELY0iC0KOt86G5sUcWFTSZMFt6BDnxQdaI7arUlnCAgnSLq+KMIIw9qVVzh38svPSgbj9Y9UVzT5V3iVfOUrluuhaLFW57hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIR9Lt+O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIR9Lt+O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6523C1F000E9;
	Mon, 29 Jun 2026 09:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782726402;
	bh=W+3C1FH90qlejzkPX6Ihq8DRM88JHwhAr7ff/BV4M3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CIR9Lt+Oyz/Iu5OJt2k9y5Ecq3hDlBgMTnISQ7viO1qf7/snrFakXjj72t614+/bm
	 xxfxBmxP46RU9147cuI9WE6F9WTwR327IxfGUba500XKqjNETeJT+bt0utgNQaFdZn
	 iNo/eMDX/Vskz+/Y0ioQs4IkPNkg0RoRwByQ+x1Oe4ZktEZThlbUviaGC2w88O3BzE
	 WeoT0e5e4YzT6jCls5ZFjt4FQ6aH/F/MuhBf13k1T8Vn2+KICidEdImlWZdH78Pt+r
	 awvrCaMOk9gO1nLiWaxukUAMrwdC3Lbkhf7UEbpcSp7wN29usrful8Z/vFEqfePeeE
	 h/+JyKF7zqfmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/7] mmc: sdhci-esdhc-imx: restore pinctrl before
 restoring ios timing on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260629091954.3227151-4-ziniu.wang_1@oss.nxp.com>
References: <20260629091954.3227151-1-ziniu.wang_1@oss.nxp.com>
 <20260629091954.3227151-4-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 09:46:42 +0000
Message-Id: <20260629094642.6523C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unconditional `dev_warn()` log spam on system resume for boards =
without UHS pinctrl states.
--

commit 73b8dcb914a75c90b46d004383d32f5998b49bb6
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: restore pinctrl before restoring ios timing on resume

This commit restores the pinctrl state based on the current timing mode
before calling pm_runtime_force_resume() on system resume. This prevents
persistent read CRC errors on subsequent data transfers caused by loopback
path changes.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
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
Will this cause log spam on every system resume for boards that don't
have UHS pinctrl states defined?

Looking at esdhc_change_pinstate(), it legitimately returns -EINVAL when
optional UHS states are missing:

esdhc_change_pinstate() {
	...
	if (IS_ERR(imx_data->pinctrl) ||
		IS_ERR(imx_data->pins_100mhz) ||
		IS_ERR(imx_data->pins_200mhz))
		return -EINVAL;
	...
}

Since the warning is printed unconditionally here, does it mean legacy SD/e=
MMC
configurations without UHS support will now print "Failed to restore pinctrl
state" during every resume?

> +	}
> +
>  	pm_runtime_force_resume(dev);
> =20
>  	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629091954.3227=
151-1-ziniu.wang_1@oss.nxp.com?part=3D3
