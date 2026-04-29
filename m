Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08908219EB
	for <imx@lists.linux.dev>; Wed, 29 Apr 2026 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777484013; cv=pass; b=Gdg519SORlS8nT6kFuj+umQ2Vhw1ROYPmR1X92gOLbxLOJ9Ep+8zmxLsE0Lc3wJmqpmttP1kjYibBK7CkRn5jO+tPgjaYEw5RX53vxoGQQbxJqOvdhgVjIjR0q65ulKtY8tlAPo24iu57WPNVD1Z6szr7arYDRUGjOew02m+ouA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777484013; c=relaxed/simple;
	bh=kN1Jg8zrE0WkiYysXn+g0/IiPU/u/Efvo6UZbhbtzTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZ/MGVQYlNhntBbfRxlJ6aFlgf+hGZR05nE1mg+zzwVBZA6c2pj7FDAoay/ElqInrZgEiJYDegAEB+a39zYsISkvTZCLj71MW7frlHwXTDyVcUr754CkYHtn2YSiZVgrxvlYZU1jNAhjJ9Zsf0mhXO39nf6tIE08uUeJHAxLAuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LUEc2e65; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LUEc2e65"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-671ab90fc1fso110186a12.0
        for <imx@lists.linux.dev>; Wed, 29 Apr 2026 10:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777484010; cv=none;
        d=google.com; s=arc-20240605;
        b=S5Z3h8t0qPLka2xRTOu2mB8BOa0Zsp3lQIlEjlk0BUq0xs4epaYLQOp7dSnONEnsdo
         n9Ipf7IevVEexGlsSDZM2UqCrx1yKloiiIvdiACDpsN+F0W1HSbuyOKAUrNuN2ONyIGv
         ffrBP1vN4fMXnuPeS19wv07N3SRa+x/1bkZhYZLxEUf8+gySSBSNC19OAcqoPK/tIb5C
         r4pCjjc7Re8I8MjhOD/Nc++J3DJlFzbSzVg3yt36DcHklrbC/DGqaUtudF4kcRLhccUU
         sz4W6MmAeypv1ZKUGfLRpmQ8Vo7s6sH4lxvOUagu6isEYcaqJ7sS8/mDAJU3teyft2c/
         3zdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/kb5CXOOm0mj4ODKw/K4npAFTtH0bYa0bnYZ1mb4DgI=;
        fh=lngqeE9By8TGnEx+xAHTs374JppPBYs9K/VbUNbgX8E=;
        b=QyFVt3ljFwdlwbpjYppFXSsz3fLiTheBn6jFnbLXJvujesZbB3wDaxA3H/7nJJHVsu
         XBXyE5x50LVz8wCKBox3uZ+A0cxWxdsUzVb39nhKXJVlyDt2wlSDg6MSTNXG71sZJ39w
         iMmq/2+2sSJ/KHUBuZlTmKwoVKKulw89X3RA4FQUwKx3gUv10OtzFvTZQtD6l1RU8G3Q
         oZzJYrtmsEOKnQpwh1Hs0nKFPt1BgXn2/gdwDebKt9yTp9GidFYE+AwaDZNBmLK8JBfW
         7twvZsK1QfOpVgLqceHylO4rrmZQ/XVAISMJAotDZtibG55K0vwjtFfHHb2bVrekyBC3
         Q/Gw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777484010; x=1778088810; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/kb5CXOOm0mj4ODKw/K4npAFTtH0bYa0bnYZ1mb4DgI=;
        b=LUEc2e65/0pdztKObox4nuIYVKbiz4UKHh+9dnWv2TThdY888srOER1muPheDHkJh4
         PeWb6xpLSCbPrZ9fjAw7fYuWEkIkLQwbAaLefwGoC2Y5GnyJsX1/SjnRRHfK1k/iCEFM
         R8hzn65sMzbpakSm4Eq2iUh9yyyKMFgGyYOswD1ff2cqgM+qcId2wAfZyxsHKt2MX+YP
         s70XMGzzs+rsjPB+/HSFZyMJyzkH6+KN1vc2I8aVBSpVTJFWdQFeU753DOYsNDPAChXD
         4W/Cn3PzrJbxzWn1NdQBkD4VjS/Kt4MXvKOhmIQ+5ZRl0dC7s2Kdeq/bzD9y3AaW26Is
         x91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777484010; x=1778088810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kb5CXOOm0mj4ODKw/K4npAFTtH0bYa0bnYZ1mb4DgI=;
        b=GvcjttoveHXNGxfrp7VaZGJL37o2deRofd9Xgxj5CqNaCoKD0H49C8SJumPh0viLjH
         OeJrxzv0dZUGfyc9zDZ3zkzhxkvORCrnExyPWH8QLuhr7/l5V9N2YPSym84Cnn4sDx8v
         fl6NJ8v67QNqWhW0hwtaD9PbGS55iW0rg/CEmvDLScoFRgUWFh+REJJG1JyXcLgp+RmG
         hIj0nBqpPgNg0Si2D2iGrhjNGllG7dazC9/6ZGC7OURCMUxhhiHXpJLsgLtpFneKlNQB
         J3kZy1aJFZNyIav6kemEVjvsqS8QHFkvxxGGb99p6GZpszJPiZxCtjHY0esK/6OAnsek
         OSig==
