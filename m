Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C54347B426
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 15:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128256; cv=none; b=jqCTs7H3fp+WGvfS7wSreCpu+/3UulrbO6W5ABBgLwAZklOgQxVRM9Np0FoY+2D8j5aqei3KCWOhnyeRSByt52eGSi+MNvG5oYVOa4L8gNWTILNrez+cqulzVZD/F12hKMqYRrbn3/ctHdk0IYrKh78VhSKMX75pw/agYFTDZwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128256; c=relaxed/simple;
	bh=cUtM9nCXCjAw/x4a+bjTLJgqufLVfuAa653qViepFAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/0zr5U6mQnZ6TZ0bcCn7BTNBEH1vJTdexlhUYlawTtQEnuAvOrP3tplNE4McUO0sPcULGugxjzWE9qnswqc5qf1WhIHD2TltuFJa2d2+5hRun3wrbeqKCmCI+Y05wn0DNFwTHR1A9JWJbPjXwlgBNkm15GWalDO3cNL+fWlEdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jl30/8ul; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jl30/8ul"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so92869255ad.2
        for <imx@lists.linux.dev>; Wed, 15 Jul 2026 08:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784128253; x=1784733053; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0f1V+XLP/pNL55h1xnCAtGPJkQJwQhVW+vGDr0a9svY=;
        b=Jl30/8ulTO/sr+Ljs1R8MlZPlnik59AFmAlsml0dYYY1FoM93eMfhFL5mSxczDBEmz
         Wm7u+AFQvLUmarYmmu3x+81qmuDH3vuZuWolz/41IkTkRfJK0Qs/mUi3UOBiP+t4FvSW
         lyKR7xFUXn5GuvOGeBeTJIYKAs3ijTXXNEtdTr4coG5GoWkV0nVqgjNJnMIj6zSJVM51
         NMzSCBymkUxaMiY/pYyEH/NNOBKOW23OsS5SJhzwh+aw7IN9mhHadOAcpQ5wS23sdIu8
         DGtd9qHbmV2OSnzaLAQnGAAWy/MG6taui2kCJXhrg6LnTEbEnBkDPOVZpbY2n9O3iOmv
         AO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784128253; x=1784733053;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0f1V+XLP/pNL55h1xnCAtGPJkQJwQhVW+vGDr0a9svY=;
        b=AeOjQKeo1rHOQ7Ic90f8RsbdQ0uixxlW3uuRSrLuuUeip+v+hkMN9krtULXil/g7lr
         DA2Ht4lIdYn44CSu/m0I7QGIeZ4D1hDjGmyDl/lmabZXl4ypd+KY7F+FY/hlJm2D6M2r
         7zXG95xKWe54S/TqrgIYIjMTljzoTOczK7HJvnoqu/eMjYpL2TxILMuw29wDR97Fn7E9
         RNkC+COqGQjx2eSUmj+gE63FhdZleoWpC+/4DGtShUhYrNDtkpInXSftw7A172sqvCRe
         L/9mIDrHkE1kzWltPQTdS2QVHg7S083+lBmMEH2tMHLdT4pO8u9ODkRnXKNSE85bk33G
         80xg==
X-Forwarded-Encrypted: i=1; AHgh+RovFqRNlqvy4yBQVFu7biFJo/KP9/EU/FNbmy/3+v7Wb2NO3gxvmIHNXiyKeqXOTY9zuHs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkloK13mqVFy7R2qN/WUVloQOkA1ChGApeCkakN2gVNtPbTuNb
	vvNBBJfkR8cSY8E5mt6RxorZNvNrqfJT3sP7Xdwh7fKP+e/XlkcfNjJJMSZ5TY4tE9A=
