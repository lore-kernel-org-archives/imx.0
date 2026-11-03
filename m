Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737535;
	b=DO9mOSt50qoR2YdwKlfNyhPK8hMKJfNYXMKVagDsFeomouw/Y6YLcc6xvpKPTEjkBGz0
	 NjzFezdaA2/tOQJVSDcM0So3RSQn3vDMvudNVXvnX9voBAVXAwVOhFBAFZIIx6NEbxZ2H
	 8urx4yl+g4rEuQ7rIfKC8tWoWwnyZ5bJCsx4DhJ80yn4ucGBMYphEzDN0QM5hJ2/oH7ET
	 Fg7uVPE/5B8gSAZzWmE0hrrbOW1NY/04OlrDBGIvtXnuEDo5tB6Npvj1RlS59H9M5hEQ5
	 qpVqAl5haKRXGroX+C1xwsjZ0/t1uumRe+yhbukM118ALfR7m9TgyCH8h6LxQhsGTgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737535;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=hywMFMGWC22FCsnfeYWHg5SybWSfpDHUd/LvoxS7oLY=;
	b=QlcsS7cYXJz5GeC3cYp413RrhEC7QmJHgsjqJT4d+zgeRRWgbedIdGhDinmNYALy5yj3
	 Y3KODxv7NzElWGv/JijFYNz8OFTSCnmZ4urtJcINHVz0f6Y89+3FDtbZSbwHBik9IYYWv
	 7AK9ZRIzRY+KsevKT4WQM2AmAxDfkLpY4JnXhrwiS8KwhUsfPbQ/s4SYCSSxQ+PruYCYX
	 7PR5ih4HEjGxzw3yZJLROfkMQnnQ3824IUO619dcaSiTQAwvh17fOTKcXZCB5eWRmh8B/
	 0CLWcqBAKLIs/ti1jkGTwVKeY8LGKELvTx8pyUswhPuTjGOKzTakGKWKedUz4TBFsJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7578E606A328
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 20:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7578E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 38B0092009E; Tue,  3 Nov 2026 21:25:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 321B692009B;
	Tue,  3 Nov 2026 20:25:31 +0000 (GMT)
Date: Tue, 3 Nov 2026 20:25:31 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    James Hilliard <james.hilliard1@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
    =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
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
    Peter Ujfalusi <peter.ujfalusi@ti.com>, 
    Vignesh Raghavendra <vigneshr@ti.com>, 
    Patrice Chotard <patrice.chotard@foss.st.com>, 
    linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 2/8] serial: serialize asynchronous write wakeups with
 the port lock
In-Reply-To: <auoUlkzXsl9WJG8B@ashevche-desk.local>
Message-ID: <alpine.DEB.2.21.2611031947260.15685@angie.orcam.me.uk>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-2-9159caade148@gmail.com> <auoUlkzXsl9WJG8B@ashevche-desk.local>
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

On Tue, 3 Nov 2026, Andy Shevchenko wrote:

> > +static unsigned long sccnxp_handle_events(struct sccnxp_port *s)
> >  {
> 
> > -	int i;
> > +	unsigned int i;
> 
> This change seems unrelated to the patch. Again, slow down and READ what AI
> produces before sending, please!

 Indeed.  FWIW I've thrown v8 at hardware I look after, that is:

 drivers/tty/serial/dz.c            |  9 ++--
 drivers/tty/serial/sb1250-duart.c  | 25 ++++++----
 drivers/tty/serial/zs.c            | 94 ++++++++++++++++++++++++++++----------
 drivers/tty/serial/zs.h            |  3 ++

and that has caused no observable regressions in my simple verification as 
direct terminal lines, both in the line mode and with ncurses.

 I have no leased-line modem hardware to put this under stress with all 
the signalling; I could see, and probably should, whether I can set up a 
SLIP connection with a direct serial link and see how it performs, but 
it'd take me more time than I can afford right now, especially as I'm 
locally short of one PSU for the systems in question that is waiting for 
parts to arrive for repair, and swapping the one working unit between 
systems is quite involving (ones in the lab won't run SLIP owing to the 
firmware limitation of the console servers they're wired to).

 But I didn't have a chance to reply before v9 has been posted with more 
updates, so I'll wait for things to settle before reviewing the changes in 
detail.

 Please consider this a NAK for the drivers listed above until the final 
version of the patch has been posted and I've had a chance to verify it.

  Maciej
