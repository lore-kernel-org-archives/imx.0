Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F75B37160
	for <imx@lists.linux.dev>; Sun,  8 Dec 2024 20:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733688900; cv=none; b=q+YbVeZ/c6DktliezFJ64d5DCqMVIUb0UfHzjeI6KxXp8iRvkOcUCUAFRUJrSVdgig6HsBVSPHO8Idl8ldk/7LBXgkxW32XIO4DQ6wxGKm8Jnc/Sw6HsYDnD6PUZa8pR4VwFQ9dYef0Ltwgs9MGXY4Zy4VuYDqt/m/rSukqLGk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733688900; c=relaxed/simple;
	bh=q8Q2fkWAkgmpCgFdDgr6bk16rqAH/b15bEyD37CpUKQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bqVFKqV1OJgGb9+4i7coX9T8yqJNzyYCJ1GjvB5IMGa4FD4DqExfRqoqd0/U/Sn05dNRnXCk4iBHKTZpXqEv9Nz6IZw/I6vU/XlQ/hVvS6KNj4s37aA8ZdMdYS7xxZIG4El8AgyjsDpBUckid+QA3OrcLeQIxVm4Csld7HtAd+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f8+TC7Gy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H49E2Smj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f8+TC7Gy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H49E2Smj"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733688896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wAEQztHm1MhKPD8YoJhLpgLMiVgRYQF2dVu0Kq/kagg=;
	b=f8+TC7GyPwKR+f0lNsaBVoKKD3KlCaZGtfTGZ+3xwWqaVF45nfsC1HIZlmeTvWrT9RLL97
	xRy/+BFSDZGpDwbgceTdv5tfi90TM590x/d/hGSd9Wc1RfODLrWOG2S1QOeKhsozKVXaUN
	dVPoWsZ+/VbVkHdT098l2Kvqmj46hWWcnO4+lfzCSWZfY8QgHl2aArbP27wysqMxcdlYoV
	NCoZMmx1955V+/gJ3pbWJflcknE5ihyTUfqFzn5QuJSCkMUxaaT2W91ylhj5ysGSjZzZBQ
	TKi0DMX2rGJfKza8G/8fnXyAgybAPZCHLv0JdDBf8ZxIYouwy4CfUqKIfQ2stw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733688896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wAEQztHm1MhKPD8YoJhLpgLMiVgRYQF2dVu0Kq/kagg=;
	b=H49E2SmjbwoTLq8t13TzNFlyjC9Jw5sOC9pE3IqaR0CyOkweHNA006NzU0lJDqMxvtF1VA
	1GJ4HGda++cvRGBw==
To: Anup Patel <apatel@ventanamicro.com>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra
 <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Sunil V L
 <sunilvl@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH 1/4] irqchip/riscv-imsic: Handle non-atomic MSI updates
 for device
In-Reply-To: <20241208150711.297624-2-apatel@ventanamicro.com>
References: <20241208150711.297624-1-apatel@ventanamicro.com>
 <20241208150711.297624-2-apatel@ventanamicro.com>
Date: Sun, 08 Dec 2024 21:14:55 +0100
Message-ID: <875xnuq6dc.ffs@tglx>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Dec 08 2024 at 20:37, Anup Patel wrote:
> +
> +			tvec = vec->local_id == mvec->local_id ?
> +			       NULL : &lpriv->vectors[mvec->local_id];
> +			if (tvec && __imsic_id_read_clear_pending(tvec->local_id)) {

As I told you before:

I don't see a way how that can work remote with the IMSIC either even if
you can easily access the pending state of the remote CPU:

CPU0                            CPU1                   Device
set_affinity()
  write_msg(tmp)
    write(addr); // CPU1
    write(data); // vector 0x20
							raise IRQ (CPU1, vector 0x20)
				handle vector 0x20
				(other device)

    check_pending(CPU1, 0x20) == false -> Interrupt is lost

There is no guarantee that set_affinity() runs on the original target
CPU (CPU 1). Your scheme only works, when CPU1 vector 0x20 is not used
by some other device. If it's used, you lost as CPU1 will consume the
vector and your pending check is not seeing anything.

x86 ensures CPU locality by deferring the affinity move to the next
device interrupt on the original target CPU (CPU1 in the above
example). See CONFIG_GENERIC_IRQ_PENDING.

The interrupt domains which are not affected (remap) set the
IRQ_MOVE_PCNTXT flag to avoid that dance and don't use that affinity
setter code path at all.

Thanks,

        tglx
