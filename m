Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792959959;
	b=Vr7yr/H7dneZ5HR6cK/Xc7RVjH7D5fIUKMciNF64DjV2bgm5IdtEmW+DMdqE13Q+UMlI
	 Bt4Z7mI3KeX+w1eCdK8Yg3tOzUZ5+lELZ6Rd7hAcwH13r8glRS5cl00YDY3il7fGjFaBl
	 6r3fcBG5iHKvIRRpNFWyt0lDqszWd+RNah6eUuPxgoJXHiG0rUHrXH5fpVQJAMdMP3JFH
	 NFdvL6Ofuo3zPwbLt45lMefX+qxeZWpmgvR5comP2Hxy0OPJcs5iRm+vGZO6YnWUrA//W
	 HNGioTrmSbYdAG5BCePpyscGMPN1JZGv2ZKNgFBgHNkJ4OFo0/KcjCqhD325o/1mY1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792959959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C/RThAUA8B7cnZs887BkMxa6IkSw9Jpa0pELDADdrhA=;
	b=ti2lbLc2E4pE+vDTRZJRQXPdX55Z4x+vnZgpwZskut0H2QNSACpKlDVOfIGR+3c4yh9I
	 QXTI+8AQeQV88LZBtZSrnI338lDdwtBJUf8k4BSHIFup9c2xXSUrz+Xf7Zmtbm/2LAGPk
	 KEA7A1+8xLUWbChf1KOWE7DbpcL5LgO7DFL7it/+9cb4boDmOdhqBYRMzPI1hzUVRgeEc
	 k6zJr6oONf4mCS7sVFoq5GD7eHLvFpLHoXRsIavbgZ+/UgUGseU1LNPSkMrFwqm+9aRkx
	 FFHyqgyl/4WTxa50xlFkzruAB+HbiAUeEPneHPKQjvOyw8yhBdURYTgETe1YfRPts+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CJs8n7fw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98701606A31A
	for <imx@lists.linux.dev>; Sun, 25 Oct 2026 20:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98701606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CJs8n7fw
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-98301b325c4so495625241.1
        for <imx@lists.linux.dev>; Sun, 25 Oct 2026 13:25:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792959957; cv=none;
        d=google.com; s=arc-20260327;
        b=E/Qh6zw0m/b7n6ioO+yv7WfIk0gHbunNcFHKHyfyfBQcbLgM5p5FwnROUHw9I64lFU
         PD4b6iKtFIcPWVjBnvcHRpg3DeO2LNQ3GLa538jfpoPNZxVS4uKDKQfIYpqHpMWsjDvQ
         oxQlUD4jgchEBHb56yeXCWKcOU+j+6hQLu0/NVAEIx0CW1IFENn0iU6t77wkb5WdPJeB
         AaosLRb/wXDldQ3bzuRVV5lXhGuyXWEXOK000vlGtPG9qZXqbi7iqbUXTkCVAmLf7upi
         mjcCLpZDrJ4MBwCpD7YTxD0TZ2IJPbN4LHb+MTYIy3UpWJ/tOMQHYyTDiRtku7u6Wi1/
         SnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C/RThAUA8B7cnZs887BkMxa6IkSw9Jpa0pELDADdrhA=;
        fh=uu/IDr5f/KVAK2vI46y6GdjcdV98SbWN8Rg5Z187nLQ=;
        b=Iz+uSY+k2WbRx9V4/6WiYGJyqLdMgl9WfXHWsKtBoLTivZiTMyvr8PwrjVv021k+Yx
         N3AsS5V374d06qjC5iezGlI3fJwuen+EYR0bdRZ7IMie8oGNPE3TUZHB5xtw4TATE3jz
         Lqs7CK/oOPe1+inEEbeLJnprtyY4CyTIXflDW8c9pxImm/cHcZsBeDP4TEI5lgaoJt4x
         TGdBeSAsob9PC0SzdxJUUfHN/tQVqNCdIk3AH9glR535MJCananNeYUo4NvwMENvC+aI
         8lRhHimj4w2rd6ypy0T/p4D4qxjTmea5HBm5e+xHb675vV1i1r2hURBIA14U+mtW/zWz
         E5aQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792959957; x=1793564757; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/RThAUA8B7cnZs887BkMxa6IkSw9Jpa0pELDADdrhA=;
        b=CJs8n7fwYSf2CytxTmIyYbmg0HoNcAtji2WpBWmbef/2BZ982+Ge+JLX1QLQ02GU9A
         Y5GExMfxeZL/pBsLnc1sK4a4g/41z2fKumW5kHVp8C3sIHTHjY1VbfVtR6d6Nbx+HC/O
         jlUUaYDaKTtsigGOyltXBUsEBbYzgnCX4f9eHqik3DWCmQiivYLMrnoATW8U88Qrkc+E
         aOzKXOOs8qgMu5rs/ZUzzALAz22jTasxPvc2Y0rkGZOkmd5cJo5oSiadi425AguyInXJ
         OqfgiidwHqugLyaDq5OEJLu224A7s1YpUoBcDsW/t0r1tLNmXrylchZi7KEsoLXoD2Xs
         JWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792959957; x=1793564757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/RThAUA8B7cnZs887BkMxa6IkSw9Jpa0pELDADdrhA=;
        b=In2CpsCSJGkjBM+PuD5JnBbCNbfrJ/nYmVnha5R3P+JrAPlSHGLG49H6WrenZ8ckYd
         oEYIngiuPgMcb7jhNiPMdWA49ndp/f40Z+Fea1faDrkP/VuocGOdX0MpLQ0yV//huCd8
         jyHPyi3SJ3O9+FaMBLMpFDDVqwdntArHZAA/AtgXcue0NZXzc7v+DQXooMOIht8XeY/a
         Wp/LrI4Nbk2GHfDuQWLytomIRSS2IWFqpV1BCoQ3vFnOq2wjN93bzxrQ6dwjd3NlwQVn
         /q8QiJZzzaqss7B4h2iAX6fCZ/s6/Zz7phYX9KBEz1mn6sGvsEUKgw57r3vEGi8h0ntc
         ICbg==
