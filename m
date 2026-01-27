Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC697E0E4
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504160; cv=none; b=pWc8qqjQM8rivMdTdg3owmOJ+NbdUvKHTbyUgyr6Gcg2W5bt/QrnIswUNs2/729qXPILM4HZwYU8OcbbkhEvAT34Pen2YcGevWlMX+em/FBbLQVZSwSyeE6+Mc6zFJ8Snw7Am6nUwIsp6ggKEfGKpSMpL4MFlukY5Tkr08MhvF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504160; c=relaxed/simple;
	bh=uMKblArHl5A9jcSFlaLTAYlOk8eq3QqLeD+7zdgmwRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V57MdJJ845rEg85hwhgK+AZhhReOg6Czt5hE0uUGWAM2awMG+gKglcEJk8xPx2hc1PkVVtGYO9Ihw0SJmmZFsa5oliTcJCWTbLOUY8DHyFFmDwnnLCXyN8SeG/URbHBJWbvj38ZXVgPh7hcsHYE/WY9HuWekfbq8czFtrMQ48Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rHDGH2Ds; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rHDGH2Ds"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso46892725e9.1
        for <imx@lists.linux.dev>; Tue, 27 Jan 2026 00:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769504157; x=1770108957; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6gcw78eDfCGKXCKZBLgnF/iPeG+D4+74BvG9CfzhIA=;
        b=rHDGH2Ds5R07pDpLo+hG3A8qoCK497WMiOS+lARYXQsLKjk09mQbT+JtHuxRq+Y05y
         +Tf1140p+jSNTmRkTn6/44JSRto1uwoKdyCAKKCCXvzlQXjyqjfrak/pdmBzqNRQHAXv
         AvBZokM3UYFmywhAKi/YluGnYvrgLbf+kH5LgHl6J+DC8MbeDvw2z9bprOTEd7rya5W9
         nMKZWfJ65jxYhzCyiXfp/YixYUOHg7rCBWd7fjTarMCC+8+6am5ETrCr238n58DMKhoH
         uvIAeHh5tC5O4NNRg1ZWMVrENz7gzdHRtpHzA6i5rIAVH1/o94sFtjxi5JlLvEmW5zcB
         0jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769504157; x=1770108957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6gcw78eDfCGKXCKZBLgnF/iPeG+D4+74BvG9CfzhIA=;
        b=pfrUdZAvrJiR9u4d7Xisqm8+qoyh3CZC9gpvJVM94zkKNdadqEOF2U8Za/BgSVXy4J
         NGSphQ/ttm0re/S2qePmO1BH42Mz6wmP98CL9XWzX9MuWNbZLbFx/3XC3yyXYWzghABE
         BNa29hZukLRU6Ff9ozIx2aK4WnaKqxZXMDZX9vXsXocgXZwog7/A/jwbwcwbqBIrfd7d
         zdpdmcwfioMhCMYT9pGjUBGYNw1nMIRdvRqgIo1nfyvmYt6XlG+Cn0sJemoJX3BFsGH/
         AdRWAI47AH80ppnIDO13pe0bNr+wwkI/9Iht17rDKJpC+lQbUe4zD33Lytf23e1pos6b
         l07Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuM1VxkUB39Is9MA4M5j8BwdRgHqkWq/dn0tnkA/HXYbWClz9iwoTa2JeBKfLSNAqNjT0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlZ7LHf6ozNlTl30MWLf4cVE89wVBCaW8WAp7MJAapfwRwr1Nz
	hjE3TjSB/7p1UkisUt3D/4sgLrT6Vig2bgPpethbtN1zVrwfqTs1DqMeAD4o05fs9G8=
X-Gm-Gg: AZuq6aIShvGdjboRsDhi4of+R4wkQuM1rsJ8ts3fwGpWXIp4ZIgtim0CJOmzjiMPKDz
	WHNAYeYJdAob4sYotRrl0iUkd8bu5+FS0kW9uIHr90jodKvZ5765HAonei55VfRO+CfM0OjrxRh
	E968bNWhY3gdqYTxfnWKYoxQ8aSnKk0huIHunRJ1Imp8D7dnoF5YUAB3tnJyVK6e4oEiiaaDFwn
	syvmjWgC4rZfGOejs0iT6xdfD/yFgUNvsgHOEgMdK1G4vF/N7mf8vr6eVk0Dd5rBO9LCvQwnep0
	mLozSLQYeY+2jwBP0q86SBIl0qADb6eaPQI18XMYKyBd/ba/lXnp0Op4ZxOcsFzJtjo8Vc7/6YE
	gAvwdAMGwvr7m624WbxpULN5JzO6XRxaOaGv/H5FDlaayqzwxMxAu1ZujLrnyfTqAEG6hmT6eKL
	HoIV4UST+C6hAz9PE=
X-Received: by 2002:a05:600c:33a6:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-48069e0fd24mr6300105e9.1.1769504156658;
        Tue, 27 Jan 2026 00:55:56 -0800 (PST)
Received: from localhost ([41.210.143.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c42895sm50695725e9.14.2026.01.27.00.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 00:55:56 -0800 (PST)
Date: Tue, 27 Jan 2026 11:55:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, robh@kernel.org,
	kuba@kernel.org, festevam@gmail.com,
	ghennadi.procopciuc@oss.nxp.com, alexandre.torgue@foss.st.com,
	linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
	shawnguo@kernel.org, mbrugger@suse.com, mcoquelin.stm32@gmail.com,
	linaro-s32@linaro.org, davem@davemloft.net, s.hauer@pengutronix.de,
	edumazet@google.com, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, conor+dt@kernel.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, Frank.li@nxp.com,
	chester62515@gmail.com, netdev@vger.kernel.org,
	kernel@pengutronix.de, pabeni@redhat.com, jan.petrous@oss.nxp.com,
	linux-stm32@st-md-mailman.stormreply.com, s32@nxp.com
Subject: Re: [v4,1/3] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
Message-ID: <aXh9lcfw6D6KouI_@stanley.mountain>
References: <8f2139e8adf02b485a4c84d558fc23f78cf04add.1769195864.git.dan.carpenter@linaro.org>
 <20260126152430.1390514-1-horms@kernel.org>
 <aXeJYo-0iiNuXVGH@shell.armlinux.org.uk>
 <aXeP1y7cK0XRx3Wo@horms.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXeP1y7cK0XRx3Wo@horms.kernel.org>

On Mon, Jan 26, 2026 at 04:01:27PM +0000, Simon Horman wrote:
> But at any rate, I think the key question is should the case
> where regmap_write() returns an error be handled in
> s32_gmac_write_phy_intf_select() (by some means)?

Generally if register read/writes fail then there is nothing you
can do a the software level, you need to buy a new computer.  However,
in this case we may eventually put the registers behind an SCMI
interface so probably checking is a good idea.

Could I leave the error message out?  The callers has an error
message and if you ever see the error message, and even with SCMI,
the fix is probably still to buy a new computer.

regards,
dan carpenter
