Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D533B4E84
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 09:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231302; cv=none; b=C/0qwmhm310Z48QNab0sRE5tsHUCXtuwqgCH+0qk11QrwjM35fJOOv0zcS8ZmLSEMUWhTaDi8B7haiNy8r6YWYTafoTDKpnSst8nsU5nmUYHnAvhFm+RSH+n5o81SeV4bCWqU17iS4J5dA2jr6ipdLNsYjv5BLT1w76eRq5g0AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231302; c=relaxed/simple;
	bh=O0l7yoi6XPv+BWDUSwBqERxNll3TaEyEXO/WmIKGJbE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u+tKFooBCkJvTFSkbSaD8vL2Uq1VR8RV6FzyxxwYQ9eEZ1ocEWC0dTsmAoPEToWLdyZ7zFWx0rAOoYZNLs0A2JOw4FGyz6UyjXnSEAtUARTgl1gH6aiYUJeF1hpW/zQRM49YhEoaWXwEawa+pDlKVb9iuDgTS1DDqHQljA94Mu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7ycyruM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7ycyruM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C177E1F000E9;
	Tue, 28 Jul 2026 09:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785231301;
	bh=kLVcIZctaG45Us+RUyiEBpPTN+zi+dTal7xOqZMEHVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n7ycyruMG7QKydnMqNCY7R2ElmjAZMSPGcb001s/etlC89iizpBIVJZtx6GCKnDKN
	 rfVFRPPZKfcB4WGkLQdTTrwyIQqsm27HdN5Z2vhDJUexakNOM1fZ/jk4z/hG/vv1Qi
	 8hGL9fmW96+TfewFpcw17Z6KznvTApmI89sN0SWAD9JILzVSy8Ndi1Ogen2lRNkUbu
	 dbYXSERM2kHSaoIWdaHdRw7Q7vrNKPFcZQaguj7nYH9MOzAqq/e1UhZ1+qcTtx+vCW
	 169NUXc7zL7vGhxKnFVAhNAZ+MR8tNSCz6DEOOyvN29tyTERaxdnYgEkgBvdiV+wf5
	 X73FQQx3/2mYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] irqchip/imx-irqsteer: Allow building as module
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260728092219.525449-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260728092219.525449-1-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:35:00 +0000
Message-Id: <20260728093500.C177E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] CHANMASK registers are not initialized to zero in probe(), which c=
auses an infinite interrupt storm upon module reload.

Pre-existing issues:
- [High] The irq_domain created in probe() is leaked on an error path, caus=
ing a Use-After-Free kernel panic on module unload.
- [High] The chained interrupt handler returns without calling chained_irq_=
exit() on an error path, permanently masking the parent interrupt.
- [High] The chained IRQ handler accesses hardware registers without verify=
ing if the device is active, violating Runtime PM contracts and causing bus=
 faults.
--

--- Patch [1]: [PATCH v2] irqchip/imx-irqsteer: Allow building as module ---
commit c3af83d8dda390fd5164c60f844d81afdbc265df
Author: Jindong Yue <jindong.yue@nxp.com>

irqchip/imx-irqsteer: Allow building as module

Make the driver buildable as a module by turning the Kconfig symbol into
a tristate and using module_platform_driver() instead of
builtin_platform_driver(). The remove function is updated to support
module unloading and reloading.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
[ ... ]
> @@ -359,4 +376,7 @@ static struct platform_driver imx_irqsteer_driver =3D=
 {
>  	.probe		=3D imx_irqsteer_probe,
>  	.remove		=3D imx_irqsteer_remove,
>  };
> -builtin_platform_driver(imx_irqsteer_driver);
> +module_platform_driver(imx_irqsteer_driver);

[Severity: High]
Are the CHANMASK registers properly initialized during module reload?

Since this patch allows the driver to be unloaded and reloaded as a module,
during module removal, the driver disposes of the child interrupt mappings =
but
does not clear the hardware CHANMASK registers.

On the next module reload, imx_irqsteer_probe() re-maps the parent interrup=
ts,
which unmasks them at the parent controller. Because the CHANMASK registers
retain their previous state, any active child interrupt will immediately tr=
igger
the parent interrupt.

Will this result in an infinite interrupt storm since the interrupt is never
cleared? Should the hardware initialization in imx_irqsteer_probe() clear
pending interrupts and mask registers before setting up the chained parent
interrupts?

[Severity: High]
This is a pre-existing issue, but does imx_irqsteer_probe() leak the irq_do=
main
on an error path?

If the validation of data->irq_count fails in imx_irqsteer_probe():

        if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
                ret =3D -EINVAL;
                goto out;
        }

The function returns an error without freeing the newly created irq_domain,
leaving it registered in the system's global irq_domain_list.

Because this patch converts the driver to a module, the module can now be
unloaded after this failure, freeing the memory containing
imx_irqsteer_domain_ops.

Will any subsequent traversal of interrupt domains cause a Use-After-Free k=
ernel
panic when it dereferences the freed ops pointer?

[Severity: High]
This is a pre-existing issue, but does imx_irqsteer_irq_handler() permanent=
ly
mask the parent interrupt on its error path?

When the chained handler executes, chained_irq_enter() masks and acknowledg=
es
the parent interrupt. If imx_irqsteer_get_hwirq_base() fails:

        if (hwirq < 0) {
                pr_warn("%s: unable to get hwirq base for irq %d\n",
                        __func__, irq);
                return;
        }

The handler returns immediately without calling chained_irq_exit().

If a spurious or unexpected interrupt number is dispatched by the parent
controller, does this missing unmask cause a complete loss of all interrupts
multiplexed through this line?

[Severity: High]
This is a pre-existing issue, but does imx_irqsteer_irq_handler() access
hardware registers without checking the PM state?

The irq_domain_set_pm_device() mechanism automatically drops PM runtime
references when no child interrupts are active, placing the irqsteer device=
 into
runtime suspend with its ipg_clk disabled. However, the chained parent inte=
rrupt
remains unconditionally active at the primary controller.

If a spurious interrupt arrives on the parent interrupt line while the devi=
ce is
suspended, imx_irqsteer_irq_handler() will execute and unconditionally read
the hardware register:

        irqmap =3D readl_relaxed(data->regs +
                               CHANSTATUS(idx, data->reg_num));

Could accessing unclocked hardware cause a synchronous external abort
(bus fault) or return 0xffffffff?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728092219.5254=
49-1-Zhipeng.wang_1@oss.nxp.com?part=3D1
