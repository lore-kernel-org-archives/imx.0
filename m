Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6823F1665
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 16:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849806; cv=pass; b=CPh3RIYEFxKzGPW2MLAKNlFX/lGJ+09v51zAOHlpKfmrspIJl38mcmazh7MBeD8snMQ6hALeqszrdy8Be06orfI+XLh5EiLUskCGEpK5yO4lfMMH+c2nanza34B+CpiSjB/BFwhPUMPqvAyv9WCppwPu7Y4KYWbJo7Z9dNC47ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849806; c=relaxed/simple;
	bh=whUst5kD5E4ZE3YDOSV+OSVwVL0wed8ch5z/VyWCXig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=an+n68IoBf1LCXrwA8pOpo76bgZ819kFgeQZEC+lqYH4qtGkc7hLz+qf0LjZasazwOrReXqfeCCldeP6qqK7q/E5e0PEnAi/XD3CRJbFn5yin9aQazsDD8rSieVJII9/o8E6m/JFQ2/HGuzlHn0IiLteO4O1rRfONwl1OWqOIrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EppGNZn1; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EppGNZn1"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b97bca3797dso513189366b.0
        for <imx@lists.linux.dev>; Wed, 18 Mar 2026 09:03:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773849796; cv=none;
        d=google.com; s=arc-20240605;
        b=djrZ/oJKEmlZyS5C5k8JN2EmCq+oJSWw18e+Od+FL7crlK9uunUT1voITDb7ocaHQG
         DLL5MeO5jAgPoKKbmQk82hStKHgnyERQr3ti9Hd3JTH7wwB4k9ogbDVuTlNRxdPdQ9Be
         DkmrQ5JmHUw95To4KrsAg8Kc1C98YOhdU3Y8t7Vmfsygh6O5IAFrWMKXfeS4PfznvQPW
         cs3ZX9qJCcB4YasVsPQjfYhqzgNGHSSfanDltVjpXjOKqXSpeJWmBp9JzL/umvxEUIOC
         YApleUX6yfI7vXMnRrn2vAxFTPojrGF/RYAgpwOGmelAz09Tt9TrVU1zg6WFEIWhg+V/
         L5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Swz0XhdroxzWkDHIYYyMmBF0VrlYEkeUluciyU8bDwM=;
        fh=laC1U0bFvCojJAt9+iI0z2Ozgjs6OTkm9VMt2YdI+sY=;
        b=NWdHlTuh1SttkHoCBSAgi1DdKBycoQ0bfuj+PyKJ7j8A2D1ModnKkJ7GIJPznUjMNk
         ArOZF8QSQUv8kbWgpI8X+UXwSI654Lwp/axoAMYZAbd//d0FMhuVQrsPkeIBgPX20LwH
         EAD3zuV3AH3YMKr4WzS7BD5WTQ80biKDFOPSRqKCSUAfhVA9lAcS6SdKK6SBpRJfwjdS
         SIQY1fvKxnRzjm4EEHhhr/BakcfuFPoY7cheCT7cejojLUukCd6PcBCuCs0Fw/VwhXGN
         3Gq6fY5wsO4yOCHcTc4A3X0NSryDhp7OrHlKxFHbplXMhCDwjPrzmecK9WgZTgudmQnW
         xA6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773849796; x=1774454596; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Swz0XhdroxzWkDHIYYyMmBF0VrlYEkeUluciyU8bDwM=;
        b=EppGNZn1l4FmN+eOEHry4Ofv/4R4mvctIeo7PApyWdNhza6XNIAQ7iv+EChFR1yaTy
         HRTK4+Nfb4dly/gWK+qkTRJr8LhNr9BY2TTCrfolTNYm/VJWMfNqnjzNLJhpx0x5FKIk
         fHF84pgdPt+172zexFJBOv0EN3MFII0A6ssBDCjD9BCyf5DwNy0jFsdJHqt0bWWAdCf9
         QA3tGqW+fGbThAwh5hT8GLnoXrD1+AKqjMIlAW9oZyRkyVHQQ+hjjEc7wSH/cThTTt1l
         UY+0jn/FV9dkbh50Sd2WSGBD0MKu1ulACjftBmD9X25HjKHFw4fPskhh/rg+87sdNgT5
         /tuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849796; x=1774454596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Swz0XhdroxzWkDHIYYyMmBF0VrlYEkeUluciyU8bDwM=;
        b=GQSa8pWcyorJXoP8h3YUPXtMLZpTIu2EWVN970Fj+y/JvwHPpOTRbdC1oi3SRXNVS8
         4xZIs+NsKbzNhkc6ai3y5DoDPKj2mFcnSQiGPd6xk71+MaImXhCUQBnSaQy0oODhi/QH
         F3s8GmxHMWGkBrKTS+97qEUoOBkELh+l1LAu2xQp1WOvxbFsc2PeLWlKZL8wlubrIHoX
         LYjJrMq2t8JNk7ezNv4+mMDag9W5A0udgHRpXBiVoYkj9aj7ua3eCHZjS2GiREPqVXQk
         6ZzswSaRXmzP0ip0eELgScLLXbA1tZLxHb+ZLPlxIBwaWgKCS3zmKfQxfPVUIP1EVjkx
         1K0w==
