Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793047777;
	b=0Da0D1G3990UrTAlp+te5zka+vAUoCt+1XJJyKtqJq9D17NSw6JFUR6H4Ufk5gyiul0K
	 ha9AAb4ijrB19mahsciCA4g7zZtY2qflwKbV/cQgwweJqVKLpB62RWu5Xk0QlFbDK+7Q8
	 TLfg9lOKcugVfbLp+sXGcBnzUqj9CovXrrcWbAG9n4RnrXzKUib1SAnTPDrROZxuY1K9f
	 iE2a8DEj8wcfR9uVYoEYqkEukW9RcehhjvcPUdvKNZTOlwFDUAwelpZpVSO+Y/ZFsIjf7
	 1f1H4J/2TjTUOK6/YzBJnTcauHqFP9u0SnM0Ytijhgr9zZwUZAU1pec8ExkhsBuRflQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eEKPapKQIiWh5bUIcb5N/LuB8yx8USeXRcJ+z78vdxU=;
	b=Wt72bgLEO+NNq72+Nbt6b3Ple9LJQ1BRc5sx+5XRPNgvSsOEgfnaw/uc6o0FJ5nDyzDm
	 CVY9gNyZJMKZqd1L1q6JANvcJqenjUa8VEvA2kNAOqzVTPpZrvYTFbo5Ros2VSLuUu2MW
	 SvOu9N/aBplDibQbSKDwNGjxTM0gGqB8+rGrEHJ0CAzINXtEWkXbnqh/4kYAPIz+9y2oN
	 uvltOqUYD4Hfp472uurILerOpjO3ZvwtKiN5UJ9ON3zeVHN/TF2FSVKYprAtskZiuiYfP
	 E2Da5ZBcoEagzTI7b1oezk400gv06kAAaUPQW24oHkWy1qf8o5c4AM1kl609uhc9rMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rdu3f9of;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED41606A321
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 20:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ED41606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rdu3f9of
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eac3b6b2ceso998319e0c.2
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 13:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793047776; cv=none;
        d=google.com; s=arc-20260327;
        b=Etb22AO71Vfa6ddM2AKGsIeEVLETJemOhBSCk7jpFIa9hP92nAiksrWb/hWvkVqO0h
         x3UZY4lHnffMhss9pK3AmOZV8mpfg2T7gDggINcAmsUq1MiAx06HOQYc4t8ke7f/VNrW
         9I7M6A8csFT6ffUZa/6Chm95AYqcwCFmTVcY7vvskiD2nvW3y8yExXEeHgq8of2i1UWk
         cUb1Z/piPtv2SaezEdx+te9I/p0rvB5JHTHEPtsj7oStbJd+76NyteXyXkcBdf2gGeJT
         0lKrOjhlSHit3Vxdqa15kizAIziSlqBwDPJGzKHcYns04gai1qnc9g1Pw/mCcahLlTpb
         zgOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eEKPapKQIiWh5bUIcb5N/LuB8yx8USeXRcJ+z78vdxU=;
        fh=+VDVGyvb/BZJq/+DHecdQbKebMXgSRsNfwpHmthvHtE=;
        b=NJpwOsLqXIMlwNFQBzkpyJGnMhJbv6YE38hU38pDyC/y2Q+w6TNSz3+CfXybOcpAzr
         RokqEVCaMTYQkZ0aI1V+fZjy2yEoHP02u91M15VLt546kSSdrQgAy9sVLKzJpuJFeLCf
         M0hr6eRtN6DpwzCiSJPXaJcnxIXq/Z9iSwT6RUWG3/gxJF2mApYd7ZavqvhH62sAVjby
         kK+NOXc5bF6bQaI8gPHnbweVNRv7ltNynzfWHjh3FNdAOrlz+XcPUtAPMe7MtTyhZvJP
         Js8XvJnzx5YVlDW/TwScgBoG9zCMwOZWLb5juMpt0+2rteLDeAAsN+23Sg0mhMa7EuuA
         O9Hw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047776; x=1793652576; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eEKPapKQIiWh5bUIcb5N/LuB8yx8USeXRcJ+z78vdxU=;
        b=Rdu3f9ofHX/qc3tb74pv8OfDtroUXgbcBbYGBlX5uruN8+9G6/MBNNC/l4CehlaNx8
         E3KdgO/5LCuGgrkIer6WpZjmOuDRRPtCEePjux7QxAEdC1gmKoLPGH3cm7VMToRMe2HS
         YbeqgdaFddybYU5z2tFU65pDmBpIR32Y4q6MsXAzZjAx9tOvN7c5nrAfwxtV7uvPg7y0
         npDpkT1FgQCGmKbneST0/ZByePuVG/pr9rcFcLexe4en35vqeSCJhZioXqSGA8nv/Or5
         xeIGO4pVYB4yhDqupynUS23S7ubGyBSeKTkQL8fuKWTYGWDFfcYD1/Sw00BsI/JCXj5E
         lJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047776; x=1793652576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eEKPapKQIiWh5bUIcb5N/LuB8yx8USeXRcJ+z78vdxU=;
        b=KjXZeRIi8FuPzGC80cOwMfzq++a01uXadq+Y/sRXYnh+QLzo+WanomUMmWpqmUQEN5
         9E5WVuop+IwWabCl9W7DJg3h+gFfcfHH5VEWnNxTRMDJ/DrdvKQDYg766CpVI0edishT
         E2yHhG0VyNnPIv0IMT/wNN8p3Rgfr8jfwJPh6NiBc7SdPdmzX6WJFd0UrYyAHuRogrCK
         muQbin9VwpkQfiTVjp39cCWdFo74zjC9XL1rAA/Errq+X3FtAlb9l2WYd0y8aOsxxPFS
         nqXQ3sD+7xsP9xbfKH1TBUhjQ8WqTphz7RD95rjbkleS9YR053cd6Q/yxRoB++tR73/h
         BZYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkdzckXRueuMzQXy0geQqBtKVYzZcL+WITagAU6RdbvP8T5WhtMAGk5YUsiO3AZuCAoVk=@lists.linux.dev
