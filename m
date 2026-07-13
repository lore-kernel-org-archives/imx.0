Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93BC35F172
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 05:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783918937; cv=none; b=tY6KiNKIsRXyYTjkXg0m70r7xP7o1H/1C46oLoXHpi5dS4ahhELlkcSvSe6N61wEckdy7Tr9aITmYjOvisF+5KrtiQaLlyhsIL/B0Np74HuZ3L8nSpl4xV0b7hst47zFcjgevjqnaw5YhVnLZOiQyAevLpPjrIktvSt0xW6Tb0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783918937; c=relaxed/simple;
	bh=Ozm0g5q7CwjoJasH6vuugzA9hDhIhp7TJzZuaKIwcTQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A92EewBB6FW8jdkszEoxI8a/LO2h0rOijjllbHl9jSnVLDHHwqbeZLSvmjSNWYJs/P7flkvBe6Y/DRQyMcLdlCXOvNakNktxTHk1i18SXMxnSmTgABHimLzIjkDjUccCkPMu4TzoHOxgEl7Vv46ILAVLR1zi6/KXAKp7GdeF5kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3BzHgcl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3BzHgcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025A61F000E9;
	Mon, 13 Jul 2026 05:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783918936;
	bh=er3c08RjosMhW3/x+/PUr8rYJ0BN1DUMmc70k9JOJYU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O3BzHgclEtNXvAO9XRVcBu/cBl6rUgaY//uqBLDSr1mi+U+4mhSiWeIpzPg37fEOG
	 aa5zWc3bvFNWWPQ2h30y5J/SxAr1olq7CzqCuZr39NIbnCE97UbX9Xzqv9IEt+9Y3T
	 smjnmBYxuefuY13SHHE3fFXl9RObtagzPiBGdkIyET2vpdYAya7R7QB6hxsVBAPekR
	 9zT0OUG3YszKXcPumBjBXHdg1PV/LfR6ACFmLkMfi7LGs4Lr3a2I5amF4+bFIkfJwD
	 JnQOrXBEtG2IwrPXB3hjN0cpUOELLslx2enWhKgQ64u/42D4itnx2oJuBDx2YycbSm
	 MwFzGM3cLuC9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/8] mmc: sdhci-esdhc-imx: restore pinctrl before
 restoring ios timing on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260713043904.4144172-5-ziniu.wang_1@oss.nxp.com>
References: <20260713043904.4144172-1-ziniu.wang_1@oss.nxp.com>
 <20260713043904.4144172-5-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 05:02:15 +0000
Message-Id: <20260713050216.025A61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Spurious pinctrl warnings on every system resume for platforms w=
ithout pinctrl configuration.

Pre-existing issues:
- [Critical] Unchecked return value of pm_runtime_force_resume() may lead t=
o unclocked register access and system crash.
- [High] Error paths in system suspend and resume callbacks fail to balance=
 the runtime PM usage counter.
- [High] esdhc_change_pinstate() uses IS_ERR() instead of IS_ERR_OR_NULL(),=
 leading to a potential NULL pointer dereference on misconfigured DTs.
--

--- Patch [4]: [PATCH v6 4/8] mmc: sdhci-esdhc-imx: restore pinctrl before =
restoring ios timing on resume ---
commit 8ca4820b7ac16444e14c14d08a8eaf0a8e80915f
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: restore pinctrl before restoring ios timing on resume

SDIO devices such as WiFi may keep power during suspend, so the MMC core
skips full card re-initialization on resume and directly restores the host
controller's ios timing to match the card. This patch restores the pinctrl
state based on current timing mode before pm_runtime_force_resume() is
called.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 2da5c8ab3e622..bc0864cb22b49 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2115,6 +2115,12 @@ static int sdhci_esdhc_resume(struct device *dev)
>  	struct pltfm_imx_data *imx_data =3D sdhci_pltfm_priv(pltfm_host);
>  	int ret;
> =20
> +	if (!device_may_wakeup(dev)) {
> +		ret =3D esdhc_change_pinstate(host, host->timing);

[Severity: High]
This is a pre-existing issue, but does esdhc_change_pinstate() fail to
catch a NULL pointer on misconfigured device trees?

In esdhc_change_pinstate(), it uses IS_ERR() instead of IS_ERR_OR_NULL():

	case MMC_TIMING_UHS_DDR50:
		if (IS_ERR(imx_data->pins_100mhz))
			return -EINVAL;
		pinctrl =3D imx_data->pins_100mhz;

If a misconfigured device tree forces UHS capabilities, the MMC core
enables UHS timings, but pins_100mhz may remain NULL. Since IS_ERR(NULL)
evaluates to false, it assigns NULL to pinctrl.

This NULL pointer is directly passed to the pinctrl subsystem:

	return pinctrl_select_state(imx_data->pinctrl, pinctrl);

This causes a panic when dereferenced by pinctrl_commit_state().

> +		if (ret)
> +			dev_warn(dev, "Failed to restore pinctrl state\n");

[Severity: Medium]
Is this warning going to trigger on every system resume for platforms
without pinctrl?

Platforms without pinctrl correctly initialize imx_data->pinctrl to an
ERR_PTR in probe(), treating it as non-fatal.

When esdhc_change_pinstate() is called, it returns -EINVAL if pinctrl
is an ERR_PTR:

	if (IS_ERR(imx_data->pinctrl))
		return -EINVAL;

This causes dev_warn() to spam the kernel log on unaffected hardware on
every system resume.

> +	}
> +
>  	pm_runtime_force_resume(dev);

[Severity: Critical]
This is a pre-existing issue, but does ignoring the return value of
pm_runtime_force_resume() risk an unclocked register access?

If the runtime resume callback fails to enable hardware clocks, the error
is returned but completely ignored here.

The driver then proceeds to access memory-mapped registers unconditionally
in sdhci_esdhc_imx_hwinit(). Accessing peripheral registers without clocks
enabled on i.MX platforms causes a Synchronous External Abort,
deterministically crashing the system.

> =20
>  	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);

[Severity: High]
This is a pre-existing issue, but do the error paths in the system suspend
and resume callbacks fail to balance the runtime PM usage counter?

In sdhci_esdhc_resume(), if mmc_gpio_set_cd_wake() fails, the function
returns early:

	ret =3D mmc_gpio_set_cd_wake(host->mmc, false);
	if (ret)
		return ret;

This bypasses pm_runtime_put_autosuspend(), leaking the usage counter
incremented during suspend.

Similarly, in sdhci_esdhc_suspend(), if pinctrl_pm_select_sleep_state()
fails, it returns early without calling pm_runtime_put() to balance
the preceding pm_runtime_get_sync().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713043904.4144=
172-1-ziniu.wang_1@oss.nxp.com?part=3D4
