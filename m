Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793044758;
	b=bWZ1EroLgl5yDZIoVdavTl07BVyM1m7GZC2HoXJgKSEWHkc2crri21o11PmvMuRgP9u3
	 JibX+kw/GmGcZW5BmdFM6W01Yiv7OYe2hRHDGxa/OhZ3/5QpBiI/ATo+dylIGx1pDUrOj
	 ohERj26OKHKEHCfWubj600xfmQssksnlIt1IigMJxs+a8yPnwrLTqS/cdIFNcEu+ESRkd
	 A6KnMsxF33xPtmlYzN4AI3Bev1eVQ7NyXA65dE5XRwnqdPXb0Pp0b9evMiLV2fOSJYIZg
	 wyTX4zfv/trjYZshWX9A1KVboRqvqkl6vwBSVYWVQCKi77TLtpOHQYCSez6ULpL1ATA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5v98+mkBPyKcXGGfAa45H0MLFavlwhFEg5B6g7hFf9M=;
	b=4Gca63bP6CgTWff4P4UJwYmm5aGkj69a6S5WaeWDpdXQakmUcUi+qT4lYeYd/p+SmZBK
	 t0OiE4i26pSznUFj6EwM1o9DPQxuVidaE3EarOJ9dF0h3yPfllJrOrJBJqqw8fD370ApQ
	 8UU0YEo4RyXn8IlHyVVyv/zCn0cn+mq5PdyEa8PrGszpznvaEAPQJMXY+CIQT7UUVhuNt
	 7TXrPZgtrETNAB0i4rzypqf8njGbWYsJ3OQ0bXXUDfE5Jd7hQsFRcF4CePKPssGc2Jkqx
	 TwLnOIDv9WxSVO2iX4ykn91HmqQ3BsrspILrpmqRU4q7aDsr/mDzLeHLQkugp68qLZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QRPnqn1U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CB5606A31A
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 19:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49CB5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QRPnqn1U
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7c33cc572e6so226684137.1
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 12:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793044757; cv=none;
        d=google.com; s=arc-20260327;
        b=Iiu5Iib48SHRoyzkYSAaTF8LEX7yIzjc566CGDTgYYCjbtEZ3UXlLmoiSh5eBCajF4
         DTrj+O4h/Sshy8XrrZKfyODt6pKWt/WiybATUGBOhswcdthI2H5A5eeldt7NJmIRdBuZ
         g/7HT82j0PQDqr13o7+V3LglxU3s6fh590AilL7lfoM9gEYdXxCpaqWbX5AfYLlC/nEX
         Jys0b4NcA5l7tQBfl5tef6T6bpFH+Yir5Uyb90mcXoN4p1NRuI1mshw8EN5ul1+tKZGE
         kEW3/GjlxeaSpoetyLYDjHr27qazfqHlXtACCtybRbUeuu6MsBK2OPUvuqP5hlCIB/gB
         o6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5v98+mkBPyKcXGGfAa45H0MLFavlwhFEg5B6g7hFf9M=;
        fh=/HVQgk/idmY/Y7Jc7xDDf2VS7vb9LYWiFy9d12b8oBw=;
        b=FwrAhj56nwgRw2N8IbFIB0dvFQvXthGLQyOmrvEMDFVI7cOvujw3Dd6cZUbo0F0nmh
         eFNifqx940rd/lGLnV2Fh+vVyD4eqqVy+9nb/ZdfcjMnznTGK3vOX+Ec9vRZhGmuA+sU
         TmKD1SeGuj2EE8cu8rcP92wmXTwTlf404n0QuzYRT5dGn21TX8n8Ud1Xo4ozIk/QWV/g
         N0zmOpukqooAozwql8UxwAEFq4TrnpcmbEXrDfbgQeMtuBPWAvoFsozbug83uqZf7DQ7
         rMbiaf+EgkqTEmUwuzL5hOVtWwT8ZvvWZsvEkxL3Xv4deSeEOQfwHBRZR+aQbD+uHL5/
         xP0g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793044757; x=1793649557; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5v98+mkBPyKcXGGfAa45H0MLFavlwhFEg5B6g7hFf9M=;
        b=QRPnqn1U8FT0K6wEgVMi3KLkgL9iFMZguG1I1J4s++5jcQzdzYL+SuZKsb871pjx1v
         jt6BfHOydPi/SBFpnYFfwcysYZRXeH3Xdzw4d/cqnLR8rpdxCKegInTMNr99cAOhsb7m
         XdyG4MkwLkT7PvFjpdoxGVU9qnVDO1jmBjLfgWsEqS5lEFvwnsfJhEUhlIg1MdqWvmNe
         3F7LmndJ3AoQ1/VCxlWqqpC479994Oc7TrE+qE9w+/9cXeJuvgKDhG2vwNe64qSgZ08g
         wUfqDQbPwiDH4HH+4qD8gs4Xnqtg7E/x2rg9LkDhbSIqeqXiyzRIgYpXBv//qc6bb8T+
         8KCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793044757; x=1793649557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5v98+mkBPyKcXGGfAa45H0MLFavlwhFEg5B6g7hFf9M=;
        b=tkrWmmKR2DJw6sdoyDaOsWc1ZoTp5PSH56G8TyHRLZdvWwvHVLiklAZ01KcnB/M1QM
         x2GvArjXNWgsALPwWfKhVrvBmhCll4ynvFXocxKd46gaLxE/LOIJus4bZ4ONyhGdfhgQ
         ao/+HCOSeJW3PK0jXcPznJD5/dJK1RgzVg5WG/lFJOm39uq/4vKVIxVf81DbYeQI5DXA
         2M3klGyJwT1CZLW5AglwSZnSm82sABTQkKYAW1Le353KL4T7I+WoSCZer8jvfd6Hvby2
         bHPungLo4253PUOYy7G6F4O03kLLyvPEgVnFgURtp+feb8w4iRy5ZSJAO8KfsohdM6Zo
         8QNA==