X-Forwarded-Encrypted: i=1; AJvYcCUBT7GtNKzckdM75bNhebiDKg3At/JzS86SvJI9GQpXIfbBS6lIgGHhuQGEGgBj2lsTtP8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1TZ3JtVEJEj6vl62JfpRcU9t1r48Ray+UIbA2iWHj3Rty4xbI
	aZ8Rfnd/BQJfngaNxm8zWb0yzkBPDf/y9uwUULYgLFHXFls9QHVOHBaqxMCzxnku9ETZUgVd4Vp
	+rr7E4V6JOIzAOrMg3ryK95Vwuu03VwqvCqlS6J5rfg==
X-Gm-Gg: ATEYQzwIfZCiNGKUoBX0B8vbcCTn06BYRyDs3Mx8pTBn4rM0uT3YE/neLyuI+QT8S1J
	HGIkL7GNAUaKpGouHQilivP2h46odUt6MG4jLAuZ1/aSmKDTnqtvniCGtpcVvS+nNsecXB3zE5u
	BnUlLS6+9xrZWTj+zA30yF7vgrPVsbgiJhn7gGQOLDrwQefmroa3pjMdcbxt7VeBNRBy6igENhy
	+9ugc/PbVpPqbcH5Y+7kVVCrca14O5M/x7xM0AIofZJqKVmJ7pzRlAUM5iOeUYPVL1k4rujaWqb
	gRGsBpdQ4nz348OUkVyW7WwwhQy7jBstXZnD7wk6
X-Received: by 2002:a17:907:9811:b0:b94:24:44bb with SMTP id
 a640c23a62f3a-b97f49bd1dfmr258135566b.42.1773849796081; Wed, 18 Mar 2026
 09:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com> <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
 <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
In-Reply-To: <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 18 Mar 2026 10:03:03 -0600
X-Gm-Features: AaiRm50ET16GLgpYC6lwF0jbLmfq5CygllZIeseBjuujZbOA5MhL0hZ6kP_Zg-Y
Message-ID: <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Mar 2026 at 08:11, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > +struct rpmsg_gpio_info {
> > > +   struct rpmsg_device *rpdev;
> > > +   struct rpmsg_gpio_packet *reply_msg;
> > > +   struct completion cmd_complete;
> > > +   struct mutex lock;
> > > +   void **port_store;
> > > +};
> >
> > Except if I missunderstood Mathieu and Bjorn's request:
> > "reuse all the design-work done in the gpio-virtio"
> > We should find similar structures here to those defined
> > in virtio_gpio.h.
> > struct rpmsg_gpio_config {
> >       __le16 ngpio;
> >       __u8 padding[2];
> >       __le32 gpio_names_size;
> > };
> >
> > /* Virtio GPIO Request / Response */
> > struct virtio_gpio_request {
> >       __le16 type;
> >       __le16 gpio;
> >       __le32 value;
> > };
>
> The core of the issue is that Shenwei is stone walling any change
> which makes it hard to keep the legacy firmware. It is possible to use
> these structures, but it makes the extra code Shenwei needs to
> translate this protocol to the legacy protocol more difficult. It
> might need to keep state, etc.
>

I agree with everything Andrew points out above.

> Two points...
>
> The firmware implements more than GPIO. There is definitely I2C as
> well, the first version of the patch has bits of I2C code. Looking at:
>
> https://lwn.net/ml/all/20250922200413.309707-3-shenwei.wang@nxp.com/
>
> There is also RTC, and a few other things which don't directly map to
> Linux subsystems, but maybe do have Linux drivers?
>
> Give how much pushback there has been on the existing protocol for
> GPIO, it would be wise to assume that I2C, and RTC is going to get the
> same amount of pushback. If any of these three, GPIO, I2C, or RTC
> decide that only a new, clean protocol will be accepted, no legacy
> shims, the firmware has to change, breaking compatibility to legacy
> protocols, and the accepted shims become pointless Maintenance burden.
>

I have made this point clear before: modeling legacy protocols in
mainline doesn't scale.  Mainline uses a single generic protocol, and
yes, it means breaking legacy protocols.  This is the cost of moving
to a mainline kernel.  If people want to use the legacy firmware, they
must stick with a legacy kernel.

> Point two is that the customers who are pushing for these drivers to
> be added to Mainline probably know that nearly nothing gets into
> Mainline without some changes. There is some short term pain to
> swapping to Mainline because of these changes, in this case, firmware
> upgrades. But in the long run, it is worth the pain to be able to use
> Mainline. And those customers who don't want to upgrade the firmware
> can keep with the out of tree drives.
>
> So, what are our choices?
>
> 1) We accept the code as it is now, with the shim?
>

NAK

> 2) We keep pushing for the virtio protocol, with the shim?
>

NAK

> 3) We keep pushing for the virtio protocol, no shim, firmware changes
>

Nothing will get merged in the RPMSG subsystem that includes support
for the legacy protocol.  Not today, not in a month, not in 5 years.

> 4) We pause GPIO where it is today, and restart all the arguments with
>    the I2C driver. We can come back to the GPIO driver in a few months
>    time once we have a better idea how I2C is going. And maybe we also
>    need to see the watchdog driver, and argue about its protocol.
>
> I also understand ST has a generic I2C driver nearly ready, if that
> gets merged first, that probably kills the NXP I2C protocol, and maybe
> the NXP GPIO and RTC protocols.
>
> My vote is for 3. If not 3, then 4.
>

Strong vote for 3.

>      Andrew
>
