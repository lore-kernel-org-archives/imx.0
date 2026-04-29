Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECAA33BBC6
	for <imx@lists.linux.dev>; Wed, 29 Apr 2026 19:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490453; cv=pass; b=II54KiknT5xHy28aAgwWxs6XndsEamUnlcCx57lSYsgyA6q5JNVdEDEM6hJm9IILBBf7Winplb0gTXXBMS59tReaLtm8OGaCxkPuUbCb0KqyHngQplDSynipXQZiDOB89664D4y/e6fr3E+AMhPIW7IlA4VOQrGrLmS7sDpFsq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490453; c=relaxed/simple;
	bh=braCilAYzfWSvAWMEDj3jzrbXNaOgTJxXed3C2N+6Jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bobwk3ZRv/wDv08dUMgOJ0CV8VH9NE+aOvhU08pwoXGV9K06uwlDz2UX93WOJOXPb5Y8VLnBjGTeZdyzqMVM61KkBitl8FSqmQZTjJE6jAaMAOonJQC4SscLS8NsIr7RJcXxbPMEh3dRCLOO8SWZWc9Zm9MhBkUwZ3y3f/K9FA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nnkdtCK0; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nnkdtCK0"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-672c12e95e9so225127a12.2
        for <imx@lists.linux.dev>; Wed, 29 Apr 2026 12:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777490450; cv=none;
        d=google.com; s=arc-20240605;
        b=bcVgGd+b9Mv5hEQ2O1/ubQaapM4+O+msvfaOxEMouhAaEeowU0Ir/gDhDO3rO477Gw
         Vs4AKRoASDTQA1K4wgJr766jsWChR1bz7gPzsqJSKuf2ZY70BX6kyzyx0a81uxhQB0IG
         R4AeVVVFr6BNnAeva4lGs3gM+sKVP63YcivziFPZvr9SeBRcMuc5oBjdur3Q4GVhMsNK
         eejndl47u3yrbsb0ImVu3eg15EQClv7kcGjjHEr1oxPBfaF5kMADBuvQpdOR3cfxkPHC
         8TptjAcEYsYq5WedUm2afm0JdGUknzSWOHkrFmmWZrLGFzSuB5/nnYuHvnFllnrOIDRF
         VLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P1oUs/Abu5g3UxUIAO0ZwpBJwwKm0pg05ZGOCVCeRmU=;
        fh=HhZk8DJYYBEVy8y68vODjLSPgjklnInAdczKvw6Pzf4=;
        b=eS0OTmBZlnq9nuUnJQMtklc9/gshvQyRR6Q9G9VKXRi4Wl6y/w/PWu57oVeckLldLU
         4XDWpPjPwnzo4mjnSExi55COOHsMqB/ieBp7PMUCvPGA8aK857kK7p3JGRS20GEwrxPV
         +4hqgV95G22QLenWxZ9caln8RcNd/CU3E4Myk0EhbluWsqZYnlXk4H+89GUttnkeCQUJ
         cXnrx6ZOawzWaOHwrJ4amtRFEZSUBnnxPlVk6BIo3UitxNzucKWbY89JbQcFQRVam5DL
         gdI9RkdjM21rFPm571bwEgID/IK0jzZsZ7d+c+C+/FUVJ1BBFdneS0XmNgI6cNE/UWvE
         OQrg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777490450; x=1778095250; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P1oUs/Abu5g3UxUIAO0ZwpBJwwKm0pg05ZGOCVCeRmU=;
        b=nnkdtCK0CCdqvmgzhc+71NLXY7ceXmWyilw2OeZhORlqhqeXaoGNgahOqkHM8cmL/6
         fJTT7xZY59gL7OM2WBhIGqJQyL1Q+orpt4o3a/RHajnknRDQPu0p+mgxk25xMADW/hHg
         JwIOobK9uGcvMsJiD+xY2TWcyTN+YG9yp4IO9vqlkl6ts2O5pdqlZ4xKRVgfgxluhuza
         MdmQdoJsTwiBf6W7pekiToyGvhG+piImgRM93LtOzNejj8skG7u8MtEIwHQhU4BQl74w
         VTOLz+0MO5PjmVPuBN6cQYVnqY3ytXyeIZOw8iPO1hktGfIryabuMZNfkY1RJQ6Kc1Nz
         Y/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490450; x=1778095250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1oUs/Abu5g3UxUIAO0ZwpBJwwKm0pg05ZGOCVCeRmU=;
        b=kSDvG8e228N1+wj7PIhgc87SC8ABCSlZ4SZUoA4AuxHUX6+yIla596fgFvKWb1Zkld
         66ck7HZIx02iK/LnxSTXhJNPlmTYOix1oo5uCtdsuF8QNeWZ6/IfZuqPWDolA1DjrOcN
         3r5t1kFPYYSF3Rvc/wi2xwJoV4SYWa9g7071/G/PhTyXU+dHazQal1HKNwjwW6NdIsns
         +CJpBzJJGzYH+wSQy0Uybh1DuSJxGUrT7D+I4MBelJPPuk19QA4O1eIDfsXWDu7XAwL+
         49cqrXUJy/+WG2vq6ikQwG/ZKg6QubFfKuONN2OvVSXChBZ6pWiruQ/lRzl4o0jUZGuF
         Aagg==
X-Forwarded-Encrypted: i=1; AFNElJ+ltE3QsSblOyG22u17OvzbopyfGcQ9svq+hFcWk+7XlF2RcivBJpXToK0wsNbYk8M/GCw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5scoXQbIc7l+nVcGQGgLvnJoW4AEXVPgBpAEhi6K2HyOSibFg
	2x8qft1MYwkR/M9ElcMWb5c0rgzHTVKcq7rV7VKW4D6s86IL6MxYbdzk8EYx+NzJRJNOAspBUmC
	IiZAETfUEvjBnU7tM0SnCooQ2dj/ZILrpOLaslCCX7w==
