Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CE439B955
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 07:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086238; cv=none; b=JnJ2RRVmx/wxbFVGqlmuAOUeETZxP3hm2Zb0mF4w5QOLSOXynyJiS5+Hhq8l99hdgoPXajIBARUHuh7hZA6X8B5HftBAp15hnw5UAHvzhcI111tri+3+EMs1JNBYaPDnfd5uzwpBqYbISVvkUde8P4Zr36uGEP2BU9wk7WZtR44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086238; c=relaxed/simple;
	bh=rV/fVk02S2beANOXdBuKjDnOGhe/RliF1zYayW9Zlo4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oFyhWEyPbMGkmliW1bicIrYnSOv8EJmXeBk35MPcR1rqeLdv4CeIVhrNVoZZ+FiVKX+nkwOepXwPQvJTWZ5FNUDNyzV+9eWpUg/VSi/xMzCVzWH6f0qpluX7cacqJs5LXyuDtcJhGkVFrl9b1mnFAoIa45e1ilzlkyUKKaXuCvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEeuJIu5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEeuJIu5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8C41F00A3A;
	Fri,  7 Aug 2026 07:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086234;
	bh=LLGBA/cj2B3NtrIiBdkVAAvebULE4ZeRztAY7EVu49Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nEeuJIu5DePIJZ2s7UxgeXNqwyKTScuHsn7YeJ90KAMB5LLpQBXCiBbra+8FNZ6yp
	 z6pCTBeBoiqNBKYTAeZURviEHw5FwqCtVRJYCkdcrae7wpzYxZqK0JJsITKAzm7bdv
	 QaO7oeOw2JZGYV7DidbXFggaWvT0BIi//b4pZlx7fpoGoAK0PVkVg/ohVQrN2raKKh
	 f3f7g2gVfraKgRfpjZADoTHx8HgSaIOjmM03tbEv6SvXTmVE19xSobkPeYgA5RrOY9
	 /Ynu+6b5Fdaj5koyAOEs9sevAbhyQMCZAcY2gmCPEnGoID0bhE8p3UA5SzlsC2oWUV
	 ITnpewSRtLFBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors
 from optional IRQ lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260807065619.30604-1-phucduc.bui@gmail.com>
References: <20260807065619.30604-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 07:03:52 +0000
Message-Id: <20260807070353.CC8C41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The newly added error path for `platform_get_irq_optional()` bypas=
ses `usb_phy_shutdown()`, potentially leaking the PHY initialization.

Pre-existing issues:
- [High] Pre-existing error handlers for IRQ allocation skip `usb_phy_shutd=
own()`, potentially leaking the initialized PHY.
--

--- Patch [1]: [PATCH v2 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors =
from optional IRQ lookup ---
commit 6c82c9cecd7d9e9567b9f2902520e1c741b42e44
Author: bui duc phuc <phucduc.bui@gmail.com>

usb: chipidea: ci_hdrc_imx: Propagate errors from optional IRQ lookup

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Link: https://lore.kernel.org/all/20260806065254.28204-1-phucduc.bui@gmail.=
com/

> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci=
_hdrc_imx.c
> index 56d2ba824a0b2..7387c9903e800 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -525,6 +525,10 @@ static int ci_hdrc_imx_probe(struct platform_device =
*pdev)
>  		data->supports_runtime_pm =3D true;
> =20
>  	data->wakeup_irq =3D platform_get_irq_optional(pdev, 1);
> +	if (data->wakeup_irq < 0 && data->wakeup_irq !=3D -ENXIO) {
> +		ret =3D data->wakeup_irq;
> +		goto err_clk;
> +	}

[Severity: High]
Does this jump skip the necessary cleanup for the USB PHY?

If usb_phy_init() succeeded earlier in ci_hdrc_imx_probe() and
platform_get_irq_optional() returns an error like -EPROBE_DEFER,
jumping directly to err_clk bypasses the phy_shutdown label:

ci_hdrc_imx_probe()
...
phy_shutdown:
	if (data->override_phy_control)
		usb_phy_shutdown(data->phy);
err_clk:

Can this leak the initialized PHY state, regulators, or clocks, especially
since -EPROBE_DEFER can be hit multiple times? Should this be goto
phy_shutdown instead?

>  	if (data->wakeup_irq > 0) {
>  		irq_name =3D devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
>  		if (!irq_name) {

[Severity: High]
This is a pre-existing issue, but do the error handlers for IRQ allocation
also incorrectly skip the PHY shutdown?

If devm_kasprintf() fails or if devm_request_threaded_irq() fails below:

ci_hdrc_imx_probe()
...
		ret =3D devm_request_threaded_irq(dev, data->wakeup_irq,
...
		if (ret)
			goto err_clk;

The error paths jump to err_clk, missing the phy_shutdown cleanup.
Could this lead to similar resource leaks if the USB PHY was successfully
initialized earlier?

> 			ret =3D dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> 			goto err_clk;
> 		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807065619.3060=
4-1-phucduc.bui@gmail.com?part=3D1
