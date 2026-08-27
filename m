Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D007F3806C5
	for <imx@lists.linux.dev>; Thu, 27 Aug 2026 15:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846115; cv=none; b=tNOMrHzwGNSvOZkhq8Opb3ddPTDQA67aajS1FAmJhnqPzm3KTDTUDhpMMSr71CsUYxtyBN39geR9msmgPyMLoDbnFspFVI5AOH812+JF3U0KBZah1R5EjkmQicjDCAFeYP0okpLp7GjsmEZqJPS/ga9OvMWfKss8SDy5SUWwy4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846115; c=relaxed/simple;
	bh=G7CqoZvE3KG/07eHU2U84P2T3/K66xN/oOCCqp6KwXo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R8gsi8BwOu5y2jq1ceRfSiXidOPVWuNmZK0ESD5PdohQHlmF4aGHgnBhS1yJoJdr8tg9vEpBocVPSF3j91dHAp0t/GDb7yWLMzUMxL1OJsH0mHdCMd/qJOPZ+DuS9A8TRYhen2rF8DSAyYcA0RqUKYKFx4Y4C9mtyKdegeDjiKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxPLSinU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxPLSinU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F251F000E9;
	Thu, 27 Aug 2026 15:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787846113;
	bh=6JZEAVxH3Y59uJqctye7xvwSo9UMHdpPMFoB4FzyN6I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cxPLSinUupFU6lVlqVa3VTaZ+S1mtOg6Hob9K1yJS0WKAa8FVnAjcYAerY7BTLHZK
	 96JtxLVVquMDlJHyAqzrvVCMwMDXlgyMWdnh9p4SOBDlbIiHVBQXOmOkglOLgPe65I
	 BmJsxG1sQBsuGiYAe7mScGr9AkyT4skXKxNpM6s2ZkNbM8zkNyy+fPGkprl23d+8o+
	 uPsB6v1iLG1F4O6DLNBFwZIu+UYvc/slRJqRUKegqWYg8tNOEwazH/gTzPWwpnlgGA
	 HyeOGfPc8A2aOt6VBg+cbk9I2lGKuMvTE+x3b8ViymWKpS6OBM967KZ3O2LTOqqWbh
	 XsmIUlK4n1MAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] i2c: at91: release DMA channels on remove and probe
 error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shengzhuo Wei" <me@cherr.cc>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-1-271d4adc03a0@cherr.cc>
References: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
 <20260827-i2c-dma-channel-leak-v1-1-271d4adc03a0@cherr.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 15:55:12 +0000
Message-Id: <20260827155513.55F251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] DMA channels requested by at91_twi_configure_dma() are leaked if b=
us recovery initialization returns -EPROBE_DEFER.
- [High] Zero-length I2C messages (e.g., SMBus Quick) unconditionally fail =
with -ENOMEM when DMA is enabled, violating I2C core DMA contracts.
- [High] Unbalanced clk_disable_unprepare() on driver unbind due to devm_cl=
k_get_enabled() and PM runtime suspend.
--

commit 6d740b54bf5767e2505374ef8cd5b48bd70b0cc4
Author: Shengzhuo Wei <me@cherr.cc>

i2c: at91: release DMA channels on remove and probe error

This commit moves the DMA channel release logic into a new helper function
at91_twi_dma_release(). It calls this helper during driver removal and on
the adapter registration failure path to prevent DMA channels from leaking.

> diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-=
at91-core.c
> index b64adef778d4b..8ca4556d96649 100644
> --- a/drivers/i2c/busses/i2c-at91-core.c
> +++ b/drivers/i2c/busses/i2c-at91-core.c
> @@ -255,6 +255,7 @@ static int at91_twi_probe(struct platform_device *pde=
v)
>  	if (rc) {
>  		pm_runtime_disable(dev->dev);
>  		pm_runtime_set_suspended(dev->dev);
> +		at91_twi_dma_release(dev);
> =20
>  		return rc;
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but does this code also leak DMA
channels if an error occurs earlier in probe?

If at91_init_twi_recovery_info() returns -EPROBE_DEFER (e.g. waiting for
pinctrl), at91_twi_probe_master() propagates the error to at91_twi_probe(),
which returns early:

drivers/i2c/busses/i2c-at91-core.c:at91_twi_probe() {
    ...
    if (dev->slave_detected)
        rc =3D at91_twi_probe_slave(pdev, phy_addr, dev);
    else
        rc =3D at91_twi_probe_master(pdev, phy_addr, dev);
    if (rc)
        return rc;
    ...
}

Since at91_twi_probe_master() acquires the DMA channels via
at91_twi_configure_dma() before calling at91_init_twi_recovery_info(),
does returning here without calling at91_twi_dma_release() cause a resource
leak of DMA channels?

> @@ -270,6 +271,8 @@ static void at91_twi_remove(struct platform_device *p=
dev)
> =20
>  	i2c_del_adapter(&dev->adapter);
> =20
> +	at91_twi_dma_release(dev);
> +
>  	pm_runtime_disable(dev->dev);
>  	pm_runtime_set_suspended(dev->dev);

[Severity: High]
This is a pre-existing issue, but can this removal sequence cause a clock
enable count underflow?

The probe function calls devm_clk_get_enabled(), which registers a devres
action to call clk_disable_unprepare() on removal. The PM runtime suspend
callback at91_twi_runtime_suspend() also disables the clock.

In at91_twi_remove(), there is no pm_runtime_get_sync() before
pm_runtime_disable(). If the device is runtime-suspended during unbind, the
clock is already physically disabled. When remove() returns, does the devres
action fire and call clk_disable_unprepare() a second time, leading to a
kernel WARN and potential clock tree corruption?

>  }
> diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2=
c-at91-master.c
> index 894cedbca99f5..68238cc8aee0d 100644
> --- a/drivers/i2c/busses/i2c-at91-master.c
> +++ b/drivers/i2c/busses/i2c-at91-master.c
[ ... ]
> @@ -817,11 +817,21 @@ static int at91_twi_configure_dma(struct at91_twi_d=
ev *dev, u32 phy_addr)
>  error:
>  	if (ret !=3D -EPROBE_DEFER)
>  		dev_info(dev->dev, "can't get DMA channel, continue without DMA suppor=
t\n");
> +	at91_twi_dma_release(dev);
> +	return ret;
> +}
> +
> +void at91_twi_dma_release(struct at91_twi_dev *dev)
> +{
> +	struct at91_twi_dma *dma =3D &dev->dma;
> +
>  	if (dma->chan_rx)
>  		dma_release_channel(dma->chan_rx);
>  	if (dma->chan_tx)
>  		dma_release_channel(dma->chan_tx);
> -	return ret;
> +	dma->chan_rx =3D NULL;
> +	dma->chan_tx =3D NULL;
> +	dev->use_dma =3D false;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does enabling DMA cause
zero-length I2C messages (like SMBus Quick) to unconditionally fail with
-ENOMEM?

When dev->use_dma is true and a zero-length message is submitted,
i2c_get_dma_safe_msg_buf() correctly returns NULL according to its API
contract (as the length is below the threshold of 1). However, the driver
checks this in at91_twi_xfer() and returns -ENOMEM:

drivers/i2c/busses/i2c-at91-master.c:at91_twi_xfer() {
    ...
    dma_buf =3D i2c_get_dma_safe_msg_buf(m_start, 1);
    if (!dma_buf) {
        ret =3D -ENOMEM;
        goto out;
    }
    ...
}

Does this break zero-length I2C transfers by aborting them instead of
gracefully falling back to PIO?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-i2c-dma-ch=
annel-leak-v1-0-271d4adc03a0@cherr.cc?part=3D1
