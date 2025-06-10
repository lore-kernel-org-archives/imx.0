Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0734E22D4E2
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749570069; cv=none; b=dhxaUMUGog76U/n6Cbe03UUV+YHOoRPEQnRxU/piDU48b2PWFZJvC4HfEXceIHULvxOwQTUryBSwgY/HQv5mwluhBWEgeXwU4DgaV1Yqfg+7GVtlN/hAvALh3n4JtagkXvxzP5h37LYJQNXqE/Vx/NtsOFT85Aict6aNNpSuk2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749570069; c=relaxed/simple;
	bh=AtvJGadDdNn2deN/jM5ACKLSrWLu0JL74f9Qzw/g/es=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hGEjS3Gl4mrS3r6YANi5UP1D9Po7aC3kOEJFdj5YLYFbdvQ7M0n758vhnesnqUQRloXb6u+URP66rIIQqvaSeOozrXIAKROD6JyoPeT5YoS7PZh9MoT+2YFJZFNJmRwYZNdRbTEiYThL4A61zTUXrhcVYkCTgOp347vTKBSJ+5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rKvNLIGX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rKvNLIGX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-441ab63a415so58701835e9.3
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749570065; x=1750174865; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NueDFP08WvW+DK8xODEP+iBtJMi/d11N9xPcU6ggTQE=;
        b=rKvNLIGXy+83j1+1JEJ/g4G4whs6++WwGnAanHgy2W3rZyMk6aild1+qxkMHNwch++
         EGBnfyH3OO5gjv1uYt68KHGAZH84DU8tQ47VjG4/cguKHRQmwGxiajMlzURRUiw/pDWX
         9BbH4vn6/bxfa8Slnghh8d3nsHf2XDOeNsIswrpXWGSOt0sJoTG8WsaZb+drSWR6jS9Z
         XN2HBi1wfOpTbKH5QsWg83rfP41Uu/43IjG6jrLtxW9PCjsEtFMcYO9/yy8m6L3eJczv
         96lNXGee7YXdCM+r3UROhQTY6XtXlkEwiYW3qxkpYCLonpBM9ZoM1gopl4U1fSwaqBSr
         AeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749570065; x=1750174865;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NueDFP08WvW+DK8xODEP+iBtJMi/d11N9xPcU6ggTQE=;
        b=AzXymxSUsam023hLjPxn4reXdF6FAXhgoy3JS2+uqRyoCAppdl3uiMBzT/nNgXPjzY
         VwtvWmPBPeIuZwbfxWtu5K1Y0Vvl4enamG/v0S0/NuOFSfKrDLV4aeHrCZ9xLuOK+i8H
         9P9W8pU/WDQT1RAt7t2dGJvwHDC/i3NpkHw36bEMchD+VPqekdbnI1F9E9ShTfF0ec/q
         tfhnne7LV4HqgjUAhB4k1BgpLd53GlnUjTrVdUzT1xkYlGh9Wt3a3zYyYFF9b+QDfg+i
         UInozR16Gfobtxq0Q3x8caBcpoPS/HUC1kF0cL8XKD8WG5pkfg/sQH/d6bjCwlhp2NDo
         HP4g==
X-Forwarded-Encrypted: i=1; AJvYcCWCMX6TdZhqP1RQUAxBUdOJdGgfMhqdbmt3uSRbSxL1/jnoHoXUkxUffUugcQDFnMuHIPI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPk/T/mzpVKsTHwYU6jLnELmifnv13AZh8BuuQPGvA+7dJC18B
	t/eijnRKWPqLHHsV1DJ/VILqGJ6Nr+Cx+pRKyQ0Bhi7iFN534URL/h6/Xfj5eEXaOdk=
X-Gm-Gg: ASbGncux7QiAvuZ/pHkh5iI6c9fPdggNznrY2n+JndHO4rMik6CP+OgMR0WA0HOH+ex
	ewPz4f5FPdLIG35Ma30Dn7EXQESVnGYCd8zJ0LJ/57ehpdNpTnC/aYxudvseezjVFBHPAWqLbAl
	7sONPctp5x4NFE1yjchIo+vrmpBdujf2TyENrb8slX81AZSGcwv4LjXjQz4uytit+lR8NiY1WhR
	q8Mo8vGrJ98UJLwweyitI54tZ39g6Y4iKdr36n558RHSvEUKTaClUQRCL60JqBsvrOQ5Babqbuz
	k+tGz059fxfybUQfHo0X325ovFW5/sXGkPm1cU7k4G8+5pm2vzGiVuYRH4qTnWu/lJQ=
