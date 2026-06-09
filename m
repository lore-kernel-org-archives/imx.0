Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850E43F0AA2
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780999480; cv=none; b=d91CKRp8sRtm7LPkDGcYMSfnczD6U8SYc3k5SGgglnM4TEaT0SKY5XyD7dvJ0PHr+vEve6JrmowJDanEXQhEQ0VlV9ysopc5sAJxo/DNA1iZoQ6DKy1DcxJznQGI/Ku3cHYapbM0mh6lUr1U3T0lgO/8uUEPiqOac3m0gi0FqvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780999480; c=relaxed/simple;
	bh=Q9E7LE6mFtNOdsWyrgvvNeWiVVUyj/+VMcbH4yBOIdc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L+4a/H8JdlglrBzBJ8AlSiISiLyqAY2IH1c6DAAPvXZ05s/52pCQtB2BjVObauFXyY8H9EH/4JoKqhkC7MAw93B5T5rsJyrETcotvioK27AGpOTg5C7wIX5duKAIUYU22+cEq3Dc35fo2cpx+HCAKVCZLcN6zASrEoBh4Zo10d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6skmC4b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6skmC4b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D581F00893;
	Tue,  9 Jun 2026 10:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780999475;
	bh=0iRRf6/eEvAoVykrdMGU3bmStJe/DZ4yVBFYN5QNOt8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J6skmC4bb8vCxhggDh7PcxhrEub2YK2nwE2TqCwgA+8kxbK5XMJYSHMS9fX7RIFWl
	 DA5BasjRqE0Gnvkc0GsXJK0IuvxdDHEqTYyUToGx6YhziVX8UTsSqqmLEKa2c1cVnR
	 NC7LwvZcGSYFzMu3k0RB0+oNhIViJfeD0Lo3IEZNoYUHv74M+ZQ2T1dUqK5uwwxFml
	 8NXN9XfCyrenDZYHAm5i9Sxfd8XHSqNPV5rsvUcmrHjkBewLeTdG5w1aMmCGbNM7l9
	 /Rgjvyf/VUaZWhiL5TgTmCjqm2Q9UlF0Fv4vkTjdjyV8rs69sJjNaBToSllcAHj01w
	 FmAPMu7iIHRfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] i2c: imx-lpi2c: reset controller in probe stage
Reply-To: sashiko-reviews@lists.linux.dev
To: carlos.song@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260609095119.924029-3-carlos.song@oss.nxp.com>
References: <20260609095119.924029-3-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 10:04:34 +0000
Message-Id: <20260609100435.25D581F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] DMA channels requested via `dma_request_chan()` are never released=
, leading to a permanent resource leak upon driver unbind or probe failure.
- [High] Device removal cancels pending async suspend without disabling har=
dware clocks, leaving clocks permanently enabled.
--

commit a0b11faf7796dce688312611f6dc5e0060ca2cbb
Author: Carlos Song <carlos.song@nxp.com>

i2c: imx-lpi2c: reset controller in probe stage

Reset I2C controller in probe stage to avoid unexpected LPI2C controller
state left from previous stages and hang system boot.

> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index 540dc6cb664eb..ccc7384323e03 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
[ ... ]
> @@ -1547,19 +1558,19 @@ static int lpi2c_imx_probe(struct platform_device=
 *pdev)
>  	ret =3D lpi2c_imx_init_recovery_info(lpi2c_imx, pdev);
>  	/* Give it another chance if pinctrl used is not ready yet */
>  	if (ret =3D=3D -EPROBE_DEFER)
> -		goto rpm_disable;
> +		goto free_irq;
> =20
>  	/* Init DMA */
>  	ret =3D lpi2c_dma_init(&pdev->dev, phy_addr);
>  	if (ret) {
>  		if (ret =3D=3D -EPROBE_DEFER)
> -			goto rpm_disable;
> +			goto free_irq;
>  		dev_info(&pdev->dev, "use pio mode\n");
>  	}
> =20
>  	ret =3D i2c_add_adapter(&lpi2c_imx->adapter);
>  	if (ret)
> -		goto rpm_disable;
> +		goto free_irq;

[Severity: High]
This is a pre-existing issue, but does this error path permanently leak
the DMA channels?

If i2c_add_adapter() fails, we jump to the free_irq label, but nothing
releases the TX and RX channels allocated via dma_request_chan() in
lpi2c_dma_init().

It looks like lpi2c_imx_remove() also entirely omits dma_release_channel()
cleanup during driver unbind:

static void lpi2c_imx_remove(struct platform_device *pdev)
{
        struct lpi2c_imx_struct *lpi2c_imx =3D platform_get_drvdata(pdev);

        i2c_del_adapter(&lpi2c_imx->adapter);

        pm_runtime_disable(&pdev->dev);
        pm_runtime_dont_use_autosuspend(&pdev->dev);
}

Will this eventually exhaust the system's DMA channels after repeated probe
failures or driver unbinds?

> =20
>  	pm_runtime_put_autosuspend(&pdev->dev);

[Severity: High]
This is also a pre-existing issue, but does lpi2c_imx_remove() leave
hardware clocks permanently enabled if the device is active when unbound?

When lpi2c_imx_remove() calls pm_runtime_disable(), it synchronously cancels
any pending asynchronous idle/suspend requests (like the autosuspend timer
started here at the end of probe), but leaves the device in its current
power state.

If the device is in RPM_ACTIVE during unbind, the clocks remain enabled. Is
a manual check or a call to pm_runtime_put_sync() needed before disabling
PM runtime to avoid a silent resource leak?

> =20
> @@ -1567,6 +1578,8 @@ static int lpi2c_imx_probe(struct platform_device *=
pdev)
> =20
>  	return 0;
> =20
> +free_irq:
> +	devm_free_irq(&pdev->dev, lpi2c_imx->irq, lpi2c_imx);
>  rpm_disable:
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609095119.9240=
29-1-carlos.song@oss.nxp.com?part=3D2
