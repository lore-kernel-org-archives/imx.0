Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEABC187FF3
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 13:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724420918; cv=none; b=V9PO/QjwXBDcXDFwX5RATQgUH/xjKhHGDU7jPBW6ykk6FOWIJ1C6AZJ4ZVGLzK6DX1vQGp/5yWkUX4fBjbc6CvTnUT7noF0Uqtl3k/dguJ08zeUO8u6HSyND405kiFNIQs9hIR0xT84IiItNVgdIqsQgDGC+2Z5lalqJP5QIY9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724420918; c=relaxed/simple;
	bh=marIxUI4id/urQjGYVyABoFpJCtk9eZAhTRVhqbZCGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enN1996oPuaowPwtC7Y4BTVmmXWHf5Sec5bvAwbaEspdfEth6iDF0Xa4+wCAnPE6ie/LaY+0R/F9iMIfI3is6iKTITDP/eC74OXOJtIPDXJy3S4nEIN4dao868bKozTbLBmXq9nqhvZo8291QHgNJB7u++ENhZXNM6TMPkNSIic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HprXuFlZ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HprXuFlZ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5bef295a2b4so3286877a12.0
        for <imx@lists.linux.dev>; Fri, 23 Aug 2024 06:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724420914; x=1725025714; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QwrD/lbeRNRzoVUmgjpRWde1MN0URKCkPBQFtW3a+vw=;
        b=HprXuFlZDi8qk4T/j5RtFn68QneYQtjSbyr0tUcnOTdEvbvXk/4XuF9AgZDPsQ96wU
         6UU1f3L6NhMfIajsV4wn2fo5100fRnD+VjmC1Ecl3aB0Y0TWSP5mlD0ny/b08+9oBsFU
         Mi791H86ZqHpQUiAmDvPlBHH0YCysfvLqGfrhJxPdqRs9KQdzrmYnKoOmCPGggqaBUAT
         K6IHW2g+fUCKx7EHSW2ymwG+pDjA83tOp/amfWC9gOqDyY/PkCx0qhpjJo8thG8G8YZM
         0y7xwVXZp9/+3Ck/RD8UR/Dz2IDrlnyGa4YImLDgAsY3R3AHud+gutkA0g1b/ugJsKKE
         7e5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724420914; x=1725025714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwrD/lbeRNRzoVUmgjpRWde1MN0URKCkPBQFtW3a+vw=;
        b=g9+pSB3TnmWVC1LTYVAimwBh0dS/oAXz5PnMoaECmylTCSDM0tU1Yr49TlgXxCklUp
         xV/hSBtoAk/DMquTUCzv+REerxlRGinXm3eDQ0wAU+WY4nOTPL1F7dE3t6F8cm7iApiO
         J6TMGje4VTqcXXGcQnEekq8rLJ1VuLPMMJ8+dY+d/F4eBcmqJTqhM+SxbNfH1PFbGh+R
         /nJMwG0Bbz6AInEjUKhpQhcJCBWYqA24pmEhEAa0rnx6q+Q0pT4hu9mea9PDPy3lSyNP
         wzvGRdYrWDu0eBEDOG0nYQjVYboPHR/8tv99/OQYF6xfIdHCj8XOXoFuhicjIfDqgmUS
         4gfA==
X-Forwarded-Encrypted: i=1; AJvYcCU8HDISntpNGPa6NiDE+hdHid+pTekB3XyoF6yyg2qzF99a88Y6Y9MGMG+ceIJJ5pYMGtw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVfSkqQdrY8opJ72OCEi5L2/2A5uGcR2a+zLWquIIQ130uaWW5
	r4ROsXr4qEVdyYW5VOoV/Im4XvukGOcMiDvxbS9K4IqlI6qJRelw
X-Google-Smtp-Source: AGHT+IHd2Dy4icrEZJ3J8EXqviPjWTYhwIADABNxwIWTMxUTKe6s4D9yDboiSs3kZIrTIP397YtD6A==
X-Received: by 2002:a05:6402:35ce:b0:5c0:8ff8:d7da with SMTP id 4fb4d7f45d1cf-5c08ff8d8d6mr325127a12.12.1724420913934;
        Fri, 23 Aug 2024 06:48:33 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:48ba:80d8:cf77:1f49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a4c438fsm2110850a12.61.2024.08.23.06.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 06:48:33 -0700 (PDT)
Date: Fri, 23 Aug 2024 15:48:32 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	Frank.Li@nxp.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <ZsiTMITWF0Tj3o8Q@eichest-laptop>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-2-eichest@gmail.com>
 <zudo7zjlxqfxipsi2x7e4kyhckvkjreovrdmsfxp3m6clbbgzv@ina4j4qxu24r>
 <Zsbi2xcxBGE7o9uE@eichest-laptop>
 <ZscNO2PKNlK3ru_7@pengutronix.de>
 <2bbddaxyjkxfmlgmq3yqcbzo7dsb2pq5bvdatk2y4ig4iintkt@35btqkdv7sy3>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bbddaxyjkxfmlgmq3yqcbzo7dsb2pq5bvdatk2y4ig4iintkt@35btqkdv7sy3>

Hi Andi,

On Fri, Aug 23, 2024 at 02:35:54AM +0200, Andi Shyti wrote:
> Hi,
> 
> On Thu, Aug 22, 2024 at 12:04:43PM GMT, Oleksij Rempel wrote:
> > On Thu, Aug 22, 2024 at 09:03:55AM +0200, Stefan Eichenberger wrote:
> > > Hi Andi,
> > > 
> > > On Thu, Aug 22, 2024 at 12:21:30AM +0200, Andi Shyti wrote:
> > > > Hi Stefan,
> > > > 
> > > > > @@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
> > > > >  		goto rpm_disable;
> > > > >  	}
> > > > >  
> > > > > +	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
> > > > > +
> > > > 
> > > > you might also want to add the multi-master boolean property in
> > > > the binding.
> > > 
> > > We discussed this internally and weren't sure when it was required
> > > because e.g. i2c-rcar and i2c-tegra don't have it documented in their
> > > bindings. Is it still required if it is part of the dt-schema?
> > > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml
> > 
> > The i2c-imx.yaml has "unevaluatedProperties: false", which fill discard
> > every thing not in this yaml
> > 
> > > If so, I will add it in the next version.
> > 
> > Yes, please.
> 
> sorry for the confusion, please don't add it. I had a chat with
> Krzysztof and I will quote him: "this is a core property, coming
> with dtschema, so they dont need to update bindings".
> 
> He also sent a cleanup to remove the only binding using it.

No problem, thanks for the clarification. 

Should I still separate the multi-master patch from the rest of the
series, even though it doesn't seem to fix the problem Fabio sees? I did
some more testing today and the workarounds he found do not solve the
problem I see, so they are definitely not the same.

Regards,
Stefan
