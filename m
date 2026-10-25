Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792966281;
	b=O+iNWUEP++57sAI7zFwwoRudKDb5bxvu4dquCOoTMp6rIMc0I8mL2V0dWxUMqloSBZYF
	 qHERKpyu4cue82zJBYA3nM3jvFDsoRSMN5EB/BetsJMKZwnlfOGXsAoEufPNK4QgjBHXq
	 DSc+5LoR/EZmhvkgTtgajJ6voj0IJWDuo4gn/2WW4lJBKUz51DnXyoavZpOVkKl1dfY7y
	 s5vKy/5Oz+zji+sNk4QhwHE0LuZrT97Kkrk016bV51JlvYlbIV8vmS8HipeZYyhBhIxaD
	 y/ev/4oiaXLj/oSycyWFxfqnaFRctayVfOezDZl85GEqPJxQH+UKj/MZunUfOTA9pDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792966281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2OfqgWNLYUmZ1gnSmkRsn07TKyfZDdq4vI9UsfMbPGw=;
	b=rI5y6BKHVGNTf/ej83X5vFTyA3NHDVxQlfMMd4dUIPX9Fr+OfGYt65U/5cXYA5L+f7eY
	 ioRsyVirzWxUfELuihYtWNM7MJO6G0yYj7VaqxQQv6U3XSBR0LB7rCINVhkp2ji3kvMeM
	 HqtnsHcfQBBDF0QoD1rc5AwQUcbPHu3wckaILOWeQK+f2QGcxiKQVxVBpAIMoJlXAOQB3
	 cOxAn4bvKys4fM9xDCjujxWdJbGLToe6fwVioQQDvyM6BYtWUJtlB6y+TyLYhfFsVCh2t
	 6GLl2I6Mj9qReSzwwF7xn4JT+ZmwYPaX1HhX0vVMfRAJUH6c1BZMMT6faKgNBDszH1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gJrHhpHn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD761606A325
	for <imx@lists.linux.dev>; Sun, 25 Oct 2026 22:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD761606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gJrHhpHn
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7c33cc572e6so2157122137.1
        for <imx@lists.linux.dev>; Sun, 25 Oct 2026 15:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792966279; cv=none;
        d=google.com; s=arc-20260327;
        b=F5B1h1ai29YVfrtChlBnKBmOzURcpMIcWwl1KBVl6xNpbnuSXOeb94/9H2A0ekjm1N
         GeO4D+IJTmIF1z1MAW3DPaRjHDnSWr2jO5mi0luftFTNArjmi30GC8G+5Pnz72E0dxg+
         yVpaSNq2QpKEHvhMva3TfkrvvOFpPE1+sGQS42bGdCbnftDJhR79B20j/qYUxv+nXgoE
         PXGAyuC9zMVokdDYmvKp0KezDS7IXO2CleKjHtPso5Y7dpVFlQkUQYt3oepjRv0KsYrt
         THwq6HDEkgz/4Q45frbTjmAYbrftdXmmjPFmXroVNgfUNPz1SHRVN8qKkUEiY86CMfER
         n4Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2OfqgWNLYUmZ1gnSmkRsn07TKyfZDdq4vI9UsfMbPGw=;
        fh=a/ZxNiEtKqliDd1DAf1pYPWcwM4tT1dOR6NbRYcL4qU=;
        b=E+fBrXDtUdM3z3I2bLUVP03vkSNIcI5wJbde9SXclohidz5oCUJw4K+XcV65YFJGyG
         suOrJgZx5DQ2FPfdbVAd10qJwDRP+uO/XUdzs+bFIQ7p+ersR2CY4snBbNzrpnpfM+wm
         Xs46bribR+f02gmOz4My7XrE/gzxwpevi6woC7p4KeADBAfjRoVgF2ziX5Rg0+w6C94n
         +hMyRCSDw+uume99EGwLGRyAC8cT5GYI8+ik0hcvRzHHXG9InIly2phwpjF/mgK4ZhBd
         oZzAQiNBWIJZJTtyrh06pKcK1Hb6tVS6x9QoG2Pg3zVWYX2otNkRVuWgbj7/tz8UiSj5
         ooxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792966279; x=1793571079; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2OfqgWNLYUmZ1gnSmkRsn07TKyfZDdq4vI9UsfMbPGw=;
        b=gJrHhpHnyyz00+SKZv1f9TKUhliCiFwCdpBwa1HrmLrzFy/TlLgV+KY9/JVcfPLoLg
         i582d4sIjlN7ThFbNpsGaluAq589WChdMJLrvHbXiVSzKhjUjPjDdQBlUR/dhijMl3PE
         zhX//OA9658ClQlcORyxPWcwQZbpqHegX24sChpfnWtZB2oteTPLK3tMuHiTHm2PeM0Y
         OLm+ZEHbj5qOrarirPHS9WqQItrVmSJbGIuzCJ7Vi+udAr0IVqjzT5wCpLy4KBzLsZjd
         rERQOm1oU4zSyBbiLK41TtdDWSCzSGZ5ebjrx1+cV6I1WgVAsklpp3NuSm0eljdWFs5h
         jXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792966279; x=1793571079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2OfqgWNLYUmZ1gnSmkRsn07TKyfZDdq4vI9UsfMbPGw=;
        b=rzBaxLYj4ajXHFgCS+wfSs9zObWmEdl1m0ICd/ySlngjHk+68oD3xlYaMgBnr8oG0q
         1YivQD0blwzYwrHeHE0UPUO8+UqIETDiUGUlFFXd5VzO6XO7gVvi6J9QbDelNX3Wu/af
         zi3PsMo9nV3S2N02YGBs69rmSBoSmMkugbzkmUhJfgxvrJwAWxOi+GgYxSnukIIJwVJw
         2r1aR4+rA9/7bkoV9JTafod5yPyHwWgbUYoKSJQIL1qpclmB478jS4oc3gYVhrdaeAfw
         A1ohYkmdYdNw/uLiFCkHkhoF8oXtFPbhaC/jYZ9NLX+npJGHMzWHhw7nbOO9N/xLfuTF
         aX1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxLQWjK94kKeRZluQj1q3D3JiJw2n0wf3VwimNE4FOtAEQCoZKCORK5XaATpQ2Jdsoq/EI=@lists.linux.dev
