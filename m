Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6E8320B
	for <imx@lists.linux.dev>; Wed, 11 Jun 2025 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654045; cv=none; b=O9U0XvgeJoROUhFHw/Vc/tWjWaF89thXXgNn7Li4HfnY3FUWQW/pm3yvf523Z+XRccANlLYhkeMbVWIUpKJhSIsBSM2BpcRbb1THhcuZDmuK2rks4rpwyZ68EZxFmdG6msR1BaNOH1aA7q9Y0i7nnlQKvkNM1pWeyP9hi47/OT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654045; c=relaxed/simple;
	bh=ya+nEh00fQFy2gMFSp7ZKYL/qH5nwJRnW3gq9p3hfHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSMnJLRvp44uFIUGdBztIHBQ82yeA22iHfPhv5sPli4ZgKr4qDFJUwgHTu0zlKOL6ZaAmB40RvNcfZOgjPCJ0R80tpMAE+5qFfJ/GN7+sO5fgP+felphsEUAhw/JApvyRFxfnlPMeDlB6vnf7l08Y9UKf37EgWU/SyVXxzVBsSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=efoxoSke; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="efoxoSke"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4508287895dso6920805e9.1
        for <imx@lists.linux.dev>; Wed, 11 Jun 2025 08:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749654040; x=1750258840; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=edmPMFPNCGBbcUfHWPuxKmJMbMtdOOjJESV7iS8XvxY=;
        b=efoxoSkeZrsxg+T0ZrU2BlTGfaelgI3ZVWUkD/8DX1JgnLw4xo6C05O4j0PVM0xuvk
         LgwfsA4cqLUcPlZsTTKn449Lmh+Rd5y0XTTg3rlaSSQlrygJM+MDBhB9UQC9GyHlEqYm
         RIfAus72eFr4Rroz7IwjQi13Jc/4mfvGDFRUKyQS4SUpnqlSFiWlYQGZxw8CNYmvT6PA
         fDODv+uYd14w0qLs/I4+5MxKeBVcHEErnT+4ScWmW08sTxvgiOvRKb+5b8fvjuqPBwjR
         ZAOTwOvXycuizHdz3FXqOQNjYs8fbShkUGhb3vOtHVfYq5i25B3Y3eJlkHrCeu2wxmK0
         lpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749654040; x=1750258840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=edmPMFPNCGBbcUfHWPuxKmJMbMtdOOjJESV7iS8XvxY=;
        b=Nm2/uZuen57VpOH1wyBLFK8OR9I6hgUGX6qFOCPMFqaey0oLmcE7yF9lRwu6+xYpj4
         GtFxIYb2l90c1PDaL2dWdrP6KBCr374aCj1dFnVolKCHxktyaFjXr+Jf8vOwwXmjV85g
         qase4lU3fc0IDTNh++aiEdlokP1Xg9fYgeWSYE1oHtWHIL6EnPBwSJaVPK9UwD5M3I2N
         b4t4b7XfoWLJU9rLUbdK9VdS2fcAjI6aTqeT0UpNJQSBXHw8hzCeVbufWCZuPGpWnU3p
         0ZodNSjV+vbTiBhRhl8gmFftp5RDwa5EKxUMwL/24D2enHmxmrmExiiuP6I2H8sqFhkl
         ozPg==
X-Forwarded-Encrypted: i=1; AJvYcCXP/pmJlqhuvFJHLTTarLMhQgs5UvwG5W6+C3VqdS1yrX21AXSyX+QlXresDCCzrqf3zpY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1dxjQ+TDfPM6OVkBzaxUjQg12OoOhu0aIgbif6gU9G9xFHRxe
	BoSt6KcNKtB+FG47ITM6v/lkalUGDgBvR9prjmrKKRCb01PNH4S72exc03vQfV/iyyOuGrfE31c
	ZqOJ8
X-Gm-Gg: ASbGncs+LvlaLtDk1ekq6eiIQjwETmp7el7TX+iJtsBG0B3oEuCGIC8oyxZw/mswtvo
	M5b/v/YXPtFWEfN3CVrYefEPjfJbfvc4NMkvzwMlZNf73qZ2xauCL19SLU5PjgthzNNxx+Pg787
	pK91ONAKB4qUeyO03kAZ0CqX9oemPdZP4cncI0NDhdhE0oXG5P5RUskAMYuLgZ4bxzbdizVeIi/
	D1g0pkFuBaHD5EOr0ewhKgMGVjriWEYZVM48L5NXWI2+6LEyfj9DvP66x9ioNtJSz510T9jj3vp
	LrqjW62zia8F38nvFfUEV0jqhlMqPXDCxu7AAKBrqiN5ZLdQkOyWnMQGxv604kSjsao=
X-Google-Smtp-Source: AGHT+IEzzhcppUbW1+BdtVXwBwJBi0yjHM3LGcXgg4DBHtCKKJdkIrDeqab0FDLQ5lwfVDcVY6scNA==
X-Received: by 2002:a05:6000:18ac:b0:3a4:f70e:bc25 with SMTP id ffacd0b85a97d-3a55825d69dmr3535626f8f.27.1749654040196;
        Wed, 11 Jun 2025 08:00:40 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532464e3csm15804587f8f.99.2025.06.11.08.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:00:39 -0700 (PDT)
Message-ID: <472a47da-e442-4335-92f3-9a0263107fc8@linaro.org>
Date: Wed, 11 Jun 2025 16:00:39 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] spi: spi-fsl-dspi: Report FIFO overflows as errors
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-4-2b831e714be2@linaro.org>
 <20250610215233.35ikv4sslkyukgwr@skbuf>
 <d95fbd83-995e-48ca-bf23-147caa80b9e1@linaro.org>
 <20250611145634.ncbzl6wwwxlidjl7@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250611145634.ncbzl6wwwxlidjl7@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/06/2025 3:56 pm, Vladimir Oltean wrote:
> On Wed, Jun 11, 2025 at 03:40:40PM +0100, James Clark wrote:
>>> Also, could there be individual error messages for TFUF and for RFOF?
>>> If you are concerned about the penalty for the error-free case, make the
>>> check two-level. First for all errors, then for individual errors.
>>>
>>
>> If I was going to split them I would probably let the compiler optimize it
>> whichever way was best. The real reason for combining them is because
>> usually you get them both together. As long as the message and fifos are
>> configured correctly you'd always get TFUF and RFOF at the same time and I
>> wanted to avoid printing twice for one event.
> 
> In that case, why not:
> 	if (spi_sr & (SPI_SR_TFUF | SPI_SR_RFOF)) {
> 		dev_err_ratelimited(dev, "FIFO errors:%s%s\n",
> 				    spi_sr & SPI_SR_TFUF ? " TX underflow," : "",
> 				    spi_sr & SPI_SR_RFOF ? " RX overflow," : "");
> 		}
> 	}

Yep that looks good, will do that

