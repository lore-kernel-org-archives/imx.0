Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722285;
	b=2NWkos/A4AW62TUC15wU7j1rVm/fhxLRwoB+cj9nCuHbBuIagCoRg1WDso57N/0j7liT
	 LZ7UyIRf+InKeTmbju20hQzknOybOyCQeA5IWgQM9Yi0YgnX5RCii86e+jBwAmITFuCMe
	 SKcYTxOnZd5ae88zJYxL3EGjJaEKT7bQ0ADmkujsAeeVRQlSsIscVOAZfCaMwuzHkt0Ze
	 mII7DjfmnZXk2lKmgOGApKP4dTDJehT1sJFrpUd0/Q5yI8PXoBy+/0ra3KxSQIkCLL4/U
	 TBCHsLLl5GEH+MbdjImK/RWN8p7P2K5Izm1qY0iXDEdWProHYcZrKsmWV7YMmBtO3Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rNwvKOCdTYC9J02wHQU8L2xZ+KavqPuMAcm6uI6YuYg=;
	b=MNSdpSCqOKd8jl4p8j48r0SFkNVkW6YyRmhEDqt4ly37QbaEVS5j76xRdsgM8SE7k5Ko
	 yjdFIUERAQJgUq8gaBKz47O1jNxo3iHUqRV6uE7OCAIf25r7+OUjDL9ooubcDP3Y5vX6F
	 fdEu8jCewHBm69YNyTiYGzE9ppjkAH2tKopQCvZnQBB1lpT3d3agCAw4gqKm3A/Ts75aK
	 Sw3gs2sKs8y7Go5n7fmLxrfJ1Cv5c1zS6siDw4NoTkrtrsRTEkSknT1klfmS5Rt6oo+lq
	 NsojIMUIAJgKScZHnfvwl0Q+5zamm9//N5bU8T8mdxsCiAUM8kxSLy0ojEmD3+wF9lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K+FQiEx7;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706976083629
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 16:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 706976083629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K+FQiEx7
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-5641f26ce05so1913904b6e.2
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 08:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722284; x=1794327084; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rNwvKOCdTYC9J02wHQU8L2xZ+KavqPuMAcm6uI6YuYg=;
        b=K+FQiEx7WndYLLkXl6rTDbyzT8ujioxBk/LnuKmBM+B2mxA4kHSjJGokVo0XdZQHnT
         OoJMLLjWyZlm39YJdgEQw2YtNC/xm6Rl2At/oF7jEkKxC18ppXJt1ZrPkB626xqWEqcZ
         JfnSBSwgb/wIDFsQmAp93zARP0fnTj9mpiL6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722284; x=1794327084;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNwvKOCdTYC9J02wHQU8L2xZ+KavqPuMAcm6uI6YuYg=;
        b=TT6voJb1v4lWURHR1jKJ4pMsG+syDguIvTf0Y/WdqBnnBsTtFb/hDAiA3j/Wns9vFR
         bj/urgh7oBPVrt8UtYr35DE/m1isnADX/Cw/g8Rtkk+2vq+GWUAemG2O6UDclqCZnVwo
         7K5WAO6UVl3M+f5XrXjLawGJ3nGrZtm/NomkAXxKkv7XKOfB7lpzfSDe6sRdcdLTr5Hc
         rY2L6t0UH3NtyIuUzfr7CCphCpwLGdI3pld0lbw3xFPLceYeXlV4GZTbcIPF6TOCaPPY
         apI3VG7dF+d9isUXXEDpmD1oiML5wgHpjKSoTrLZ3A8uTln8lnVax6xLZuHcjByZX7hv
         55NQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhV4KdX+1+Edmhugr/FpW3zwLsjPGlnKthQLUUuzPaayQnWz6R0svYXLFPNAWOS/e+XE4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/bi3wn+1WZypC8ou8JMD8lZtEjAmR6xrDY9jVhBxmRaZjwdiBf
	4j0qxnvsX2XUa3Hm/OGoH77WLK/C6V2Qi9AhCjjULPqx5WmAXC50ID1xu99VQ74MwA==
X-Gm-Gg: AYBFou2aBfIBFD7QL2isrJvnzQ467JXYd5Ylqts4Ysqfaxet3JSaE/S3UqBg9KeclPW
	1rWbz9J7EkvDlzoCWz5HGIhu6B+5jRK90Ss2nk9DUGm19fFKly1n++AlYbQDCkuQ4pyxC745HQx
	0NWS5LLsxzomYZsdGYotGeemzFIpJr5sRrsVcQ4vDpMnAdiliHkXKqX1ovUT6f39c4Hj5AZTawm
	h+zZBtEhBr9ZTl0GXN1xfxy/c3/C41FAG1pGfA+k0zGiK0rcfVfpFR0GwaL51zkueup70D/P6I+
	Acc2cFpLyHPsYqg0PMM71yMngprFCF4izljbt56pmHqgO+8ranzltNo8zDzeyjmFVu8jYJW/UA4
	40xOHGsk9KKkXrdzuQ1EbPusUKj4qUcvSyYA2c+eaheb/IRP8bdhJcpfUJhYTZOyfIUbj9WGCBP
	/JFQuRje2wQlCgnNDStBuCv6XPFpKGPDC7/fmbGFO9LdodW+FI1c4taGrbeRZKwdlCkz4Pf6US4
	q/5kOSkbb+K4QNnOggFJngkYQ0x6SWJv8x6ZW06lKC3Kv3C82XJTALirQHpq4qE6WvRcvkeQeAf
	lNOcT/QPJ8SZeczg/BD4B20eAcei0ngTBQ+0nKq4gZ77pYD+q2JeqgkYyCj6xSpCoVPSDYLBmV7
	HcjvPnWrsvxIJ+dw=
