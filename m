Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72949478868
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787059964; cv=none; b=HVxwhWlcyNHl6Evptc+YZ0jErPVxjVLs+1AUdgyuJ6ErGcoEWpRk3Rtte1SHe3stLX32fpWW/SbEKZ2DOLWhQxlJl9Btfe0PNpkJiTFWd29Q7Hy/h2TwkKXu2DsazspML4W4WyRXaQfmjsP70DDkRIeDiR6T/M96yPkb6VeZMYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787059964; c=relaxed/simple;
	bh=SVz+QfANtWE6aRgOOGKehiPu7vLV0EtO0HKQ9SCUAz4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mgVnHzsYSKPhjU5iknHpVTf4bI7w496mzZ+DOn0yE1JG8VKUg6bP+aUYvDl7DizYj688cNo7QfGUbMJiNK+5WlS4+UumvfDPdjC1xDy0nCmznhSFpJ2YbS5Me9z3oxGlmNd28taPeUltD9ag1SfetYbgMpBjsbOBqNYhviArDTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jOPzQs2J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jOPzQs2J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F691F000E9;
	Tue, 18 Aug 2026 13:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787059963;
	bh=lPo0pXzxqMCJKxgTJyjjLc/rvlVQg6D5I4fgtvpnH9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jOPzQs2JxVCtZNNoOqmaVFGxG2fEF1VRFsIzflmxcEW1P0Tp0Fdb+WFyWlMbUBIlq
	 9P2KdDFmsIuO/XD+999z7S6Y408XDY5hoGzRpJs1+Rr7XwxGo/3XNrTmJ2HbBXdHBr
	 hWUni8jts4X4L0HAaw1bFzSYSd/Ab6PEmAn+yGoDg5GPAY/2ZsV/JnpzD/wrqcfM0a
	 nv0feuFuM089oulQmQbpmbhqodUWqpAryEAEHCRBHOkPjmCb8PLNO6ca7GQmhSAZxq
	 nUkEHTYSJ9QWj+DgQzGp2UShsHMzNqNDHeP4CShXpAvRqwSEG6Wv+VTZ/wpkX2SrAc
	 4SgRitFff6OSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] irqchip: irq-imx-intmux: fix runtime PM cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiawen Liu" <1298662399@qq.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <tencent_62C095FCF52245E6900FBA2E4E008042BF08@qq.com>
References: <tencent_62C095FCF52245E6900FBA2E4E008042BF08@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 13:32:42 +0000
Message-Id: <20260818133242.D7F691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free and resource leak in the probe error path due to mi=
ssing unwind of IRQ domains and chained handlers.
- [High] Missing PM active check in the IRQ handler risks a kernel panic on=
 unclocked register access.
--

--- Patch [1]: [PATCH] irqchip: irq-imx-intmux: fix runtime PM cleanup ---
commit da49153900c09e5deedd785bdc0ee1d127431e07
Author: Jiawen Liu <1298662399@qq.com>

irqchip: irq-imx-intmux: fix runtime PM cleanup

Probe enables runtime PM and clock. Failures after clock enable only
disable clock and leak PM runtime reference/enable. This commit balances
runtime PM setup on imx-intmux probe failures in imx_intmux_probe.

> diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-i=
ntmux.c
> --- a/drivers/irqchip/irq-imx-intmux.c
> +++ b/drivers/irqchip/irq-imx-intmux.c
[ ... ]
> @@ -283,6 +285,8 @@ static int imx_intmux_probe(struct platform_device *p=
dev)
>  	return 0;
>  out:
>  	clk_disable_unprepare(data->ipg_clk);
> +	pm_runtime_put_noidle(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
>  	return ret;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does this error path fail to
unwind chained handlers and IRQ domains initialized in previous loop
iterations?

If imx_intmux_probe() fails during channel initialization (for instance, if
irq_domain_create_linear() fails for a later channel), the code jumps to the
out label. The error path disables the clock and PM but does not unwind the
IRQ domains and chained handlers registered in earlier loop iterations.

Because the data structure is managed by devm_kzalloc(), it will be
automatically freed upon probe failure. The parent IRQ line would remain
armed with a dangling pointer, which could lead to a use-after-free if the
hardware triggers an interrupt.

[Severity: High]
This is also a pre-existing issue, but is there a missing PM active check in
imx_intmux_irq_handler() that could risk a kernel panic?

Looking at imx_intmux_irq_handler():

imx_intmux_irq_handler()
    chained_irq_enter(irq_desc_get_chip(desc), desc);
    irqstat =3D readl_relaxed(data->regs + CHANIPR(idx));

The CHANIPR register is read without first using pm_runtime_get_if_active()
to verify the device is powered.

If a spurious interrupt arrives on the parent IRQ line while the imx_intmux
device is runtime suspended (and its clock is disabled), would this unclock=
ed
hardware register access cause an imprecise external abort?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_62C095FCF52=
245E6900FBA2E4E008042BF08@qq.com?part=3D1
