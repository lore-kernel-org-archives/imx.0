Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB43119E97F
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 18:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956584; cv=pass; b=jTBWjJ4kaSJJ8ocAWpLYd4nIFdv/YaLVrD9P4P6mCyiPsIJZcoZn0ntPmDCGrvh4dUXYncBLV10V5EHNLM15kcn0Mdon0aTBzilp+Lz0qnYLgDVwVC57cEnHJy3wT2b9wnyPWQeHaVvQIEbUupCXST9f/A3PKVhtC92d9IGXHP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956584; c=relaxed/simple;
	bh=vJaYNFnuf2hOYg3Wzwgr911xc+wa92WDutG7dqVnCzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XOqqpv2jw9yz6NyuS9rR+G70e/7GIBRjKI7rOgLmXIK/paiMn167QgzL6WEPZGNqhojd5xFh+nmqOpWXZ45xsyJ3c79ztxIq9XdAz7UQlKAjPiec/xp6CpJ5uDbv063tVDCFpF2/BOb67Ai9ge1nTsDk1FdtcvNzFAp9lB2Vs+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BFUEmeF1; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BFUEmeF1"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65bf302471dso6118373a12.1
        for <imx@lists.linux.dev>; Tue, 24 Feb 2026 10:09:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771956581; cv=none;
        d=google.com; s=arc-20240605;
        b=OPo/4rLbmmyzEPflMJP9Tv4q2FbBTMeIyZASLQYnnhRucAIkFIppqYPcw0zpdJKbyh
         fsEiXXQMlRwoo9hrFLJjFW5EQqnhxdElFQNi9B7cNsRZtXML57Q38V11dsgVJsTnWY7C
         9IHYB0unHCHuigiNLh3DQLaa1DTnw6fjqVU00wl5Gpu+xXC7pIMuyc97M8Z/4IpM8sG/
         cJhkzfNITt/1RjNMjjD9Jkk9nyStvuqaBsYcQ0GADlSdnoqU54hzHitWlUDC4818U5DG
         bIcZ6SwysqvpUwqkHE06Ewwclfd7ChJUPXwKKcj8OJKLPrHkXFYGYAdhL4iazLtUwWQs
         buQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WkhJvVlHP2HM21UJR495PsQ26BfaGB2+8QVHbNSzt78=;
        fh=3D9KtMP//RATeEl1SWuuRmc7Yl1+ie4HFKX4iG//fLA=;
        b=FbRvTIHnrdURvsQba4VBVIjo+SrwJJWU95lqRde3ng/KHtbrfusnMMP+Ke0lw/I2n8
         ZfJttKXf2gqwmeG9PZjtOZHDkvvvyUWZ75+ue1K9AM+Osh1cmKxuVaWFOBPLo7Y+ZeqB
         uGsiY+mmWSDJH1jMBhXIPy3Ulw6ZhucThooyzdVqVbAuOviWvivpQ2eCAvYUxls7hEFh
         rQ85moOxg/pdaLq7DR7Y/5tU8vpLcGoYHsh8rGs+ofQ7lD4kdkWFKYd/4TE8YtvilXO1
         qcGWML9YHNthTbzVxQmy4CoWpvG5jXQrOkd0xmLeQnvLHMh3G2pSsJ2Dcy2smZ0VzvTv
         bqKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771956581; x=1772561381; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkhJvVlHP2HM21UJR495PsQ26BfaGB2+8QVHbNSzt78=;
        b=BFUEmeF1qc1t3hPy/+N4pEC52iQd/WoX49O/YKx4OtrluYiJ2wja7amU6evKI2g27W
         r+AQVM9vkJfFkrtrjMSGn7YLeyNuY+F9WO7tEJdklNmvZrfD17eK8oPBuMuM59S6ekcx
         CDa8i/mvoIBZll6OfjoVbXR0v25t/h9hfKg4YU0agsOoJX2St5P33eMMOcEkmV1aUbZb
         zrFl442p2RJZG8dkE2ib220qX4iFRfKbubF9GNtMzvwH8gO5mrwsw72PXdCGd6pPaXOA
         AcatnJTMNqTvMFLzydaGBdi6S3AqJwM0cFi4izG532iwCzYUMu5E70I2kBkv0vrERQ1C
         NZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956581; x=1772561381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WkhJvVlHP2HM21UJR495PsQ26BfaGB2+8QVHbNSzt78=;
        b=lXh+2PHocoAHvv4C81cGPOU8Nua8HVgzm2LIWKrpu0/6pUOF1SDVZgVXv5/fZ49+K/
         MfVr1uwzgIf0sd/x/TgBu8gxv5YOyaVwEICfnj0hfC7G8dqpzYofzzxfqXXtYUWXdHs+
         R63r8PrcSa0bIj0MyMn1RcCFi6olwvkvUN7viXSRRv0ukizqQBPBLMMQaz1/X74u38op
         ZwOTJMXCAt+6aNe1qO+LthVSevQRNv2c46+JLkXT901u4K20mK8rl7Jfl9iBTFeVdbFR
         O9KoHFv1qutNzeb9+rh57BV8ABIQBoGUq9TEAwj/DwRqazfnG+DpAll3Yc/0QwGtSSWn
         cl+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBTwhfIUibzrJuSWCg4yJ8By5s+WM6OsW2pTMM22OGh7LCQi6+6kHx+gwpUXPNS5M6sIc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzBJzG1HXwBTLOh6uDaBj9/KfGUBvVmVZVy2Z0FwtLxZY3fHBB
	0I6idb0h9Bo51UVuy+OUyomQ7S3FHs0DMrRA2WStklcfBbC37bIb18FUvKyIM/EF+J9XM0O+9w7
	x4BnXg/5ZGqjYTrojHJgyqaNBUoaWnsvPG8y8VRlffg==
