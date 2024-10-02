Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02241EEE6
	for <imx@lists.linux.dev>; Wed,  2 Oct 2024 14:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727879771; cv=none; b=AImJbbfemcCFXwutx/V9XDshBdmBoCWQZjVyzWeIrxi31LKeH/9ZQoqvAhpzo0ODafBpTEisaOQMUT3TQfN/VWo+POsoFXzWfR6w9tJSbjt8D/rzwMPmcs3hlUDJPGhq6cpBRlUoJMsL6/ZvR0jSfGYGSx0mgC+mBM1h3MZQ+lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727879771; c=relaxed/simple;
	bh=rAm7s1zqbKAlOWxaTEL993+VFrvSzpI1Q4YD+zzwquo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reKIC0MnF9GsnaHNDBqOkL6veXpC63OPKsznlLC+H28F62uoyt7ZxqWAhYPEtm5vD4TzVTuTsMAqerb9yE7jw98bMCIdMameQ6+HOzRreB0F2Ub83FxYpc2/Re6fC4IpZUs6UBcm0t3N6+MJ5RDiSQ/h/yUMESvoC5YPniuEa7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NY+dVhWN; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NY+dVhWN"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539983beb19so3863553e87.3
        for <imx@lists.linux.dev>; Wed, 02 Oct 2024 07:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727879768; x=1728484568; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SYBnqtvGiQjaRMTgNULW741gmtqnFsMn0VCfba+rg+A=;
        b=NY+dVhWNdkfV+ejfDvv6eV203tIdNyIncvMi8/YUFT9Ds/60va7N70u8GHys7iYb9J
         3qN74ofpBf/lUECDBzc1r5qNIp9ldN8VTgJZrGY1X3DcqxopfYAAuebZqueujYA+Avym
         q940rbgFvq2imzugfxppWR0w3lqu6vgg/cDjXSaOcGQlSTgyfhheb7bJlbnho6UgjN0Q
         vklTFhP1YUf14tovD8E5/jN8L+oTvX+uH9O2UPR2nce0entEZrieq5/Rjjl+2inmWpnB
         l6/ioEftFymrH1+9o7AsNsH4iAKQx6I3owmnN8K5XzZITZBDwNS8mgzxLLtBRbtff5uL
         o/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727879768; x=1728484568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYBnqtvGiQjaRMTgNULW741gmtqnFsMn0VCfba+rg+A=;
        b=Y5IfdMiMNAu9OzOl1RYoV/txnnssSzXYs9RwvLo1nVEDLK+ArYAQAcvDZxmwPyfcJy
         WZCnd0ywsIlUy3zO3xVJ+MgDNv9SmtEU2fTdWnExyVG86+5ju/eqBaz0OJ+Wq4ZTFflk
         qZYXvALZwOihJwsvqXum8N6Uiw0mEqQssOuuNJpfxcXzZaqB6Ig9s4Wf6GMh/NGZgU35
         rH8KnIaV59zw9H9s4mOWJXfEbpN1t4YO6LnxMbiA1rs8X4E0KHR/RubyLsUYnBmbBS8f
         CKP0FRk88RNUAwzm0gDoEAuL3tweCnh7tZeBOeasHLIo0oLI0Kx1QBMffUXRJRMMRx+r
         uyRw==
X-Forwarded-Encrypted: i=1; AJvYcCVHbhbrnCJb/Jfk4ItsIeX9XW2Mcj15/f0nbaj5i7Ng/54PikAcJy7uQ/igfUAmTEntY5I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMaulbxUK6K8wWGhx/6hw3t7AeMYjxz1ZaXTRev+ZSjiU2zAd0
	32GvYzoMVVS7/zSR9gkUrs0te+hSfphGzoj1+FEOWRp2RWaFRuZD
X-Google-Smtp-Source: AGHT+IELBe44nDd0xVmrlmK9UvO9iyEJQmLMZHrBr23Zi+FleF6chln+t/rRwOksZLaeO0i19LgsDQ==
X-Received: by 2002:a05:6512:31c8:b0:52c:a5cb:69e4 with SMTP id 2adb3069b0e04-539a07a3603mr2013252e87.54.1727879767296;
        Wed, 02 Oct 2024 07:36:07 -0700 (PDT)
Received: from eichest-laptop (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79ff460dsm20084135e9.32.2024.10.02.07.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 07:36:06 -0700 (PDT)
Date: Wed, 2 Oct 2024 16:36:05 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: o.rempel@pengutronix.de,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4 3/4] i2c: imx: use readb_relaxed and writeb_relaxed
Message-ID: <Zv1aVatIlToneign@eichest-laptop>
References: <20241002112020.23913-1-eichest@gmail.com>
 <20241002112020.23913-4-eichest@gmail.com>
 <6b070948-cf02-4f13-a220-0f6cfa21c41a@app.fastmail.com>
 <Zv1FuHlpeayZq-Zv@eichest-laptop>
 <a65ddcab-4ba9-4dfe-93ec-352b31845eb4@app.fastmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a65ddcab-4ba9-4dfe-93ec-352b31845eb4@app.fastmail.com>

On Wed, Oct 02, 2024 at 01:36:04PM +0000, Arnd Bergmann wrote:
> On Wed, Oct 2, 2024, at 13:08, Stefan Eichenberger wrote:
> > On Wed, Oct 02, 2024 at 11:51:22AM +0000, Arnd Bergmann wrote:
> >> On Wed, Oct 2, 2024, at 11:19, Stefan Eichenberger wrote:
> >> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> >> >
> >> > Use the relaxed version of readb and writeb to reduce overhead. It is
> >> > safe to use the relaxed version because we either do not rely on dma
> >> > completion, or we use a dma callback to ensure that the dma transfer is
> >> > complete before we continue.
> >> 
> >> I would still consider this a bug in general, you should
> >> never default to the unsafe variants.
> >> 
> >> If there is a codepath that needs the barrierless version,
> >> please add imx_i2c_write_reg_relaxed()/imx_i2c_read_reg_relaxed()
> >> helpers that use those only in the places where it makes
> >> a measurable difference, with a comment that explains
> >> the usage.
> >
> > I added the patch because of the following dicussion:
> > https://lore.kernel.org/linux-i2c/ZpVWXlR6j2i0ZtVQ@lizhi-Precision-Tower-5810/
> >
> > I can't determine if the relaxed version improves performance. The
> > 'normal' version worked well for our use case too. Therefore, dropping
> > the change would be acceptable for us. Another potential solution could
> > be to use the relaxed version only inside the ISR. Would that be an
> > acceptable solution? What is your impression, Frank Li
> > <Frank.Li@nxp.com>?
> 
> I'm pretty sure that Frank meant to use readb_relaxed()/writeb_relaxed()
> inside of the FIFO access loop, not for everything else. This
> makes a lot of sense, since the FIFO read in particular is
> clearly performance sensitive and already serialized by the
> implied control dependency.
> 
> If you can read multiple bytes, the best interface to use
> would in fact be readsb() or possibly readsl() to read
> four bytes with each access.
> 
> It appears that you did not implement the suggestion to
> read the entire FIFO though, so you can probably just skip
> the _relaxed() change entirely.

This makes sense, it appears this was a misunderstanding. If no one
objects, I will drop the patch in the next version. Thank you for the
clarification.

Regards,
Stefan