X-Forwarded-Encrypted: i=1; AKwUvBz4q9SjcEDNeudTbVY52/jrXpWzx1o/UksicRy1qBpY7Ky8UdsOIjo33PTphKUWXJesyvg=@lists.linux.dev
X-Gm-Message-State: AFq9FYJi/5gzUad8ZY11WaDuFwF5kGmVkyyGFF30pkuyDwD+wq8ZKPia
	uMTSvlg2T5XyfqWiR+hu/BlTDx+m1zUpXzLmNYFpM3Eo4xZ1IkUg0LHBfyjLVSZ18LMqruOLYRU
	lDPD33soH5Cw0FLoU+sDQ4QaX67/Gqec=
X-Gm-Gg: AYBFou17UsvPYE10fsDOfbHjlptusXs5Yh/LdYiko0V0jNvuhFLwFkfxo35YXW10Vuo
	kTTfiDxACtoOqUsRQVHGsL3HvysIgNae2uss7LvI4oSVZU3XHITla0/32kAgSY2TbKI/52hBGTF
	60G1MRaFof+TrGTz1qK+WmHeOEjpTdnfBCecPan128lgWECKnLgpBanUBZt1/XwXBBknwSexHvr
	xUMFKZ6LfsHTDmGiCFB5c0DN3kCyQ895EzgwEZHEleFmHnXU0HK9b/+B2qyW+sGdkLmfOhcf4vN
	pg8hCK1UEHZyBC+3Lcq64J+iAnQ751jXA+vfgN/mC3T2uyMkZfA67jQHYSGCyugJ9PDhRcRZaTR
	Cig1ftqY93KYzVjliVurtd3mgckbHS6KaAyEgnzpwJSgTUYJLgRPyb8JXXpqLr+UGqd3OJTY35o
	J0W61J4by1CZuU+CtMTgmGMJSCviXXbNFMr4TuPx+7sOLHcYkXq68D99cchF4F2bsT1wn9SvF0C
	0Ad5gW3WKYbY/Cqqvi+HezcH6BFWA==
X-Received: by 2002:a05:6102:3e8f:b0:7cb:bd9b:4873 with SMTP id
 ada2fe7eead31-7cea14fad38mr297588137.21.1793044757153; Mon, 26 Oct 2026
 12:59:17 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk> <at4bw-G8czG-G7Wl@ashevche-desk.local>
 <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
 <at5qKehogAjTa-fA@ashevche-desk.local> <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
 <at8eDFj2WNaXDaot@ashevche-desk.local> <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
 <at-vyZ1sDhYPu0W5@ashevche-desk.local>
