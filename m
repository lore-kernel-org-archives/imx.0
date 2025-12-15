Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF5D2C0F96
	for <imx@lists.linux.dev>; Mon, 15 Dec 2025 18:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765823642; cv=none; b=m/ZDRHog0cj2/fkrLm8x4l4s0e8AwiqtDWXfI3L2kkNIPpxKlTnNkbYJzyFF/M/ROAIcVmexhIscJfletbAyTnGpGRipWUZCnW2/X3H4PgO8H89F08Rsh/LmDZr/AxsYQYsXKdbyO+sK2VPg6Du8ttilh/uYwPj+r2s5CruziII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765823642; c=relaxed/simple;
	bh=WNJuxtR4xjqLFfaBNgAaSfYdatv+C8mw731fRCaI/ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCVW/UKhD/jeoZFYfK1WCK6eacwMJc30Quyk+ninlc2Ex0qEqudqQbed6ddFRSpyJxMr7BqcIwQFQss1USko20otM+7aBv/AwUXto85IyCOBRAUjlRvV8bKdEk/vT2Gs/d1kkzQbv4t3kSsFigBTM0NR+bf40HmqRe0gQ8JVodY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WoDhMQ1B; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WoDhMQ1B"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso30829385e9.3
        for <imx@lists.linux.dev>; Mon, 15 Dec 2025 10:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765823639; x=1766428439; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ivCXo0tlAhX6SrgNkqQcm5Kx6Z8sjaJXC/TK9cEdNg=;
        b=WoDhMQ1BgME6TbP7wowhs5dxhB3JfWos297pjub164/V3G+vA8eL4ibsRn7/Esfg7r
         Gf/gxiCrVDAwEbvoVsKzdagmHVqsVvtsT8pculv7RyXYV9qQm82v7o7xtH+ahycqYMg2
         4D4zQlt0lKc6f/LQO6laN1qVaQKQ0qRhPWXdpQ8aTGa8OCLmCsDdg082Y/8HMhKegCON
         XmEUn7KbBEoB4SFK5lZQwqfVG5fLsIgz4+TJANvNT+KMGOhR7iTyoBV24Q6QYMXx9pG2
         J5+vz188L5CwR+76h3gwqXRINpoNCtvwoSRMXKpxNtu+Zbfo4FXNObj5Uer3lLcxbtAv
         L94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765823639; x=1766428439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ivCXo0tlAhX6SrgNkqQcm5Kx6Z8sjaJXC/TK9cEdNg=;
        b=DiwuDgEynAcNSFqp+jVIVoKs6vTJOCrHm+kWwqyzhlGoOyxy5HLieDZamjNbOuxI5H
         ktDRGkBWFn3QqN2abhDnrr67vw0da54nG/H5IwZa/jMS67WKm9pOyGWmsVNwZnH19oDS
         Ysk88qdl7IKuory4g2T3J+L47XYtj7vMDE8gR8Fs/xrBPAXVxEBTxGDlMb2Tec9ZflHF
         ImmIAGv08jR0RFzwN4VsaIr9heqcIyGILULtN6qzqw/z+l0C+AQ9jcmercaZNEMkbaQT
         0ECyxKWb1cbjf32P+6QgDTF0SY6zV9eTVAAboz7AcSIJZE16wUBtlc7ipWdaGcBWQB2+
         /8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9OuNraNkodk4j3W9cCWmaj73VABu91+c1eTuidQtjpXHIqFMbLxymljOjKC5NmYbtkgU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx43HbUr51TzsC1E8LlyNhAakcV6xJPqS9SzUILd2hFd7+U0te4
	LPoJIXSz550XaOhwIAPcZbAc2EPkBY8bOeM5g+x8VWzlBEmzp2AbeXJPhhcHvYMRVs4=
X-Gm-Gg: AY/fxX6mlYC3geq8vLFH/AiHYMqtcJT2Z7Ry2y/AIoEqz03tDsuKKPcs8L14nOZ+bfu
	Dmf+S1xLLNMRazj1bb72JJTlzyEIa2tiF/c79L7WlDsRj3R8HuNkQNcyhp0JV7qD9PmLVQxWQIm
	MlUiRyKUNw9aF/tVxZIFvHZYjj6/BhHXtDhPR7RPHS0TttRj259gCzd6SyLt/QCCvd+rBQvusOE
	YcuMHxAQd3q9oWt3R+Iw4uor3h9qNtoQgnhq0rBDIqmbNN4dpK/jjeRAK4t9td8znAd2x6s+Yd1
	UVQSz8lSXBtmpqwhyDBBpLcb/ND4nROG8So+He5mlem10f41e822zn6VGXwjSKsoiknreQGDIHd
	yC9RkCEX9kDWhazTf1d7J9YUOspj1+n54YRmosD85wkxJKJG9k+kvUmKBr4OFuGfnhwhvldTdSa
	9d8+nOCnFpFfn30dMS
X-Google-Smtp-Source: AGHT+IGD9iih4mWv4BLSj82m0Ympx0mGmlL43wh+neFiQaKbjBxHvTG8uww0J8sP/od0z1H7q0uRNg==
X-Received: by 2002:a05:600c:5252:b0:477:76cb:4812 with SMTP id 5b1f17b1804b1-47a8f708ebamr117215125e9.0.1765823638856;
        Mon, 15 Dec 2025 10:33:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f280cf05sm16491842f8f.7.2025.12.15.10.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 10:33:58 -0800 (PST)
Date: Mon, 15 Dec 2025 21:33:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, linaro-s32@linaro.org
Subject: Re: [PATCH v2 0/4] s32g: Use a syscon for GPR
Message-ID: <aUBUkuLf7NHtLSl1@stanley.mountain>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
 <aUAvwRmIZBC0W6ql@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUAvwRmIZBC0W6ql@lizhi-Precision-Tower-5810>

On Mon, Dec 15, 2025 at 10:56:49AM -0500, Frank Li wrote:
> On Mon, Dec 15, 2025 at 05:41:43PM +0300, Dan Carpenter wrote:
> > The s32g devices have a GPR register region which holds a number of
> > miscellaneous registers.  Currently only the stmmac/dwmac-s32.c uses
> > anything from there and we just add a line to the device tree to
> > access that GMAC_0_CTRL_STS register:
> >
> >                         reg = <0x4033c000 0x2000>, /* gmac IP */
> >                               <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> >
> > We still have to maintain backwards compatibility to this format,
> > of course, but it would be better to access these through a syscon.
> > First of all, putting all the registers together is more organized
> > and shows how the hardware actually is implemented.  Secondly, in
> > some versions of this chipset those registers can only be accessed
> > via SCMI, if the registers aren't grouped together each driver will
> > have to create a whole lot of if then statements to access it via
> > IOMEM or via SCMI,
> 
> Does SCMI work as regmap? syscon look likes simple, but missed abstract
> in overall.
> 

The SCMI part of this is pretty complicated and needs discussion.  It
might be that it requires a vendor extension.  Right now, the out of
tree code uses a nvmem vendor extension but that probably won't get
merged upstream.

But in theory, it's fairly simple, you can write a regmap driver and
register it as a syscon and everything that was accessing nxp,phy-sel
accesses the same register but over SCMI.

> You still use regmap by use MMIO. /* GMAC_0_CTRL_STS */
> 
> regmap = devm_regmap_init_mmio(dev, sts_offset, &regmap_config);
> 

You can use have an MMIO syscon, or you can create a custom driver
and register it as a syscon using of_syscon_register_regmap().

> So all code can use regmap function without if-then statements if SCMI work
> as regmap.
> 

regards,
dan carpenter

