Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA16D46E00B
	for <imx@lists.linux.dev>; Thu, 27 Aug 2026 15:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846175; cv=none; b=Voij1ilQ5ZeVi/RH0e3LbOiA1aoe2IDYSxP//Cq9cybRQKPGzUfh0AZT10joVKnTAZt+D/iLIQVlpCK+VHwmOB6ciEG5QJAnvF+LhU+HJJngvv2Ldg+OkPRH2DfkjpyxvT63H37nxO6xR7miXjnpJrCY1Htp9TqQ8jsaO9nJLs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846175; c=relaxed/simple;
	bh=N5iJvS1KoI5bp5yvsvC6gWtdft8+DTZzLiaS4T/BtCc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DgpOkLfZuvDu06N5kdVI8iR8jFhqInShc4wpfHk/e473OnhJAYLkJ19JfFjtd7PKfEc6f7lubl2JgimAAHG8UEpNO/0Ej6Cmdgw//w9thTsiFvcsKRq9oX2yHxcuGehrfoarkydy5EGrHVFJXDQvqk5XOIOQaVgc+E1T1/HAPi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecmwhf5h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecmwhf5h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFA71F000E9;
	Thu, 27 Aug 2026 15:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787846174;
	bh=Uyy9HRUZjMy3QOnQkFEMjDs/BiWRNMET23bRpHCZi/M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ecmwhf5hgtv+pNQ0fm9xHS4CtDrHqKBrV53V8OpSuVlqtCAzK3HeFLZJs2F9YQqec
	 bNRZL4LhJm/6YF+CkRZ+h60FWmf57nOVf5OroJKG2ideH2xOsBTN19zU5zuUW1glX8
	 frJtBecJfQUrdo1J81MB+duzQNDjATvcT0uCxtw1dPsJ4KHuI7JwQ83o3B1dBEp7FV
	 s+oQYrK6XkTX1qWQI8evvngF3942R6FVakFiXm0DwdQwlfMqG9FDmoxQ0Lc8cBaU4Z
	 XWSoO9W7WpunSXfWypsCmMn5yQOk9Qlas8GxTQHY42LtJrTi5AvszLPD4TN1lzZIYw
	 kU2zrwoP4Zltg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] i2c: imx: release DMA channels on probe error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shengzhuo Wei" <me@cherr.cc>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-2-271d4adc03a0@cherr.cc>
References: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
 <20260827-i2c-dma-channel-leak-v1-2-271d4adc03a0@cherr.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 15:56:13 +0000
Message-Id: <20260827155614.1BFA71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The IRQ handler accesses hardware registers without verifying if t=
he device is runtime active, and the runtime suspend callback lacks `synchr=
onize_irq()`. This combination causes system crashes or invalid reads on sh=
ared IRQ lines.
--

commit bd798c45679ae67bd4a370c03b96a207ed6bc4a9
Author: Shengzhuo Wei <me@cherr.cc>

i2c: imx: release DMA channels on probe error

i2c_imx_dma_request() acquires exclusive tx/rx DMA channels and is optional.
If i2c_add_numbered_adapter() then fails, probe returns without releasing
the channels. This commit ensures the channels are released on the probe
error path.

Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
Cc: stable@vger.kernel.org

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 19ec056b00afe..c24d9201a60e8 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1880,6 +1880,8 @@ static int i2c_imx_probe(struct platform_device *pd=
ev)
> =20
>  clk_notifier_unregister:
>  	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
> +	if (i2c_imx->dma)
> +		i2c_imx_dma_free(i2c_imx);
>  	free_irq(irq, i2c_imx);

[Severity: High]
This isn't a bug introduced by this patch, but since we're modifying the
probe and IRQ cleanup paths, could this driver crash due to unclocked
register reads if the IRQ is shared?

Looking at the driver, the IRQ is registered as shared during probe:

drivers/i2c/busses/i2c-imx.c:i2c_imx_probe() {
    ...
    ret =3D request_irq(irq, i2c_imx_isr, IRQF_SHARED | IRQF_NO_SUSPEND,
                      pdev->name, i2c_imx);
    ...
}

However, the runtime suspend callback disables the clock without ensuring
no ISR is running:

drivers/i2c/busses/i2c-imx.c:i2c_imx_runtime_suspend() {
    ...
    clk_disable(i2c_imx->clk);
    ...
}

If another device sharing the same interrupt line fires while this device
is runtime suspended, i2c_imx_isr() is called and unconditionally reads from
the unclocked hardware:

drivers/i2c/busses/i2c-imx.c:i2c_imx_isr() {
    ...
    status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
    ...
}

Should the runtime suspend callback use synchronize_irq(), and the ISR use
pm_runtime_get_if_active() before accessing hardware registers to prevent
these invalid reads or system crashes?

>  rpm_disable:
>  	pm_runtime_put_noidle(&pdev->dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-i2c-dma-ch=
annel-leak-v1-0-271d4adc03a0@cherr.cc?part=3D2
