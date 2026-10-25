Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792905008;
	b=Ysw9AcxMkUzgAurw09yjG0n29Ke75GUMPXfEDuf98lvvvwOWrHrcnt1CIySh+Otsc5pv
	 wtsZ/KJ6RLyI/QoU0HyKcuPJIAm7vTVXtDUd+RO00oIqrMYomEIT/pCFYZj4xk0UGIJBi
	 y3MUWmP3HNqSd+VR952JEFI+C+ef3ackJVHPz2hajiiu+xU3FIAQ90DekN05cHXwmbUcv
	 wnuLkAD1LwJDCqgZ51n43nlWMDYknJ7pauczdTylm3StH/fw3TIyXerlwf+Wo7zaBOC8L
	 ECN2ZgEoonKe6bZdDRYY50+JLPcDRKORW+MIfS2IEoRIqauC/OYZyRnCSRcDlGvV1lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792905008;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=8e88usUcYauyf3azJlO/PIAv73piHOHPPh8TVgMWY7s=;
	b=mg0WSawyomq4fH1wePh6TrydgZzYQLW3wAtda1a1nkxTCnzvDoVPnp4VZlf7Vzowpgma
	 VYgQMGefxyBk5S1406zopjlLpKvHgfHA1B49XWAQuzXT37v08AttDiKjadbyjCufvUS91
	 gXdJs2EMsOQCIum2AwyuVXbQYtF27wfMewqjGiIqX2qLAnGAniRhL9/QPE+eI7ySbO3I/
	 MS5U76Z6kSnDOQnN+++3Dl87gF/QP8+ZSpl2Rdo7lv9HkK6pz7Cj9/Hz7ZgEeR6nAALAh
	 y820v6EtOL1knbXJW8qKHqK1y3L3Y796ITeZ7fj+CUgOGzItIt4QDdtycbIDNt/NXEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804A2606A31A
	for <imx@lists.linux.dev>; Sun, 25 Oct 2026 05:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 804A2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id EAB0892009C; Sun, 25 Oct 2026 06:10:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id DDFC292009B;
	Sun, 25 Oct 2026 05:10:03 +0000 (GMT)
Date: Sun, 25 Oct 2026 05:10:03 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: James Hilliard <james.hilliard1@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
    =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
    Tony Lindgren <tony@atomide.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Richard Genoud <richard.genoud@bootlin.com>, 
    Nicolas Ferre <nicolas.ferre@microchip.com>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
    Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
    =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
    Sascha Hauer <s.hauer@pengutronix.de>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>, 
    linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
In-Reply-To: <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
Message-ID: <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk>
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com> <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 24 Oct 2026, James Hilliard wrote:

> uart_write_wakeup() expects the UART port lock to be held. Several worker,
> DMA completion and interrupt paths call it without that lock, including
> indirect calls from uart_handle_cts_change() and the transmit helpers.

 Fair enough, and thank you for the cleanup and spotting the issue in the 
first place, however...

> diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1250-duart.c
> index b4e1b90e5960..b15f76acd06b 100644
> --- a/drivers/tty/serial/sb1250-duart.c
> +++ b/drivers/tty/serial/sb1250-duart.c
> @@ -454,10 +454,12 @@ static irqreturn_t sbd_interrupt(int irq, void *dev_id)
>  
>  		if (intstat & M_DUART_ISR_RX)
>  			sbd_receive_chars(sport);
> -		if (intstat & M_DUART_ISR_IN)
> -			sbd_status_handle(sport);
> -		if (intstat & M_DUART_ISR_TX)
> -			sbd_transmit_chars(sport);
> +		scoped_guard(uart_port_lock_irqsave, uport) {
> +			if (intstat & M_DUART_ISR_IN)
> +				sbd_status_handle(sport);
> +			if (intstat & M_DUART_ISR_TX)
> +				sbd_transmit_chars(sport);
> +		}

... why do you think the whole functions need to be called with the lock 
held while they may or may not call the handlers in question even?  I 
think we should avoid excessive locking where possible to avoid holding 
execution elsewhere unnecessarily, shouldn't we?

  Maciej
