Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAE33F4DD8
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188203; cv=none; b=lFE3YkjPT+F2YSkorAFf44k1jK1wbL/XRNk/F+ZvxeUZCQ06zGFEGJhgcAZmkMIQfESsNyVibwYG60OolG4Mf+GsgXRu8eLxkz4ydSpCzVNtHFw0mMySHfokUMF9WW4s4T3018g2erFf25GGK229i2NxLHIboqIvqX+Mbp1o4Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188203; c=relaxed/simple;
	bh=uJ1lQ/aLlA2/QceM+5YA0tTGCFYKCeXAoS7GvKNyLwg=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TF0PP1TLwt/RVz7Mr2C3l/UbYYg+RIhlnc/X7GFrZkdqd4JxYW6ozkgtNdN+iR6lzULJVaQf3Eh7mJVSaQtn1pftvdiAgYaubLVdiEYilan/QsSIaayw2FKjw9BRfmzlz0VXWjLL9LayJvVo5yhGnheLQfgLzygGBIBXY/R/Ru4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ArQGp0V7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ArQGp0V7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059F6C2BCB3;
	Tue, 19 May 2026 10:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779188203;
	bh=uJ1lQ/aLlA2/QceM+5YA0tTGCFYKCeXAoS7GvKNyLwg=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date:From;
	b=ArQGp0V747RrX60ILL2Q/Mti/IzUg66bYhWsBNHDk7KqjjvdMrZ/d4lIyig1vE6FU
	 6wkOWBfzUljKYusEUfmlBuuiBXyz8QB9o80IESwmlP1R1ia1AaHLtgVlaSbPXMYRjr
	 kQWfUiBuE/KIoF7c3WvRRrr2bxM/LmHqU/n1/IEOwIe7V13/h1eOyUnY14P4zZjSR0
	 5BdV+S011xsviNno53gb7C2gyiJtdADiVRzWxlT0f6X1210fvK0MJzcA5OL/WGGAoS
	 o9IpOncAehE1qhLwArFPTlYZwmDlRTW/eJesTw3xDN47MocyisumqLcL0AEa+taKKO
	 IeNElN/Rxe1IQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: reset controller in probe stage
Reply-To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260519104214.2794176-1-carlos.song@oss.nxp.com>
References: <20260519104214.2794176-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 10:56:42 +0000
Message-Id: <20260519105643.059F6C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Moving devm_request_irq() after PM runtime initialization causes a=
 PM runtime usage counter and clock leak if the IRQ request fails.
--

commit 3005ae3d3fdbe3e9115c8d88256efdcb9d2fcde9
Author: Carlos Song <carlos.song@nxp.com>

i2c: imx-lpi2c: reset controller in probe stage

This commit resets the I2C controller in the probe stage to avoid an
unexpected LPI2C controller state left from previous stages that could hang
system boot.

> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index a01c236964819..da40b365a07f0 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
[ ... ]
> @@ -1535,10 +1530,23 @@ static int lpi2c_imx_probe(struct platform_device=
 *pdev)
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> =20
> +	/*
> +	 * Reset all internal controller logic and registers to avoid effects o=
f previous status
> +	 * The reset takes effect immediately and there is no minimum delay req=
uired before
> +	 * clearing the software reset.
> +	 */
> +	writel(MCR_RST, lpi2c_imx->base + LPI2C_MCR);
> +	writel(0, lpi2c_imx->base + LPI2C_MCR);
> +
>  	temp =3D readl(lpi2c_imx->base + LPI2C_PARAM);
>  	lpi2c_imx->txfifosize =3D 1 << (temp & 0x0f);
>  	lpi2c_imx->rxfifosize =3D 1 << ((temp >> 8) & 0x0f);
> =20
> +	ret =3D devm_request_irq(&pdev->dev, lpi2c_imx->irq, lpi2c_imx_isr, IRQ=
F_NO_SUSPEND,
> +			       pdev->name, lpi2c_imx);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", lpi2c_im=
x->irq);

Does this code leak the PM runtime usage counter and hardware clocks if the
IRQ request fails?

Because this block was moved after pm_runtime_enable() and
pm_runtime_set_active(), a direct return bypasses the rpm_disable cleanup
path.

Should this instead jump to rpm_disable rather than returning directly, so
that pm_runtime_put_sync() and pm_runtime_disable() can run and disable the
clocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519104214.2794=
176-1-carlos.song@oss.nxp.com?part=3D1
