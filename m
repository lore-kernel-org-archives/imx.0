Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793046312;
	b=PJLaCmwK2pEIEeMKXRtHXrnq5pVkgCU75s2GK0CwA0tt0lQZVCwUqpefFoTkEolNQs1K
	 vGSCvFFkdMY0ORpdWyzSyZoqImxg+3G4zRHD++GVewymf5ob2cWspiHfwMbWTMf8j9Uve
	 p1cf4twN176ACw7WsoIm0L1i5nV/JEd1/VOmw9vyA/l/vA5JbUZt4msUIw0mCIC8fR7E0
	 lEVePWhWaBFGFnzPF411IQ8UJ8mC+L/t/9eiIIWL53ETeAm6KVPi2rRlhy/iZx4xjEpGx
	 EVnrNWUQSfIMeiN2UPpiFe9jijXLs1Gf0ZM/ECrDY++tLE24o25fiQz2RuSujFW/Smw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pU0NwAlmN/1H5GxbKnpqpM7HbDpz94JrESY0WvDe6G0=;
	b=KcGArjxkwU1p3U8INw3td57/tFqF2qXz6SJNnEAw6zITeSCSOXVRPzQoei04T2D26Pee
	 LIZaRajtA3rhIi9So3PDSZvADV2w7pVW0ufBZ10O68h8NaF4tUNMka/tYLUcthEqQ8qIH
	 VfoJNMUT7EzwQsZxk9kaGhujpF/rm6qPlqxJO/3g647J6XrhZJpqjmP/LVjal4b/Fj90X
	 ERGQI2bfNkzquf5VGN2Zt/LWio/YazcXXOefn8UPbVL3Iv29wa2MGXjrXJrLtOsRV6O8V
	 vhufPTXNj5xpdwv1VSbyjtyIMHFlO0j15faGdTo9mZagizWY4aKKDtGWTle2t2dY5EQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WBiqNk9t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C617D606A320
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 20:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C617D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WBiqNk9t
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9908c849564so838313241.3
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 13:25:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793046311; cv=none;
        d=google.com; s=arc-20260327;
        b=ONrieA0YPB4pXpzMMzZK4GIkgdMrRPbXiRH+EM2Mc5zc7zHK8azmS/3BtN+dhxplTR
         1KQR411R5ildsS8MYOhuZorZvTY60AZO1PrxRt7IRlOn+5JAhS/xV6x7g1ImIc7r8CLa
         XOtDTlQ6rutda6gs4KagYlqi0jEGUDlZIpJKDMGb+aJy2T6hmi91yjTaMIDhhXLxc14x
         sACESSYfB8MkO3avgutzzryXJXtCmNo3lP77PekmKynJU6lo9GhZ/3Ezeg/VawmAh8Mq
         Sm4dMJmPGRJcrl76FqGCn7iNcLtcbt4Y6XpGlWcDxB97ZLGa6rTIafj07bvsM3or70SD
         WmCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pU0NwAlmN/1H5GxbKnpqpM7HbDpz94JrESY0WvDe6G0=;
        fh=QaSAe5+9U//WEfLE5DkHIVIi1ybq5T291GC7IolrOK0=;
        b=CjoEXZNYSu3w8fyeAo7F6L1WHgV42qaLFM3BgykprSNpktddpb/0yHWQI5FB+i9EBx
         r4VZ947JACSnzY1mWvE18tvLCYFWjNGBAQKm1RdYOVJV7vfk2msN/bivyFftL7G3sjYy
         viN4LAk9V5odIQjz/KMyokMMo61o7d/OkeJ3rx/+8Ah2v1xgKQENMYkF2qvifhVfh4wE
         fKC8WCol7nz9aV+jc0Ldgs4OZH+Rzb4Nagh5F1mZrky2FBk49wegYQdarVAU9kFu+uIm
         KfAPieFIoyN0dU8Cnu8sUMn5bzyongZy9Ol+7GeipCE8QTz0j3H8CxnbJeBhPeC8Sim6
         dz0Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793046311; x=1793651111; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pU0NwAlmN/1H5GxbKnpqpM7HbDpz94JrESY0WvDe6G0=;
        b=WBiqNk9tpsroiROm+bkEKQ+FjUedV62fInlo4197z6wPPbVPhEP7U0vUErz55kU7nW
         gUERkOcyTmg/oh/l3JzTcDWCzAw8vo5qLVDU8kHY50ea06pp6QpA98DqShl3AItCLS5x
         NaYPTkIvoA4+URhT3sq//WQWH7UD0spkl+Tg6LOgDRAsms83vyhdCqApP5GksuBMofVw
         N+HgltNtKqKm9e2VnpS0n17oZSN+/q+mVlKD7j+dg8KQzraQZD3eehymhEjf3FDf9BXi
         uErJCgKGyMY2IOu0HF6oSwhbVjPIUheM+C8MF+faSxmo74Vl3lSy1pknqUSAlzpkryi6
         OJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046311; x=1793651111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pU0NwAlmN/1H5GxbKnpqpM7HbDpz94JrESY0WvDe6G0=;
        b=Imez38hDd37Q5XKEfZya17EPFYiLEBytTMbZvoJYJe7wQTYKXXUXSFJMdAueggWkfK
         hiQZZ1YnUNAUkRhrPn+K2z014etWMMVsclPmNfOZAuXd6WJbWIe30MobCdYb9aRX41Uc
         fjkhLEOdXtKnhmeNp+gSBrspswaNmr3SJPv9UoIuM1b7gKxARz0Zq+fjB3KUyaY7a/xx
         hBqL2yeATQIS9nURlONvG6Oxb7+nke4YWh9mI2OOj3IS52XovlrhPzVOdAeGz/CIAzGb
         LcKBkY8HjCv7nnlsr6H3cGE7Ck3TcCzID/kF5kkPtO8ilaeNXbP8JL71FlWobhn97E36
         T4Ng==
