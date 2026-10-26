Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793033169;
	b=U7zZ4uso/UmytX6GprdgflzWSXMLfsFg12+y0naGlTWckIzKidxgmKz52kdC6zPQJqlq
	 imQp5+olHIrLIULbTJyBhhMZ8oGwRs+ONCQa4cbkQ9LM4dPrYsxjebuAOmdNioayB4b9z
	 orlP7LChZ5ILR5LtU9/Xdrk4Mr3FggULVtsE/o/7Z4+81pukuA+7fVQrIMMMaO7WM5IyY
	 K5BGbzKOE4nf8nt4aWrc2wlVDHdTsPNtRcY3Aswg7jhDzzphOs4p11y1D0w7VGwzitGz7
	 PnDBCXPy9s/5pSrdZtjZC8NbiE1WFtAjpIwyTF3AsiHxOvY0+Wdeqx/wRuSj3bZhoow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sbR6KDZ54pfKvX4mBD6E1CqiOyZSCDGH5Y/Tf8ZG/yY=;
	b=avj+AmFIeYlmyYNMO6JqESBbzQr6G8RhE7z4KQQCzHEOqlYseguNSVRm7ELPsvsBLFmE
	 1ISxq/nIcbOG1XJUB3DwvpEU+WuS54mRnO4LHeJhwfMKcjUJWwDfTyBs0LhW/GYzC/zoJ
	 Im4T4XNM7KV+IYjXt18CeRKQAeJA6Zr+5qVDgJ78/kmuX0GA4KHqheClm8Su/wODCAnxI
	 NyMSaPe/RKCdc/RnlrJHTmCYZ/YOn9Gq+v1nJhaMKCFW6FmQzNmOfwDz0e+eG7IdRdiBj
	 D60JqIAtJxaFS0vsILbk949ARMj83bN7BItGZagQNMNZwlrurZcWv4shxQjxQa4Ojhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ToYEH+hH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82038606A31D
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 16:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82038606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ToYEH+hH
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso3226157a12.1
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 09:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793033168; cv=none;
        d=google.com; s=arc-20260327;
        b=gT9fiQ3ywC1QrsfBKBro35rvS4D1Zdujt3nfPii61+YA7ZnW3PExPXr1q3eJx9LCwW
         gQo9Di2A6X7EjG4scHJULXM0I3gaIYj8UzULKjlKzS0xFRDo2Lj8Z8GGbvbdveqC5rae
         JctR+8g4b/Qbw9XQUa2300mV0aeSyIY9b6LyhV2XUISQWDvkm9ZIZxGKh1GvUKm8ZH2f
         p3X0mc0dM6TDKrVi1ktityZ1fTHt36GzMRDD/qhnLmXZMlCm6yr/s5UeN0n3l0jRNKsi
         5pEM05Bsdh2+lrxPBWwJNWtBf3VVh83bb5wRX4K/M/6a619AaDzOL8afqRf61lVyrWDL
         HBbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sbR6KDZ54pfKvX4mBD6E1CqiOyZSCDGH5Y/Tf8ZG/yY=;
        fh=mak5zRWE8Z3upFZP2iCtJdeuNm7+7gIaACFkZ+1ruQA=;
        b=ZwqvfpEAA1cXb/0yA7CiBNPlxEyVXDEwhaAbW9br/9gySdx2KVJU0AsCAjcnr5ZUlo
         bs0LLWApxtanjpDFk6UwkyFkF3Xz/NqS0lxLchf03HK9Xq/JSYQjMaOAxdRrwGW7v2m9
         fDBlPnEx/xBvoExJLmrCoEKbISfQp3RsuViofDJHGt+Ri4ttUPC1QTk14mmTqmzxxXxl
         /CKUO+4IUR/cUFUYIUi/s1LfiXKWfzELlgoeEA8qYRrfYsVT+LoDUYI9Lxis5Z5hfpeE
         5UWI1w8SxKtiBX4ghepsCQZjpPOysA/ZhKWgFweFypCVou5K4paFQA4VASWGURQkRJNF
         mPDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793033168; x=1793637968; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sbR6KDZ54pfKvX4mBD6E1CqiOyZSCDGH5Y/Tf8ZG/yY=;
        b=ToYEH+hHGN0XbDzLPHl6hP8eBEQujFcL1E/Lkw1QLWw+zLchEx4TJYLlfWe6TLsDLt
         Jj37Dvso8UkuwZPVCcUSq3bkn7/inpDb0TbWJrGZf3XLGDcj89Pel1ZGG5/Dh9fSezti
         XEWa67B0+2Q0Ro8LOJi+pQYsxFCQ9KI/DaPB2nt1782DLNKVYywT6I/DLqvvOwEjsejw
         Pm9LhlYSonSsFSRxYnZIc/SR/CNXjPjx7pPngOiwWH29F8vwZAUJPzr7X1YI5BPYO5Bm
         /ALU7lNbKacDLZSIB/5ixa4AAYUDzatIB4/gNtGbVkTfkI1RvPMseaHfaUx++FmVxA3B
         3/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033168; x=1793637968;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbR6KDZ54pfKvX4mBD6E1CqiOyZSCDGH5Y/Tf8ZG/yY=;
        b=XSmbFCTVmcnaq0qIzGVccWnu5CH4k7Xsu9aDK0pZOFurcXhycPS3JYFJkrvugigcEE
         o8AQSF4rSc5E1LJUQvemGqYhcagzCdQkTAFR9yz6/Df94RkPuGBmtzfWC2g9Z1IGkIsg
         lSmbxW2u435leuKR6CE/NndUoiqfGovDoFO4hh9BD8/zXasef75CQqWX4Ep7x+8+466Y
         /4/8D7H8LypZt6upbNJVlkPMql0NdlRJb000mMyo9eDl97qsKujkshgvB6quMJZLpXxN
         9uoslaTZoYrHPpqbKv5sUe0kX0sYLjvPQV8ikUcNPQEjdQymz8q7NqR5w9xvIErdwtXA
         dhdA==
