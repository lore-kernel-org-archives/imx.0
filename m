Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283744;
	b=ih0w8LEhxOkXCLovXtLuoZ4C4QSo6rDeop8b+7LMJplrbNS7SPf2npYnJhdJaef7UWJO
	 6I9/5zllnyhr7E26iPl2ihO/le8MKIXtTwf6QEt/NnIYnxEqzcQuvI/l5VlC2WjXILjzs
	 8CDJR6+GY+xmC8odjQHQ6AxujvYg4/pi/UZ1H6ArWzw2emUuyORnfRGmC8jmoljrTzxW9
	 29/6TX/J2ceuwBnFxn3om7C7fpgAh/h9h8R7SJ19pwrSk4vh+OvTRYgjiVmKUQjGnLSub
	 m/nvPNftv/mHll8Xre4AC4wADtdEW1T4kl/PFsRcTLiDsb+lhUSBUGYadwJrYIm6ndA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283744;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=EgkPHMHLTM0OJa/gTROG+9KF0iCc6Eu3UkCLei8s4MQ=;
	b=Iy3CVHwgWwbU6TiYFZ7r8y8G9wOHvEF1INLRnAhOPIQKoWvf1NwKFoHehpFAJyHy9zFW
	 eBdbNbq7FCu4mx6RmnmyLJEmM7DSJqmpGEbGXv/K+6YLXYhTVsllXRa5nNMqxbXJFdDMK
	 eK/+k/SIRWEw85ICr8DxhzCutCX5DPD3dDZjsRridYkqCyQ/rZJkXY/P8xLflG0Y7c97l
	 1dO2MlkoLDpQx8hi7TVEtIx1NWZysUeY+vw3hL5bC5qOt+1ry9YMAzK/r0jBqjBre7xuz
	 /Cl7h/DtfOE3reWKFQhhY+Sy3rMDdTKm+rSWIrmcFfIsgh3Vwvgf9kby/SFhhv3l3rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h+dcdu2Y;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102E3606A910
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 14:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 102E3606A910
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h+dcdu2Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793283745; x=1824819745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MgJL8MuqM9l4uyQAiqFvrF6SdMQF/UIm279xyhJToOY=;
  b=h+dcdu2YZK6b5J6mUJwDTIAmyZORGmTPxOVuXwVp2uPf9gins7Smm3aC
   BGB7wWArcaBJoCxMaFeZGS2I+ebdC9/a9fs3bYCnM3h9qKlHfufoEGN3R
   SWP0X36IRWYCL2QXasrk6KK6PwdDo7syorcBSw3JSHC0oCmApmkm9IDvG
   jkXMQiV2oVmKZZUj5SmVtIgq9SLFT34XOJNnS91hANwOcjyXqvKqciqRI
   dF/uLqNqrjTKUYEAbp5JVP6IQG8/5sBnpZAN+IjwT0YPtLoeFEDPb+PQm
   0nyQfwiMuIXUr7lWVF879TPgpUBECmKhzyIutsES4IgIyIrM8HEK0sAgk
   A==;
X-CSE-ConnectionGUID: /eBuQILIT4mq6G2QVfeqnQ==
X-CSE-MsgGUID: Q2It8+U1S8mtgR79XZwd6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1925620"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1925620"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:22:24 -0700
X-CSE-ConnectionGUID: yr/uZ8XsRG2FWMf2URIasA==
X-CSE-MsgGUID: egHmc43mSROKoKZDsLbkbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5261220"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:22:16 -0700
Date: Thu, 29 Oct 2026 16:22:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raul E Rangel <rrangel@chromium.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 5/6] serial: 8250: retire canceled RX DMA before
 reusing the receive buffer
Message-ID: <auNWl_thBnE8JqBE@ashevche-desk.local>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 29, 2026 at 01:37:01AM -0600, James Hilliard wrote:
> The generic RX timeout path pauses a transfer, copies its data and
> terminates it asynchronously. Clearing rx_running at that point lets a
> new receive reuse the buffer and cookie while the old callback has not
> yet run. Inspecting the new cookie cannot distinguish that callback from
> the completion of a new transfer.
> 
> Reserve the receive buffer until a worker has drained the canceled
> callbacks. Keep FIFO access separate from callback retirement: after a
> successful pause and termination, clear rx_running while rx_terminating
> prevents another descriptor from reusing the buffer. Deliver the paused
> data before allowing the interrupt handler to drain the FIFO through PIO.
> Normal retirement only releases ownership and leaves subsequent receive
> handling to the UART interrupt.
> 
> Preserve the normal completion-path LSR read and gate DMA resubmission on
> the receive interrupt enable, so stop_rx() prevents another transfer while
> the status read retains its existing side effects.
> 
> Reject new flush work and PIO receive handling during shutdown, including
> late Intel MID DMA timeouts. Stop and drain retirement work before freeing
> the channels and buffer. Once RX has stopped, allow the idle flush used by
> DesignWare LCR recovery during shutdown. Clear the shutdown guard before
> startup configures the UART and tests its interrupts.
> 
> Check pause failures before accessing the buffer. A successful pause is
> the quiescence guarantee, even when a provider still reports IN_PROGRESS.
> Also accept DMA_COMPLETE after a failed pause: completion can stop the
> channel before its callback acquires the port lock, leaving nothing for
> the provider to pause. Retire that completed transfer normally.
> 
> A failed pause with an incomplete cookie is ambiguous: hardware may have
> finished while its completion interrupt is still pending. Canceling that
> descriptor can discard the entire completed receive buffer and switch
> permanently to PIO. Retain the transfer and retry pause and status in the
> worker, with receive interrupts masked to prevent a timeout interrupt
> storm. The worker copies only after a successful pause or reported
> completion, then terminates and drains the old callback before reuse.
> The pending-pause guard keeps callbacks from copying or resubmitting the
> transfer concurrently. Retries sleep outside the port lock and stop when
> shutdown takes over. A provider which never pauses or completes retains
> RX ownership until an error or shutdown; a timeout alone cannot establish
> that discarding the buffer is safe.
> 
> On DMA_ERROR or termination failure, let the worker stop DMA before
> handing the FIFO to PIO. Keep the requested enables in the existing IER
> shadow and filter hardware writes during pause retries and recovery,
> including termios, RS485 and overrun-backoff changes. Apply the current
> enables after retirement so stop_rx() and shutdown remain effective.
> Hold a runtime PM reference around worker register accesses and keep RX
> on PIO until reopen after a confirmed error.
> 
> Abort the DesignWare idle sequence when RX cannot be stopped. Allow
> the empty-FIFO timeout workaround once DMA has released the FIFO, including
> while callbacks retire. Exclude FIFO resets during RX DMA recovery. If the
> provider still cannot terminate the channel in process context, retain
> its buffer and leave receive interrupts masked.
> 
> For OMAP, publish the shutdown gate under the port lock before the final
> RX flush and interrupt masking. Take the RX DMA lock inside the port lock
> in the completion callback, and serialize the runtime-suspend flush with
> the same order. Drain the UART IRQ before releasing DMA state so an
> in-flight handler cannot retain up->dma across its release.

Can this patch be split to smaller logically isolated (to some extent) pieces?

...

> +++ b/drivers/tty/serial/8250/8250_dma.c

>  #include <linux/tty_flip.h>
>  #include <linux/serial_reg.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/delay.h>

When adding a new header to an unsorted block, try to squeeze it the way that
you get the longest ordered chain (yes, interleaved with some unsorted
elements, but still).

>  #include "8250.h"

-- 
With Best Regards,
Andy Shevchenko