X-Gm-Message-State: AFq9FYKwXFj1eI8tJTN0bmojcDgHbBnFDB0ZIzDbOMauLWl0DPIGUlxM
	epeXRlL5WxObA8wGF861swjipQoDioPeP9zywC9hTXL7ESAsEyHKYic8gs0kEszV37h2KvALgr9
	g0BL5nrQH2guRr77+bwKt9nVyl5dg3gI=
X-Gm-Gg: AYBFou24wIkQeZ2M2jfbj3New9Fv6jPDlJGQ4KApF4WKTkEebky4400sI38QFRc0LLy
	wglbQhfNMt7+jKG+faPZOAGyL6/i3H7EUfyVymsctyaFd/0o/86oS0AzqlLPBVUV3PHQ4cpXjkA
	uahg8TGUpGQ/UlYJmYLy5zz/xu5VKuMeHgLEMoW/iABbDeN2bNjpC6bbpINECcOIH4fhHlsSChI
	NR0Q0fWjhaopgPw/SdoDZE7Yg9LvOw3pfU0EhGCpf32EF/CkToLogQ105d3n55Bq9bxIeSPJFwz
	DwJNIZ3Wg/DhZfDLMbzYvu7+PXvJg3tV/QegBwUke3eDj/35NOZ/hFkQMVw6dJVvr9dAzeQYd+q
	I/gou2vge+UxjEEIk4M9L+r/nYgCLKuBKarQ9AHePIqbbD1tgCmaTyUtR137mKmMoWOtfGn8qnF
	eUYZ7jAmYGTtE/On0DvM/GNc9XKL2RAWF1f/oinKMq0enM+cut73V5FFmZGr/zhZTfC5Nf8BzZm
	xbLGu22Tm8sqnNH0SubRazJ1HbVPQ==
X-Received: by 2002:a05:6102:54a4:b0:7bf:8ec:4996 with SMTP id
 ada2fe7eead31-7ce5cd56791mr1192565137.20.1792966279613; Sun, 25 Oct 2026
 15:11:19 -0700 (PDT)
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
 <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com> <at5qKehogAjTa-fA@ashevche-desk.local>
In-Reply-To: <at5qKehogAjTa-fA@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 16:11:08 -0600
X-Gm-Features: AclHuK8uppf4mumWz9vBy2Gysgc_7CSgy4TY8S57y0TXESxCvcndlkgEpAI5NvA
Message-ID: <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
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

