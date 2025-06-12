Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE08518A6AD
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 14:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737677; cv=none; b=pqeAh8tOD5x5XgkSgEM9OOVNRjgNjiOSinWmH9jTnZzi5lRnWb7yKnMQV+Lbw+D7E7wDaa/6I3+879nULOL6uSg74gOrf+0BAPUsQbUBWD0sMOrt590BzEQHWl26elhDj83tNe2UQo7sgOX/h5F1xSrVSuoYLm1zcjoIcpoNi/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737677; c=relaxed/simple;
	bh=60WDQiWn4ERcM4sXmxu8hCFJPSCd2H/JsWpNpGO9EBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EYVJg3+kKe2RFQRQygd7RNTuTHzYul2IyN1wrwo3LXJ9wcXqWn1PsIsRZNP5zDzJ3EWb93VfHsoL8rDGUV8mgqnTxA8s1Z55HtRx5vPtCNcoBDjZaLkP/V7DHGrPHX4wWwRUh8ncOZMgrtpcJJ59a69IA47jHPLJ0CUo0y1jQ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g1880hKS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g1880hKS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so871408f8f.2
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 07:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749737674; x=1750342474; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J19QzIs1SpN2V+Z84587yjfC+A6S3Z0DqJUi8/rsIps=;
        b=g1880hKSqq6cuvJ3zHVZ6GWB+aoJV0Wij5cEhl53Wqk0FZKLyR6Xk7U/vov4b6V4jA
         Hl14+Q09CAuRJvvfZGrN6G5w/YreFjSylyeW6cSnthN0ratLu6dVZaUjLQOjJNADaEqh
         XLSAAj2O7F6gY07epaPZRynHkLq79Ht0ZBgJ2FkAGMOZ8wXCztT05VveRuX86L6KOrnQ
         RMFYP0kFaDXgQb/50nmzgY93unuy7fgTP0s+7V+EERYxPXehAkyFcuLD+12cgSszZRma
         kewxn0fY+n7QTzDxb1laWgQVybcu6tAiEs1tDAd7zSJJAzimH94O6m7rr7vt/HQ6ALBj
         OqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749737674; x=1750342474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J19QzIs1SpN2V+Z84587yjfC+A6S3Z0DqJUi8/rsIps=;
        b=jjtp3bMTn4uc5yRYs1JbKRTr/buiVacy95KnV+i82mOn//y46kt4EJnWxOoELcVoXk
         Bmp96k++zRlUrqcpx2I1DL63PcRk8s0I7M+esBR30mfF/GZzx1C4Njc8RDjHW8c2XYrp
         y8phq9vInbHv0QQEe90g27FjEPHfEDWhAGeWCv/kGAK/6XaHlnI/aroDWTl2LFhUOoHQ
         LObhgDfYpXMtHY/0OtuJDYiTxVY+mgpHHoagM+cOSvuiUpYKL+80N61mZpA4CUyWYIkx
         xBENB1KTcqsVokPTJjxl65RPbqVqAr6zCESNoWNrh7f+BOx3oNO9VKIIRP0RLCi5BDSl
         v1nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuGUtanQaZSveKjB3JQntnwgGFJCEBzsOL1aUzZ+ZI4YHAEFqPutqpi9zk5uMtu2H7D4M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+pMTbo+XpUmau0g0bcSXHfP/9PHi0iz8dDFXBjV3+oPkM4xRX
	XT2+wngQF+mhlaygop5kAX4/KlIomkJqN3af3JiZTlnlVkeTbqrjWylVa20fCthvuKA=
