Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F470383C63
	for <imx@lists.linux.dev>; Fri, 29 May 2026 17:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780076044; cv=none; b=DgkyVPTM/vO6CUdnGZDRlz+4lTpnl1WnjY/v0YNuwMLpSa38XkoimiEJnJFvLX+SSdRstLUiIQBdtqKX3ZAHr56E932rPBJ/W12N1PBKAStU5j8HjWhLPi1uSdcpl+PjJ/Nd5BNg9Ar2EdnTN2v4qS/rG7Vddr4Ty82SrmpmkIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780076044; c=relaxed/simple;
	bh=mCTnI2oQ8G2tIALP/ChJFue+DN4ym18NHMLvUr3EzZg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VpPpNS7L1rtCpJnqbxlNoHY3YoRqPLx23iFqP0m8NKYkFSdyIhoWCebF9rP8xYy3y2afBpa3/ZcaqkzlC6fC4IaZ+EXFAJymY/rZKMn3JDaxg19e3yYAE5QJ/FWc/AwD0o9HRkO6hr4QNF3ZD3WTrxdlFslcWoo/h2xNZKcUOOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=muf8gXDT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="muf8gXDT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DE11F00893;
	Fri, 29 May 2026 17:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780076042;
	bh=AWHAHhwrHq65wIOAglpH6+jne9a3TQA7MmZhlYzZS9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=muf8gXDTdl9PgeP/74fzMskguTu8AU0JeAs8jpOcPCZw3eKIQDrELKvao6Q3rDMR3
	 mDDY+r85Pl7LZAbTtCzn1xjbT3xLmnqbSGOfGhNO++HuSsph8V0qsfnUkjFMQI3oBv
	 +Tw7n/10PG10Onhw4K7BaUNy3MaD9/Znpu9Orh6ABY/CJVqPsp/0VxdSG+EM2YzQax
	 MTcgEfLoabbI0As4o3KzxVIhh2OrcDR+4iFqpf5tijtFo12kAnyUyXGWdOUHkAJiLG
	 15IydiLjzH7otHkcM8ORthdEAlNCwVIxz+KpoJdTsj8QJftJSSiVgpzb5CnPA8tI9U
	 dcV/f8BFVDpvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] mailbox: imx: Move the RXDB part of the mailbox
 into the threaded handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260529-imx_mbox_rproc-v1-3-b8ffc36e11e5@linutronix.de>
References: <20260529-imx_mbox_rproc-v1-3-b8ffc36e11e5@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 17:34:02 +0000
Message-Id: <20260529173402.B8DE11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect bitmask macro used when unmasking RXDB interrupts in the=
 threaded IRQ handler.
--

commit 52f5529242040f4be31a0457d8d67afe5b6d8073
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

mailbox: imx: Move the RXDB part of the mailbox into the threaded handler

This commit moves the RXDB callback handling into the threaded handler for
the i.MX mailbox driver. It unconditionally unmasks the RXDB interrupt in
the threaded handler after processing, similar to how the standard RX
interrupts are handled.

> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
[ ... ]
> @@ -528,6 +528,12 @@ static irqreturn_t imx_mu_isr_th(int irq, void *p)
>  			imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, cp=
->idx), 0);
>  		return IRQ_HANDLED;
> =20
> +	case IMX_MU_TYPE_RXDB:
> +		cp->pending =3D 0;
> +		priv->dcfg->rxdb(priv, cp);
> +		imx_mu_xcr_rmw(priv, IMX_MU_GIER, IMX_MU_xCR_RIEn(priv->dcfg->type, cp=
->idx), 0);

[Severity: High]
Does this code use the correct bitmask macro for unmasking the RXDB interru=
pt?

The IMX_MU_TYPE_RXDB case appears to be using IMX_MU_xCR_RIEn (Receive
Interrupt Enable) instead of IMX_MU_xCR_GIEn (General Purpose Interrupt
Enable) to generate the bitmask.

On non-V2 hardware, these macros target different bit ranges (bits 24-27 for
RIEn vs bits 28-31 for GIEn). Could this leave the RXDB interrupt permanent=
ly
masked after it fires once, and inadvertently set incorrect bits in the
control register?

> +		return IRQ_HANDLED;
> +
>  	default:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-imx_mbox_r=
proc-v1-0-b8ffc36e11e5@linutronix.de?part=3D3
