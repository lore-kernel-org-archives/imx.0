Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBCD21576E
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 19:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860641; cv=pass; b=kp2V/m+jcZvAjJJRD/zOZKjUP7bhEmnAhMlrL1yLm3XfruODxAKgAMNIxZtnDx9Fg+gKEMWcLVXNbLwY4hngonOuJuTkz5v34M6+0pqqebtBjQ254Ngvqqkbv5+rBO0CV4LLVM9VFeuXl/KRR+2KQyk3bmjzXCMLG4lXd+b2I74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860641; c=relaxed/simple;
	bh=T1+fx/WLpTfB9SQJibZ6lWXK3GEnUtk5g7rLlawTyh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nr5CY5+7DamhG069gRlmTCt0VJQannfrhi2RCBxhsd/hDhD/ZMMjpB6O4B/SszysDB7r1fYQJXgSho6sMpe8f7TTWnQOksHjIsd2W/utuITr17J6mOyHlUGso1V56N3nJSHwcOjxu1HkWs/UgngCo/+ewiIXXzipuaJCLCie6r4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ckQd56vR; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckQd56vR"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8f97c626aaso19147466b.2
        for <imx@lists.linux.dev>; Wed, 18 Mar 2026 12:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773860638; cv=none;
        d=google.com; s=arc-20240605;
        b=hmJ934zMepgrXyb5sXAVXDsjlRwl/y0egsKbl3HKdv4jPQRe12I8ny+jsOGNsCdu/L
         FvMOVlLQgbOlUqi2FtFhvjY7QzQY9JL55C8GAsBOaRQ2aAfUXmnMLZqinRIHwnJhGNhS
         VoGVEGTpQ2j0+rsKnyGwRCQH6i3oqZ8iwA8AjpBE61iyXNrJPdKRmKKHsGGaNbDsK3I3
         O3aInNyp2a2cA7qjl3gVlvG4Tvy4VKfOirBRjVXntyULtP9wHc8yeejArxjkmjD51gZa
         2aVrZFWb2aL+CA2CcKPnA9y9hOvJNWi12OuR76qxX/kWgRL9iXhj3N/2udI/HRUDtMDD
         f9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=04ig8Jpnhmqmb93VFIyiBP6MR+wj/njfRfrqGD7STpI=;
        fh=7bakCRRAzfz5zNqX2txJQPcy5cAwjv6dpdRSEMDUmc4=;
        b=CG3gksXMV7plPxGU4SbnVX2nlAYqVuPGBKSxcUQuCoA1OS3ur6VztvNN0Wfk3Sq9Gn
         KkI3ranIcDGhPoDaIQ0QhZTrT8zoSmSsquukvL/VJ4pu/n5DyP5+W1+6Ib+RzLHif1mL
         d1qAwzRpl9C49rMbl6VAOIrPuci37eOkPl8OtiHUKqoz+Qy/UkhBhkx2MAjAn4uzuQ8D
         qiJ/6bqi14HSpn/X/nOBsyUv94rn1QPGVMRmbu0aUQmNQUi3U9o/dKnk3oDVeMsnWN/m
         ZimUPfONKlAPFFfRgCiif9nC+gsOcMD7xQVE1t6aRhGb/t8/7/spf0ZXErEx68+TsGib
         sCeA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773860638; x=1774465438; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04ig8Jpnhmqmb93VFIyiBP6MR+wj/njfRfrqGD7STpI=;
        b=ckQd56vRVF33SnEuTIV9kx0TbTQPkMKbd+I+QVDnimDbhPIoSMrxwTTDQh6zbr4CCO
         4OM6OeoEM5/g+8JOcs42QgbyTrmdncatGPNAoa83rkiWCGZs0dcjFlbCq92dAf+SswSa
         X/dsbc1B8pTGhuBhBn+hJfKS+Xw0lf8VjsmSQGqmPLxRm4pJvS/Lp+nbfhjkI6aMF9PO
         X2q9vufoASptxjEwHLTM6LmkLP59vKRLWP/SAinkQRJk+SucPgIWIyUE9sdadCuhUK4v
         cQax6ZEQhNzf/7HCiqLZ/LJK0iaIPRwT80+WEEVXArJalQtgYA73+DKC9wUEXLCE8cOc
         qDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860638; x=1774465438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=04ig8Jpnhmqmb93VFIyiBP6MR+wj/njfRfrqGD7STpI=;
        b=resqee9r7MKMTwkhH1MkhO4RixchRlWPB5bjg4GtJZ4GLdJvH2IuNRMLOSuqJlzXro
         ExcmFtnyG1JcplzL5UvQPYSVEdb7CS/e0jKGXVsT4jKxItHzpnnDkwJX9wSXEmDGEmBq
         ArO3dZ8dnHHKn5N1KIzb191qfo5rO+QZbwf8TFcZfMLPchLlocNlqWf2ZWCLaUFUPDfn
         2KTv4Fq1MTyyZRl9wRXlECSwKSKNc34X4cmaobIt+k1WM6q6JATS6CTSkE+qk/Yhma1p
         5XV2NrWm8X+4MRMGZsHBSCJswIjc1ib2kMlb9MkWhHVSo5twHuefp5kdPTeDRFvF9Q20
         ZFhg==