On Sun, Oct 25, 2026 at 2:44=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrote:
> > On Sun, Oct 25, 2026 at 9:10=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sun, Oct 25, 2026 at 05:10:03AM +0000, Maciej W. Rozycki wrote:
> > > > On Sat, 24 Oct 2026, James Hilliard wrote:
> > > >
> > > > > uart_write_wakeup() expects the UART port lock to be held. Severa=
l worker,
> > > > > DMA completion and interrupt paths call it without that lock, inc=
luding
> > > > > indirect calls from uart_handle_cts_change() and the transmit hel=
pers.
> > > >
> > > >  Fair enough, and thank you for the cleanup and spotting the issue =
in the
> > > > first place, however...
> > >
> > > He already issues a v6. I think the tactics against AI contributions =
should be
> > > to not answer for a week or so until there will be a quiescent week.
> >
> > At least with the workflow I've been using, a good signal for quiescenc=
e is
> > simply whether or not the Sashiko reviewer found issues.
> >
> > I am feeding the Sashiko prompts into my local agent but it seems to
> > sometimes miss issues that get flagged by the public Sashiko reviewer
> > still.
> >
> > I've been attempting to peel off independently reviewable fixes where
> > feasible as well to minimize the amount of patches/code during respins
> > as well.
> >
> > > At least that's what I learn from this patch storm.
> >
> > Whenever my local branch accumulates significant refactoring/changes
> > due to Sashiko or manual reviews I generally try and send out the new
> > revision fairly quickly in an attempt to avoid reviewers wasting time
> > reviewing code that is obsoleted by the new fixes/changes in my local
> > branch.
> >
> > Locally I actually have far more UART related patches in an integration
> > tree that I've held off on sending for now since they are dependent upo=
n
> > the prerequisite fixes I have already sent. My unposted patches actuall=
y
> > have an even larger amount of code changes than all the UART related
> > patches that I've posted so far, at least when measured in terms of tot=
al
> > lines of code changed.
> >
> > The large amount of patches I ended up with seems to have mostly come
> > about due to the AI agent identifying most of these bugs while iteratin=
g on
> > and debugging new features(most of which are still largely unsent so fa=
r).
> >
> > The strategy I've been using is to send small isolated fixes separately=
 and
> > then reference them as needed in the larger series that depend on them.
> > I figure this should make the changes easier to review than having them
> > all in a larger series. I contributed the changes[0] to make this compa=
tible
> > with the Sashiko reviewer actually.
> >
> > I also use a custom AI agent controlled hardware in the loop test harne=
ss
> > which makes iterating/testing changes much faster since the AI agent ca=
n
> > autonomously test and iterate on changes far faster than is possible to=
 do
> > manually. This test setup also allows much more thorough testing as a l=
ot
> > of error handling or uncommonly hit code paths can then be tested using
> > AI generated fault injection tests on real hardware tailored to the spe=
cific
> > fix being validated. I manually review the final changes before sending=
 as
> > well of course.
> >
> > I'm constantly refining these patch development/review workflows as wel=
l
> > so feel free to give me any suggestions for anything I should change to
> > make review easier.
>
> I already gave one: slow down. Better think than loop through AI and keep
> Sashiko busy. Your patches are valuable, no questions, but they are way
> too complicated to catch on withing an hours or a couple of days time fra=
me.

Yeah, I was already slowing down quite a bit. I probably should have starte=
d
sending some of these earlier but I wanted to see how my final integration =
tree
would look like first so that I could better peel out what was actually nee=
ded
as preparatory fixes in ways that would fit well with subsequent features.

> Some people might want to test the stuff. And sending too often you actua=
lly
> will get the opposite results, people will be tired to even start reviewi=
ng
> and/or testing your code as it's changed way too quickly.

My thought process was that people wouldn't want to be testing code that
had known bugs flagged in Sashiko reviews.

> Settle down first
> with something, put on the cover letter the answer why not all Sashiko's
> comments are being addressed (for example, due to amount of patches or th=
e
> series being focused on a certain issue).

So, in general I've been always attempting to resolve known Sashiko issues
in every subsequent re-spin, so that would be a bit tricky since I wouldn't=
 be
aware of the Sashiko issues until after the series has already been sent.

Usually the subsequent issues that get flagged are new issues only discover=
ed
after each new re-spin.

I do have a bunch of UART/DMA related patches that don't have flagged Sashi=
ko
issues so it probably makes sense to try and review those first while the l=
arger
series that have Sashiko flagged issues are still stabilizing.

>
> > [0] https://github.com/sashiko-dev/sashiko/pull/389
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