X-Gm-Gg: AfdE7cn19le54/F2nzfM2uk7jzS01YtPYgK+gXVC4qUABgdkiWSqivj1TE/3aBQkSjx
	l02/FhoA/2HM19J3a8Ac2dZhEjKG6z9DavakO6eVG8mMbl8o5M0aGFBDUBxyVWAUZ8YpLKlzVZO
	BbXKS5WIEfpvikUXBQhjYZFy22dSv0PkBV7WwLfJhZ19SOaduwAn90osHmqt7fxF4KCaXZcFdFZ
	TcgXDws/trJsiBZNOfzANOfymJan5cfJ5lOdVabCUrLckC2bykqPomE/FP0b5qqpAOXC76ByHt/
	wYBuKlpyiKv8IIPus4rbeeZyVglKiYPwE1oYFM4oA98udWeLcoeuoGNnCM3OQV8r60yTZkK/R2v
	B86stcLnesTvAuotOJgJVIILGf1Q/v07FvPRxvNuYVThYWmk6cXK27Tv8s7Uwcd5RSdl883R6jy
	/wYgPrFZ3gci3PwdEb4AekduObaj8=
X-Received: by 2002:a17:903:1a2e:b0:2cc:eec6:558 with SMTP id d9443c01a7336-2cef14ad047mr75726665ad.39.1784128252771;
        Wed, 15 Jul 2026 08:10:52 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4f38:9a5e:fd18:7a9b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf0fdb3a0asm4417715ad.0.2026.07.15.08.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:10:52 -0700 (PDT)
Date: Wed, 15 Jul 2026 09:10:49 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
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
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	"b-padhi@ti.com" <b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Message-ID: <alei-dNIXo7Z7uT1@p14s>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
 <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB918568AE7B2364EC9D16427689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB918568AE7B2364EC9D16427689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>

On Tue, Jul 14, 2026 at 07:04:08PM +0000, Shenwei Wang (OSS) wrote:
> 
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Monday, July 13, 2026 12:17 PM
> > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> > Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> > POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > <andrew@lunn.ch>
> > Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over rpmsg
> > bus
> > 
> > > +
> > > +The RPMSG message consists of a 8-byte packet with the following layout:
> > > +
> > > +.. code-block:: none
> > > +.. code-block:: none
> > > +
> > > +   +------+------+--------+
> > > +   | 0x00 | 0x01 |  0x02  |
> > > +   |   2  | line | trigger|
> > > +   +------+------+--------+
> > 
> > 2 things here:
> > 
> > 1) You did not include messages that mask and unmask interrupts at the driver
> > side.
> > 
> > 2) We are carrying virtio-gpio messages on top of RPMSG and as such, this whole
> > protocol should be about thar:
> > 
> > +------+------+--------+--------
> > | 0x00 |       payload         |
> > |  Q   |                       |
> > +------+------+--------+--------
> > 
> > Q = 0 requestq
> > Q = 1 eventq
> > 
> > The "payload" part is simply the format of the messages as found in the virtio-
> > gpio specification.  From there, the only thing left to mention is which messages
> > are not supported, i.e get line names.
> > 
> > > +
> > > +- **line**: The GPIO line (pin) index of the port.
> > > +
> > > +- **trigger**: Optional parameter to indicate the trigger event type.
> > 
> > Not part of the spec - remove.
> > 
> 
> The two fields above are required for rpmsg-gpio, but not for virtio-gpio.

I agree that the line is required but not the trigger.  The driver (using the
same terminology as the specification) knows what trigger the pin has been
configured for.  Adding the trigger information to the interrupt notification is
redundant.

> 
> In the rpmsg-gpio case, interrupt detection and handling occur on the remote processor. The 
> interrupt information (such as the GPIO line and trigger type) must therefore be sent to Linux 
> through this notification message.
> 
> In contrast, for virtio-gpio, interrupt handling is performed on the local processor. Since Linux already 
> has all the necessary interrupt context, the information is not needed.
> 
> Shenwei
> 
> > Given the refactoring work that is still needed, I will not look at the
> > implementation.
> > 
> > Thanks,
> > Mathieu
> > 
> > > +
> > > diff --git a/Documentation/driver-api/gpio/index.rst
> > > b/Documentation/driver-api/gpio/index.rst
> > > index bee58f709b9a..e5eb1f82f01f 100644
> > > --- a/Documentation/driver-api/gpio/index.rst
> > > +++ b/Documentation/driver-api/gpio/index.rst
> > > @@ -16,6 +16,7 @@ Contents:
> > >     drivers-on-gpio
> > >     bt8xxgpio
> > >     pca953x
> > > +   gpio-rpmsg
> > >
> > >  Core
> > >  ====
> > > --
> > > 2.43.0
> > >