X-Received: by 2002:a05:6808:2218:b0:52b:7641:33a6 with SMTP id 5614622812f47-5640deea502mr9137854b6e.14.1793722284423;
        Tue, 03 Nov 2026 08:11:24 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:22 -0800 (PST)
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
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 8/8] serial: 8250: retain DMA resources when termination fails
Date: Tue,  3 Nov 2026 09:11:04 -0700
Message-ID: <20261103161104.2449407-8-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-8-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-8-9159caade148@gmail.com>
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

Thanks for replacing the fixed 100 ms sleep with exponential backoff
(1 ms -> 1 s) and adding the initial/ongoing/recovery diagnostics in v9.

Following up on our v8 discussion regarding blocking in
serial8250_terminate_dma() versus non-blocking resource quarantine:

1. Why non-blocking quarantine cannot be done purely inside 8250_dma:
   I agree with your v8 reply and the updated commit message here that
   serial8250_release_dma() cannot simply return early while leaving
   serial_core to proceed with normal teardown:

   a) Immediately after serial8250_release_dma(up) returns in
      serial8250_do_shutdown() (8250_port.c:2474-2511, and similarly in
      omap_8250_shutdown() at 8250_omap.c:794-803), the 8250 driver itself
      clears the hardware FIFOs (serial8250_clear_fifos()), reads UART_RX,
      frees the IRQ (up->ops->release_irq(up)), and drops runtime PM
      (serial8250_rpm_put_tx(up) / serial8250_rpm_put(up)).
   b) In uart_tty_port_shutdown() (serial_core.c:1841-1853), immediately
      after uart_port_shutdown(port) returns, serial_core unconditionally
      calls uart_free_xmit_buf(port) (line 1850) — freeing the page that
      dma->tx_addr is still DMA-mapped to — and powers down the UART via
      uart_change_pm(state, UART_PM_STATE_OFF) (line 1852). Likewise,
      uart_suspend_port() (serial_core.c:2502-2514) calls ops->shutdown(uport)
      (line 2502) and unconditionally sets UART_PM_STATE_OFF (line 2512).
   c) Even if startup() returns -EIO on reopen when DMA is still active,
      uart_port_startup() (serial_core.c:422-423) has:
        if (retval && capable(CAP_SYS_ADMIN))
                return 1;
      which causes uart_port_activate() (serial_core.c:2060-2062) to set
      tty_port_set_active(port, true) with tty_port_initialized(port) == false
      and allows root open() (serial_core.c:2040-2042) to succeed (0). From
      that state, ioctl(TIOCSSERIAL) -> uart_set_info() (serial_core.c:1068)
      -> uart_shutdown() (serial_core.c:466-511, which calls
      uart_free_xmit_buf() at line 510 outside if (tty_port_initialized))
      or uart_hangup() (serial_core.c:1942-1950) or uart_change_port() ->
      release_port() (serial_core.c:932-933, 1072) can free the TX buffer,
      power down the UART, and release MMIO mappings while DMA is active.

   We modeled these cross-layer paths in Serial8250TxDmaV8.tla
   (QuarantineGuardsShutdown, QuarantineGuardsAdminOpen, and
   NoDmaOnPoweredOffUart in Serial8250TxDmaV8_UnguardedQuarantineHazard.cfg
   and Serial8250TxDmaV8_AdminReopenQuarantineHazard.cfg vs.
   Serial8250TxDmaV8_TerminateRetryHang_Fixed.cfg, alongside
   Serial8250TxDmaV8_QuarantinePioReopenHazard.cfg at
   https://github.com/ismell/linux-8250-dma-tla), and TLC confirms that
   quarantine without those serial_core and PM guards violates
   NoDmaOnPoweredOffUart / NoConcurrentFifoAccess (in 6 states) and
   NoUsersAtFree (in 7 states). Given that enforcing non-blocking quarantine
   requires coordinated changes across serial_core.c, runtime PM, and 8250
   shutdown, addressing non-blocking quarantine in a separate follow-up
   series and documenting the limitation here makes sense.

2. What in-tree DMAengine providers actually return from terminate_all:
   For context on when the retry loop in serial8250_terminate_dma() can
   trigger, I audited all 78 .device_terminate_all implementations in
   drivers/dma/:
   - 64 out of 78 unconditionally return 0.
   - Among DMA controllers used with 8250 UARTs, synchronous FIFO-draining
     drivers (drivers/dma/dw/core.c dwc_chan_pause ~40 us,
     drivers/dma/idma64.c idma64_chan_deactivate ~100 us) already poll in
     microseconds inside terminate_all and return 0.
   - The only 8250-paired DMA controllers that can return non-zero are:
     * drivers/dma/tegra186-gpc-dma.c (tegra_dma_terminate_all, lines
       714-743), which already polls readl_relaxed_poll_timeout_atomic()
       for up to 5000 us (5 ms) in tegra_dma_stop_client() / tegra_dma_pause()
       / tegra_dma_pause_noerr() (lines 389-414, 676-712) before returning
       -ETIMEDOUT; and
     * drivers/dma/at_xdmac.c (at_xdmac_device_terminate_all, lines
       1999-2039), which only returns < 0 if pm_runtime_resume_and_get()
       fails.
     (Even across all 14 non-zero .device_terminate_all implementations in
     drivers/dma/, the only one designed around a caller retry loop is
     cppi41_stop_chan() -> cppi41_tear_down_chan() in drivers/dma/ti/cppi41.c:
     652-770, which is a USB MUSB controller used only by musb_cppi41.c.)

Thanks,
Raul
