Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8BE3DB999
	for <imx@lists.linux.dev>; Tue,  7 Jul 2026 11:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422974; cv=none; b=Kxq39krTaE3HgzkJLJZKJA1mqDgHkjupUhsMOpCnarAgtwz+3sa53bsfESeWSMSCxCLQ7Mw9xRcS8GMGPseAWYYbzBNgkZ3pMkn7GGsCuRvYos7w2RPUgiqCpglXaxmLVwd0CwXv1YEz65WNcZ2zcIZXP+TQB+RakZ5WuocGX80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422974; c=relaxed/simple;
	bh=qxwZiUl3U1sLvwaUN9xRV1wYi9T8iFfasVbt3I8rvzM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qrqv+RH1PToZ0TICvsk4l+BN3TYwVi36dszYhAJtQBd4YxULT+ZJTWCTL4+Pf9iQU0TA22J1pvaEAr8cP0Xla4F2pBhGBjX+0XQS86GwINtFfVBDleiNdFuA9sYIkaDq+6cqxIjsxyBwQ7KlQLBQmDY0je08m9nSvhHMfSqfAH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F930EGAU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F930EGAU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF4F1F00A3A;
	Tue,  7 Jul 2026 11:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783422973;
	bh=Xmyq6idOuUkI7DXMEk0dv/Qv6Zj3d2DK8qKr85jcNZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F930EGAU0eRyxA35eu3bFi3IgxG8cvRMjOFZ09PcE1a1CpHCN2KDQZV8kcZ5Tb7mF
	 ScVODtRCyrPzjUcRHHz7w2wsHzqH4KZqeNiK6yl17Prt1TRs/UDo0jRhIsCTPRVxeC
	 AVahr0Hz+YfGQG0vKS3b6JjLQQ3h/g6Dz+rr8/eafMed9eKIm6hpOuvyGMMpoO0NiV
	 M9iUn7v4gtSR0b89B7cGL3zz90COadP3QaAT0EqhrMJOyeVhwtICf7DE/3/MxJ+vsS
	 pPzyfQiaTo1nDzKsznUtE7BdU8AVow3+NTi+xpK4p0wIOcjPtj4aVriRTBda6BJNfl
	 BZM9rwY7bokjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/8] mmc: sdhci-esdhc-imx: restore pinctrl before
 restoring ios timing on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260707110303.3779799-5-ziniu.wang_1@oss.nxp.com>
References: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
 <20260707110303.3779799-5-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 11:16:12 +0000
Message-Id: <20260707111612.8FF4F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The patch unconditionally logs a warning if `esdhc_change_pinsta=
te` returns an error, which will spam dmesg on every system resume for plat=
forms that do not define pinctrl or specific pinctrl states.

Pre-existing issues:
- [High] Return value of `pm_runtime_force_resume()` is ignored, which can =
lead to an external abort (kernel panic) if it fails.
- [High] Main SDHCI interrupt remains permanently disabled after system res=
ume if wakeup setup fails or is unconfigured.
--

--- Patch [4]: [PATCH v5 4/8] mmc: sdhci-esdhc-imx: restore pinctrl before =
restoring ios timing on resume ---
commit 512978c986e4d08be55744583a21c90ad70f4d54
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: restore pinctrl before restoring ios timing on resume

SDIO devices such as WiFi may keep power during suspend, so the MMC
core skips full card re-initialization on resume and directly restores
the host controller's ios timing to match the card. This patch restores
the pinctrl state based on current timing mode before
pm_runtime_force_resume() to prevent persistent read CRC errors.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2115,6 +2115,12 @@ static int sdhci_esdhc_resume(struct device *dev)
>  	struct pltfm_imx_data *imx_data =3D sdhci_pltfm_priv(pltfm_host);
>  	int ret;
> =20
> +	if (!device_may_wakeup(dev)) {
> +		ret =3D esdhc_change_pinstate(host, host->timing);
> +		if (ret)
> +			dev_warn(dev, "Failed to restore pinctrl state\n");

[Severity: Medium]
Will this unconditionally log a warning and spam dmesg on every system resu=
me
for platforms that do not define pinctrl or specific pinctrl states? If
esdhc_change_pinstate() returns an error (like -EINVAL when imx_data->pinct=
rl
or pins_100mhz is ERR_PTR), it appears this warning will always be printed.

> +	}
> +
>  	pm_runtime_force_resume(dev);

[Severity: High]
This is a pre-existing issue, but does ignoring the return value of
pm_runtime_force_resume() allow execution to proceed with disabled clocks?

If pm_runtime_force_resume() fails to enable the clocks (e.g., in
sdhci_esdhc_runtime_resume()), the subsequent call to sdhci_esdhc_imx_hwini=
t()
will access hardware registers without an active clock. On i.MX platforms,
this can cause a synchronous external abort and crash the kernel.

> =20
>  	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);

There is also another pre-existing issue in the suspend/resume path regardi=
ng
interrupt handling:

[Severity: High]
This isn't a bug introduced by this patch, but can the main SDHCI interrupt
remain permanently disabled after system resume if wakeup setup fails or is
unconfigured?

In sdhci_esdhc_suspend():

    disable_irq(host->irq);
    ret =3D sdhci_enable_irq_wakeups(host);

If system suspend is initiated on a device where device_may_wakeup(dev) is
true, but sdhci_cd_irq_can_wakeup(host) and mmc_card_wake_sdio_irq(host->mm=
c)
are both false, sdhci_enable_irq_wakeups() returns false and sets
host->irq_wake_enabled to false.

Then on resume in sdhci_esdhc_resume():

    if (host->irq_wake_enabled) {
        sdhci_disable_irq_wakeups(host);
        enable_irq(host->irq);
    }

Would this skip calling enable_irq() because host->irq_wake_enabled is fals=
e,
leaving the main MMC interrupt permanently disabled and causing all command
and data transfers to time out?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707110303.3779=
799-1-ziniu.wang_1@oss.nxp.com?part=3D4
