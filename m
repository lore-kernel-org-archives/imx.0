Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1223E073D
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 14:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394782; cv=none; b=Z7jXMSP1pjImxA2fd1nRPkFibmkfBgyhckZWeJBilVfmvWZlEh4G8TPFjuMY+uiwR668MAAS99LGj7q7qOvhbHiRDCFRQWw3OqU/yjSYGePEU9rq0Jw5trjUPZF08ZhE4BnNS+L75ag2j5Pu42xHehd1QZ8fS9g71oQPTwrcfHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394782; c=relaxed/simple;
	bh=WLYjZ9t3XIJtH5hWlDnhy1PYqdr15a9ucfQJkIgTPMw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XvwnZnx2wq6KSCu4Wes6ep6Om4BER6hhLodajqR776ujjvq7tVn2nPsPTXkHJIuWkLof9eI0818QFDuVkkqCkfUYM40bux6P8SXTSfKX17sKNRaufQoumoU5h/IvJJOBQ6lBH9uvy3+4FloEDPf/KmBanT2peOcO4g/ulsb/Ngc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TeV1v6IP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TeV1v6IP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B421F000FF;
	Mon, 14 Sep 2026 14:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789394780;
	bh=oAShBkkWWGuA8n4xJ4T0tdoS3lN0f1dtp3wA15osrOk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TeV1v6IP2gyxcblhdmzN27kgMnVo940OFtkEouY/+bM8f6/KMowQk036G1BmSLMfa
	 HAtGFA2KqK6NrYGAQmjmQMfifWE2dZLVfOSCCWLe/mXRD3j7ZW52TuigC1qLFcOWt/
	 rfKuBtilPTK7EsqpEr5tvTndRp22Ljb6VYRMpU1WBlbNcP5DyYytnzaKiMJItXwsk9
	 4/9moas1EtzqSZzZvwtK/f0Uek7pjGugrbWMYOL5eYFFgcqZYescFW70uA07qj1asG
	 98GxW4GjV13ONDzE/3lzA6f90gzljlW+GmEmbecajnW4TYlKLTpJ9mvYs2fDNLRxSt
	 VgG7Zp7Ai7EPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] irqchip/imx-intmux: fix runtime PM teardown on remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260914134211.1734163-1-lgs201920130244@gmail.com>
References: <20260914134211.1734163-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 14:06:19 +0000
Message-Id: <20260914140620.51B421F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The error paths in `imx_intmux_probe()` fail to unwind Runtime PM =
initialization and leak IRQ domains and chained handlers, leading to perman=
ent PM usage count leaks and critical use-after-free vulnerabilities.
- [High] The chained IRQ handler accesses hardware registers without verify=
ing that the device is in an active Runtime PM state, risking a bus fault.
--

commit 3fdfa141ddbe4114d8632a64386f9d6fcbce0d98
Author: Guangshuo Li <lgs201920130244@gmail.com>

irqchip/imx-intmux: fix runtime PM teardown on remove

This commit fixes runtime PM teardown in imx_intmux_remove() by properly
resuming the device before accessing registers. It also balances the clock
enable configuration for both CONFIG_PM states.

> diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-i=
ntmux.c
> index 47c2681d138a0..de2a8f98f6255 100644
> --- a/drivers/irqchip/irq-imx-intmux.c
> +++ b/drivers/irqchip/irq-imx-intmux.c
> @@ -288,12 +288,16 @@ static int imx_intmux_probe(struct platform_device =
*pdev)
>  static void imx_intmux_remove(struct platform_device *pdev)
>  {
>  	struct intmux_data *data =3D platform_get_drvdata(pdev);
> -	int i;
> +	int i, ret;
> +
> +	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0)
> +		dev_warn(&pdev->dev, "failed to resume device: %d\n", ret);

[ ... ]

>  	pm_runtime_disable(&pdev->dev);
> +	if (ret >=3D 0) {
> +		pm_runtime_put_noidle(&pdev->dev);
> +		clk_disable_unprepare(data->ipg_clk);
> +		pm_runtime_set_suspended(&pdev->dev);
> +	}
>  }

[Severity: High]
This isn't a bug introduced by this patch, but I noticed imx_intmux_probe()
has some error paths that fail to unwind Runtime PM initialization and leak
IRQ domains and chained handlers.

If clk_prepare_enable() fails, the function returns an error without unwind=
ing
the pm_runtime_enable() and pm_runtime_get_noresume() calls:

drivers/irqchip/irq-imx-intmux.c:imx_intmux_probe() {
    ...
	pm_runtime_get_noresume(&pdev->dev);
	pm_runtime_set_active(&pdev->dev);
	pm_runtime_enable(&pdev->dev);

	ret =3D clk_prepare_enable(data->ipg_clk);
	if (ret) {
		dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
		return ret;
	}
    ...
}

Also, if initialization fails for a channel, the function jumps to the out
label and returns without tearing down the chained handlers and IRQ domains
created in previous successful iterations:

drivers/irqchip/irq-imx-intmux.c:imx_intmux_probe() {
    ...
	for (i =3D 0; i < channum; i++) {
        ...
		domain =3D irq_domain_create_linear(of_fwnode_handle(np), 32,
						  &imx_intmux_domain_ops,
						  &data->irqchip_data[i]);
		if (!domain) {
			ret =3D -ENOMEM;
			dev_err(&pdev->dev, "failed to create IRQ domain\n");
			goto out;
		}
        ...
	}
    ...
out:
	clk_disable_unprepare(data->ipg_clk);
	return ret;
}

Can this lead to a permanent PM usage count leak, or a use-after-free if
a hardware event triggers the parent IRQ line whose chained handler was left
registered?


[Severity: High]
This is a pre-existing issue, but the chained IRQ handler accesses hardware
registers without verifying that the device is in an active Runtime PM stat=
e:

drivers/irqchip/irq-imx-intmux.c:imx_intmux_irq_handler() {
    ...
	chained_irq_enter(irq_desc_get_chip(desc), desc);

	/* read the interrupt source pending status of this channel */
	irqstat =3D readl_relaxed(data->regs + CHANIPR(idx));

	for_each_set_bit(pos, &irqstat, 32)
		generic_handle_domain_irq(irqchip_data->domain, pos);
    ...
}

If a spurious interrupt arrives on the parent IRQ line while the intmux
device is runtime-suspended and its clock is disabled, wouldn't this
unclocked hardware access cause a bus fault? Should the handler use
pm_runtime_get_if_active() to confirm the device is active before reading
the registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914134211.1734=
163-1-lgs201920130244@gmail.com?part=3D1
