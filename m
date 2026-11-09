Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241301;
	b=2hlxCLZpDZLgPpnzhbaLSwRxYSV/u284IW8wGgmWD6KlQghtizy1PeZCt7wGRbsXG7uM
	 t1dlzilfuM0+6K1V1nZtjiPNx5F3jKZqiS7ceuPpyEISXd5J+lKl60MUaw9JIwSFrQdwv
	 gNG6cSlzrs2NeysuQt1qvt0yFYmCbysH8+yxz591oGrnUfkkCeSmn8nnszAsJWgBki6KY
	 iKCo7cgsRu/8AJNxv0AzLPq2pH/S0izfGsAlLh5JXlg4t5W52Qnon1qKG9hY/sw3SigGs
	 CjFZn5IXDI29mmYpLv0VRdF3WQD+/ycn0xYiRQb3H4VSP+ohjkfzgCU7bS/fMAQsITg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ATsD9Xu4uSt2b+wnr6JUehFjGprw+gnrB702q3SrL8o=;
	b=fgjNGuvREWqbgklgbFMb9DfppcGEfPdIGTmZobIOjA77zSmM85wHIjo5IHoz6WnllYch
	 8thgXP4wVsVr/6+JGbnb4tJnYeGJp+c6kj3bVqbYmAOEMuMuoE4dKnkJ7eaOobseP91g6
	 IbC0oH2yBUC+MvJkxdR2CxO3thD6TYeMcKkXeFTxpvsdqs1JWKLEpyUZQrpg58o0batWr
	 jURtwHtGxT/miK96+t0WtY26rJ2+Wjm7Y3zWkD12DvjMpRU6R+PlvwErJ9Nf4MFMC0Y/9
	 4H7Rs3k4zWnK1E3PHbSxt6ABNy3RdxuDayTA3iqq/5WCVJPqVIFIm0XPjU1LIT8jlDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PMYqxqqj;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65032606A321
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 16:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65032606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PMYqxqqj
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-53c156ba662so501629b6e.1
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 08:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794241299; x=1794846099; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ATsD9Xu4uSt2b+wnr6JUehFjGprw+gnrB702q3SrL8o=;
        b=PMYqxqqjJvV1N5L8F49ILzSCRALMiF/MOK5A5QZKEEHeSECPR8KhpE6f2UWN9J7I+b
         5sGlLGP644ugDsTczwHIRr+T1Ls7KLv/yDZROMEw7FhBwszROA3Y0f04mFJEzrsCh3zD
         5Jdb3BidMYuKoi80OryilvFcAxa+QyxLc3oXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794241299; x=1794846099;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATsD9Xu4uSt2b+wnr6JUehFjGprw+gnrB702q3SrL8o=;
        b=sEwW23bexyQ2hAy6uP4ZRU6MPrnat9CiywKscjXkBs4mjK/wDz7gBN8A8sTMKINvgf
         Y4lzE/U7uKvjJdF1A8xXGv7lY//tCOiBcY2Wpv6VcRXi7gnU9WTLdACuR5WV6AQh56wC
         TmhpTz4ibLtuq7U+rEQf53NBrnNxS2mBXYNzShjikb6Fl2+i/dWeRi8cU8xeGSk7iWre
         vsR4TyHpP5sn2xe9FxTd3rMVGKCxs96b6xl/KwD2Bwj/2kqkhekMGxiVhpiHdbIaQ1r+
         M1WFM+jGWT4HXDbNdUBWiKiWX9v+LR+/0qpvMfm2IAdx+lrbSDtWAyJicWIA+zBjLU5u
         6ALQ==
X-Forwarded-Encrypted: i=1; AL+hErGgIcas7jShFLS0fUxy1nhRv/8Q2Ku7tm9BNy2lrkSGFP0x9N4YILjGrKwWvsPuDhkm2k4=@lists.linux.dev
X-Gm-Message-State: APuU4Z86vOY5w2aTZVaKYUE6Ug6kCo1kGy/Q/DEjseSL1X7XaYXaZ3la
	8jR8M6fKsl/vavhhzYW1lpLcU/ab0ily5YHZkt2hX7lvEUAfHYyJwnY3xRvaH1boQg==
X-Gm-Gg: AYBFou2aE9IXE2RPk2KfJg+wiDQ+6yXNAgAEqV32MzBT7WWANiPuu/62ys/Abpgfn3r
	MlRJWqnl19k9qZBt/OxB5MTJjlSnBrAzMI0O8F1pjBtJUdAj3W6K/1ayGjSW0rXiLoz1R8RQLaZ
	qA4sB6l8uBTvtJgP9kCQTSQUCobqFm0mJgb5LHKJ60y/f5ZzhHRQqXlMoZJkW3nf8ZulSpiyvNL
	qrxCfPw9844S1o+hucyYqvt3Z/RaQ2+dEO++l/UWf2ZokfKoeUkTptYDQWIcSAUUZbw1Qz9NSKp
	9AZf1PBxfd29rMU1aFVSTsx3NCDCtMkBUwdKLfJ8k/8EpnS8CxAIN00PfEiH2dFHbzEreJcKdOG
	Yc50ydiAh41HREYGp3tcFJk+sgrdLWLQtBkGJSfCGqlzAo1NJZAVKBcbt8cLthNf8qwagSmx8CO
	NNDQMp3BZhtyJHEzSLfglcflxsYonDOnKIYvHjPBMRKE6uF0gkjo1/ul/Iz35xC/2LNdhLJwezx
	Bqvh9f+re39/Q6pFbIMyGaCndin1M30+C6BvoJjOiDKwAv/QFYZX1Z4H6FJRj2Q3J2jS2W/5d9j
	2vbv+zmheAwEYVqvfNHoY0S/IKH8lCQlJrPBaZx4SZQSDa9Pa2wSpAe0AM/TaGR/1f/y2iiaoKm
	Leg/j+uHWL2Gdv2M=