X-Gm-Gg: ASbGncuEHkE9oGa/Gwj01qAavQqrWam6XcQTwSg9oKL/CymnOswUoMTRAc82xm25soc
	cOImtZ/hrT0eNF5whpS6mGQZ3+gZCdoOa/haliEsoPRdLxEtXA9UTcbjLDV4VUCEQaosVa6OcJU
	CSDJD13J6mF/fBUl5WNA7XdCz3eNyqEslnJ+ZkSH2JxX+OD4WoVoKUtyfs4TzJ7b2M8pU+jNLmF
	Z1WEmq+BJJ0oPe4qlVltN/DFfF1G3sP3zAP5zIXRNIc8BetSa4VCbZ/sMcQa2ZzQlyW+CahNucR
	s32L+iJhwc/RolHvokHYg80C8I2DepYs0de6am0CEtoIm+Tqu0r1hDaJnnyUZUAfBVEnhAd1isO
	K3w==
X-Google-Smtp-Source: AGHT+IGMvfoiQPigVo7iO2Dw6iilpFxrDO4WGsQDGLouqfPnH55vE1SO0OF49/vNlZbAzHfxJoNlPQ==
X-Received: by 2002:a5d:64c5:0:b0:3a4:d700:f773 with SMTP id ffacd0b85a97d-3a5606a2f5amr2978490f8f.11.1749737674171;
        Thu, 12 Jun 2025 07:14:34 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a56198f827sm2077031f8f.29.2025.06.12.07.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:14:33 -0700 (PDT)
Message-ID: <ad7e9aa7-74a3-449d-8ed9-cb270fd5c718@linaro.org>
Date: Thu, 12 Jun 2025 15:14:32 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Frank Li <Frank.li@nxp.com>, Vladimir Oltean <olteanv@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
 <aEhMBsqlx9I4XqJS@lizhi-Precision-Tower-5810>
 <de7142ac-f1a3-412f-9f00-502222b20165@app.fastmail.com>
 <aEhVsrEk0qv+38r3@lizhi-Precision-Tower-5810>
 <20250611090107.t35zatn47vetnvse@skbuf>
 <c65c752a-5b60-4f30-8d51-9a903ddd55a6@linaro.org>
 <20250612111514.rfb3gpmlilznrfxs@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250612111514.rfb3gpmlilznrfxs@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/06/2025 12:15 pm, Vladimir Oltean wrote:
> On Thu, Jun 12, 2025 at 12:05:26PM +0100, James Clark wrote:
>> (No idea why it goes faster when it's under load, but I hope that can be
>> ignored for this test)
> 
> Might be because of dynamic CPU frequency scaling as done by the governor.
> If the CPU utilization of spidev_test isn't high enough, the governor
> will prefer lower CPU frequencies. You can try to repeat the test with
> the "performance" governor and/or setting the min frequency equal to the
> max one.
> 

That doesn't seem to make a difference, I get the same results with 
this. Even for the "fixed" DMA test results below there is a similar 
small performance increase when stressing the system:

   # cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq
   1300000
   ...

   # cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
   1300000
   ...

   # cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
   performance
   ...

> That's why I don't like the DMA mode in DSPI, it's still CPU-bound,
> because the DMA buffers are very small (you can only provide one TX FIFO
> worth of data per DMA transfer, rather than the whole buffer).

Is that right? The FIFO size isn't used in any of the DMA codepaths, it 
looks like the whole DMA buffer is filled before initiating the 
transfer. And we increase the buffer to 4k in this patchset to fully use 
the existing allocation.

> 
> FWIW, the XSPI FIFO performance should be higher.

This leads me to realise a mistake in my original figures. My head was 
stuck in target mode where we use DMA so I forgot to force DMA in host 
mode to run the performance tests. The previous figures were all XSPI 
mode and the small difference in performance could have been just down 
to the layout of the code changing?

Changing it to DMA mode gives figures that make much more sense:

Coherent (4096 byte transfers): 6534 kbps
Non-coherent:                   7347 kbps

Coherent (16 byte transfers):    447 kbps
Non-coherent:                    448 kbps


Just for comparison running the same test in XSPI mode:

4096 byte transfers:            2143 kbps
16 byte transfers:               637 kbps


So for small transfers XSPI is slightly better but for large ones DMA is 
much better, with non-coherent memory giving another 800kbps gain. 
Perhaps we could find the midpoint and then auto select the mode 
depending on the size, but maybe there is latency to consider too which 
could be important.

