Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E171480947
	for <imx@lists.linux.dev>; Tue,  5 May 2026 17:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778001562; cv=none; b=iSsErqJ4U+3jCXe/Q5hgXKwNAn6s+Ectyo5nweZBXQ2tcPoLnu6w/c6tVHjP2LCuh1QmjGQqDHBg3zCL7BYRG/rc5ECfI/G4KYXids03tR9L4eEF80LnXnq/O63NZ6TLg7Rirv6sKJPMowijPlsKKK2zRLIWkJq0dV0SVLhEmow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778001562; c=relaxed/simple;
	bh=U+afFZuILb43fRFvzC2Y/lAW3ml2uo5rujpWac2kEYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3zK31lY8l9ETm5QoeGvkS5eo4pogMVtFgzixEjSY6Wggkj4dCrcvswwY0QOD/8SdW1RPkakrdLcnr1IQQ/uz19ZBnYVmvlWLbZ0Vz4oTY3dMCaIF+DuMBm1kozKVadaDVFsuGrdhP2kel5mWCWCcqO1O3NQ5Y1QgBtRHM+lVK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pcA5PoFm; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pcA5PoFm"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-835386ff122so2744029b3a.3
        for <imx@lists.linux.dev>; Tue, 05 May 2026 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778001560; x=1778606360; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WL3Uj3kb7PrFoW/8XQQ00eIJvsOj+gpzAMtc380q7Qs=;
        b=pcA5PoFmLYWi0q9BZWhMySxH8Fl0F4waZAhhbaJF3wX7tvnYbESE1DWZntxEG+uJP/
         1D65/BDvFXb4eEH+gl1Mo5Whdpd58rCWVD6TS+SQ8eeKvydxMQqP9nIKQ/KSCLT6hrbI
         wW62y+6LXo9z2CfbNl58IsTjdaJfXcxdlvh75Fj/Y+x9n9dYcaPNFU8B/AVGxqqb2eH/
         XPoFGIjqPrhnnZ3NowIHuhmTL0MHcx15bxpjJSiVVxyd9FudzWkf/a9lo2MDOf9uBJ4m
         Pi0GHywj0ZF3JpfOLk174EhiwF3nDmVpWp/FVoiABwOXAbKIor0lqlNhRVgD7ZDBS9aR
         badg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778001560; x=1778606360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WL3Uj3kb7PrFoW/8XQQ00eIJvsOj+gpzAMtc380q7Qs=;
        b=nUGgUeFx+qQYtggVjEZzza8uMqc39cOOwdxsjNemtKtwcGdRw7Gaa419nuNAPyitNy
         dgrvBp5zInJJBVeqLHjAGlO0d24ZqwooccpaHYgeX9JNRKZADsbHLf7JU9ruUoEZ2YxC
         +RBKXm40F8DxO6xGhyXP7BtU6pyoarig4FXPpy+Z9pl/H7uBZY2xUQTEMAiT0Qd7qADp
         FrIxEbOh8TrsBb5A+scdfMkKEaKGoUT22ltoHB5c0KofTIehzzOPYtXczlIRQWAqimlS
         kUNwEnmtNF9efl7PSW+X8RRYCTaLARZtY5JsqanQAGg7Q/NbAdxQpKrLK/BuUPzA5C7q
         D2IQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HmDYqFixK67a3BQuWqwdKTgoWpr/9OmnVkaM2rKZG5Uvv9DxuAU/SOIOxZSUyH7e4PbA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzU7hNO03lw6sWNE7XUAPDTSjk3VfmcW5zgxT67Ps2Sp0HtjJe9
	PI5/qIFVP84HIKLoykGIl8mnQVzQZO/ov3RxxhL+xuJiDvajR6JLCFUuOdr+syLHHMg=
X-Gm-Gg: AeBDieslDODFzyXvK+SDCdpvFv0yl/Gm3n5fnJOz7AgK3qLiLTAq19aau5XnU8fVRQZ
	LssPElSoL4QqSy6ZOkRCYWHP8x3fD4NjMrvmsoC0SavcKk8hPQdhTJct6Y+ftn15DvnxyS0QXGL
	RcatZFsnrfJ2d7V5MZTSi5dYpmwFnqdXsFHonjDFxdtGmVgH26AYwkgzwod5V9rQ/447179E7F6
	9gSVzO+yo9oqZYc3qBQOAttlMj2bxJoEwupB1JsJLtCsCQ7+jzx9RIdEJJGqFqFW7Q6xfwokaxF
	E9UHzr9X3SfxwwE9cOJ0aVHkan/jgX6SIHZGW37rxDyvSygZfphNejK8K8t4kgYejjRuBnPAQXO
	HV3gj/EmUw40wnPqi/agGsxnkUWGBS1UzAxiONbjH/V23ZnciOb4km7YypUaQiJew0fHFMYZT1k
	s9tbl5Cnlmo8w00bXvzlGzMxkWg6ReSvWpN7VClhlDi77jw+Pe
X-Received: by 2002:a05:6a00:61c2:b0:83a:3135:edbd with SMTP id d2e1a72fcca58-83a3135f266mr300178b3a.7.1778001559581;
        Tue, 05 May 2026 10:19:19 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7e49:16e6:42db:e391])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83962e7e3fcsm3646944b3a.0.2026.05.05.10.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:19:18 -0700 (PDT)
Date: Tue, 5 May 2026 11:19:15 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: "Padhi, Beleswar" <b-padhi@ti.com>, Shenwei Wang <shenwei.wang@nxp.com>,
	Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <afomkynW95IRIHYW@p14s>
References: <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
 <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s>
 <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
 <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>

