Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F09243849C
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 09:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131488; cv=none; b=oArRWYnU087rdnd5JA/oPE99LoDuIpRJly334KEeyItYTDKKWMVB3guJDMTdZpz1YeL77qIvn2Diu4etd2RvaRiFVMucJWnDdYh5v3t+c9A/eLr+VDZ+Qox3VJsipo99Aqc1RT3hKBMviPY+JDE7SobEnFyqNr2a29n4xbmxJFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131488; c=relaxed/simple;
	bh=IN9u0X1+/pv3mpWjcW7bMRNB4lJUqohSzOC5oMc3y3A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bRD12P8Wvj3q5MldjyHuh714neKTQ5Ql4QgrZmKQpLOXpwJgbBQUBdB4sZNJgmkuCo1UU/YFMppCMA2EDtwn9JccPfL6bK/lYBGpfLsdB7JTx0UpjA9q1vf/16Xjj2b8m2roXWarFOOzAaYbpECQKnccdpuMF017akMmQjPgT3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDvt1nbQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDvt1nbQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C7B1F000E9;
	Wed, 19 Aug 2026 09:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787131481;
	bh=5bzl9Y8kpZwHlKBUShdGhcGmB/GVRrDX6viGKtfY10w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kDvt1nbQpTuDK4/3pvdJyOrcUZ6Dz98JHZZC/RUyaGZzR0SwqSg5O0VpMfUZexGee
	 xsVWOTg5gk+5RqJ8Nib78ioeG3LqsZs5je0Ci6fpKmqOIY+qv3YRSqy74ie4ZkasCi
	 bkrbcK3QhuqTygr5e7yvZGIg8dgfBvYc646GLo6y3yOuvDf8zZD/dKjQn/NWJDL24T
	 jf4KxEyFilchbbIMuBmFmUGVGGVKWd6IXzcciZrghPY2d3upQmG1jjKkWaEnr3cqE7
	 ivHAPaLlY9USwbOxBu2p7GUzdGqccszxlBtFZgil+RPzphPopryVNMtL7t7wVfYJR5
	 qpQdE9v+TZL+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] irqchip/imx-irqsteer: Allow building as module
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260819090543.585131-6-Zhipeng.wang_1@oss.nxp.com>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-6-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 09:24:40 +0000
Message-Id: <20260819092440.E2C7B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unloading the module while the device is runtime-suspended causes =
a clock enable count underflow and kernel WARN.
- [High] Spurious parent interrupts during runtime suspend cause a bus erro=
r/system crash due to unprotected hardware access.
- [High] Missing synchronize_irq() in remove() leads to a Use-After-Free ra=
ce condition with in-flight chained handlers.
- [High] An unvalidated device tree property `fsl,num-irqs` leads to an out=
-of-bounds memory write.
--

--- Patch [5]: [PATCH v4 5/5] irqchip/imx-irqsteer: Allow building as modul=
e ---
commit 4fdbf892274cef735a839f80bcfd62708a887cbc
Author: Jindong Yue <jindong.yue@nxp.com>

irqchip/imx-irqsteer: Allow building as module

Make the driver buildable as a module by turning the Kconfig symbol into
a tristate and using module_platform_driver() instead of
builtin_platform_driver(). Let the driver core own the clock and
runtime PM lifetime using devres.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index a9909ecb6fef7..a60cc527e6191 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c

[ ... ]

> @@ -193,7 +194,7 @@ static int imx_irqsteer_probe(struct platform_device =
*pdev)
>  		return PTR_ERR(data->regs);
>  	}
> =20
> -	data->ipg_clk =3D devm_clk_get(&pdev->dev, "ipg");
> +	data->ipg_clk =3D devm_clk_get_enabled(&pdev->dev, "ipg");

[Severity: High]
This is a pre-existing issue, but since the patch modifies
imx_irqsteer_probe(), could the fsl,num-irqs property cause an out-of-bounds
write?

In imx_irqsteer_probe(), data->reg_num is calculated from fsl,num-irqs and
then used in a loop to clear CHANMASK:

for (i =3D 0; i < data->reg_num; i++)
        writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));

However, the bounds check to ensure data->irq_count does not exceed
CHAN_MAX_OUTPUT_INT happens after this loop. Could a large value in the
device tree lead to writing past the mapped IOMEM region?

>  	if (IS_ERR(data->ipg_clk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
>  				     "failed to get ipg clk\n");

[ ... ]

> @@ -293,8 +297,6 @@ static void imx_irqsteer_remove(struct platform_devic=
e *pdev)
>  						 NULL, NULL);

[Severity: High]
This is a pre-existing issue, but when clearing the chained handlers here,
is there a risk of a use-after-free?

The chained handler is cleared via irq_set_chained_handler_and_data(), but
this does not wait for handlers executing on other CPUs to finish. When
devres subsequently unmaps the I/O memory, could an in-flight
imx_irqsteer_irq_handler() concurrently read data->regs and cause a bus
fault? Would calling synchronize_irq() be needed here?

>  		irq_dispose_mapping(irqsteer_data->irq[i]);
>  	}
> -
> -	clk_disable_unprepare(irqsteer_data->ipg_clk);
>  }

[Severity: High]
This is a pre-existing issue, but does removing manual clock management in
favor of devres introduce a clock enable count underflow during unbind?

If the module is unloaded while the device is auto-suspended, the clock is
disabled by imx_irqsteer_suspend(). Because the device is left in a
suspended state when imx_irqsteer_remove() returns, devm_clk_get_enabled()
teardown will unconditionally call clk_disable_unprepare().

Since pm_runtime_disable() does not automatically resume the device, will
this result in clk_disable() being called with an enable count of 0? Should
we call pm_runtime_get_sync() in imx_irqsteer_remove() to ensure the clock
is active before devres cleanup?

> =20
>  #ifdef CONFIG_PM
> @@ -324,7 +326,7 @@ static int imx_irqsteer_suspend(struct device *dev)
>  	struct irqsteer_data *irqsteer_data =3D dev_get_drvdata(dev);
> =20
>  	imx_irqsteer_save_regs(irqsteer_data);
> -	clk_disable_unprepare(irqsteer_data->ipg_clk);
> +	clk_disable(irqsteer_data->ipg_clk);

[Severity: High]
This is a pre-existing issue, but since we are modifying the clock disable
logic in suspend, what happens if a spurious interrupt arrives while the
device is suspended?

imx_irqsteer_irq_handler() unconditionally reads the CHANSTATUS register
using readl_relaxed(). If imx_irqsteer_suspend() has disabled the hardware
clock, wouldn't reading from an unclocked peripheral trigger a bus error or
system crash?

Does the interrupt handler need to use pm_runtime_get_if_active() to verify
the power state before attempting hardware access?

> =20
>  	return 0;
>  }

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819090543.5851=
31-1-Zhipeng.wang_1@oss.nxp.com?part=3D5
