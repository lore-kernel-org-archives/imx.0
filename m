Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8094137DAA8
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 07:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088713; cv=none; b=L+QoD0vegZ+qi41c1DhR170ylxNuOBSsfjPUP+Qj68+o5l7XXpYD4M3V1FmI7IluVtGZzHlonOJ+gGT1rl7HH9l+FPDmzerJjl0XkFmAvXxTKJ+be2nIlFHrK/PSMB8dOWPuLrUQ/hQihk58djr+0J1Q7wB/IWT1V1YEsOraCCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088713; c=relaxed/simple;
	bh=ZJbnE1Gf+sPFJo6V20Ft4klStjquWE8wfQuWIEHIHSs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hBES39357s92A3cbBsx1GtEChN0r9C5eBbfKah+1zFU8SGZPHs+WBeWUcG5Eq3ttsY8U48rvEwxeGtHXfHixYe9RBb+k3/2vx3XdQ5HWijhFir0eqJZ2w2oe+32K0UxlBjz1hy2A2zR6J3jeRaqvIX4NGpzyDFub6dJctBQ14x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcIumXke; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcIumXke"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794E91F000E9;
	Fri,  7 Aug 2026 07:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786088710;
	bh=qDXzKzxd+3aYaTiqSp3X0deSydMiCNQd++7orVa7G58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UcIumXkeUUFcV6GtF973WyFY9f8uNjHDDjTRkgp09f5GgLEtDqthIe5XbzMnJfMs7
	 tyJXS9SseZxiy5fm30dxZSrGg52PRDepLHb5EZxE377OUf46hmyV0T6ILAfAxd1x5y
	 VPBUtlWP8hxQVkjEdpP3gmfyYGnvmBmUVRcA6MZX0b25SOG/KSzJB0j1c9htoe+s2t
	 vHQp1kbByPr+974B6h2BmkaBdh0jiQzKC97JOmG1CK4Z7SjRYsHx73TqoGBLoM0Np/
	 saGOEFfgwgkbcMHcANf/CKQSAP5yWWEIIOLYKVEnYiVtYdS7gFFK1wdU1pmdywZ0KF
	 hJJLqY2TrxOnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] irqchip/imx-irqsteer: Fix error handling path in
 probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260807072346.1222389-2-Zhipeng.wang_1@oss.nxp.com>
References: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
 <20260807072346.1222389-2-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 07:45:09 +0000
Message-Id: <20260807074510.794E91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The chained IRQ handler accesses hardware registers without checki=
ng if the device is active, risking a system crash on spurious interrupts.
- [High] The driver fails to explicitly mask hardware interrupts during ini=
tialization, risking an unhandled interrupt storm during probe.
--

--- Patch [1]: [PATCH v3 1/4] irqchip/imx-irqsteer: Fix error handling path=
 in probe() ---
commit bda073233892b00ff41d8b06dd3aac163410e9a2
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

irqchip/imx-irqsteer: Fix error handling path in probe()

This commit splits the error handling path in imx_irqsteer_probe() so that
failures occurring after the IRQ domain creation properly remove the domain
before disabling the clock. This prevents an IRQ domain leak during probe
failures.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 87b07f517be35..a2f0629b22a37 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -241,13 +241,13 @@ static int imx_irqsteer_probe(struct platform_devic=
e *pdev)

[ ... ]

>  	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
>  		ret =3D -EINVAL;
> -		goto out;
> +		goto err_domain;
>  	}
> =20
>  	for (i =3D 0; i < data->irq_count; i++) {

[Severity: High]
This is a pre-existing issue, but does this initialization fail to explicit=
ly
mask hardware interrupts before registering the chained handler?

When irq_set_chained_handler_and_data() is called in this loop to register
imx_irqsteer_irq_handler(), the parent IRQ is unmasked at the GIC. If the
bootloader leaves any input interrupt lines unmasked and asserted in the
CHANMASK and CHANSTATUS registers, the GIC will fire immediately.

Since no child handler is registered yet, the interrupt is never cleared,
which causes chained_irq_exit() to re-unmask the parent IRQ. Does this risk
an infinite unhandled interrupt storm during boot?

Also, regarding imx_irqsteer_irq_handler() which is registered in this
loop:

imx_irqsteer_irq_handler() {
    ...
    irqmap =3D readl_relaxed(data->regs + CHANSTATUS(idx, data->reg_num));
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does the chained handler
access hardware registers without checking if the device is active?

If no child interrupts are requested, the IRQ core drops its PM reference
and the device enters runtime suspend, disabling the IPG clock. If a
spurious interrupt arrives on the parent IRQ line from the GIC, the handler
is invoked and unconditionally reads the CHANSTATUS register with the clock
off.

Could this trigger a synchronous external abort (kernel panic)? Should the
handler verify the device's PM runtime state using pm_runtime_get_if_active=
()
before accessing registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807072346.1222=
389-1-Zhipeng.wang_1@oss.nxp.com?part=3D1
