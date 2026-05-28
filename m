Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E612F549F
	for <imx@lists.linux.dev>; Thu, 28 May 2026 20:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780001342; cv=none; b=YVAALexEZoV5jMkJmitkhqh5KpI5wWMgNZzQHTCQyVcPseIrSIzHK+2SofWSjBAARur2kszbciykoK12T4TJ4UE7BaoxMhukw28Ve6ZcEpleO/50ozbpMDOR2M50BUrQiSet03lh3/QGQAf0fDxdKysEiHiOmKK7JiwND2wHMzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780001342; c=relaxed/simple;
	bh=SwWrtDcejaJEiN5aCSW1i6+YW+zZziefcP7/GaVAdow=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aiByNAPa4WGg2bIKqoEGPhoI6q8D6By4HZVAafoYf2md0wzpPsKD96XCjreAMeoBi5vIMCs+7E2TwNhVHo47b7/LWRJFF0elhdu5HXXZAfZI19AGDtewDCPUlPeq7THISdcK0+0JGaGPH+E46zAnJlJf0nsBewtj8gNoWqcx0IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heDx+5MC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heDx+5MC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47801F00A3A;
	Thu, 28 May 2026 20:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780001341;
	bh=yqZs1UnsEEzG4SGzql7wCfHY6p3hE1wnpVySYobdLxQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=heDx+5MCUCJfvWlo0pinfvFGsHDnsZVw0H2BYyDPl1pK85YIGFV0HTC08960lYb6h
	 Xod9ESLgLmeYqjTOPDyeGPYnyEojult2ReHExwz/WXeUgFI7s2TGuKIe2s+93mjuFt
	 e8HexY9gsYsZtRC8x3JZNHPF3i2lsecvZ3VNhyYkGy7hNwTdH3pfT2xZfOqb7dZqkU
	 frGBE4naqvdbuWH5LgeAGjYGfPIv4GdF411t3Z4KX1iczuTvbQWVH882pRZw7NLHvI
	 b88idbBVQFu1ttkD/nSBI/3x4tPCMZIAtDooDwiJk1aLjK6OXcJM6Y7YG5h6LgIGzz
	 NrD4zlcHt/Z7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] serial: mxs-auart: fix 64-bit cast in probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260528203011.137338-1-rosenp@gmail.com>
References: <20260528203011.137338-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 20:49:00 +0000
Message-Id: <20260528204900.E47801F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Platform ID Logic / Out-of-Bounds Array Access and Dangling Pointer
- [High] Hardware Access Logic / Missing API Call causing External Abort
- [High] Use-After-Unmap / Race Condition between devm_request_irq and ioun=
map
--

commit 1f0a577246ef846dca74fbf44e87059664a89db4
Author: Rosen Penev <rosenp@gmail.com>

serial: mxs-auart: fix 64-bit cast in probe

of_device_get_match_data() returns a pointer. Casting it directly to
enum truncates on 64-bit platforms. Cast to unsigned long instead.

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

[Severity: High]
This isn't a bug introduced by this patch, but does this function properly
enable the clock before accessing hardware registers?

For non-ASM9260 variants, the driver fetches the clock via devm_clk_get()
in mxs_get_clks() but does not call clk_prepare_enable() for it. Later in
probe, it reads from the registers:

    version =3D mxs_read(s, REG_VERSION);

Accessing registers of a peripheral whose clock is disabled can trigger a
synchronous external abort. Is it safe to rely entirely on the bootloader
to leave the clock enabled during probe?

[Severity: High]
This is a pre-existing issue, but does the error path properly clear the
port from the global array?

During probe, the port is registered using the DT alias ID:

    auart_port[s->port.line] =3D s;

However, the error path uses pdev->id:

    out_free_qpio_irq:
        mxs_auart_free_gpio_irq(s);
        auart_port[pdev->id] =3D NULL;

For devices probed via the device tree, the platform bus implicitly sets
pdev->id to -1 (PLATFORM_DEVID_NONE). Could this cause an out-of-bounds
write to auart_port[-1], while leaving the actual slot with a dangling
pointer to the freed devm-allocated port?

[Severity: High]
This is a pre-existing issue, but is there a use-after-unmap race condition
in the error path?

The driver manually unmaps I/O memory but uses devm_request_irq() for the
interrupt:

    out_iounmap:
        iounmap(s->port.membase);

Because devm resources are freed only after probe returns, the explicit
iounmap happens while the interrupt handler is still registered. If an
interrupt fires during this window, mxs_auart_irq_handle() will attempt
to read from the unmapped s->port.membase, potentially causing a page
fault. Could the interrupt handling be synchronized with the unmapping?

>  	if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528203011.1373=
38-1-rosenp@gmail.com?part=3D1