X-Forwarded-Encrypted: i=1; AFNElJ9eG3wohWPSYRKecOQYevtzgzev+WNrb2PJH6ewNG2l8AEQS+iGYkoMavyrvyloEwxblCY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9f0jwMWRn8TQ+ygVvGW/683pQayVCckjQvtt1mfzz4ajV83Ht
	mqMwT7yi+N/SIBOs11U3W5JHIqnIBklaI2DEv0IJ0Oy9a6xQ21PJadgI+l0A+GqOmi5hLqgI+24
	X7GxAnnkWgiC/kRjrOIvcY1EHYQJ6L4Jx7WETxbSY7w==
X-Gm-Gg: AeBDievZvZhlf1rd4iv5cpoBEyPjkmlZ/k1BZGI/rTai5/hwQ6yEnzRb94evwIOm+xe
	N7ideoEljH6G7aUvWXGQrk7tlkp7Nj6HWd1qCzNJ7oW88WK4+EkXXU1lm4LQMJduaQEyqNMyLui
	FlJIm08KbZhLODvhrH7+r4lVcS7TOxaFpt2zuMmsr1CIhgBjTBPpeEzqDhYQ5FtnQpqU5iJexsy
	gq6xj53k86wk3fkCXIo7k7FsfZlsAfBKL0Z75kejB2Qde6Z9EdkeacZ+rT3b0i6c7DkUgoDB8AA
	o1PPFUhlvkri8iF062Fd1++fvAJCU1AjQ+MaTRK0Le3PeqtU0IBY
X-Received: by 2002:a05:6402:1ed3:b0:672:5255:af77 with SMTP id
 4fb4d7f45d1cf-679bb07ee71mr5034063a12.13.1777484010328; Wed, 29 Apr 2026
 10:33:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com> <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch> <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch> <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s> <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 29 Apr 2026 11:33:18 -0600
X-Gm-Features: AVHnY4KBveuXaT50xXGT561BJAnz_p9YSdb7SJnI5b60PkMgL6_ZMJ8SGU0KF-U
Message-ID: <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "Padhi, Beleswar" <b-padhi@ti.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
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

On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Wednesday, April 29, 2026 10:42 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
> > Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
> > imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> > On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Andrew Lunn <andrew@lunn.ch>
> > > > Sent: Monday, April 27, 2026 3:49 PM
> > > > To: Shenwei Wang <shenwei.wang@nxp.com>
> > > > Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
> > > > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > > > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > > > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> > > > Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> > > > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
> > > > Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > > > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > > > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> > > > Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > > > devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> > > > imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> > > > dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> > > > <brgl@bgdev.pl>
> > > > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
> > > > GPIO driver
> > > > > > struct virtio_gpio_response {
> > > > > >         __u8 status;
> > > > > >         __u8 value;
> > > > > > };
> > > >
> > > > > It is the same message format. Please see the message definition
> > > > (GET_DIRECTION) below:
> > > >
> > > > > +   +-----+-----+-----+-----+-----+----+
> > > > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> > > > > +   | 1   | 2   |port |line | err | dir|
> > > > > +   +-----+-----+-----+-----+-----+----+
> > > >
> > > > Sorry, but i don't see how two u8 vs six u8 are the same message format.
> > > >
> > >
> > > Some changes to the message format are necessary.
> > >
> > > Virtio uses two communication channels (virtqueues): one for requests and
> > replies, and a second one for events.
> > > In contrast, rpmsg provides only a single communication channel, so a
> > > type field is required to distinguish between different kinds of messages.
> > >
> > > Since rpmsg replies and events share the same message format, an additional
> > line is introduced to handle both cases.
> > >
> > > Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
> > uniquely identify the target controller.
> >
> > I have commented on this before - RPMSG is already providing multiplexing
> > capability by way of endpoints.  There is no need for a port field.  One endpoint,
> > one GPIO controller.
> >
>
> You still need a way to let the remote side know which port the endpoint maps to, either
> by embedding the port information in the message (the current way), or by sending it
> separately.
>

An endpoint is created with every namespace request.  There should be
one namespace request for every GPIO controller, which yields a unique
endpoint for each controller and eliminates the need for an extra
field to identify them.

> Shenwei
>
> > >
> > > Shenwei
> > >
> > > >        Andrew
