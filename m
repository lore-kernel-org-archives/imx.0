Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B34A1F5FA
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 15:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gMNSrwXt"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37DB8C0004;
	Tue, 17 Oct 2023 15:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697555166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcKDvBb6jnUJQGfQIZYJmILk9qMhN/wgRJD69FE2Nq8=;
	b=gMNSrwXtyQfHLaxBZdIC7zCUVCGh1Q4jYEI8oNA7aj8wZrGUVUZnJJ2AOnfBq0kvZIDa/l
	iZSE4toLtXxLjDvoLhNhYS1rmWaB6TdwNqpJOURBet+RsqkbUJkMbbia+bpWt3expJJLsP
	U7vHEx01/8914YAG7RIzVmmrvwfX0HnHI0z3wJwmlc/GJ4FWVdZmWzVf7vhwiCbFqrOXEk
	JU4QoVYHpoRxtTz1Me9AJ+fHggBbIBE8IrixH5KWQcC+s8eMvbm8/8X7HlRKxOnEJNKTF5
	SBa2fjyDdx+w+F6Ka4caG+wTX5qObjvF5Bit16RQVavw8M2Iq95RK50EUruRag==
Date: Tue, 17 Oct 2023 17:06:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 6/6] i3c: master: svc: fix random hot join failure since
 timeout error
Message-ID: <20231017170603.5ef996c2@xps-13>
In-Reply-To: <ZS6d+mANtuhoAcuX@lizhi-Precision-Tower-5810>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
	<20231016153232.2851095-7-Frank.Li@nxp.com>
	<20231017163335.16770af2@xps-13>
	<ZS6d+mANtuhoAcuX@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Frank,

Frank.li@nxp.com wrote on Tue, 17 Oct 2023 10:45:14 -0400:

> On Tue, Oct 17, 2023 at 04:33:35PM +0200, Miquel Raynal wrote:
> > Hi Frank,
> >=20
> > Frank.Li@nxp.com wrote on Mon, 16 Oct 2023 11:32:32 -0400:
> >  =20
> > > master side report:
> > >   silvaco-i3c-master 44330000.i3c-master: Error condition: MSTATUS 0x=
020090c7, MERRWARN 0x00100000
> > >=20
> > > BIT 20: TIMEOUT error
> > >   The module has stalled too long in a frame. This happens when:
> > >   - The TX FIFO or RX FIFO is not handled and the bus is stuck in the
> > > middle of a message,
> > >   - No STOP was issued and between messages,
> > >   - IBI manual is used and no decision was made.
> > >   The maximum stall period is 10 KHz or 100 =CE=BCs.
> > >=20
> > > This is a just warning. System irq thread schedule latency is possibl=
e =20
> >=20
> > 							can be bigger =20
> > > bigger than 100us. Just omit this waring. =20
> >=20
> > I'm not sure this is the correct approach. It's a real issue but there
> > is not much we can do about it. Perhaps dev_err is too high, but I
> > would not entirely drop this message. Maybe a comment and turning the
> > message into a dbg printk would be more appropriate? =20
>=20
> The key is not message. It return true, means IBI/HJ thread will not run.

But why should the workers run if it's too late?

Thanks,
Miqu=C3=A8l
