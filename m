Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E46D145323
	for <imx@lists.linux.dev>; Thu, 29 Aug 2024 07:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724915233; cv=none; b=ZgyIm28vZkJpCiVIRqWaJ1iOoo0DRi79fzmNtpSN3A0LEkNslAgPXWYHREuITQfFKWJGeehMuLDabVsSr48X82toucFtbjFhdwzdhgMvOeOexDCK4nbUjCv1ivccob5RE87nJH02Yq2sN+dg2zFvTD1nxj02/4ajWdUQzLSNTqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724915233; c=relaxed/simple;
	bh=iIrdz8xHWQOEmDFHwlLnKLxhlF+qVRPko7F/x7pE884=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyoo58gmrVG9zCN4gldJ8KKjOyzJHV4VTzXdJRNyV501jDeJRs9ulJtqD6vdGl/vVnzwdse6ZjK/JVAJGGNELErA32C2VsArYTwob90rc8uxBRNwERVgMbebtDI/dzhzh1IbuC74yLyas5WrCG+oZmHudXHtTda9CVjJqrneMM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YQnRfx3J; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YQnRfx3J"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5bed72ff443so273446a12.1
        for <imx@lists.linux.dev>; Thu, 29 Aug 2024 00:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724915228; x=1725520028; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EDV7LYU2DJnsK4TmWVUaf/+yENKrN1KF0jvLEaGLdFU=;
        b=YQnRfx3JUiW0gL/UTmUXe1O9R6Ejxr8ci1JBFBLgGHnD85U8lgMvpYPRRm7fwlEy36
         Z0xHBXdbQ/RS9LzstECOySbWOw3oep+4fKgNTHkSZupefNoTaDO89Hs0cybovRlKEOoS
         4gWufm0U2WZtzh0xhX4n9PJnbsxSHHNj+2OFYHZfnk4Dnj+RgcYIcsDfVF/OyY+6ZNAF
         DMnKRT1c/htt4K51odPr4m77hn7utczCb/syza0bFS865E2NvpoMLKaKbu+E6+oipzxs
         SGbCh80ZZl8wWhVtnDuyGYyHl7wuvZ8hQFYgIOwbJwv6cpsFVgt0KsTduso2DMf2lTf0
         GSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724915228; x=1725520028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDV7LYU2DJnsK4TmWVUaf/+yENKrN1KF0jvLEaGLdFU=;
        b=BqlxcRonxtgrFWLyRDXsNZoe7JLIPU7KAzQsI9b3yLVD0UKEucK36J4/RkqbyEq1mP
         FFipJHBMZkZ06U0rvFDrjrPZUVNeV8D++o0Fuo2AMwhK3CnZ0sxLF/mzmjtUPGXHg5Sa
         8ZR6arOhznrSfwsZVGY5U1PUOBIigeprdHpkdveP1fT1xI8vwpFC8LIoYSrLN+JTVA3y
         Wu9I6zPPmsJXna030Q+rOjcKzD2T0k2IibWr6ymDLXifpNU0wApwQLDZqt9u81kO1V+D
         dV7kR9/JJj/ENkpUdsjatNU5TbUGXj+rKzEIiQos6ruTKY2G1Ei0/r5m36n0X+H+WbHs
         OPPA==
X-Forwarded-Encrypted: i=1; AJvYcCX4CPTInm97khooJ1Cn2/0pXWPY3Nlcri/mTp3xRcBa4e1v1tsGr9sUNWYRivD9X1SZeqg=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo4+L0JB4EGlRRHtqfRoWWO4FoU66bNZ0LD8MjpsVj6b0fQ8mh
	wcbo7qQW505vUfDOxP83JoXOWENnyvhUTjdfQtcwCCDA+5CkC4bPP/z0JGMgE00=
X-Google-Smtp-Source: AGHT+IFNrbFztgjXMHcLbgg0oT3MbRl4ZmtEJeLPKhMXUsVFcQa9Y3/vmFxcGOFsZGHW/LlDarOk/g==
X-Received: by 2002:a17:907:e92:b0:a80:7193:bd88 with SMTP id a640c23a62f3a-a897f8f78a4mr131638966b.36.1724915228420;
        Thu, 29 Aug 2024 00:07:08 -0700 (PDT)
Received: from linaro.org ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feae63sm38563966b.35.2024.08.29.00.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:07:07 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:07:05 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Pengfei Li <pengfei.li_1@nxp.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, abelvesa@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, ping.bai@nxp.com,
	ye.li@nxp.com, peng.fan@nxp.com, aisheng.dong@nxp.com,
	frank.li@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] clk: imx93: Move IMX93_CLK_END macro to clk driver
Message-ID: <ZtAeGWtJDMyTVkjc@linaro.org>
References: <20240627082426.394937-1-pengfei.li_1@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627082426.394937-1-pengfei.li_1@nxp.com>

On 24-06-27 16:24:24, Pengfei Li wrote:
> 'IMX93_CLK_END' macro was previously defined in imx93-clock.h to
> indicate the number of clocks, but it is not part of the ABI, so
> it should be moved to clk driver.
> 

Right, why?

All other providers have been using the _CLK_END from the bindings
header. What is so special about this ? AFAICT, nothing.

> ---
> Change for v2:
> - Use pre-processor define to simplify code.
> - link to v1: https://lore.kernel.org/all/20240625175147.94985-1-pengfei.li_1@nxp.com/
> 
> Pengfei Li (2):
>   clk: imx93: Move IMX93_CLK_END macro to clk driver
>   dt-bindings: clock: imx93: Drop IMX93_CLK_END macro definition
> 
>  drivers/clk/imx/clk-imx93.c             | 2 ++
>  include/dt-bindings/clock/imx93-clock.h | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> -- 
> 2.34.1
> 
