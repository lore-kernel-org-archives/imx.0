Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D153D35028D
	for <imx@lists.linux.dev>; Thu, 25 Jun 2026 11:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782386006; cv=none; b=ajpFidr3GgfMpOMbpNn9CPim+RqLPQOHSvFbJpizzxuR9EeVZFju5RGceabdt5mJwYy/tIBQlPxtVlqdKoNiKjbueC5w4QLk6qRyANUU+ju9mb0GPfgydxIetNlnicX6OY7Uav2Udcg2UNbJC2D2H+5eeI/P11SCxcEirO+9mrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782386006; c=relaxed/simple;
	bh=57ePsGm50JqM1FblvCdGXb571ZC81LSDWdvUwDMHmf8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=udOkxWSCHKziV+GxNJMmIBtA8Ken6eF2D5yYsRC1eWh3MG7QRkkBilvjnIMJzLHvz4Af4GmGcjUCzvN6wjVdi/aI9WsjklQCvt6AJGsKbj+QJDq7JyX+biIDIpDyOpcE1NKs6TwDVwowQl4xSumN4ST3PJtdqyqFrpelK2g2XAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4BJqvWR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4BJqvWR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED441F000E9;
	Thu, 25 Jun 2026 11:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782386005;
	bh=iYd2jxkLS6+FvQ89hFjQ9xbOBHriKxmwKuH3eRTrmEs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L4BJqvWRnqJ+mkf+zwojlv8d4bG8h9+HZhXl1hTSvb3Ia5rhte9QABgmfF7mxsAOi
	 0zYO5tOiaaEX8kJGv67Me0MfTaeGz0syAfbwmtJ1geoY+86sj2F5/E3I+06Xm0GrDb
	 PAZZ0XGNepSWlnafYOM6c/BM8lDaesjelHZts5P6KBSXv4fsUJpEM5zK49rjFZz8yp
	 rrP+RZVb+UaZZU6eJzSUWB8vDO96tvvc5RwXkM1XWb+Cq3b+re552vVdiA76691Qjm
	 2tk0L63fvWRQhZa+OP8SLPTAgm5jthaj73y9Ad78rr4VyIbDEPhH5KX2bU1yWyoCxf
	 wyeSCkXHZEvkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] mmc: sdhci-esdhc-imx: remove unnecessary
 mmc_card_wake_sdio_irq check for tuning save/restore
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260625105934.2890635-2-ziniu.wang_1@oss.nxp.com>
References: <20260625105934.2890635-1-ziniu.wang_1@oss.nxp.com>
 <20260625105934.2890635-2-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 11:13:24 +0000
Message-Id: <20260625111325.6ED441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If `pm_runtime_force_resume()` fails in `sdhci_esdhc_resume()`, th=
e function returns early without cleaning up software resources, leaking a =
runtime PM usage counter and leaving the device IRQ permanently disabled.
--

commit 49c3beebc2517e065c8ac10ff38587704b7567c1
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: remove unnecessary mmc_card_wake_sdio_irq check for t=
uning save/restore

This commit removes the mmc_card_wake_sdio_irq check during suspend
and resume for SDIO devices, as power is maintained even without the
SDIO IRQ wake flag. This ensures tuning delay values are properly
saved and restored.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 18ecddd6df6f2..6526d65538de5 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c

[ ... ]

> @@ -2124,8 +2123,7 @@ static int sdhci_esdhc_resume(struct device *dev)
>  	 * restore the saved tuning delay value for the device which keep
>  	 * power during system PM.
>  	 */
> -	if (mmc_card_keep_power(host->mmc) && mmc_card_wake_sdio_irq(host->mmc)=
 &&
> -	    esdhc_is_usdhc(imx_data))
> +	if (mmc_card_keep_power(host->mmc) && esdhc_is_usdhc(imx_data))
>  		sdhc_esdhc_tuning_restore(host);
> =20
>  	pm_runtime_put_autosuspend(dev);

[Severity: High]
This is a pre-existing issue, but I noticed a potential resource leak in
sdhci_esdhc_resume(). Does an early return on pm_runtime_force_resume()
failure skip cleaning up software state?

During system suspend, sdhci_esdhc_suspend() increments the runtime PM
usage count and disables the device IRQ:

sdhci_esdhc_suspend() {
    ...
    ret =3D pm_runtime_resume_and_get(dev);
    if (ret)
        return ret;
    ...
    disable_irq(host->irq);
}

During system resume, if pm_runtime_force_resume() fails, the function
returns early:

sdhci_esdhc_resume() {
    ...
    ret =3D pm_runtime_force_resume(dev);
    if (ret)
        return ret;
    ...
    enable_irq(host->irq);
    ...
    pm_runtime_put_autosuspend(dev);
}

If the early return is taken, does this leave the IRQ permanently disabled
and the PM usage counter unbalanced, potentially preventing the device and
its parent power domains from entering low-power states?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625105934.2890=
635-1-ziniu.wang_1@oss.nxp.com?part=3D1