X-Forwarded-Encrypted: i=1; AJvYcCVIIqVgbmRiJey87fzaRNVxMlTIXayDNTN2IbsgIsjmIRGSO/eK2hPmUUhJHN+0eSKW+ZA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSO3nljCxjLo3lLJID89ksZRpyioimv+RHVDm3o8aTs7oBwuID
	wRjvSWAjs2MgBOTlUjNFLKEe7oYDpmfZY9lff0yD2hpVt0l5uhyJ9aqvhzQeHoSu303KdZXOpxC
	R6piOMDA1X+D6gHkOwCRS+jwz2c1WKk8fwdofCOc+Ew==
X-Gm-Gg: ATEYQzwqSOC0c8gIx6qU8MpfTjZp7rN7Ogvgmuu35OjIne+t/5VQ8FWu/BkvX0GOkeV
	Hmox32LCP60pm1bfOZDdEj/P5mX+Tiv32Ph7zvOV9LHxLbABjC9x3QA57fauafuIw/pQYrr3Qfj
	/Jp5mEyg3kPrferMlsput5owlGblJBvaN1pKx087AVe7Y5jKWWYSKf2mDBMADN/jEPpmbl3W2Ob
	FkCfWgAzT89sCuK/SNWhMcGk/P27Flj7IGR0zVxGDbhcIEQyInzBgv4FoG1fYgYxzjS4hT7ohtn
	Z/BE7U1gxEBJkW/xqU1mQH9WuDASWaPPkUy0TJ0jkqniS/mlFFc=
X-Received: by 2002:a17:907:96a3:b0:b94:1bd:13fa with SMTP id
 a640c23a62f3a-b97f493bde3mr266129966b.21.1773860638142; Wed, 18 Mar 2026
 12:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com> <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
 <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch> <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
 <PAXPR04MB9185E1D7543DB60DE089423B894EA@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185E1D7543DB60DE089423B894EA@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 18 Mar 2026 13:03:47 -0600
X-Gm-Features: AaiRm50DCHDfwwIrpEvrd6IARu-OJyOKkB98w-Mz3i8yabOEb0YcC2ELSE3lijw
Message-ID: <CANLsYkyvHBKVuRB9abg=WijMLAfaboBxb_eHWETQ6hU3C9Zmew@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Mar 2026 at 12:46, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Wednesday, March 18, 2026 11:03 AM
> > To: Andrew Lunn <andrew@lunn.ch>
> > Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Shenwei Wang
> > <shenwei.wang@nxp.com>; Linus Walleij <linusw@kernel.org>; Bartosz
> > Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob He=
rring
> > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dool=
ey
> > <conor+dt@kernel.org>; Bjorn Andersson <andersson@kernel.org>; Frank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO =
driver
> > On Tue, 17 Mar 2026 at 08:11, Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > > > +struct rpmsg_gpio_info {
> > > > > +   struct rpmsg_device *rpdev;
> > > > > +   struct rpmsg_gpio_packet *reply_msg;
> > > > > +   struct completion cmd_complete;
> > > > > +   struct mutex lock;
> > > > > +   void **port_store;
> > > > > +};
> > > >
> > > > Except if I missunderstood Mathieu and Bjorn's request:
> > > > "reuse all the design-work done in the gpio-virtio"
> > > > We should find similar structures here to those defined in
> > > > virtio_gpio.h.
> > > > struct rpmsg_gpio_config {
> > > >       __le16 ngpio;
> > > >       __u8 padding[2];
> > > >       __le32 gpio_names_size;
> > > > };
> > > >
> > > > /* Virtio GPIO Request / Response */ struct virtio_gpio_request {
> > > >       __le16 type;
> > > >       __le16 gpio;
> > > >       __le32 value;
> > > > };
> > >
> > > The core of the issue is that Shenwei is stone walling any change
> > > which makes it hard to keep the legacy firmware. It is possible to us=
e
> > > these structures, but it makes the extra code Shenwei needs to
> > > translate this protocol to the legacy protocol more difficult. It
> > > might need to keep state, etc.
> > >
> >
> > I agree with everything Andrew points out above.
> >
> > > Two points...
> > >
> > > The firmware implements more than GPIO. There is definitely I2C as
> > > well, the first version of the patch has bits of I2C code. Looking at=
:
> > >
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
wn.
> > > net%2Fml%2Fall%2F20250922200413.309707-3-
> > shenwei.wang%40nxp.com%2F&dat
> > >
> > a=3D05%7C02%7Cshenwei.wang%40nxp.com%7C4b8879a9c89a4a831cf508de850
> > 7de18%
> > >
> > 7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639094465992371367%
> > 7CUnkn
> > >
> > own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIl
> > AiOiJX
> > >
> > aW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Ds8tl8n
> > m3eD
> > > 9l%2FetyyE%2FPWwJh4wQalaaHr4OEwzpQ7NY%3D&reserved=3D0
> > >
> > > There is also RTC, and a few other things which don't directly map to
> > > Linux subsystems, but maybe do have Linux drivers?
> > >
> > > Give how much pushback there has been on the existing protocol for
> > > GPIO, it would be wise to assume that I2C, and RTC is going to get th=
e
> > > same amount of pushback. If any of these three, GPIO, I2C, or RTC
> > > decide that only a new, clean protocol will be accepted, no legacy
> > > shims, the firmware has to change, breaking compatibility to legacy
> > > protocols, and the accepted shims become pointless Maintenance burden=
.
> > >
> >
> > I have made this point clear before: modeling legacy protocols in mainl=
ine doesn't
> > scale.  Mainline uses a single generic protocol, and yes, it means brea=
king legacy
> > protocols.  This is the cost of moving to a mainline kernel.  If people=
 want to use