X-Gm-Message-State: AFq9FYIJBl+0yT2FZPEaJehZO4o+HABufnH1KftssGXlxhSOyybW1qGI
	1G7AZplCEEd0otkmuzQkzenJQVE5cD6A1gZ0+UeGyB+52y3ZNwkHAsdU4+8Zwph2jkTs1vGVQuV
	hu4ydZS+/LRZrvanhqpznHtfqlhiyDLU=
X-Gm-Gg: AYBFou1+VFBR4UDlJqamSTglfDz9I6WNfUNEcZrB/GzDw9SBkRrT/NKdpn+fgKDABpq
	SwWKycd49OCI1XpW/kWxgDjLUT8aJlZ16uf5mLjdr4RYvLqVTVaHXIkjKabiUtxGuf/T1ynKGO7
	apfGdCIa+oOqH4tasT4oFkxzvPPmewgvjmOTmf+i76fSklLqoPNvxiAYBmDLdF1K1flEngqcbIU
	4DH71eG9MGl3XHOyej2vUQvQOIM34LVSyuLQmk1kS/aXUuHf0ijuGaWEsTyUb6zMjkiGaFg11O7
	bbMvsUg2XSR7FPii+mdiwvsFhWO991eT11j6Wedxj9PfFJlu8rQAv60px5RFmu7zhK3CPTChkJZ
	6WnFTVM+PS+8vuLpyaZl+KFkT6djkZjQnl2NdqbH8uZGm3q/j4+g/Jbk7WUWFxN0i+qBmNXUjw4
	s7qsF2NXG3sW64RGhlRfdlh+rwZjS70oSZqQE+sDPknZr1Iu1HrRvTTZxXQwN44mh6vx/pCadCD
	tR0NV0PZr4/7MqfG/51T3KaGsIWxHtqPs6VOrxZwGYkn/klJ7o=
X-Received: by 2002:a67:e114:0:b0:7be:37d8:1567 with SMTP id
 ada2fe7eead31-7ce5ccdca48mr2010224137.10.1793047776347; Mon, 26 Oct 2026
 13:49:36 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <at4bw-G8czG-G7Wl@ashevche-desk.local> <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
 <at5qKehogAjTa-fA@ashevche-desk.local> <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
 <at8eDFj2WNaXDaot@ashevche-desk.local> <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
 <at-vyZ1sDhYPu0W5@ashevche-desk.local> <CADvTj4o_CENc3i92OQEZudOErSKPUptT4t2CCqDaGbseuK0QcQ@mail.gmail.com>
 <2026102631-stove-preview-b534@gregkh> <CADvTj4pCnnzx4B28H_1BuY4gm2fh_8HYL9jLpsAoJcWfiUXOHw@mail.gmail.com>
 <2026102657-tubby-tragedy-5f1b@gregkh>