X-Forwarded-Encrypted: i=1; AKwUvBxMgwtSYA9VHN4e7g7yds5WW5RCvY5dma/xuk1hKoQFsVRm4p2yCtwkGp4L++kmezNSWW4=@lists.linux.dev
X-Gm-Message-State: AFq9FYJTHo4pxOdEevnXhx41o+GmrjkUzCMqHrunoknwrG45MZy/Z10y
	s7jMLy6yfW79bGOyUM9uCwS4ct8NCvZqxwg6WxRTDmsykg7kJkYffNKLtafFCjkiDINkgfQOzs2
	Baato3kfrIjQqrnfteh/uFvGsmnTzRhU=
X-Gm-Gg: AYBFou2WKRVxsFz4ud4yV+WNfuAjo/4f28mMvFwOM0hOEYTo5RGIf5cFyK7W0pV1dzV
	JL7QszIcgxf/kIRi+/+oo+AAJ3gTy8F3GHVEHeQTcnmYwSG0H5KgyqlcvO990vn4svnhHmop0Ky
	OmKszGH3ZpcMECB8z2vHRGbqeAaLGkmvxFkgIPbD+mGKiazsBHwI7KY/akYf2NSr4HwlwT9v4EG
	f0mjqQZqM+xNUK25gkmZl7GA+Lc08SJuhVGXTwOXs3MV4UW6xpGITBWAyEc/drJAzvko+VIdSRk
	wZQC8ozqhL2ZNFw7e/Jsd2SirE3OpWktpp6ZO74Rb5TfiUHnnO5ez9sEWiJBWjDojLDeeo0e0u1
	Zec2tnRdRXYfaDL27p9XkqJzjrLLMVdITAADIUl84rF7LvS8laW7RlbrlV2dV6Lkl4nQGUq7hMJ
	hpoI5BUchEm4uFOdX0XRnPspeLc9KBeQGODBajybFlj+K92cZpWkpUA+aOzidheZqFka7LTDYzn
	aDXnjzGxZY2HqbX3F2/5DkMc5iT8A==
X-Received: by 2002:a05:6102:a213:20b0:7ce:645a:13a4 with SMTP id
 ada2fe7eead31-7ce645a802emr619643137.20.1792959957403; Sun, 25 Oct 2026
 13:25:57 -0700 (PDT)
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
In-Reply-To: <at4bw-G8czG-G7Wl@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 14:25:46 -0600
X-Gm-Features: AclHuK95EKPTnWE_5NOhWBwYmgu-dizSaKFvAkW3Q_P3x_TD5WYGvbT2T9PcLnc
Message-ID: <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
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

On Sun, Oct 25, 2026 at 9:10=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Oct 25, 2026 at 05:10:03AM +0000, Maciej W. Rozycki wrote:
> > On Sat, 24 Oct 2026, James Hilliard wrote:
> >
> > > uart_write_wakeup() expects the UART port lock to be held. Several wo=
rker,
> > > DMA completion and interrupt paths call it without that lock, includi=
ng
> > > indirect calls from uart_handle_cts_change() and the transmit helpers=
.
> >
> >  Fair enough, and thank you for the cleanup and spotting the issue in t=
he
> > first place, however...
>
> He already issues a v6. I think the tactics against AI contributions shou=
ld be
> to not answer for a week or so until there will be a quiescent week.

At least with the workflow I've been using, a good signal for quiescence is
simply whether or not the Sashiko reviewer found issues.

I am feeding the Sashiko prompts into my local agent but it seems to
sometimes miss issues that get flagged by the public Sashiko reviewer
still.

I've been attempting to peel off independently reviewable fixes where
feasible as well to minimize the amount of patches/code during respins
as well.

> At least that's what I learn from this patch storm.

Whenever my local branch accumulates significant refactoring/changes
due to Sashiko or manual reviews I generally try and send out the new
revision fairly quickly in an attempt to avoid reviewers wasting time
reviewing code that is obsoleted by the new fixes/changes in my local
branch.

Locally I actually have far more UART related patches in an integration
tree that I've held off on sending for now since they are dependent upon
the prerequisite fixes I have already sent. My unposted patches actually
have an even larger amount of code changes than all the UART related
patches that I've posted so far, at least when measured in terms of total
lines of code changed.

The large amount of patches I ended up with seems to have mostly come
about due to the AI agent identifying most of these bugs while iterating on
and debugging new features(most of which are still largely unsent so far).

The strategy I've been using is to send small isolated fixes separately and
then reference them as needed in the larger series that depend on them.
I figure this should make the changes easier to review than having them
all in a larger series. I contributed the changes[0] to make this compatibl=
e
with the Sashiko reviewer actually.

I also use a custom AI agent controlled hardware in the loop test harness
which makes iterating/testing changes much faster since the AI agent can
autonomously test and iterate on changes far faster than is possible to do
manually. This test setup also allows much more thorough testing as a lot
of error handling or uncommonly hit code paths can then be tested using
AI generated fault injection tests on real hardware tailored to the specifi=
c
fix being validated. I manually review the final changes before sending as
well of course.

I'm constantly refining these patch development/review workflows as well
so feel free to give me any suggestions for anything I should change to
make review easier.

[0] https://github.com/sashiko-dev/sashiko/pull/389

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
