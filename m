Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FDB3B0591
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 09:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355188; cv=none; b=oXn+/bTLjIgwprKTx+Wi7MF6UweYFg8j0MV/kGzCKpdneAKLk08sy3Mj1wHf6oUxu65GGVtpSwqu9Zicr1tEcvjg626vFbRP7B02FYCTxjvXEEFQCKcubzrETOPyR7qDmXfP8xRTKIcPV6j/9KUFeuWntO0Bzpk9WbB59iRQD7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355188; c=relaxed/simple;
	bh=ymD7Uq/45SvnBxG1c3lfx950c2z091eQgwYPQfLw22M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cUPEjAxJYOKTxZ/PZZ63G0vl+v1//v3xi6VnaHrspIHZ80KigtTUfKRb4X22+6sBp3aS8qOYb2Az0GVl2qsRhXwUwas2R/HKbSKsyQwBz57oAU5QuSbuS345KLMNUo3+uidNZOVXFUWVdvcK1YfNWwM5Plf8BMDkKtAyM+kiMYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XY0vluUC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XY0vluUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA02F1F00A3A;
	Mon, 10 Aug 2026 09:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786355187;
	bh=2Br8JmvbCOCNeBrgMQmcujk0FHQptNk7+QBOkit2AkA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XY0vluUCnt4VZTVPZMPoMx5c6fT1P0+jd1BBwPG9n0cQXLdUQNFx+EES3RvW4CMD/
	 7T4JQY9Qv9ZUfOdIknlNvFkh4ci2iSAuzZXTo032mngcxOXjJxLuazRYMmWL9RZ7Xc
	 0TGukLUIorr1K/CSM8b3gwJg++J9rHXZje8u0z/SFKW57D553xUdp3EsQV0FAHdVm4
	 BcgtP44KGcsmpb7PwR5Y0pnP4q/w2jriz0c2coA9DHljY7k3JHBRW7KFHBPIw5ee8O
	 KBEcnBy3lJD48vDWVitOSdGtF3zmsCuuioL1i++qreHYSrLonbbhIMQppd3fKp3HCV
	 4BmxYel1Pw2Sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors
 from optional IRQ lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260810093112.47807-1-phucduc.bui@gmail.com>
References: <20260810093112.47807-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 09:46:26 +0000
Message-Id: <20260810094626.DA02F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If `devm_kasprintf()` fails to allocate memory for `irq_name`, `de=
v_err_probe()` is called but its return value is not assigned to `ret`. Sin=
ce `ret` is `0` at this point, the probe function incorrectly returns `0` (=
success) despite the failure, leaving the device in a broken, partially ini=
tialized state.
--

--- Patch [1]: [PATCH v3 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors =
from optional IRQ lookup ---
commit bd6ce4edd163bb35e7e3be5ae05ae52d0c380e8a
Author: bui duc phuc <phucduc.bui@gmail.com>

usb: chipidea: ci_hdrc_imx: Propagate errors from optional IRQ lookup

This commit updates ci_hdrc_imx_probe() to propagate errors returned from
platform_get_irq_optional(). Instead of continuing without an IRQ on
failures like -EPROBE_DEFER or -EINVAL, the driver now properly aborts
and returns the error.

> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci=
_hdrc_imx.c
> index 56d2ba824a0b2..9e529398c6075 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -525,6 +525,10 @@ static int ci_hdrc_imx_probe(struct platform_device =
*pdev)
>  		data->supports_runtime_pm =3D true;
> =20
>  	data->wakeup_irq =3D platform_get_irq_optional(pdev, 1);
> +	if (data->wakeup_irq < 0 && data->wakeup_irq !=3D -ENXIO) {
> +		ret =3D data->wakeup_irq;
> +		goto phy_shutdown;
> +	}
>  	if (data->wakeup_irq > 0) {
>  		irq_name =3D devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
>  		if (!irq_name) {

[Severity: High]
This is a pre-existing issue, but missing an assignment to ret here causes
the probe to falsely succeed:

drivers/usb/chipidea/ci_hdrc_imx.c:ci_hdrc_imx_probe() {
    ...
	if (data->wakeup_irq > 0) {
		irq_name =3D devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
		if (!irq_name) {
			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
			goto err_clk;
		}
    ...
}

Because dev_err_probe() is called but its return value is not assigned to
ret, and ret is 0 at this point, the probe function incorrectly returns 0
(success) despite the memory allocation failure.

Does this code need to assign the error to ret before jumping to err_clk?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810093112.4780=
7-1-phucduc.bui@gmail.com?part=3D1
