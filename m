Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7249931352B
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 06:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999477; cv=none; b=VDDrGU95MaDdv79hVj312lcCeGiTf/nMJkyQYB9gMZGxrOHdRtF6noZOT6ji74h5fKACswPzMe2IahFI7eRDntyB9P0pmo/6Moec7htmx12mIFNEvuzPgCrHMr1BCt3m+d7YSlGYypL8wAxJHfraGWyaEALqZjL+QG0NywZXdQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999477; c=relaxed/simple;
	bh=cvZVq23JrLXt6hl/LfQaDqcRfsBYomWb1Hu4E0bV1Eo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S0Ijq2v6pLsfZ1BN8jY74fAVLz6VW6ST6UteEAMCnNO6RwI5J/DyCgJzr5D9ke9cdsNV/hhQW7BOt+qsRGlaBJX8Va/aG19NaRDfTLmMI9KNuLToxLBaRZJOUrx4ouDWWWpZ67FFFfvYKv33Y58FHln1KCjOT3Dz46+zEAiBVI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WmMRMXM0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WmMRMXM0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F361F000E9;
	Thu,  6 Aug 2026 06:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785999476;
	bh=qtT5f6zUhBh+rnTzoDMF2Earx0w/7zAk3+a7n/U2FtQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WmMRMXM0XKni6/YhGesPVJKRYSK3nKV/v+Pe26sRSOI6j5JsAKnn0kyWn6pdnofWU
	 Da8tfGQKIPaohnny+OsbQTV2Sgw6YxY0Dh8xen01fGuyJhUTZroUrJfH6aK+HfIqAM
	 f9rQCwZn4pMUy+tStw1hbK6EBhi0UvMpwcppu6Ax3NPgfXwzzArMGn/aBqFc23FYaL
	 /8W54gfaH7Q4iLwgUT1DJWt4d0/MpMJKGJrwoVvanKMRyHpotx/HzZHQQjE1DibRWa
	 PWRvLi7OAM8OXStfanEYSHL8B0d+j7CmD3rXrZ7OcY5wiQdrVNjoOQV8d6CpHlddkn
	 3QeWqi9BFMflg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: Propagate -EPROBE_DEFER
 from IRQ lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260806065254.28204-1-phucduc.bui@gmail.com>
References: <20260806065254.28204-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 06:57:55 +0000
Message-Id: <20260806065755.C9F361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Direct return of -EPROBE_DEFER causes severe resource and PM QoS l=
eaks.

Pre-existing issues:
- [High] Unassigned return value from `dev_err_probe()` leads to silent pro=
be failure.
--

--- Patch [1]: [PATCH] usb: chipidea: ci_hdrc_imx: Propagate -EPROBE_DEFER =
from IRQ lookup ---
commit f3178922b4ca9aa8ccf0ccf0a9ffbc1a5d201ad1
Author: bui duc phuc <phucduc.bui@gmail.com>

usb: chipidea: ci_hdrc_imx: Propagate -EPROBE_DEFER from IRQ lookup
   =20
This commit updates the driver to explicitly check if the optional IRQ look=
up
returns -EPROBE_DEFER, propagating the error so the driver can be re-probed
when the interrupt resource becomes available.

> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci=
_hdrc_imx.c
> index 56d2ba824a0b2..f53d09e900102 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -525,6 +525,8 @@ static int ci_hdrc_imx_probe(struct platform_device *=
pdev)
>  		data->supports_runtime_pm =3D true;
> =20
>  	data->wakeup_irq =3D platform_get_irq_optional(pdev, 1);
> +	if (data->wakeup_irq =3D=3D -EPROBE_DEFER)
> +		return -EPROBE_DEFER;

[Severity: High]
Does this direct return skip necessary cleanup steps?

Returning directly here bypasses the cleanup labels (`err_clk`,
`qos_remove_request`, etc.) which leaks resources like the CPU latency
PM QoS request, clocks, and device refcounts.

Should this set `ret =3D -EPROBE_DEFER` and jump to `phy_shutdown` instead?

>  	if (data->wakeup_irq > 0) {
>  		irq_name =3D devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
>  		if (!irq_name) {
>  			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");

[Severity: High]
This is a pre-existing issue, but does this code fail to assign the return
value?

If `irq_name` allocation fails, `ret` remains 0 from earlier initialization.
This causes the probe function to jump to `err_clk` and return 0, falsely
signaling that the device was successfully probed while leaving it
uninitialized.

Should the result of `dev_err_probe()` be assigned to `ret`?

>  			goto err_clk;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806065254.2820=
4-1-phucduc.bui@gmail.com?part=3D1