X-Forwarded-Encrypted: i=1; AKwUvBzwq6ZkECNF/BjAlqqt/ip2wyy11k4ptivuRoQzfgld2SesYB+v+5OinADORv0bfZ0ItPs=@lists.linux.dev
X-Gm-Message-State: AFq9FYKBhY6NsCPeuS8ZvsSXGYZDqnf3cZNknZAbT1eE2+M8aCeCwikt
	mCc2Aa7iZ348pZC68KFdi1S7CSpvW54is+S/DqMdmKZ9NysgHTPSj5+kfq8Tau1na+cgxYm9kdp
	AMNfTgpComnF/2YmZs13EwLsySPvYWbE=
X-Gm-Gg: AYBFou1jW7robgIVYXbc2RFK1pAlAsaIp+YEQe4jT+l+i0OYAgDlocBzcy4rnpicMt7
	iq7FaQOGEejUE9lvHVXhPEmGQ7F3nRLMJ2pd7NpjtzDrQSXtwlLp3V3bDSqqEfyx8ku7A+a8qz5
	Tj5h0k5Q3ODaA2qK9TXOICqnnBjUyuAxn9Xy7A+XcTCjriIx+s02xELPH5x/db43dxBdXNeyC5O
	iKczkjMquDsVnv9tAJv3mti23OmcuTdLTlHGNG+12wfVPjy2U/43xZg82oZtnO6PTL9H4/u/vRK
	AKQFoytl/XiOYws+iNEYS6oryNla8BsNk3hQTWW19LibyVbmXJqdY1v/7000lXvAA8ntXK9djDP
	b7QnIAXjuPeqqjxnrjbEr57ZNsrmPTWUU3ZdQBxzBumibvZzzWpJa9IoBVrAzX/pyX2ch2HyfDa
	1aHjKSyFtDnSDc+KFoiIoFhO37/BOpcphheuyF/6+GUlLZGJi94ODPwLrCCOUUUKV/GMOK2KubN
	UhapgTl8U8GWs2lWFAomG3BazH3Cw==
