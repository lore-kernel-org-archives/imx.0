Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984DE27FD74
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 09:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786094566; cv=none; b=pqq1Y7fWIFar6v1vmDzTkpOcE0CcAVQBVOfFu9KlncYd0hCLa0L3rbv2u7frO5E8iKLXA9k3tXelcKNfNC1C8GfTmcVNro/xoTe2EZdrrzT1vGJovDv8XH8DyQLYP2kp6ECk0a/taMErAcKL4wuHMgtCW25KYaH/9TKX7Bh8ezE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786094566; c=relaxed/simple;
	bh=H0N742lp30zc/cPKT+zrlbDJ8EkZoab0OHo9yYaG1uI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J5a8TA16AQGK/RkJQSRXlkC3G+2qKYAr3Id9W5nEhXUmyJ4+kjp9AtEBqIK80/EOcPIfU2b3qKeymoZ3HyuDviPwkPzSN4g1oB0is0TBB4ps5FMhbw1sPxXILn1MU8PENQJc3+/qxjiO5os1UC1X+HJlwztsGqLgBZCnYGUq0fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVYNO1e3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVYNO1e3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4730E1F000E9;
	Fri,  7 Aug 2026 09:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786094565;
	bh=Ak+IbZ9hG+nWAadNNO1f2hK2ilAyAUKjqgwj0BxRX5c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LVYNO1e3hraQoILoAfZw1kd9dFkwo+rzRt3TyibCWUQTqskiCfciH81UzYNHFtWME
	 7Xkd8QccGbIqw9eBnPb4NxcB6UQnDm/fVhkIizUxA7i7nPzcHY+/Omf1r7U1+2cAAM
	 Hh31Oalm9jncdlhyfw0l4pUxUTsbG9YqETvoYygWdUOX3ypk9OMvsvanHZyXcLwnKN
	 zYWabMEWky09Qpbpnac6XL5HLQRR92/H+of7Mul+rcrYk0LaVoni+kiDEqGiNSHJmd
	 lhozppE0f86g3LrULNxkXIN2aBhFifVY2ZFU2fMCbEs8ZLqKxQ4jvMfo7FM5FTByqU
	 QeX7Ic/ZwRN+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] serial: 8250_mtk: Propagate errors from optional
 IRQ lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260807090945.41690-3-phucduc.bui@gmail.com>
References: <20260807090945.41690-1-phucduc.bui@gmail.com>
 <20260807090945.41690-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 09:22:44 +0000
Message-Id: <20260807092245.4730E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] The probe function exits with an error without unregistering t=
he previously registered 8250 port, leading to a port leak and a use-after-=
free of devm-allocated memory.

Pre-existing issues:
- [High] Runtime PM is enabled after the UART port is registered, violating=
 TTY subsystem guidelines and risking circular wait conditions during probe.
--

--- Patch [3]: [PATCH 3/3] serial: 8250_mtk: Propagate errors from optional=
 IRQ lookup ---
commit b5b9e4c48c3e7b1094e5e1c9834f9f8130a17c26
Author: bui duc phuc <phucduc.bui@gmail.com>

serial: 8250_mtk: Propagate errors from optional IRQ lookup

This commit updates mtk8250_probe() to propagate error codes such as
-EPROBE_DEFER or -EINVAL from platform_get_irq_optional(), rather than
continuing without an IRQ.

> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250=
/8250_mtk.c
> index e6a56cf54ae0c..d0d2aecf90059 100644
> --- a/drivers/tty/serial/8250/8250_mtk.c
> +++ b/drivers/tty/serial/8250/8250_mtk.c

[ ... ]

> @@ -587,6 +587,8 @@ static int mtk8250_probe(struct platform_device *pdev)
>  		return data->line;
> =20
>  	data->rx_wakeup_irq =3D platform_get_irq_optional(pdev, 1);
> +	if (data->rx_wakeup_irq < 0 && data->rx_wakeup_irq !=3D -ENXIO)
> +		return data->rx_wakeup_irq;

[Severity: Critical]
Does this error path leak the registered serial port?

The port was successfully registered earlier in mtk8250_probe() via
serial8250_register_8250_port(), but there is no call to
serial8250_unregister_port() before returning the error here.

Could this result in a use-after-free if the tty device is later accessed?
The devm-allocated memory for the data structure will be automatically freed
when the probe fails, but the port remains active globally.

> =20
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);

[Severity: High]
This is a pre-existing issue, but should runtime PM be enabled before
the serial port is registered?

The mtk8250_do_pm() callback invokes pm_runtime_get_sync(). If
serial8250_register_8250_port() synchronously invokes the pm callback
during registration, it will attempt to use uninitialized runtime PM
infrastructure, which can lead to circular wait conditions.

> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807090945.4169=
0-1-phucduc.bui@gmail.com?part=3D3
