Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220532;
	b=w+EmTsXgXrFCEDlf7geVnDTmanGDmi1PVfxALMclTKlR+DjajnHnip5JEzxNx1x4XPES
	 pzCIgz+ex07ehlM5gRhxWJIHuNNHUCF1Z+udZ8uollce9t9PGm7LOaUK5+FuC2nJzeMMp
	 RLLqqprWJJjEnmtZmODov645BCrluq7y4xR23OOhc/O/Gjz/Fa/VzS6r60E+1luEvzYnr
	 byvxwznkCmYCXM86zyx9cazWCB3m573h6HTLGDNmLc6eGA8Pon+x3/VAeSzzct59Wc6wT
	 WEq9iUIBrLbzM2sn7LZcG/vL+UFRepq9xtt7WiHvQ7r0YIrD4s/Mj1U7I9CL37iUYWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BH2WnjXWwsl9S26zTcVnDiXysm6ntQCEcJClsDwXCEM=;
	b=J8jG8+9QmAaEDwNDDiD3O8LvznJmGX5CtlL9VoMO3ZKxkEz0ynluyCXeSsXtrX3zMdEa
	 A+0XuWoHyWrV2f8spVSfuLNCp7PjlM1JtQSxlvE72kz92WxiqdH0S8CE0j5hOLr59yBSv
	 UI8kWfqXRyY+pZNcFaXtCTOfGw163M7dizpsSQKLGzLhDN2qM+mFkX+iDmqyab61uWcVG
	 AgCQjoJq65muAWKGahaPN6m3+whdIBB08KpB12jy3LWY2meT/5QCg05a/GgQdfAW/Ck7O
	 GXNR1UevwGbSVR9O2tvrv3TDohrvcb4AqL9HmcoDlIVw9yewWtvxE9Bwx7GefmPsaAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i5dLo8XP;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3F4606A31D
	for <imx@lists.linux.dev>; Wed, 28 Oct 2026 20:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD3F4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i5dLo8XP
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-53dbe9b8d6eso74527b6e.1
        for <imx@lists.linux.dev>; Wed, 28 Oct 2026 13:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793220531; x=1793825331; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BH2WnjXWwsl9S26zTcVnDiXysm6ntQCEcJClsDwXCEM=;
        b=i5dLo8XPuVP0wPFLhWyOHvUQVjPR7dFU33SYb4f8tUzujPDdRkbuMI0ka/rIki6y0j
         bd6ltJtLixyJe+o1LP9uF5JgXCokBHm1FEpE0GqqHPf7nlgTq40HBqNPBD6AsYjhBNiV
         WmMevNaTjoO912+ZOkX/fQuZNnQ3q+Q9wsnoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220531; x=1793825331;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BH2WnjXWwsl9S26zTcVnDiXysm6ntQCEcJClsDwXCEM=;
        b=AMics/HnfelG5zqwbtoLAdzwnDdFGrEvTSvVUBpfH6Bvq+oxMxbjLKNifwp8HETu6r
         c3ypaV+boFQusqank0rmbPN0BBWo5qFqyfdCqz35wexuCO/0ajaJt5V9Vk8EldGHUmJD
         670hrECGmH4vGs4Adw3Z+7SflxJGDAOQi+yfAQGe9ebPF30khjRGCJvz/iN9xMG9ajnt
         jMNDiHu+ZH3prOEdiQpNKkEA/BVsImJODBQ32CmS9BRifkwbcfrUaYnk80zzU196s49p
         Q4bZW+dlGzOFYjnpqVQrsSzs+6LrBc4Cn19c0YLFSifTKkmS/OcjAobs+8RKi/orAnBn
         2osA==
X-Forwarded-Encrypted: i=1; AKwUvByTLG8Vclva2YnnY/CDCMz3lqbU4KOKTkpCEAFeDp5sozD3Z4CEqN1acFe2LG36f79ky/8=@lists.linux.dev
X-Gm-Message-State: AFq9FYL0MprsSfQCUAPgpilN2JlqGGGMUhIG34IVq7XzllRUQMHcYVcl
	nTdY1fy+Q58x6BiulaqYHdwkOYf06VYDBz9FgL/N2ms/SpPT2U5t0diK8JvjNtyYLg==