X-Gm-Gg: ATEYQzyBtMnug9UoCEk3EJFBN1h00Mn7RX/t8UwysCfxOcus3Rsrukh0tR1hvgvQh+F
	a6gU1fWnK8Mg6IZdIsAmkxuhDMVY2+JsPDhsPsSwaV0QlwhFxNMq3jZ4/Yhi1uVY1TrSOjJz9Oz
	A7wHdWfuESlMG/oLZ7SWdRaadz5lijnyjkgZMXgTXpx8GnB5PGWsZL5wUVjbTEOR3r1Ajtz9U4L
	2nMNgOeJlmjVpypVYi2sZV/N/NmuQBRHvchec5DNr4/81tsRXldA2+tiwbk1BI277YgclNGUYBG
	2bbBoitmP52RJvAAAaBGxUtegW8LOxHUIDwPpZHtOg==
X-Received: by 2002:a05:6402:460c:b0:65f:7498:389d with SMTP id
 4fb4d7f45d1cf-65f74983abfmr1106639a12.10.1771956581270; Tue, 24 Feb 2026
 10:09:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260212213656.662437-4-shenwei.wang@nxp.com> <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch> <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch> <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch> <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com> <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
 <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 24 Feb 2026 11:09:30 -0700
X-Gm-Features: AaiRm513jfkXhWCicXSxk8RHd0EwNINnculQUiIBSoqo4oda2oGf6hKMPIXU_e0
Message-ID: <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Feb 2026 at 08:56, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Bjorn Andersson <andersson@kernel.org>
> > Sent: Monday, February 23, 2026 8:43 AM
> > To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Shenwei Wang
> > <shenwei.wang@nxp.com>; Andrew Lunn <andrew@lunn.ch>; Bartosz
> > Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob He=
rring
> > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dool=
ey
> > <conor+dt@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Fr=
ank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO d=
river
> > On Mon, Feb 23, 2026 at 03:24:43PM +0100, Arnaud POULIQUEN wrote:
> > > On 2/22/26 15:48, Linus Walleij wrote:
> > > > On Fri, Feb 20, 2026 at 7:57=E2=80=AFPM Shenwei Wang <shenwei.wang@=
nxp.com>
> > wrote:
> > [..]
> > > >
> > > > Is it generic? If it is not, let's call it "NXP rpmsg GPIO driver"
> > > > and rename files etc accordingly. Maybe it can share code with the
> > > > actual generic RPMSG driver once that arrives, that is more of a li=
brary
> > question.
> > >
> > > I would like to (re)express my concerns regarding the creation of an
> > > NXP-specific driver. To clarify my concerns, ST, like probably some
> > > other SoC vendors, has rpmsg-gpio and rpmsg-i2c drivers in downstream
> > > with plans to upstream them.
> > >
> > > If we proceed in this direction:
> > >
> > > -Any vendor wishing to upstream an rpmsg-gpio driver might submit
> > > their own platform-specific version.
> > >
> > > - If NXP upstreams other rpmsg drivers, these will likely remain
> > > NXP-centric to maintain compatibility with their legacy firmware and
> > > the nxp-rpmsg-gpio driver, leading to platform-specific versions in s=
everal
> > frameworks.
> > >
> > > - The implementation will impact not only the Linux side but also the
> > > remote side. Indeed, some operating systems like Zephyr or NuttX
> > > implement the rpmsg device side (Zephyr already implements the
> > > rpmsg-tty)
> > >
> > > Maintaining a generic approach for RPMsg, similar to what is done for
> > > Virtio, seems to me a more reliable solution, even though it may
> > > induce some downstream costs (ST would also need to break
> > > compatibility with legacy ST remote proc firmware).
> > >
> >
> > Could the virtio-based mechanism be used directly (without rpmsg)?
> >
>
> Technically, yes=E2=80=94it's possible to use the virtio mechanism direct=
ly without rpmsg.
> It=E2=80=99s a bit like talking straight to the IP layer without involvin=
g TCP or UDP: doable, but
> at a lower=E2=80=91level approach.
>
> As for the idea of gpio=E2=80=91virtio, which could be an optional soluti=
on that certain customers
> might prefer. I recall hearing this idea from Mathieu originally, though =
I=E2=80=99m not sure whether
> he plans to implement it.
>

