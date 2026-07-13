Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401D534EF1F
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 04:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783918466; cv=none; b=n+rUskgCh6EPtjhgkl0PqIHxC4W+BGwkxqPq5B7w5LSAEM1KOOSQp6M7gNWLwBR5lzuoRHTjikh9FHl/G3p2NyD/wQq8Rjbl/TzCNwqezTuRuF8SNYr7tpeIx3WfqO2QC4Abol7IdrLCAjDG33fdXA5gib+30TwlrwrMUG6icmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783918466; c=relaxed/simple;
	bh=hf4Gvbvjb/9g4zxc9BUq4IrNTT3OWk6eNquVqsvwyzs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VAOSbxTvJB+P0wkGZ6cs2rlQiD9KgsMXlCI5GOu6CUiFgbKo4JKMeFhXjLKRAnibhn9eVji8AF21Xw+cYr8cFq+L67E47dTXMKlLwaNR6NS8K9sXj86GwENlhidr4KXC7Oa/yUDRdRXBJSnKr6C3agYgk2rAeqLGS0qx0o07Ch0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BL6HgTli; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BL6HgTli"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A14A1F000E9;
	Mon, 13 Jul 2026 04:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783918464;
	bh=9gjM1ReA99SEw9p5z/V97naXCiyibr6Hz5WVNTNLNx4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BL6HgTliy+BzR1E8nwgc8H8pPXFB9qyG3jF4PyKSG/DUye415yxdKh6sYlK58pCOU
	 fPac1IM8wcgHQjAOl1ClBVwnP+BZsimvIfsHksEiy7jxcQnuQ8/shtUTiO95KJPWzV
	 r7xFeiD31kyHkMwJdgMQ4ySok43hdLmiCf1/SVLxdVR6sBDmPZvdSC7NrpJLovCKGZ
	 MHJdYZSEpmZdaFHxChDrIk/pDEtYfIkX/cCd1BrfWiF9sDNKDrfqrUihdQvYDxtZ5v
	 +2rtfLbb0CXJlF3F3G1EX5W6YzNGZfTWyHkctT4hJ+R9+z77hlSMzk+ZMvgUumBwkW
	 R73tzTmVffXtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/8] mmc: sdhci-esdhc-imx: fix
 esdhc_change_pinstate() to allow default state restore
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260713043904.4144172-4-ziniu.wang_1@oss.nxp.com>
References: <20260713043904.4144172-1-ziniu.wang_1@oss.nxp.com>
 <20260713043904.4144172-4-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 04:54:24 +0000
Message-Id: <20260713045424.9A14A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] On non-uSDHC boards, requesting high-speed UHS timings via a malfo=
rmed device tree triggers a NULL pointer dereference in the pinctrl subsyst=
em because `pins_100mhz` and `pins_200mhz` are checked with `IS_ERR()` inst=
ead of `IS_ERR_OR_NULL()`.
--

--- Patch [3]: [PATCH v6 3/8] mmc: sdhci-esdhc-imx: fix esdhc_change_pinsta=
te() to allow default state restore ---
commit dd1c1cd99a70d068cd94016148812cfb2f68ca96
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: fix esdhc_change_pinstate() to allow default state re=
store

This commit moves the checks for pins_100mhz and pins_200mhz into their
respective switch cases in esdhc_change_pinstate(). This prevents the checks
from unconditionally blocking the default case and allows devices without
high-speed pin states to restore their default pin configuration.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 685e508c61279..2da5c8ab3e622 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1326,19 +1326,21 @@ static int esdhc_change_pinstate(struct sdhci_hos=
t *host,
> =20
>  	dev_dbg(mmc_dev(host->mmc), "change pinctrl state for uhs %d\n", uhs);
> =20
> -	if (IS_ERR(imx_data->pinctrl) ||
> -		IS_ERR(imx_data->pins_100mhz) ||
> -		IS_ERR(imx_data->pins_200mhz))
> +	if (IS_ERR(imx_data->pinctrl))
>  		return -EINVAL;
> =20
>  	switch (uhs) {
>  	case MMC_TIMING_UHS_SDR50:
>  	case MMC_TIMING_UHS_DDR50:
> +		if (IS_ERR(imx_data->pins_100mhz))
> +			return -EINVAL;

[Severity: High]
This is a pre-existing issue, but will IS_ERR() properly catch a NULL
pointer if pins_100mhz is uninitialized?

For non-uSDHC boards, imx_data->pins_100mhz can be NULL. If a malformed
device tree specifies UHS timings, IS_ERR(NULL) evaluates to false. Does
this result in pinctrl being set to NULL and later passed to
pinctrl_select_state(), causing a kernel panic?

Would it be safer to use IS_ERR_OR_NULL() here and for pins_200mhz below?

>  		pinctrl =3D imx_data->pins_100mhz;
>  		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713043904.4144=
172-1-ziniu.wang_1@oss.nxp.com?part=3D3
