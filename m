Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F8640D577
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 22:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781045375; cv=none; b=sxhyZ4uEYCLpBQ8WXUgXsLOjKbHlEG9UMVg5bU0icmENawkP/1B+WwySsWCCTFyzi/hIJOOIm5mzK5C4gKJMET4yMfIdgcb5yDrv2k57KNY9dUx7vk018XGVGutp9f3J48GYW1YMvAlD/09+gPRQm1naQkDFVpMcs7sfnlcG07g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781045375; c=relaxed/simple;
	bh=4zZIkRnszFxR2jfCc2KIgZ/ia8UaF/inEb/DynsmKZc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SjXVOjjhrJiNOF4tL4z33p/JG5Ab+AhJKEPKns6yxyjnvL2IrHGr/XV8EhwwnkHsvGOZtjSAmGFcbKxC0P8lw/cariMVyxKopXOoYGqVeaH+uG9ljlmE1rn8yc0LVyXZGWOYx820pqlHbgnYsM90F4tCMbjzMT1es6HbbZmTwQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/tGMENo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/tGMENo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E8A1F00893;
	Tue,  9 Jun 2026 22:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781045374;
	bh=S0LZsFBiTMYpWlOU4YbE/que7iDrKYS7U54r293m+Ic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y/tGMENoNtJhp+z+svnpDTH61/Pcgjw7azCgNPI5QQzjQ9hkgo2V6mJHTGdmZHNeI
	 YvaRSMTqRbTXxfYpiCpHeX6db8jnJc8rJJ6KT47Jm9ZK50m07IQ8FL5qhbhOp/b7ya
	 puk5TfWOvnFyJNzHO6hjt99z61SIJE8fLsoJ0lDytNEmzA2fmHuhRvpF5xCSs0mDGg
	 0NgQ5EOIyEx8zyfInWSor3TjQzDsACcUzbstxGIg4h88H4XQodaqDjpz7f+GqNwh+A
	 Oh695FXGopNE5SiMN9yOHn5PeYfb4hJWmjhfRxru7KMMv9FGz6eqK8UvZ5C7KW2mu8
	 AkAd4l+igNm6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 1/4] serial: mxs-auart: fix cast type for
 of_device_get_match_data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260609223717.41670-2-rosenp@gmail.com>
References: <20260609223717.41670-2-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 22:49:33 +0000
Message-Id: <20260609224934.13E8A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds array write to negative index (-1) due to using pdev=
->id.
- [High] Use-after-unmap race condition due to mixing devm_request_irq with=
 manual iounmap.
--

commit 65b6a79a32694ff06e9c834fc282d2c8989565ff
Author: Rosen Penev <rosenp@gmail.com>

serial: mxs-auart: fix cast type for of_device_get_match_data

of_device_get_match_data returns const void*. Cast to unsigned long to
avoid implicit integer truncation warnings. All the data parameters are
correct anyway.

> diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auar=
t.c
> index 693b491f1e755..3e14c2768c48e 100644
> --- a/drivers/tty/serial/mxs-auart.c
> +++ b/drivers/tty/serial/mxs-auart.c
> @@ -1598,7 +1598,7 @@ static int mxs_auart_probe(struct platform_device *=
pdev)
>  		return -EINVAL;
>  	}
> =20
> -	s->devtype =3D (enum mxs_auart_type)of_device_get_match_data(&pdev->dev=
);
> +	s->devtype =3D (unsigned long)of_device_get_match_data(&pdev->dev);
> =20
>  	ret =3D mxs_get_clks(s, pdev);
>  	if (ret)

[ ... ]

>  out_free_qpio_irq:
>  	mxs_auart_free_gpio_irq(s);
>  	auart_port[pdev->id] =3D NULL;

[Severity: High]
This isn't a bug introduced by this patch, but does this result in an
out-of-bounds write to a negative index?

For devices instantiated via Device Tree, pdev->id is initialized to
PLATFORM_DEVID_NONE (-1).

The driver correctly registers the port using auart_port[s->port.line] =3D =
s;
earlier in probe, but on the error path it attempts to clean up using
auart_port[pdev->id] =3D NULL;.

Could this corrupt the adjacent global memory in the BSS/Data section? It a=
lso
seems to fail to clear the actual dangling pointer at
auart_port[s->port.line], which might lead to a use-after-free later.

> =20
>  out_iounmap:
>  	iounmap(s->port.membase);

[Severity: High]
This is a pre-existing issue, but does this manual iounmap() create a
use-after-unmap race condition?

The driver requests the main UART interrupt using devm_request_irq().
Devm-managed resources are freed automatically, but only after the probe
function returns.

Since the memory is manually unmapped here, there is a window where the
interrupt handler mxs_auart_irq_handle() remains registered and active.

If a spurious interrupt fires during this window, the handler could execute=
 an
MMIO read via mxs_read(s, REG_STAT) on the unmapped memory, potentially cau=
sing
a kernel page fault.

[ ... ]

>  static void mxs_auart_remove(struct platform_device *pdev)
>  {
>  	struct mxs_auart_port *s =3D platform_get_drvdata(pdev);
> =20
>  	uart_remove_one_port(&auart_driver, &s->port);
>  	auart_port[pdev->id] =3D NULL;

[Severity: High]
This is a pre-existing issue, but doesn't this also result in the same
out-of-bounds write to a negative index as seen in the probe error path?

>  	mxs_auart_free_gpio_irq(s);
>  	iounmap(s->port.membase);

[Severity: High]
This isn't a bug introduced by this patch, but does this create the same
use-after-unmap race condition during device removal?

Since the devm subsystem cleans up the IRQ handler after remove() completes,
manually unmapping the memory here leaves a window where an active interrupt
could trigger an MMIO read on the unmapped memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609223717.4167=
0-2-rosenp@gmail.com?part=3D1