As Daniel pointed out, gpio-virtio is already available and already
includes a protocol that is generic - no need to redefine a new one as
this set is trying to.

As mentioned in a previous email, I understand some implementations
will have restricted memory and need to use RPMSG.  For those cases a
generic rpmsg-gpio protocol should be derived from gpio-virtio that
would only deal with breaking down the standard gpio-virtio protocol
into something digestible by RPMSG.  That was Bjorn's point in an
earlier message.  This will allow to use the same interface and be
flexible in how we want to talk to the transport medium, i.e pure
gpio-virtio or rpmsg-gpio.

Fortunately RPMSG already uses channels to differentiate between
traffic, no need to multiplex everything on the same channel.  That
too needs to go.

> As the chip vendor, NXP=E2=80=99s role is to provide all possible options=
 and let customers choose
> the approach that best fits their needs; we don=E2=80=99t make that decis=
ion for them.

As kernel maintainers, our role is to advise on designs that are
generic, simple, maintainable and stand the test of time.

>
> Thanks,
> Shenwei
>
> >
> > If not, it would be good to derive a generic rpmsg-gpio protocol from t=
he virtio
> > protocol, and land implementations of this in e.g. Linux and Zephyr to =
establish
> > that option.
> >
> > Regards,
> > Bjorn
> >
> > >
> > > In the end, I am just trying to influence the direction for RPMsg, bu=
t
> > > based on the discussions in this thread, it seems others share simila=
r
> > > expectations, which should probably be taken into account as well.
> > >
> > > Thanks and Regards,
> > > Arnaud
> > >
> > >
> > > I just want to
> > >
> > > >
> > > > Yours,
> > > > Linus Walleij
> > >