X-Forwarded-Encrypted: i=1; AKwUvBwc1hedPk3ZboN4UmLI+6QjWv+rq2Qd6Sc6Dl5VAxwdJp7m1DeQe79wej56ZbpN2xnSCNk=@lists.linux.dev
X-Gm-Message-State: AFq9FYJWfLdHmmHi2SL9mEsUiHSqGy3Nc4KUmxD0F7LzBtcjTdVnqRRZ
	BB23Fu15KHbjjm7ulXv76vItt8vwCY1eo4hdcUhmTA7nd5ep95Mj3NXGm0mIE8e5ZEM10L8Ks9h
	feCb/a+MfRBk5KWDkj8bouUa94mmsrBQ=
X-Gm-Gg: AYBFou3nBJaJsvYXyeuhVmAhl+8j8EmI3f9sxTJXQql+vPqnsKUEDMWoSBH83wmucSA
	XP1czh7+m0qnOHF9td6UEM2lnqQAhz1+0lbOLQxxEmxYWVYv2680MyUQywcW/99beOmdVFaEx4w
	3+8Fpr5eO6vp3WZsoXgYP9ozbSU+G014vLJZQ2LyfJKq/G0lgoZYK9FaMFUteWO+6ClVPqKK+7N
	75a/U7plWVo4dCaaHo1nzzUIxqTBsujbxxM8OZRCiLI8BaJVdG+3q+iNixtNW9pByElA0bS0sMJ
	ldG2ZAhyCXOrQzDAzrC3Imial87jx49k0exWhnzXeUgHQ0DqcBytVoK5tKn1uN24ynAnQu1s/HH
	rz5auJYXUaBbUzH3E/AGthrxzIzpWmM4581N5osU15kSwubw+jghCKBEQ2ZsKHg20cDXYvxpixm
	LMDkRWcqtQrGj/H+Z1GfEPxqJt6COt8woyS5Oi+RI2cnJhkv7xZ0mgWpyTKGkaFJ/05AHMkTe8V
	8W6k2ZSOFy23ZWsQ6QBOf4z0nHuyZRcCWmYisHLGPZ/b6n/9K4=
X-Received: by 2002:aa7:ca44:0:b0:6b1:b611:a2af with SMTP id
 4fb4d7f45d1cf-6b442ff2fd3mr6024136a12.20.1793033167557; Mon, 26 Oct 2026
 09:46:07 -0700 (PDT)
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
 <at8eDFj2WNaXDaot@ashevche-desk.local>
In-Reply-To: <at8eDFj2WNaXDaot@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 10:45:54 -0600
X-Gm-Features: AclHuK9i3gJhID1qYhY2EyC-ofDyvA_hJVRAckf-dNWT3ME93Ru8v8ikGWkk384
Message-ID: <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
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

On Mon, Oct 26, 2026 at 3:33=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrote:
> > On Sun, Oct 25, 2026 at 2:44=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrote:
>
> ...
>
> > > Some people might want to test the stuff. And sending too often you a=
ctually
> > > will get the opposite results, people will be tired to even start rev=
iewing
> > > and/or testing your code as it's changed way too quickly.
> >
> > My thought process was that people wouldn't want to be testing code tha=
t
> > had known bugs flagged in Sashiko reviews.
>
> Sashiko reviews are not visible in my or any other mailbox. To see them I=
 have
> to go to some URL and so on, meaning to waste time to see why on the eart=
h the
> new version has been sent.

Maybe the Sashiko reviews are getting caught in spam filtering or something=
?
They are showing up for me and on the mailing list[0] so I'm a bit confused=
 why
you aren't seeing them. You shouldn't have to go to the web interface[1] to=
 look
up the reviews.

[0] https://lore.kernel.org/all/sashiko-outbox-183574@kernel.org/

[1] https://sashiko.dev/

> It's better before addressing Sashiko comments,
> reply to all people involved and to Sashiko's original email, so it will =
be
> visible in the previous version why you issued (actually about to issue) =
the
> next version.

Hmm, maybe it makes sense to enable recipients in the reply_to config[2]?

[2] https://github.com/sashiko-dev/sashiko/blob/v.0.6.3/projects/linux/mail=
ing_lists.toml#L290

> And before even issuing it, wait for a while, people might
> disagree with Sashiko judgement or your replies on how to address that.

I was assuming everyone was seeing the Sashiko reviews getting posted to
the mailing list already. The are ending up in lore so unless someone isn't
subscribed to the list I'm not sure why they wouldn't be seeing those revie=
ws
already.

>
> TL;DR: this mailing list is *not* a playground with you and Sashiko, the =
whole
> community is behind it.
>
> > > Settle down first
> > > with something, put on the cover letter the answer why not all Sashik=
o's
> > > comments are being addressed (for example, due to amount of patches o=
r the
> > > series being focused on a certain issue).
> >
> > So, in general I've been always attempting to resolve known Sashiko iss=
ues
> > in every subsequent re-spin, so that would be a bit tricky since I woul=
dn't be
> > aware of the Sashiko issues until after the series has already been sen=
t.
> >
> > Usually the subsequent issues that get flagged are new issues only disc=
overed
> > after each new re-spin.
> >
> > I do have a bunch of UART/DMA related patches that don't have flagged S=
ashiko
> > issues so it probably makes sense to try and review those first while t=
he larger
> > series that have Sashiko flagged issues are still stabilizing.
>
> Yes.
>
> > > > [0] https://github.com/sashiko-dev/sashiko/pull/389
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
