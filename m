Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110E6439341
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378070; cv=none; b=Yi6gJXAgFa1TFlFm4fs6MRTrpKzUlzXUu75bB7l4tVS4MIYVNQ6tCEqArN5TTeJ80vEXD6WovXyCZFVFcHC8KNbdaduvxNOMLUA81n9Cc9HAJkxpcLFCsRzQuumG5Wh2c1H6HvxrDluYWmmbs7ZTS8CEJ/AbC7FkbcCvJGyuIsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378070; c=relaxed/simple;
	bh=Cwc6H2Ivc/ZpJo1VAjygBm4OtIMZYzx/Xf1mtSUqTFc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tyCEro8CZSOSrjN/o47Lcv7qXsJEamgnTD57RrgJZLt098HqN4x1OTjbCKDw1Ftf7bk+bxePYQZtZ7pHMXFP8yGYSCdGEf7mG1BWvQCax70WKdOcdo6xRxMwk5hGrgDiDXkIQwHvNPyWj8MaQWFG7diBrh4iqRUhkOPwai8XEPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PMaesGuv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PMaesGuv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6248F1F000FF;
	Mon, 14 Sep 2026 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789378068;
	bh=kwEbHkCHse74DFS4Dx+Pw4/zvjPWehvTvmNRVR1UEEQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PMaesGuvjgG+l7cC+1SyOqyQLJvwFDYY6/AWHkI63RWPCjdLfpQcjoaJ6nTse58Y6
	 RaczZfpHjYaNJmBKDoeeD2TWxBlFudixNxPpluS9h5gRYs/huaNTVfNbXsKKh9Sklt
	 DlNkQjsRIsuCN8aGj8TOQxMXGBC15JDWv6Tv0QPc/AsqDLlajlvGFQPsmgHAp/U6cJ
	 d6Q235A5B8htKEDAhm81rZ5e83yqkEzetYrd5+/FacmkAm+5GWcgV8LmtufkOMJu1D
	 N0wK8bCVHSMVs7ox7tBCXUbovBW2G3CbGQkCIVwzwszId1NpyEvoW114ZThej7apE4
	 B2FhMGZM7dFaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i2c: imx: disable autosuspend on remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260914091544.1667137-1-lgs201920130244@gmail.com>
References: <20260914091544.1667137-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 09:27:47 +0000
Message-Id: <20260914092748.6248F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The shared interrupt handler accesses hardware registers without c=
hecking if the device is active, causing a potential system crash.
- [High] DMA channels are permanently leaked if `i2c_add_numbered_adapter()=
` fails during probe.
- [High] Race condition in `i2c_imx_unreg_slave()` allows `slave_timer` to =
be re-armed after cancellation, leading to a use-after-free.
--

commit 37a8cb58f3db8dddb256f2da1347377502c8b5b3
Author: Guangshuo Li <lgs201920130244@gmail.com>
Subject: i2c: imx: disable autosuspend on remove

This commit adds a missing pm_runtime_dont_use_autosuspend() call in the
remove path to properly clean up runtime PM state. This ensures that the
autosuspend flag is cleared when the driver is unbound.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 19ec056b00afe..4dc3df6a41a4f 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1920,6 +1920,7 @@ static void i2c_imx_remove(struct platform_device *=
pdev)
> =20
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  }
> =20
>  static int i2c_imx_runtime_suspend(struct device *dev)

[Severity: High]
This isn't a bug introduced by this patch, but does this runtime suspend
callback need to call synchronize_irq() before the clock is disabled?

Since the driver requests the IRQ with IRQF_SHARED, if another device on the
shared line triggers an interrupt while the I2C device is runtime suspended,
i2c_imx_isr() executes and reads the IMX_I2C_I2SR register:

drivers/i2c/busses/i2c-imx.c:i2c_imx_isr() {
    [ ... ]
    status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
    [ ... ]
}

Could this unconditional read of hardware registers while the controller's
clock is disabled potentially cause a fatal external abort?

[Severity: High]
This isn't a bug introduced by this patch, but is there a potential DMA
channel resource leak in the probe function?

In i2c_imx_probe(), i2c_imx_dma_request() successfully requests TX and RX D=
MA
channels. If the subsequent call to i2c_add_numbered_adapter() fails:

drivers/i2c/busses/i2c-imx.c:i2c_imx_probe() {
    [ ... ]
    ret =3D i2c_add_numbered_adapter(&i2c_imx->adapter);
    if (ret < 0)
        goto clk_notifier_unregister;
    [ ... ]
}

This jump appears to bypass calling i2c_imx_dma_free(). Does this leak the
channels permanently since they are not devm-managed?

[Severity: High]
This isn't a bug introduced by this patch, but is there a potential race
condition in i2c_imx_unreg_slave() that could lead to a use-after-free?

The function cancels the timer and clears the slave pointer without holding
the slave lock:

drivers/i2c/busses/i2c-imx.c:i2c_imx_unreg_slave() {
    [ ... ]
    hrtimer_cancel(&i2c_imx->slave_timer);
    i2c_imx->slave =3D NULL;
    [ ... ]
}

If a hardware interrupt executes concurrently between these operations, cou=
ld
i2c_imx_isr() acquire the lock, see i2c_imx->slave as non-NULL, and invoke
i2c_imx_slave_handle() which restarts the timer via hrtimer_restart()? Since
the device is subsequently freed, would this leave a pending timer referenc=
ing
freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914091544.1667=
137-1-lgs201920130244@gmail.com?part=3D1