X-Gm-Gg: AYBFou0dUD7vz8eJbeHUwXKi5z1sECS+RAggs3RtaFLZZ8JAYwSIQWikUCFpLdmjaPJ
	1xn72kNq/zSM7i7R9YmkmiFwwkKLIKYrQ497hAWlXw/5Vwi94vZCwtvutVqhPLrs8dkq2HelJ+X
	vWwtj+m7XXMFRpkhUXh+9EzyutMPu3iPs3rHxiL9HPKKOCkqj1gnIuBQe0p4xEKkCi5OmpWKlMY
	nB0IiGIVfhzqyRZbLby25mj9aPBdQ2BfzJtYIUdCUBpHp70BcERqN/HU5RAUdFJzZxV3dhDcrK4
	5NvNDmVFjKxNvDNycUjAp1C9hExZ4/CcvisUSTBmPA5l5qktmCVq7vplLfBexfNjl1dbOzdA3yN
	RUIZzxp0LHP87OR8dPB4pd/m4BQvNRKzD2ihNei9ryjj43MlOxeNp6cSJvODTNj78S9WiQnUxCD
	3llXihIGxlkl6TgQm2CAunu0/Mu2rmlWtYgFUsdLvJsTGP5d1guCG9OmRJpj5zRiurr66+1Uh6l
	SAqO8nKCIo4+akLZ3Yyzt4LFUumxad/gRYkVFtcXFlG4AE2hjX5HnTOjLyR0oRZLABwgLtMMDf9
	huanI44U3h82vj+FmmuYU5aQ9XmJW7HTvi9+aP3DG3mEXMAr3DNMbHLMj5+Im4prkq+daabrvA+
	PvHz4Npztna02kBWJCdyLcbqQg4pla/V63burF4M=
X-Received: by 2002:a05:6808:bca:b0:4b8:4703:db97 with SMTP id 5614622812f47-563efb4d666mr411105b6e.32.1793220530793;
        Wed, 28 Oct 2026 13:48:50 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c363902esm2281137b6e.2.2026.10.28.13.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:48:50 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 2/5] serial: serialize asynchronous write wakeups with the port lock
Date: Wed, 28 Oct 2026 14:48:45 -0600
Message-ID: <20261028204847.3471382-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261027-submit-serial-8250-dma-cancel-v1-v7-2-985a023ba4b4@gmail.com>
References: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com> <20261027-submit-serial-8250-dma-cancel-v1-v7-2-985a023ba4b4@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi James,

A few issues in this patch across the serial drivers:

1. Recursive self-deadlock on ltq_port->lock in drivers/tty/serial/lantiq.c:

> @@ -239,7 +239,8 @@ lqasc_tx_int(int irq, void *_port)
>  	spin_lock_irqsave(&ltq_port->lock, flags);
>  	__raw_writel(ASC_IRNCR_TIR, port->membase + LTQ_ASC_IRNCR);
>  	spin_unlock_irqrestore(&ltq_port->lock, flags);
> -	lqasc_start_tx(port);
> +	scoped_guard(uart_port_lock_irqsave, port)
> +		lqasc_start_tx(port);
>  	return IRQ_HANDLED;
>  }

Inside lqasc_start_tx():

	spin_lock_irqsave(&ltq_port->lock, flags);
	uart_port_tx(port, ch,
		lqasc_tx_ready(port),
		writeb(ch, port->membase + LTQ_ASC_TBUF));
	spin_unlock_irqrestore(&ltq_port->lock, flags);

uart_port_tx() invokes uart_write_wakeup(port) while ltq_port->lock is still
held (nested inside port->lock). If anything in the wakeup path or printk()
invokes lqasc_console_write() (which takes spin_lock_irqsave(&ltq_port->lock,
flags) at line 612), the CPU will immediately self-deadlock on ltq_port->lock.
ltq_port->lock should not be held across uart_write_wakeup(port).

2. Missed unlocked callers in drivers/tty/serial/dz.c, drivers/tty/serial/zs.c,
and drivers/tty/serial/jsm/jsm_cls.c:

The commit description states:
"Ensure every driver caller of uart_write_wakeup(), directly or through
uart_port_tx*() and uart_handle_cts_change(), holds the port lock first."

However:
- In drivers/tty/serial/dz.c: dz_transmit_chars() (lines 266-288) only locks
  &dport->port around dz_stop_tx(), calling uart_fifo_get(&dport->port, &tmp)
  at line 267 and uart_write_wakeup(&dport->port) at line 281 without holding
  dport->port.lock.
- In drivers/tty/serial/zs.c: zs_transmit_chars() (line 641) only acquires
  &scc->zlock, so zs_raw_transmit_chars() calls uart_fifo_get(&zport->port, &ch)
  (line 621) and uart_write_wakeup(&zport->port) (line 630) without holding
  zport->port.lock. In addition, zs_status_handle() (lines 673-680) drops
  &scc->zlock and calls uart_handle_cts_change(uport, ...) and
  uart_handle_dcd_change(uport, ...) with no lock held at all, which triggers
  lockdep_assert_held_once(&uport->lock) in serial_core.c.
- In drivers/tty/serial/jsm/jsm_cls.c: while jsm_neo.c wrapped
  neo_parse_modem() in scoped_guard(uart_port_lock_irqsave, &ch->uart_port),
  cls_parse_isr() in jsm_cls.c (line 585) still calls cls_parse_modem() ->
  uart_handle_dcd_change(&ch->uart_port, ...) without holding ch->uart_port.lock.

Also, in Patch 3/5, adding lockdep_assert_held_once(&port->lock); to
uart_write_wakeup() alongside uart_xmit_block() / uart_xmit_unblock() would
help catch any unlocked callers automatically.

Thanks,
Raul