In-Reply-To: <2026102657-tubby-tragedy-5f1b@gregkh>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 14:49:24 -0600
X-Gm-Features: AclHuK9UNYlzFhcHxdKzFFVeehL7ZLxndmHwf2zdIRC7OGdlKpLpZQpwjo4GLVA
Message-ID: <CADvTj4oFBznFO9ZxL_8wZtcPaweSSt-a_brVkmQKzqJsBX2P5w@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
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

On Mon, Oct 26, 2026 at 2:40=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Oct 26, 2026 at 02:24:58PM -0600, James Hilliard wrote:
> > On Mon, Oct 26, 2026 at 2:17=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Oct 26, 2026 at 01:59:06PM -0600, James Hilliard wrote:
> > > > On Mon, Oct 26, 2026 at 1:53=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > >
> > > > > On Mon, Oct 26, 2026 at 10:45:54AM -0600, James Hilliard wrote:
> > > > > > On Mon, Oct 26, 2026 at 3:33=E2=80=AFAM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrot=
e:
> > > > > > > > On Sun, Oct 25, 2026 at 2:44=E2=80=AFPM Andy Shevchenko
> > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard =
wrote:
> > > > >
> > > > > ...
> > > > >
> > > > > > > > > Some people might want to test the stuff. And sending too=
 often you actually
> > > > > > > > > will get the opposite results, people will be tired to ev=
en start reviewing
> > > > > > > > > and/or testing your code as it's changed way too quickly.
> > > > > > > >
> > > > > > > > My thought process was that people wouldn't want to be test=
ing code that
> > > > > > > > had known bugs flagged in Sashiko reviews.
> > > > > > >
> > > > > > > Sashiko reviews are not visible in my or any other mailbox. T=
o see them I have
> > > > > > > to go to some URL and so on, meaning to waste time to see why=
 on the earth the
> > > > > > > new version has been sent.
> > > > > >
> > > > > > Maybe the Sashiko reviews are getting caught in spam filtering =
or something?
> > > > > > They are showing up for me and on the mailing list[0] so I'm a =
bit confused why
> > > > > > you aren't seeing them. You shouldn't have to go to the web int=
erface[1] to look
> > > > > > up the reviews.
> > > > > >
> > > > > > [0] https://lore.kernel.org/all/sashiko-outbox-183574@kernel.or=
g/
> > > > > >
> > > > > > [1] https://sashiko.dev/
> > > > > >
> > > > > > > It's better before addressing Sashiko comments,
> > > > > > > reply to all people involved and to Sashiko's original email,=
 so it will be
> > > > > > > visible in the previous version why you issued (actually abou=
t to issue) the
> > > > > > > next version.
> > > > > >
> > > > > > Hmm, maybe it makes sense to enable recipients in the reply_to =
config[2]?
> > > > >
> > > > > It's up to the list owners / subsystem maintainers.
> > > > >
> > > > > > [2] https://github.com/sashiko-dev/sashiko/blob/v.0.6.3/project=
s/linux/mailing_lists.toml#L290
> > > > > >
> > > > > > > And before even issuing it, wait for a while, people might
> > > > > > > disagree with Sashiko judgement or your replies on how to add=
ress that.
> > > > > >
> > > > > > I was assuming everyone was seeing the Sashiko reviews getting =
posted to
> > > > > > the mailing list already. The are ending up in lore so unless s=
omeone isn't
> > > > > > subscribed to the list I'm not sure why they wouldn't be seeing=
 those reviews
> > > > > > already.
> > > > >
> > > > > I assume you already answered your Q. mailing list in this sense =
doesn't mean
> > > > > recipients. I think it simply goes to the mailing list without fo=
rwarding.
> > > >
> > > > Do we want those reviews going to recipients as well as the mailing=
 list?
> > >
> > > For serial patches, we decided to only have it go to the submitter an=
d
> > > the list.
> >
> > When it goes to the list is it supposed to go to list subscribers as
> > well or only to lore?
>
> All list subscribers as well, I've watched your interactions just fine
> :)

Andy, are you subscribed to the linux-serial list?

I'm wondering if some mail is getting dropped, in this particular thread I =
never
actually received the review from Maciej W. Rozycki <macro@orcam.me.uk> at
all and had to manually import the email from lore. I think that's the
only review
email that I saw go missing myself.

That one getting dropped seems especially strange since it had a
direct reply to me.

>
> thanks,
>
> greg k-h