X-Google-Smtp-Source: AGHT+IE8vZWJXPJwa+gVU82KDy8mY6qQldYKeCEubTj2bvtmDCPRe0/J0ElfWijiPtS/DHNqS1NHVQ==
X-Received: by 2002:a05:600c:3b8f:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-4531ddeac16mr32168275e9.6.1749570065317;
        Tue, 10 Jun 2025 08:41:05 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5322ab413sm12488670f8f.23.2025.06.10.08.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 08:41:04 -0700 (PDT)
Message-ID: <9852a22a-1a09-4559-9775-2ccbb44c43c0@linaro.org>
Date: Tue, 10 Jun 2025 16:41:04 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: James Clark <james.clark@linaro.org>
Subject: Re: [PATCH 1/4] spi: spi-fsl-dspi: Clear completion counter before
 initiating transfer
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-1-2b831e714be2@linaro.org>
 <20250610113423.zztoyabv4qzsaawt@skbuf>
Content-Language: en-US
In-Reply-To: <20250610113423.zztoyabv4qzsaawt@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/06/2025 12:34 pm, Vladimir Oltean wrote:
> On Mon, Jun 09, 2025 at 04:32:38PM +0100, James Clark wrote:
>> In target mode, extra interrupts can be received between the end of a
>> transfer and halting the module if the host continues sending more data.
> 
> Presumably you mean not just any extra interrupts can be received, but
> specifically CMDTCF, since that triggers the complete(&dspi->xfer_done)
> call. Other interrupt sources are masked in XSPI mode and should be
> irrelevant.
> 

Yes complete(&dspi->xfer_done) is called so CMDTCF is set. For example 
in one case of underflow I get SPI_SR = 0xca8b0450, which is these flags:

   TCF, TXRXS, TFUF, TFFF, CMDTCF, RFOF, RFDF, CMDFFF

Compared to a successful transfer I get 0xc2830330:

   TCF, TXRXS,       TFFF, CMDTCF,       RFDF, CMDFFF

>> If the interrupt from this occurs after the reinit_completion() then the
>> completion counter is left at a non-zero value. The next unrelated
>> transfer initiated by userspace will then complete immediately without
>> waiting for the interrupt or writing to the RX buffer.
>>
>> Fix it by resetting the counter before the transfer so that lingering
>> values are cleared. This is done after clearing the FIFOs and the
>> status register but before the transfer is initiated, so no interrupts
>> should be received at this point resulting in other race conditions.
> 
> Sorry, I don't have a lot of experience with the target mode, and when I
> introduced the XSPI FIFO mode, I didn't take target mode into consideration.
> 
> The question is, does the module support XSPI FIFO writes in target
> mode? In the LS1028A reference manual, I see PUSHR_SLAVE has the upper
> 16 bits (for the command) hidden, specifically there is no CTAS field
> there that would point to one of the CTARE0/CTARE1 registers.
> Cross-checking with the S32G3 RM, I see nothing fundamentally different.
> 
> I am surprised, given this fact, that the CMDTCF interrupt would fire at
> all in target mode.
> 


It's working in my testing where I've forced it to XSPI mode instead of 
DMA mode on S32G3. I assume the command is blank because in target mode 
CTAR0 (aka CTAR0_SLAVE) is always used regardless of the frame.

CTARE0 isn't explicitly relabeled like CTAR0, but this paragraph states 
that CTARE0 is used:

   50.4.3.2 Slave mode

   ... The SPI Slave mode transfer attributes are configured in the CTAR0
   and CTARE0 registers ...

Any transfers smaller than the FIFO are working in interrupt mode, 
although larger ones are problematic because there isn't enough time to 
reload the FIFOs while the host is still sending (hence the error I 
added in patch 4).

Polling mode isn't working at all because it has a timeout which gets 
hit and returns -ETIMEDOUT before the host sends anything. Although I 
added the check there for consistency and for catching host mode errors.

>>
>> Fixes: 4f5ee75ea171 ("spi: spi-fsl-dspi: Replace interruptible wait queue with a simple completion")
> 
> To be clear, if you ran 'git bisect' to track down this issue, it
> wouldn't have pointed you to this commit, would it?

I didn't test it no, but I did assume that the wake_up_interruptible() 
that got replaced wasn't vulnerable to this same issue. Because the 
spurious wake_up_interruptible() would be "lost", and a fresh one from 
the next transfer would have been required to proceed past the 
wait_event_interruptible().

Whereas wait_for_completion() is just a counter so it has the memory 
problem explained in the commit message.

