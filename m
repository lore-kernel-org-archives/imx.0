Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B3B2F12CE
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 07:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086446; cv=none; b=stewQCgmclVLw49WquNdkcsRTaXdreC3H/ScWrbGIrsIcXM/KVZtNFi6W3/b/5IzIM20PBRX72CWqI7hef0TpvLO6JMJfplaAr45woemVDwCQ6ZzDR6EQC100jnTwumZeVgJeqyWdwNYiS4vf/6haMUYipJ7y1OQzaAkgV2eTiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086446; c=relaxed/simple;
	bh=Z5svQ2yLsqU/4oZBWR0R9tXZgO9guASwq43ljXXH5Eg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UnUXTgUzKRksjkt/6lwmhqalVAhCZiEtZAIfY+XmrBlRexdD1Z94/QrGiDFew5qrgnMUSPmQSrEJ6EzhruyPRsiJ5PAPvwLgf0LzucUfXhOyrJ1FCG3FGMnRla3Ftdb6FYu5vaWE2zsdcrgp3/a8FA1Fg0+lvmqCkUDcmWh12nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n36FEr6N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n36FEr6N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0691F00A3A;
	Fri,  7 Aug 2026 07:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086445;
	bh=QK0xDyPemVQ9izvPAt83DJ5i7Zl6K6w1kNghu25EMZk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n36FEr6NkjOhMpoPE0XryJ/HgyhhGcEoi0fcGwAmL3rV4w1YkH9n8gym82OJZt3rf
	 jjkS+8617bYsFXFucFz0qY2RS5VLNzegsXS4SD6jKEt0anmONDCMl4fqBbkP/rFAKT
	 +uIfvgtxxx4Mw1wdIEZgwlriPOG3WQN8vpkvfsMzNDBOuymIdGDvE5MVwHQ8+YvR7/
	 QRXmHM70c2fKIRMO2gpKyEegmCJKgD9rrXp8P4E1xS2jcHbIep1tD/BDJh6fKNvxpq
	 KzCdgxZcsZ30WCbOE8ncP4RYlTL4m/BmXFSLJF4wgM/wCoLWc+njk2ZWnaeC0DHYYq
	 MjB05DLutor6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling
 when creating IRQ name
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260807065619.30604-2-phucduc.bui@gmail.com>
References: <20260807065619.30604-1-phucduc.bui@gmail.com>
 <20260807065619.30604-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 07:05:10 +0000
Message-Id: <20260807070724.DE0691F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Error paths for wakeup IRQ allocation bypass the USB PHY shutdown,=
 leading to a resource leak.
--

--- Patch [2]: [PATCH v2 2/2] usb: chipidea: ci_hdrc_imx: Fix error handlin=
g when creating IRQ name ---
commit 3a41f09eeb5ba5b2ec80f3833ced7293b9a2ffe6
Author: bui duc phuc <phucduc.bui@gmail.com>

usb: chipidea: ci_hdrc_imx: Fix error handling when creating IRQ name

This patch fixes a bug where the failure of devm_kasprintf() during wakeup
IRQ name allocation was logged but not propagated. It assigns the result of
dev_err_probe() to the return variable to properly fail the probe.

Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.o=
rg/

> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci=
_hdrc_imx.c
> index 7387c9903e800..ec2280ae82dc5 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -532,7 +532,7 @@ static int ci_hdrc_imx_probe(struct platform_device *=
pdev)
>  	if (data->wakeup_irq > 0) {
>  		irq_name =3D devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
>  		if (!irq_name) {
> -			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> +			ret =3D dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
>  			goto err_clk;

[Severity: High]
This is a pre-existing issue, but does this error path bypass the USB PHY
shutdown, leading to a resource leak?

If usb_phy_init() was called earlier in ci_hdrc_imx_probe(), jumping direct=
ly
to err_clk skips the phy_shutdown label. This leaks the PHY initialization
state (such as clocks and regulators).

If probe defers or fails here, this could cause regulator and clock enable
counts to increase endlessly on subsequent probe attempts.

Should this goto point to phy_shutdown instead?

>  		}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807065619.3060=
4-1-phucduc.bui@gmail.com?part=3D2
