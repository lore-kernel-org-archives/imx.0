Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6119A2874F5
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 03:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456711; cv=none; b=EMq2A+J2IgeaJfkzAhqlK8rfNQ9r8LIqj2Tkp99mwvgVWlCQ7rDmBYZ5MGmDFZHt6rFZjsIe7IM5mPUtQ9ygvNCljyPFmDrP7lG+u6U7JfpOFnjwDnNU7UDPPkJ2vOFnkFNBrLtij1Dp9WM4RS1MjmW03AmwMKobmuoYPY2AqfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456711; c=relaxed/simple;
	bh=vJWKV7og8OdZWXvIRknceZ4B1Fxg0C0/n/Q3EkY3Hbk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F4dWFszt3ZMAXwifF57iogXwG6i6nXgCDOaX383nW+n9XXzRElS2yXtozqinEulP7VZPT/LbNVX+LEgr33wFy3p4x6cbdt4Ua1ah3GxaKOXHZhGJu9xQnVYpRVBhXV+kj/p7/6eWzheQlzHNeZJZ9ZDAcqe1eA69akz+jefTq+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3XT45J7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3XT45J7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6D51F00893;
	Wed,  3 Jun 2026 03:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780456710;
	bh=3mSIfS/7yfn1c+eC+3zN9I8GHhwn4IfeAB4TYeS4n70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K3XT45J75k+gQNVR5KTP6DtcYDN1NxwtTWG+0AT+CAmT2oNnBmW88TdFIbhD8drEC
	 n0Hdn1LBHWP3RSZ64Zx88pb+0gqDuessdupexGsrmO1v9H2iRX2nbOxJjgWPQRmbaY
	 Ub6kcnKP4Mvp3FZvzsj4JmAKWG5ha6OdAApClq8Yclr/ZSnkQqYciQ7QsetPw6u0UF
	 ZTiJY4CjVWHRlDHvH/eBWHHB2QIIFP2SYPYqzTRtbJ/D4EgV4kXJmVIAgRMR8P1UMn
	 0eH66I5CkcF9lUeQwudTZSJSCoMAmOKDWiVCi5Ki0j+/EEXh9v970GdPYdmSg35dFw
	 M6kIOB2R83BnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] serial: mxs-auart: use devm resources for iomem and
 GPIO IRQs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260603025857.287148-3-rosenp@gmail.com>
References: <20260603025857.287148-3-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 03:18:29 +0000
Message-Id: <20260603031829.DF6D51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `clk_disable_unprepare()` for `s->clk` in `mxs_auart_rem=
ove()` causes a clock enable count leak.
--

commit bb27ea241e1f8b8f030c765ac616b8c5f0b20802
Author: Rosen Penev <rosenp@gmail.com>

serial: mxs-auart: use devm resources for iomem and GPIO IRQs

This commit replaces platform_get_resource and ioremap with
devm_platform_get_and_ioremap_resource. It also converts GPIO IRQ requests =
to
use devm_request_irq, eliminating the need for manual cleanup and simplifyi=
ng
the remove function.

> diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auar=
t.c
> --- a/drivers/tty/serial/mxs-auart.c
> +++ b/drivers/tty/serial/mxs-auart.c

[ ... ]

> @@ -1683,11 +1656,7 @@ static void mxs_auart_remove(struct platform_devic=
e *pdev)
>  	struct mxs_auart_port *s =3D platform_get_drvdata(pdev);
> =20
>  	uart_remove_one_port(&auart_driver, &s->port);
> -	auart_port[pdev->id] =3D NULL;
> -	mxs_auart_free_gpio_irq(s);
> -	iounmap(s->port.membase);
> -	if (is_asm9260_auart(s))
> -		clk_disable_unprepare(s->clk);

[Severity: Medium]
Does removing clk_disable_unprepare() here cause a clock enable count leak
when the driver is unbound?

Looking at mxs_auart_probe(), the driver acquires s->clk using devm_clk_get=
(),
but it is explicitly prepared and enabled via clk_prepare_enable(s->clk).
Because it cannot use devm_clk_get_enabled() (its rate must be set while the
clock is disabled), its lifecycle is unmanaged.

While subsequent patches might disable the clock for non-console ports at t=
he
end of probe(), console ports leave it enabled. Won't deleting this manual
cleanup leave the clock's prepare and enable counts unbalanced on unbind?

> +	auart_port[s->port.line] =3D NULL;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603025857.2871=
48-1-rosenp@gmail.com?part=3D2
