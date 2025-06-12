Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132EC298CBB
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 15:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749743250; cv=none; b=PI/NM7jKS5HgXaSJBxgWoEsmy4tCTwX+b2gsp64tJL4JwfIWsv5RuepO5vc4kCsR532rug45jN4LqvctDJVIz76cFZOKenv+juDINsTFKk3XC3AMlJtHW9Ldf84mlwk9lRa8rrxNjZYTAonQtFXacqVnvqM2fANvcV0kT8WSyNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749743250; c=relaxed/simple;
	bh=6EJWAXUizv4x6TeLRRJdm1zI0l44XmREmXJzX+1ANS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4jcEjhstBKSilB9g5C9Mvcn5jUIBcczuprWT1AsW6qbrCHCzGq14oOYoquiLmLhGsyGF+sWTBo2YHJWYg0dLqCF8OBeKr+SuiannrxZEXaPdClg11VioqEa0EnPuIhOGgIL+zIsrMdXaiMZuH45z0Zd+K3vB+CQ/MWC3CyaBVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I0bp+1WD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I0bp+1WD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso9497875e9.2
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 08:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749743247; x=1750348047; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zh7m5aFTZexY03nsf1b1OGgOvOMdgi7k2RJzccpdmoQ=;
        b=I0bp+1WDbi2lcCOz2XCiGWG8RO/Ufw9VNbAJAhOLpJOSPQFq8h/wm9x0PZl3pEzvge
         iWzBdmJq4/OTikTgLSHAs7lWo6ZCOFFP6xfUzKttTjNEdR6ej31WPL1Ntelf1sep1PnR
         qWL0w13M6eDFKX5KLPMxPYxiku9ql8Pck++NTJZbdB9ezmlUEYlqQb10QJ8oUsYd7O9j
         6t4juGKFbZwjCc0Xh6XayjYYGx1/tt1aDCkI5Dvu0RFqKN6rvA8lMepHFb2RuewTnadU
         P97JX0gwTAPjeb2/PpTuT0RJSq2Hee0Lwcz1W3HMVahA1yRGMrjTD2FK4nMVwLlD62l8
         2zBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749743247; x=1750348047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zh7m5aFTZexY03nsf1b1OGgOvOMdgi7k2RJzccpdmoQ=;
        b=PFUgbX2LHhIBBDde0+HmxZbiWFA+b6SHY1lKCDWAWXsjT3o82hV/2Jgc1B9rZxpuxa
         KxSPmt6E2ybOMdXJG1s0Mp1RfenS6CXCBPW1dfAHJ2w/qLlV3kWCNjN+LVY5gZNO1BqW
         HkyM6jlL9kcKFfdTSV3Eowj/s7TbNHi+U6wLvxVo/GQ1aphxDJ8YuD8JJqyUO52ympz3
         IOO7frGcUJvL8bTxCUcqAu966iXYhX3Mm6a4GV92C/uXwZ+XCM3lGn2scolTqYId/L7P
         gKK1BhmgZRMdbZg7MUr7UbcePNC2Mu5yzXWapxZTD5qtxy+cb+Zx4++ANyfmZUDgyINK
         53SA==
X-Forwarded-Encrypted: i=1; AJvYcCXihmC0hiz9/chVivXhme/FsMDfJ22GU9ekZdNd04k1pWhEfkK9u51VkCFSElMYvCmGpdE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3khp5CdnPC3WV/Aifv7PiAsoUGJkBqgUggOKEunHTLjoh9T+N
	H6SaJdlwblXwF8my/Mj4ikZIeVU/4sH+DNN6ILctDn/u7Nij5rENmSWh15JjGprmShk=
X-Gm-Gg: ASbGnctZzF1Gc2AQOAQ/VaK7QjeSNy/jzBvWgp8QCqJVxO99zf2Mn4Vm0Wq0ncj4RYl
	HYoneuKd22YhXvRQ3ngUF+y2gu+C4FSSHlJ9DXuTbeLu6L0EZP2i9s8rOXgNF4KXBr1FB4pwov4
	1hSey4lInPMO+UwIdrDtb3WDalRj0Uxv/NyZJYxXQTHMlJUzNJR69elLwLSK76w/Df2Vcb48hxY
	Gx2OnhPOxHvdgVHvRTABCVyk7ynG4c7TAjOx/u6eBMOgb3d76vfUFISx8o+0Z1Q10BnLB5YNpTz
	VyxuLONP7EY+52sPGxDN2biHSXrM3dXV+bIN9eW9JbYL+wbKMKkegzWX4ZMisqmMu0/pF0MrwSc
	/MQ==
X-Google-Smtp-Source: AGHT+IHczznv5LyNR2hJXOddUvykY6/Q7P2zOffstHCE9b07Vxo76rhyxFFsgAzhcmc0JU11Yz5PdA==
X-Received: by 2002:a05:600c:8b08:b0:450:cea0:1781 with SMTP id 5b1f17b1804b1-4533436e50fmr1615195e9.16.1749743247314;
        Thu, 12 Jun 2025 08:47:27 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4531febf905sm69898505e9.0.2025.06.12.08.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 08:47:26 -0700 (PDT)
Message-ID: <78d77dd0-2ddb-4074-8f2a-debc7bc41fe1@linaro.org>
Date: Thu, 12 Jun 2025 16:47:26 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Frank Li <Frank.li@nxp.com>, Vladimir Oltean <olteanv@gmail.com>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
 <aEhMBsqlx9I4XqJS@lizhi-Precision-Tower-5810>
 <de7142ac-f1a3-412f-9f00-502222b20165@app.fastmail.com>
 <aEhVsrEk0qv+38r3@lizhi-Precision-Tower-5810>
 <20250611090107.t35zatn47vetnvse@skbuf>
 <c65c752a-5b60-4f30-8d51-9a903ddd55a6@linaro.org>
 <20250612111514.rfb3gpmlilznrfxs@skbuf>
 <ad7e9aa7-74a3-449d-8ed9-cb270fd5c718@linaro.org>
 <56b158fa-5fd6-4582-8ca1-296863d6d2a8@sirena.org.uk>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <56b158fa-5fd6-4582-8ca1-296863d6d2a8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/06/2025 3:43 pm, Mark Brown wrote:
> On Thu, Jun 12, 2025 at 03:14:32PM +0100, James Clark wrote:
>> On 12/06/2025 12:15 pm, Vladimir Oltean wrote:
> 
>>> FWIW, the XSPI FIFO performance should be higher.
> 
>> This leads me to realise a mistake in my original figures. My head was stuck
>> in target mode where we use DMA so I forgot to force DMA in host mode to run
>> the performance tests. The previous figures were all XSPI mode and the small
>> difference in performance could have been just down to the layout of the
>> code changing?
> 
>> Changing it to DMA mode gives figures that make much more sense:
> 
> If not having DMA mode is making this much of a difference shouldn't the
> driver just do that?  I'm not seeing runtime configuration in the driver
> so I guess this is local hacking...
> 

Yes just changed locally.

>> So for small transfers XSPI is slightly better but for large ones DMA is
>> much better, with non-coherent memory giving another 800kbps gain. Perhaps
>> we could find the midpoint and then auto select the mode depending on the
>> size, but maybe there is latency to consider too which could be important.
> 
> This is a fairly normal pattern, it's a big part of why the can_dma()
> callback is per transfer - so you can do a copybreak and use PIO for
> smaller transfers where the overhead of setting up DMA is often more
> than the overhead of just doing PIO.

Makes sense. Although for some reason two devices already use DMA for 
host mode and it's not that clear to me what the reason is.