> > the legacy firmware, they must stick with a legacy kernel.
> >
> > > Point two is that the customers who are pushing for these drivers to
> > > be added to Mainline probably know that nearly nothing gets into
> > > Mainline without some changes. There is some short term pain to
> > > swapping to Mainline because of these changes, in this case, firmware
> > > upgrades. But in the long run, it is worth the pain to be able to use
> > > Mainline. And those customers who don't want to upgrade the firmware
> > > can keep with the out of tree drives.
> > >
> > > So, what are our choices?
> > >
> > > 1) We accept the code as it is now, with the shim?
> > >
> >
> > NAK
> >
> > > 2) We keep pushing for the virtio protocol, with the shim?
> > >
> >
> > NAK
> >
> > > 3) We keep pushing for the virtio protocol, no shim, firmware changes
> > >
> >
> > Nothing will get merged in the RPMSG subsystem that includes support fo=
r the
> > legacy protocol.  Not today, not in a month, not in 5 years.
> >
>
> @Mathieu,
> Your tone is unnecessary. If you believe this driver must
> comply with a specific virtio protocol, then please point to the exact
> specification instead of making blanket statements.
>
> If virtio is the direction you prefer, you are of course free to propose
> and implement such support yourself.
>
> My patches are contributed in good faith to improve the ecosystem, and
> this work clearly belongs to the GPIO subsystem. I don't understand why
> you are asserting authority here without providing any technical
> justification.
>

All arguments have already been presented to you, we are now going in circl=
es.

I am happy to look at a new revision of this work that complies with
the comments Andrew, Arnaud and I provided.  I will not engage with
you or your work until that time comes.

> @Linus Walleij,
> From a technical standpoint, this GPIO driver is no different from
> gpio-mxc, gpio-omap, or gpio-rda. If the concern is simply the use of
> the word =E2=80=9Cgeneric=E2=80=9D in the name, I=E2=80=99m perfectly fin=
e reverting it to an
> NXP=E2=80=91specific driver.
>
> If maintaining a private GPIO driver is no longer acceptable going
> forward, that=E2=80=99s also fine =E2=80=94 we can stop the discussion he=
re. If you think
> there are still technical limitations in the driver itself, I=E2=80=99m m=
ore than
> willing to continue improving it.
>
> But the goal is not to create a driver for another protocol that someone
> claims perfect.
>
> Thanks,
> Shenwei
>
> > > 4) We pause GPIO where it is today, and restart all the arguments wit=
h
> > >    the I2C driver. We can come back to the GPIO driver in a few month=
s
> > >    time once we have a better idea how I2C is going. And maybe we als=
o
> > >    need to see the watchdog driver, and argue about its protocol.
> > >
> > > I also understand ST has a generic I2C driver nearly ready, if that
> > > gets merged first, that probably kills the NXP I2C protocol, and mayb=
e
> > > the NXP GPIO and RTC protocols.
> > >
> > > My vote is for 3. If not 3, then 4.
> > >
> >
> > Strong vote for 3.
> >
> > >      Andrew
> > >