X-Gm-Gg: AeBDieu6DDZtAxrI9CtTigKLPQfDNVwQL7Aaek+F31PsxSLO/60rUnhaWYT141Jy69n
	dOv5Znw5izga0bKMgiop0aK5GWQj69zCAxFhRfbbRtdXXFm1XJd1Bo7QtAIV6d3fpGK3VYJYrIN
	A0aAdn9kMzclobegib2MH4eLND5yFu3ScHbsddxwzZinL2m+1G50sD5f25o8dfTHlpQjDU3FCXg
	owoK2jyQdEqVwIAOuI0g/pbTOM4Wd1srL1itnNGuzgNyFRNrStbLXOgANhN4NMa6tAKEgmUm0VM
	E97aE0sakDLdNdvxI/lTLwAknkt9AEYa3zmux86dVih2VoFDHOHzgce6t1Gi2/A=
X-Received: by 2002:a05:6402:5024:b0:674:2565:f27a with SMTP id
 4fb4d7f45d1cf-679bb095b4amr4292362a12.19.1777490449661; Wed, 29 Apr 2026
 12:20:49 -0700 (PDT)
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
 <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com> <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
In-Reply-To: <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 29 Apr 2026 13:20:38 -0600
X-Gm-Features: AVHnY4LS0q8rVhCWEM9jcgreDzRj6jHlyTeei6srw2bJ0kIdi0Mr181JcAK3ylA
Message-ID: <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: "Padhi, Beleswar" <b-padhi@ti.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
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

On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wrote:
>
> Hi Mathieu,
>
> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
> > On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
> >>
> >>
> >>> -----Original Message-----
> >>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>> Sent: Wednesday, April 29, 2026 10:42 AM
> >>> To: Shenwei Wang <shenwei.wang@nxp.com>
> >>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
> >>> Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> >>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> >>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> >>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> >>> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> >>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> >>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> >>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> >>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> >>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
> >>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> >>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> >>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> >>>>
> >>>>> -----Original Message-----
> >>>>> From: Andrew Lunn <andrew@lunn.ch>
> >>>>> Sent: Monday, April 27, 2026 3:49 PM
> >>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
> >>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
> >>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> >>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> >>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> >>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> >>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
> >>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
> >>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> >>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> >>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> >>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> >>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> >>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> >>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> >>>>> <brgl@bgdev.pl>
> >>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
> >>>>> GPIO driver
> >>>>>>> struct virtio_gpio_response {
> >>>>>>>          __u8 status;
> >>>>>>>          __u8 value;
> >>>>>>> };
> >>>>>> It is the same message format. Please see the message definition
> >>>>> (GET_DIRECTION) below:
> >>>>>
> >>>>>> +   +-----+-----+-----+-----+-----+----+
> >>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> >>>>>> +   | 1   | 2   |port |line | err | dir|
> >>>>>> +   +-----+-----+-----+-----+-----+----+
> >>>>> Sorry, but i don't see how two u8 vs six u8 are the same message format.
> >>>>>
> >>>> Some changes to the message format are necessary.
> >>>>
> >>>> Virtio uses two communication channels (virtqueues): one for requests and
> >>> replies, and a second one for events.
> >>>> In contrast, rpmsg provides only a single communication channel, so a
> >>>> type field is required to distinguish between different kinds of messages.
> >>>>
> >>>> Since rpmsg replies and events share the same message format, an additional
> >>> line is introduced to handle both cases.
> >>>> Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
> >>> uniquely identify the target controller.
> >>>
> >>> I have commented on this before - RPMSG is already providing multiplexing
> >>> capability by way of endpoints.  There is no need for a port field.  One endpoint,
> >>> one GPIO controller.
> >>>
> >> You still need a way to let the remote side know which port the endpoint maps to, either
> >> by embedding the port information in the message (the current way), or by sending it
> >> separately.
> >>
> > An endpoint is created with every namespace request.  There should be
> > one namespace request for every GPIO controller, which yields a unique
> > endpoint for each controller and eliminates the need for an extra
> > field to identify them.
>
>
> Right, but this can still be done by just having one namespace request.
> We can create new endpoints bound to an existing namespace/channel by
> invoking rpmsg_create_ept(). This is what I suggested here too:
> https://lore.kernel.org/all/29485742-6e49-482e-b73d-228295daaeec@ti.com/
>

I will look at your suggestion (i.e link above) later this week or next week.

> My mental model looks like this for the complete picture:
>
> 1. namespace/channel#1 = rpmsg-io
>     a. ept1 -> gpio-controller@1
>     b. ept2 -> gpio-controller@2
>

I've asked for one endpoint per GPIO controller since the very
beginning.  I don't yet have a strong opinion on whether to use one
namespace request per GPIO controller or a single request that spins
off multiple endpoints.  I'll have to look at your link and reflect on
that.  Regardless of how we proceed on that front, multiplexing needs
to happen at the endpoint level rather than the packet level.  This is
the only way this work can move forward.

> 2. namespace/channel#2 = rpmsg-i2c
>     a. ept1 -> i2c@1
>     b. ept2 -> i2c@2
>     c. ept3 -> i2c@3
>
> etc...
>
> This way device groups are isolated with each channel/namespace, and
> instances within each device groups are also respected with specific
> endpoints.
>
> Thanks,
> Beleswar
>
