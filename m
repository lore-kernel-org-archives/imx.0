Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D6878F37
	for <imx@lists.linux.dev>; Mon, 21 Jul 2025 14:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753106534; cv=none; b=AwiE6UHd6OCpqjSsEZeuI1UUwbQHWLtNGXvJuN3kr8s+DWAxewTNWjrk1ukqhwCF0YOWHdrhReOeOusb6yTix6tZmGCk27HQNYwpTLk3RoORWIvG2QMjpyb/9D4urwPg/wdOAaYe5sxV/mBBmhXkHy/2d8jYrrF077TaofEkTSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753106534; c=relaxed/simple;
	bh=K/tvH/XPupJbti3h3akfsqzcD/XB20IvWkJxZTtRarc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QV4qXVIgiBwu2h3DBPNegnu9ckTWohEDQ48e9AjyUxegO8NTxItKgGSGuqDy5/OYcJNL5O0/4Pc1HqU395fpRObNO2ytDW0igpvkjY0wA6LTO7zWi6xvfOSg4quB80hK8+RQyfVMP/uAvw65Q9Uw/xxxV+lmHQvxdeT/7HlYRIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XuDJlCd4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XuDJlCd4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451d6ade159so31920375e9.1
        for <imx@lists.linux.dev>; Mon, 21 Jul 2025 07:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753106531; x=1753711331; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JysbhfPyNzahvE6I7WOWc6CziM6SyuBgK4O6jVYWaZ4=;
        b=XuDJlCd4D5tuUTq1fdWwoaUkB1acAYZ6SzF+D5FK3bHgbGRgGF38Xt6q7rk14eOaxX
         ZVaAoSwOdc8t94m9yMz/xqk8rCJJV6ahSYqE23Bf4JFgfOFDKf1dOsnuGUhUzVdKEVyL
         MdGFPCqSK9p/toEr8BXbka4249mrRQypAaW6UZGz9v1FOvZRINlXGurjSTMT9hWkTu+8
         euesLur0kdt5d+6kDTzWwMy6QhMRkcEqltKsUUEHu5qWplkZubwc6nME4VHPo2hsQy2x
         9xTtQOZxgF3KgU8mMwFnMXL0uAvJUtbAzkyljhz1SqOE2DS/TCHQN8oDfi/+rhm4Ff90
         +OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753106531; x=1753711331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JysbhfPyNzahvE6I7WOWc6CziM6SyuBgK4O6jVYWaZ4=;
        b=Rk+sBMh2ND3C62bPP4aB9CCmvhl6l9T8hpshYfNr7NU+XdGu+EGtF8erhg7jdjQD/P
         Ub6XaE1fv4KvCtupjz4J825Mc+5rzn/6UirE6jtLeH2x4m4uBWR3eRjhGc04xHrUdt44
         iWk/ALAOGZF/kAQLecYrXaVoQF7L+xNW0RGCD3GsXCg2jXRZk+QTcaeZ280a+ti2xgLj
         QVg3NVL7Q8hTJ6SNxiOYT/BDwug5NgfYLuvymgOFAh5n97XFoYxZDx8oJXOQYTakXml6
         lZFqzb8YPWvsbCzbMPLymQFD3YBLKzhUgdH1/7+y3ok6sTb/UCITk//BekECw7mSSIn4
         nNDw==
X-Forwarded-Encrypted: i=1; AJvYcCVXWdo/oGUJK74NBvK74TgKnvDqgO19Z5EDBgFKOp+fPvTH0oQbObLDK873CKmH75UZOms=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyuld+9fCfTV7QTXu81aa54Ljc4IrhNLwpYwxjticjkbRwBBhaO
	sALd/txU0b11xg+vXbZlQ/wm10RxxahybmQCqbcB2DhfztrFJ31aEoCisY4zfUa8JoE=
X-Gm-Gg: ASbGncuKXhWelPXMawvkCoLuAOw50T6I6yAV30DlYtfNIEG+STnBnnWhxApPlwn5fRb
	h7OwdX1M2PXK/Jz/R1HxnmjbVfeYZIwZjVcnAkvHHdoloqTkAuF0JZygy7xgbBdumPCF61pUuWH
	MP1EcMaHGiJkainSO+Bc+NkTi7KV42rzDcBfhYmu2ASGdQEmbxfyttnK1Z9jK7+/p0TmmpQRArC
	c7KWEnnr3bnBE4puCNBfmd21PeT9b4bh4V4K/ffomqZ3y77h1F02gSOo8i/D4S2o0GlEU551Cpu
	QxCzSq0JLutVf2Q+tDg1DM3AGQ60+YdjN9q+Qql0knABGqTNARsCR7TdPA9U0pnC4u+7DlIRAEp
	rVtrcSLSWFsxbfsNroDKIYGCXtRo=
X-Google-Smtp-Source: AGHT+IGOX5JDkng8uIhW+zosXPHsHWQGM69v40Uruv1QlOIkOEgGq49oUq4QtzyThAB5R5cnQLsYTg==
X-Received: by 2002:a05:600c:3b88:b0:456:25aa:e9c0 with SMTP id 5b1f17b1804b1-4562e355c9bmr205979635e9.14.1753106530850;
        Mon, 21 Jul 2025 07:02:10 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-456490dc57csm44070625e9.4.2025.07.21.07.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 07:02:10 -0700 (PDT)
Message-ID: <e23bac2c-c39c-4446-9305-e7e51eabcb4b@linaro.org>
Date: Mon, 21 Jul 2025 15:02:09 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] spi: spi-fsl-dspi: Store status directly in
 cur_msg->status
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Mark Brown
 <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>,
 Christoph Hellwig <hch@lst.de>, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
 <20250627-james-nxp-spi-dma-v4-2-178dba20c120@linaro.org>
 <20250627213041.vp6yfcgf4xysdklf@skbuf>
 <eb704af4-5800-49b6-9915-c990c5b23fa1@linaro.org>
 <20250721133958.dhityxa7vvtqov3d@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250721133958.dhityxa7vvtqov3d@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/07/2025 2:39 pm, Vladimir Oltean wrote:
> On Mon, Jul 21, 2025 at 02:25:55PM +0100, James Clark wrote:
>> Hi Vladimir,
>>
>> Just wanted to check if you are ok for me to send a new version with your
>> fixes included now?
> 
> Yes, sorry for not being clear, the tests which I wanted to run were
> these ones:
> https://lore.kernel.org/linux-spi/20250630152612.npdobwbcezl5nlym@skbuf/
> 

Got it, thanks.

>> I assume from the other discussion that we don't want to always enable DMA
>> mode either, and we'll just leave it for s32g target mode only?
> 
> Yeah, for sure don't enable DMA mode unconditionally. I don't have time
> right now to look into Mark's can_dma() suggestion - if you don't have
> either, I suppose it is what it is, and the performance improvements
> brought by your enhanced DMA patches can be brought over to other SoCs
> at some unspecified time in the future.

I think incremental is better yes, there wouldn't be much or any of this 
thrown away anyway.

I'm also not sure if it would fit with can_dma as that starts mapping 
stuff in the core layer. We want to avoid that because we need to write 
that control word for each SPI word. We could still change mode 
conditionally in the DSPI driver though, or make can_dma more flexible. 
But on top of this for sure.

James