X-Received: by 2002:a05:6808:159f:b0:4d6:90f3:74a1 with SMTP id 5614622812f47-5683ccd209amr89819b6e.44.1794241299242;
        Mon, 09 Nov 2026 08:21:39 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade694062csm5510676fac.8.2026.11.09.08.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:21:38 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Raul E Rangel <rrangel@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH v10 7/8] serial: 8250: retire canceled RX DMA before reusing the receive buffer
Date: Mon,  9 Nov 2026 09:21:34 -0700
Message-ID: <20261109162135.906262-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261108-submit-serial-8250-dma-cancel-v1-v10-7-e6227ddb95b1@gmail.com>
References: <20261108-submit-serial-8250-dma-cancel-v1-v10-0-e6227ddb95b1@gmail.com> <20261108-submit-serial-8250-dma-cancel-v1-v10-7-e6227ddb95b1@gmail.com> <CADvTj4qXcOqS-wDrrN-x3sXUQr5BtFBeGzz_wqpW8WJ1DMPg+g@mail.gmail.com>
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

Thanks for dropping the unused rx_pause_wakeup lines in omap_8250_shutdown()
in v10. Following up here on your question from the v9 7/8 thread:

On Tue, Nov 03, 2026 at 11:05:42AM -0700, James Hilliard wrote:
> For pause-capable hardware, a recovery timeout does not have to prove
> that the failure is permanent. The concern is what happens after that
> timeout: the current recovery path discards the pending transfer and
> leaves RX on PIO until reopen.
>
> Is there a recovery approach that avoids an indefinite RX stall
> without turning a potentially temporary pause failure into loss of DMA
> for the rest of the open session?

Yes — the only reason the current recovery path disables RX DMA for the
rest of the open session is that serial8250_rx_dma_recover() sets
dma->rx_err = true and serial8250_rx_dma_flush_work() leaves it set
after dmaengine_terminate_sync(dma->rxchan) succeeds, which causes
serial8250_rx_dma() to return -EIO until reopen.

Notice that struct uart_8250_dma already distinguishes a normal
post-pause async termination from an unpaused transfer that needs
synchronous termination:
- When serial8250_rx_dma_try_flush() succeeds, it calls
  dmaengine_terminate_async(dma->rxchan), sets dma->rx_terminating =
  true, and clears dma->rx_running = 0.
- When serial8250_rx_dma_try_flush() fails, dma->rx_running remains 1.

So we can decouple bounded pause-timeout recovery from sticky PIO
fallback without adding any new struct fields:

1. In serial8250_rx_dma_flush_work(), if retry is still true when the
   1-second retry budget expires (or immediately if ret == -ENOSYS ||
   ret == -EOPNOTSUPP):
   - If ret == -ENOSYS || ret == -EOPNOTSUPP (e.g. Tegra186 where
     hw_support_pause is false), call serial8250_rx_dma_recover(p) so
     dma->rx_err = true permanently falls back to PIO for the session.
   - Otherwise (a pause timeout such as -EAGAIN, -EBUSY, or
     -ETIMEDOUT), set dma->rx_terminating = true while keeping
     dma->rx_running = 1, dma->rx_pause_pending = true, and
     dma->rx_err = false, and set retry = false.

2. Derive recover from persistent state under port->lock:

     recover = dma->rx_err || (dma->rx_running && dma->rx_terminating);
     fall_back_pio = dma->rx_err;

   And in serial8250_rx_dma_recovering() (8250.h):

     return up->dma &&
            (up->dma->rx_pause_pending ||
             ((up->dma->rx_err || up->dma->rx_running) &&
              up->dma->rx_terminating));

3. In if (recover), run ret = dmaengine_terminate_sync(dma->rxchan):
   - While dmaengine_terminate_sync() runs outside port->lock,
     serial8250_rx_dma_recovering() is true (keeping RX interrupts
     masked in UART_IER and skip_rx = true) and dma->rx_terminating is
     true (blocking dma_rx_complete() and serial8250_rx_dma()).
   - If dmaengine_terminate_sync(dma->rxchan) fails (ret != 0), latch
     dma->rx_err = true under port->lock and return early so RX stays
     masked and the buffer stays owned by DMA.
   - If dmaengine_terminate_sync(dma->rxchan) succeeds (ret == 0), the
     existing post-sync cleanup block clears rx_pause_pending,
     rx_terminating, and rx_running and restores UART_IER with
     dma->rx_err == false.

Because 8250 RX DMA is armed on-demand when rx_running == 0 and
!rx_err, any trigger-tail bytes remaining in the UART RX FIFO below the
RDI trigger level are drained via PIO on UART_IIR_RX_TIMEOUT, and the
next UART_IIR_RDI interrupt submits a fresh RX DMA descriptor — so RX
DMA remains active for the rest of the open session.

(Regarding the dw-axi-dmac driver mentioned on v10 7/8:
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c has separate provider
bugs where dw_axi_dma_interrupt() clears CH_INTSTATUS across all
channels including DWAXIDMAC_IRQ_SUSPENDED, dma_chan_pause() leaves
DMAC_CHSUSPREG and chan->is_paused = true set when returning -EAGAIN,
and dma_chan_terminate_all() only clears DMAC_CHEN without clearing
DMAC_CHSUSPREG or chan->is_paused. Those belong in a dw-axi-dmac
driver fix, whereas the non-sticky pause-timeout recovery above ensures
8250_dma.c never stalls RX indefinitely on a pause timeout while
keeping RX DMA enabled for subsequent transfers.)

Thanks,
Raul