X-Received: by 2002:a05:6102:83cb:b0:7c1:6de4:9f67 with SMTP id
 ada2fe7eead31-7ce5ca62390mr2075068137.2.1793046310592; Mon, 26 Oct 2026
 13:25:10 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk> <at4bw-G8czG-G7Wl@ashevche-desk.local>
 <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
 <at5qKehogAjTa-fA@ashevche-desk.local> <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
 <at8eDFj2WNaXDaot@ashevche-desk.local> <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
 <at-vyZ1sDhYPu0W5@ashevche-desk.local> <CADvTj4o_CENc3i92OQEZudOErSKPUptT4t2CCqDaGbseuK0QcQ@mail.gmail.com>
 <2026102631-stove-preview-b534@gregkh>
In-Reply-To: <2026102631-stove-preview-b534@gregkh>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 14:24:58 -0600
X-Gm-Features: AclHuK-jg_V963WeCj8dDZYyLMETxUQLvBlHikJJBrwQZYN579iKyQfuGLYZuh0
Message-ID: <CADvTj4pCnnzx4B28H_1BuY4gm2fh_8HYL9jLpsAoJcWfiUXOHw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Jiri Slaby <jirislaby@kernel.org>, 
	Raul E Rangel <rrangel@chromium.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
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

On Mon, Oct 26, 2026 at 2:17=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Oct 26, 2026 at 01:59:06PM -0600, James Hilliard wrote:
> > On Mon, Oct 26, 2026 at 1:53=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Mon, Oct 26, 2026 at 10:45:54AM -0600, James Hilliard wrote:
> > > > On Mon, Oct 26, 2026 at 3:33=E2=80=AFAM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrote:
> > > > > > On Sun, Oct 25, 2026 at 2:44=E2=80=AFPM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrot=
e:
> > >
> > > ...
> > >
> > > > > > > Some people might want to test the stuff. And sending too oft=
en you actually
> > > > > > > will get the opposite results, people will be tired to even s=
tart reviewing
> > > > > > > and/or testing your code as it's changed way too quickly.
> > > > > >
> > > > > > My thought process was that people wouldn't want to be testing =
code that
> > > > > > had known bugs flagged in Sashiko reviews.
> > > > >
> > > > > Sashiko reviews are not visible in my or any other mailbox. To se=
e them I have
> > > > > to go to some URL and so on, meaning to waste time to see why on =
the earth the
> > > > > new version has been sent.
> > > >
> > > > Maybe the Sashiko reviews are getting caught in spam filtering or s=
omething?
> > > > They are showing up for me and on the mailing list[0] so I'm a bit =
confused why
> > > > you aren't seeing them. You shouldn't have to go to the web interfa=
ce[1] to look
> > > > up the reviews.
> > > >
> > > > [0] https://lore.kernel.org/all/sashiko-outbox-183574@kernel.org/
> > > >
> > > > [1] https://sashiko.dev/
> > > >
> > > > > It's better before addressing Sashiko comments,
> > > > > reply to all people involved and to Sashiko's original email, so =
it will be
> > > > > visible in the previous version why you issued (actually about to=
 issue) the
> > > > > next version.
> > > >
> > > > Hmm, maybe it makes sense to enable recipients in the reply_to conf=
ig[2]?
> > >
> > > It's up to the list owners / subsystem maintainers.
> > >
> > > > [2] https://github.com/sashiko-dev/sashiko/blob/v.0.6.3/projects/li=
nux/mailing_lists.toml#L290
> > > >
> > > > > And before even issuing it, wait for a while, people might
> > > > > disagree with Sashiko judgement or your replies on how to address=
 that.
> > > >
> > > > I was assuming everyone was seeing the Sashiko reviews getting post=
ed to
> > > > the mailing list already. The are ending up in lore so unless someo=
ne isn't
> > > > subscribed to the list I'm not sure why they wouldn't be seeing tho=
se reviews
> > > > already.
> > >
> > > I assume you already answered your Q. mailing list in this sense does=
n't mean
> > > recipients. I think it simply goes to the mailing list without forwar=
ding.
> >
> > Do we want those reviews going to recipients as well as the mailing lis=
t?
>
> For serial patches, we decided to only have it go to the submitter and
> the list.

When it goes to the list is it supposed to go to list subscribers as
well or only
to lore?

>
> thanks,
>
> greg k-h
