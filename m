Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793050579;
	b=DeqeRgPUL2QNtwJ+4RGRKyk2Cs/yNL2nV5IUMU2EqgmFNV6+LQW8IQd755NVEDEs9oWe
	 IWhWaZarFSj2Y9HaBTOIKkDVXZOCPVH0QNWXn8nE9f6r5XF/SOshGr4RmvM+xJll2C8s2
	 VLPpUDJvGOMLn6pV0HkiAxDRRjBQKIDz9OsazMF7nCwSjqUCHyTyYfuvUZ3geW+ANRcVr
	 G/+ZteWsmXPLHi1QZTQvhteGH9tTYvBLHcYjDE/qSJKOaZBgbxcwAe20dTkm2sepzoK74
	 r75jIGEJ33RlBKzhyuY1LkDQEXRULAaXswW2WagAoKznhcltRpTYA2MalA8dAIcBowg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050579;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=5WwcqlRiGiZgzw5DJN15vwpaO3IDWNFaAlz82X5MUKQ=;
	b=p7DeBB/KDpEXsG/2z3zi7kWhcMmEN8goupxpk9iI/PMwmS07Ex4IdbxXcWErJDUDw6FN
	 3HnJd/vrGq1lnJMaEWy4nLi3NUg8uUu2kq+8GG+YUnWFN9Zyx7FTR4EyZi5IKi5olsDNB
	 u8wvdJO5tQA5F82w5CYXxHs5gC+1Tk256yFLeOROwNDuxEAbqyfy8aq5qyVyRax+Y/CR7
	 dDzVzRW89zC/AsdA8Wcbeohc8ngKxAdAOvsn9QH4qaLZ0nMvEC8nylmBmyQHTt7j8V6ML
	 T3SLDclCPFoxJmPqtwuKF4MrV+SxJEh5ebk+qDPSahwJLVpipplnqSY6o1M/uK5IBPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DE9606A31D
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 21:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41DE9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id F00D392009D; Mon, 26 Oct 2026 22:36:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id EA11E92009B;
	Mon, 26 Oct 2026 21:36:14 +0000 (GMT)
Date: Mon, 26 Oct 2026 21:36:14 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: James Hilliard <james.hilliard1@gmail.com>
cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
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
    linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
In-Reply-To: <CADvTj4oFBznFO9ZxL_8wZtcPaweSSt-a_brVkmQKzqJsBX2P5w@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2610262133000.42255@angie.orcam.me.uk>
References: <at4bw-G8czG-G7Wl@ashevche-desk.local> <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com> <at5qKehogAjTa-fA@ashevche-desk.local> <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com> <at8eDFj2WNaXDaot@ashevche-desk.local>
 <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com> <at-vyZ1sDhYPu0W5@ashevche-desk.local> <CADvTj4o_CENc3i92OQEZudOErSKPUptT4t2CCqDaGbseuK0QcQ@mail.gmail.com> <2026102631-stove-preview-b534@gregkh> <CADvTj4pCnnzx4B28H_1BuY4gm2fh_8HYL9jLpsAoJcWfiUXOHw@mail.gmail.com>
 <2026102657-tubby-tragedy-5f1b@gregkh> <CADvTj4oFBznFO9ZxL_8wZtcPaweSSt-a_brVkmQKzqJsBX2P5w@mail.gmail.com>
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

On Mon, 26 Oct 2026, James Hilliard wrote:

> I'm wondering if some mail is getting dropped, in this particular thread I never
> actually received the review from Maciej W. Rozycki <macro@orcam.me.uk> at
> all and had to manually import the email from lore. I think that's the
> only review
> email that I saw go missing myself.

 Well, Gmail doesn't like e-mail sent from here anymore.  I'm not going to 
do anything about it, it's standard (E)SMTP service here, sorry.

  Maciej
