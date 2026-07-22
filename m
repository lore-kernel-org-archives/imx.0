Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C213E2AD6
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 03:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784692656; cv=none; b=Nv6DRtCn4J/yuT8GSKqFCMiRNjhVFB2ASPdBPP85JFUIs9G41O0rgmFqVaW9yG7HIAK+OYUOrl7JxiGmCS+IwYKvmWF7S7H1PBsKy8DbrkC31hIXiIaG/gQ8DsLhxfZ6TPwkcsUhnAX8kf4GVluHa7U+GHwNK0nn0I0/8/Mrl2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784692656; c=relaxed/simple;
	bh=QOoFUEMAQK7HCVwS/+1DJtgwDdCKhS6c9nQJMqwxVis=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bagwd6+3/3N45xJ1nY6PozOKguvFALTaQ7HFvTPgEDywawrfX8vqG7drXc+qzQePqUCAF4q4XTlRCkDa1PX5tVcUfBqVF4Rc2HBDNHEDS4IkOQWPEzCoz9CRNK1sthtlPP3mSxYYa1M2vP8X8emqYmX7zk5OnTUONLX2Dda5d4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLCn07aK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLCn07aK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDDE1F000E9;
	Wed, 22 Jul 2026 03:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784692651;
	bh=06uGU640yW33z/uwx0PljR4xLQM9M3VW2s/kx0Pd2D0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NLCn07aK3EG6yQ51DvYy+t+IUpUsibEzfNPGKhTQeNuDPyGEuLDvYZ2d+r8/88pZs
	 enVKkhnzdi5heYcDlwQr1woygcZnS9HpPzYqGye5a922JH3zPol4/mgn7xokKFU/0c
	 JDq90apcn1/HePhsY2Lnb0dJBfH7nr0CdMkigf8GaZe0J1LXUEEFLDBCGrvbhcWYJe
	 srtj1PLd/ahXIaViOVIrK6sek4Xi19IYMcZbHxRhQrevQ5ux/K4mVZIQENDUFZwshw
	 QGlBq6xj1xdYbcFmOh5uOJEUQ1v1fkNLuNPa4sxXELFcCC4CpVZaIspU+jv5sjKVMW
	 BtBfhfHYHWmiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] serial: imx: Remove redundant dev_err()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260722034342.316755-3-panchuang@vivo.com>
References: <20260722034342.316755-1-panchuang@vivo.com>
 <20260722034342.316755-3-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 03:57:31 +0000
Message-Id: <20260722035731.8CDDE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The global `imx_uart_ports` array retains a dangling pointer to a =
freed `sport` structure if `uart_add_one_port()` fails or when the driver i=
s unbound.
- [High] The hrtimers `trigger_start_tx` and `trigger_stop_tx` are never sy=
nchronously cancelled during device teardown, leading to a potential Use-Af=
ter-Free.
--

--- Patch [2]: [PATCH 2/5] serial: imx: Remove redundant dev_err() ---
commit 44174bba1c656c63bfedf3dc6b8ca0b3fa1165cb
Author: Pan Chuang <panchuang@vivo.com>

serial: imx: Remove redundant dev_err()

This commit removes driver-specific dev_err() calls after devm_request_irq(=
),=20
as the core function already logs detailed error messages on failure since=
=20
commit 55b48e23f5c4.

> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> index 251a50c8aa387..95fdb60e06a77 100644
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c
> @@ -2602,34 +2602,23 @@ static int imx_uart_probe(struct platform_device =
*pdev)
[ ... ]
>  	} else {
>  		ret =3D devm_request_irq(&pdev->dev, rxirq, imx_uart_int, 0,
>  				       dev_name(&pdev->dev), sport);
> -		if (ret) {
> -			dev_err(&pdev->dev, "failed to request irq: %d\n", ret);
> +		if (ret)
>  			goto err_clk;
> -		}
>  	}
> =20
>  	imx_uart_ports[sport->port.line] =3D sport;

[Severity: High]
This is a pre-existing issue, but does this leave a dangling pointer in
the global array if uart_add_one_port() fails later in the probe function?

If uart_add_one_port() fails, the function returns an error and devm
automatically frees the sport structure. However, the pointer was already
assigned to imx_uart_ports[sport->port.line] and is never cleared on the
error path. Could this lead to a use-after-free if the console subsystem or
sysrq accesses the array?

Similarly, it looks like imx_uart_remove() does not clear this array entry
before devres frees the memory during driver unbind.

[Severity: High]
This is also a pre-existing issue, but are the trigger_start_tx and
trigger_stop_tx hrtimers synchronously cancelled during device teardown?

Looking at the unbind path in imx_uart_remove():

static void imx_uart_remove(struct platform_device *pdev)
{
        struct imx_port *sport =3D platform_get_drvdata(pdev);

        uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
}

During unbind, imx_uart_shutdown() tries to stop the port and calls
hrtimer_try_to_cancel() implicitly. However, hrtimer_try_to_cancel() doesn't
wait for a currently executing callback to finish.

Since explicit hrtimer_cancel() is never called in imx_uart_remove(),
could devres free the sport structure while the hrtimer callback is still
running or pending on another CPU, resulting in a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722034342.3167=
55-1-panchuang@vivo.com?part=3D2