In-Reply-To: <at-vyZ1sDhYPu0W5@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 13:59:06 -0600
X-Gm-Features: AclHuK-pkQBp3tukGM9FdJ8ekfrjzUqdLwbnUIKbAlyu-Q9paOfNaII7ApJtovI
Message-ID: <CADvTj4o_CENc3i92OQEZudOErSKPUptT4t2CCqDaGbseuK0QcQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 1:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 26, 2026 at 10:45:54AM -0600, James Hilliard wrote:
> > On Mon, Oct 26, 2026 at 3:33=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrote:
> > > > On Sun, Oct 25, 2026 at 2:44=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrote:
>
> ...
>
> > > > > Some people might want to test the stuff. And sending too often y=
ou actually
> > > > > will get the opposite results, people will be tired to even start=
 reviewing
> > > > > and/or testing your code as it's changed way too quickly.
> > > >
> > > > My thought process was that people wouldn't want to be testing code=
 that
> > > > had known bugs flagged in Sashiko reviews.
> > >
> > > Sashiko reviews are not visible in my or any other mailbox. To see th=
em I have
> > > to go to some URL and so on, meaning to waste time to see why on the =
earth the
> > > new version has been sent.
> >
> > Maybe the Sashiko reviews are getting caught in spam filtering or somet=
hing?
> > They are showing up for me and on the mailing list[0] so I'm a bit conf=
used why
> > you aren't seeing them. You shouldn't have to go to the web interface[1=
] to look
> > up the reviews.
> >
> > [0] https://lore.kernel.org/all/sashiko-outbox-183574@kernel.org/
> >
> > [1] https://sashiko.dev/
> >
> > > It's better before addressing Sashiko comments,
> > > reply to all people involved and to Sashiko's original email, so it w=
ill be
> > > visible in the previous version why you issued (actually about to iss=
ue) the
> > > next version.
> >
> > Hmm, maybe it makes sense to enable recipients in the reply_to config[2=
]?
>
> It's up to the list owners / subsystem maintainers.
>
> > [2] https://github.com/sashiko-dev/sashiko/blob/v.0.6.3/projects/linux/=
mailing_lists.toml#L290
> >
> > > And before even issuing it, wait for a while, people might
> > > disagree with Sashiko judgement or your replies on how to address tha=
t.
> >
> > I was assuming everyone was seeing the Sashiko reviews getting posted t=
o
> > the mailing list already. The are ending up in lore so unless someone i=
sn't
> > subscribed to the list I'm not sure why they wouldn't be seeing those r=
eviews
> > already.
>
> I assume you already answered your Q. mailing list in this sense doesn't =
mean
> recipients. I think it simply goes to the mailing list without forwarding=
.

Do we want those reviews going to recipients as well as the mailing list?

>
> You can ask at helpdesk@ how this is configured on the kernel.org side.
>
> > > TL;DR: this mailing list is *not* a playground with you and Sashiko, =
the whole
> > > community is behind it.
>
> > > > > Settle down first
> > > > > with something, put on the cover letter the answer why not all Sa=
shiko's
> > > > > comments are being addressed (for example, due to amount of patch=
es or the
> > > > > series being focused on a certain issue).
> > > >
> > > > So, in general I've been always attempting to resolve known Sashiko=
 issues
> > > > in every subsequent re-spin, so that would be a bit tricky since I =
wouldn't be
> > > > aware of the Sashiko issues until after the series has already been=
 sent.
> > > >
> > > > Usually the subsequent issues that get flagged are new issues only =
discovered
> > > > after each new re-spin.
> > > >
> > > > I do have a bunch of UART/DMA related patches that don't have flagg=
ed Sashiko
> > > > issues so it probably makes sense to try and review those first whi=
le the larger
> > > > series that have Sashiko flagged issues are still stabilizing.
> > >
> > > Yes.
> > >
> > > > > > [0] https://github.com/sashiko-dev/sashiko/pull/389
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