On Thu, Apr 30, 2026 at 09:35:09AM +0200, Arnaud POULIQUEN wrote:
> Hello,
> 
> On 4/29/26 21:20, Mathieu Poirier wrote:
> > On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wrote:
> > > 
> > > Hi Mathieu,
> > > 
> > > On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
> > > > On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
> > > > > 
> > > > > 
> > > > > > -----Original Message-----
> > > > > > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > > > Sent: Wednesday, April 29, 2026 10:42 AM
> > > > > > To: Shenwei Wang <shenwei.wang@nxp.com>
> > > > > > Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
> > > > > > Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > > > > > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > > > > > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > > > > > <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > > > > > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > > > > > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > > > > > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > > > > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > > > > > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > > > > > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
> > > > > > imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> > > > > > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> > > > > > On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> > > > > > > 
> > > > > > > > -----Original Message-----
> > > > > > > > From: Andrew Lunn <andrew@lunn.ch>
> > > > > > > > Sent: Monday, April 27, 2026 3:49 PM
> > > > > > > > To: Shenwei Wang <shenwei.wang@nxp.com>
> > > > > > > > Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
> > > > > > > > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > > > > > > > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > > > > > > > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> > > > > > > > Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> > > > > > > > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
> > > > > > > > Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > > > > > > > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > > > > > > > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> > > > > > > > Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > > > > > > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > > > > > > > devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> > > > > > > > imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> > > > > > > > dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> > > > > > > > <brgl@bgdev.pl>
> > > > > > > > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
> > > > > > > > GPIO driver
> > > > > > > > > > struct virtio_gpio_response {
> > > > > > > > > >           __u8 status;
> > > > > > > > > >           __u8 value;
> > > > > > > > > > };
> > > > > > > > > It is the same message format. Please see the message definition
> > > > > > > > (GET_DIRECTION) below:
> > > > > > > > 
> > > > > > > > > +   +-----+-----+-----+-----+-----+----+
> > > > > > > > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> > > > > > > > > +   | 1   | 2   |port |line | err | dir|
> > > > > > > > > +   +-----+-----+-----+-----+-----+----+
> > > > > > > > Sorry, but i don't see how two u8 vs six u8 are the same message format.
> > > > > > > > 
> > > > > > > Some changes to the message format are necessary.
> > > > > > > 
> > > > > > > Virtio uses two communication channels (virtqueues): one for requests and
> > > > > > replies, and a second one for events.
> > > > > > > In contrast, rpmsg provides only a single communication channel, so a
> > > > > > > type field is required to distinguish between different kinds of messages.
> > > > > > > 
> > > > > > > Since rpmsg replies and events share the same message format, an additional
> > > > > > line is introduced to handle both cases.
> > > > > > > Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
> > > > > > uniquely identify the target controller.
> > > > > > 
> > > > > > I have commented on this before - RPMSG is already providing multiplexing
> > > > > > capability by way of endpoints.  There is no need for a port field.  One endpoint,
> > > > > > one GPIO controller.
> > > > > > 
> > > > > You still need a way to let the remote side know which port the endpoint maps to, either
> > > > > by embedding the port information in the message (the current way), or by sending it
> > > > > separately.
> > > > > 
> > > > An endpoint is created with every namespace request.  There should be
> > > > one namespace request for every GPIO controller, which yields a unique
> > > > endpoint for each controller and eliminates the need for an extra
> > > > field to identify them.
> > > 
> > > 
> > > Right, but this can still be done by just having one namespace request.
> > > We can create new endpoints bound to an existing namespace/channel by
> > > invoking rpmsg_create_ept(). This is what I suggested here too:
> > > https://lore.kernel.org/all/29485742-6e49-482e-b73d-228295daaeec@ti.com/
> > > 
> > 
> > I will look at your suggestion (i.e link above) later this week or next week.
> > 
> > > My mental model looks like this for the complete picture:
> > > 
> > > 1. namespace/channel#1 = rpmsg-io
> > >      a. ept1 -> gpio-controller@1
> > >      b. ept2 -> gpio-controller@2
> > > 
> > 
> > I've asked for one endpoint per GPIO controller since the very
> > beginning.  I don't yet have a strong opinion on whether to use one
> > namespace request per GPIO controller or a single request that spins
> > off multiple endpoints.  I'll have to look at your link and reflect on
> > that.  Regardless of how we proceed on that front, multiplexing needs
> > to happen at the endpoint level rather than the packet level.  This is
> > the only way this work can move forward.
> > 
> 
> I would be more in favor of Mathieu’s proposal: “An endpoint is created with
> every namespace request.”
> 
> If the endpoint is created only on the Linux side, how do we match the Linux
> endpoint address with the local port field on the remote side?
> 
> With a multi-namespace approach, the namespace could be rpmsg-io-[addr],
> where [addr] corresponds to the GPIO controller address in the DT. This
> would:
> 
> - match the RPMsg probe with the DT,
> - provide a simple mapping between the port and the endpoint on both sides,
> - allow multiple endpoints on the remote side,
> - provide a simple discovery mechanism for remote capabilities.
>

This is exactly what I had in mind but I'll finish reading this thread before
expressing a final point of view.  That said, the namespace announcement should
be "rpmsg-gpio-[addr]" rather than "rpmsg-io-[addr]" to make sure there is no
ambiguity on the meaning of "io".

More comments to come...
 
> Regards,
> Arnaud
> 
> > > 2. namespace/channel#2 = rpmsg-i2c
> > >      a. ept1 -> i2c@1
> > >      b. ept2 -> i2c@2
> > >      c. ept3 -> i2c@3
> > > 
> > > etc...
> > > 
> > > This way device groups are isolated with each channel/namespace, and
> > > instances within each device groups are also respected with specific
> > > endpoints.
> > > 
> > > Thanks,
> > > Beleswar
> > > 
> > 
> 
