Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CB6272E56
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 08:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751014340; cv=none; b=nmGuSJZCCugEb+lUFr2JVMzs+yMK8lxOr0Jxz2UjirSe7MIg1j02K35r3sZpx4QUGetBxcQzY2VmyH0N+g0GattZtWyNrdqHZVoIh987yIprofJkS389RUHAqSnlYRmm/lcejxpXenJEwojg3C4/xbII/l9Hg/dOmrBXeGXO6r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751014340; c=relaxed/simple;
	bh=Trp2tEL9MBTHjgrxShlRCBnJKQ3r7660UkyS6y6g+ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gEc+pipSaQ+CBeudguuTMS1HFz7HD9TZ8Am3DAFbVMhSTNdOJZYfbxn5rdnowkIEP/k8rWBIzSwjkLts5m0BLJg0GjXleMecLYWBjdYD1k5JqF8TpCW/qVQhIz93ECITKZ806etkvfgMNA9v07ueTEckf0AVFNMZnzHBf+g+490=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WA+Skm3O; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WA+Skm3O"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so1354340f8f.2
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 01:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751014337; x=1751619137; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UoFUdFqAipKbBMVUce6Z7qQLfXF9kagacYpEqN92/d8=;
        b=WA+Skm3Ogt3EuCXa53usWZRxIHz0SzgXkrgprMHYxKsuuxPIx+v4tn114JCK2Xc5y8
         b1k6hXa6vERNjS5/t1eQP0k80LIA/FoASfY+OMolg5IG9hSvzn/6gMCkMHdK9KPtCFZr
         V/cWCQSiwwPAZ59HIbtwe1SSom9KoPDomBkosmOnC6bnoqspcGQ5L3AaLC5w32nbU1bx
         0WLB3XKFrNRvYSanBMSDmiLJ20O0+ufSptZiWIjerQV5qtZOMiSiAarJXQjH6PEvCbvR
         8SdEctRJp1/XNpBDlnZU0mraiV0oruk2KwlPjBb2E7h5aZSUcUj75N/zgU6aDnHCyOS5
         WPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751014337; x=1751619137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UoFUdFqAipKbBMVUce6Z7qQLfXF9kagacYpEqN92/d8=;
        b=mtuQo+pYzlozsej41PmeO6HQB5hPHbdXvYwntRjJj2RQc9Zff7fi0hHhQ12Hyhf7zk
         NoW/oCO6nA3REc9PK3Wh6Vkf7cU8UiSm9YnLxYJoXZYrUq2JvmFlVdxo6CgwA7kXreIJ
         /Dfd2XHO+1b/LECudtk1d709e1tOU+oq8B2QzusRPOy2Hlhi2E2LKhmLpzsCuu5lYjDO
         6dCAzx/ooCj3JTLNtNXydNS5DDADDKDgWInR4A+Wn59Kq/u1sYrWTuI9Y/oAEsSdhvSA
         qtCFHEfO/J5kNxaXuUzqte1nLxFNRBh5YiEM+pH/gpqpalKLy6mXVilKlRIXGI0sjDjo
         KYzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSb8YdyWCx1farVSX68Zo8qVcUopmHF/I4AyIuDCagBSlhSMsumYl1p01mf57b6ciH88c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAq2S/IJ7T+RpMl+prJgByX9haob1fk93IirvHXyaedUpah59j
	eRHPI/xZUad10+T7rk50zFVnmC98scIX7eo/vlqwzIWJy+ynu7EwGTvont0BdSWvpZg=
X-Gm-Gg: ASbGncvfbf7FOTdILLLExvhxWE5E6cc6/0oprqXDVJAwiSjCW1w2bESWPH80Xk1yo3B
	brfun3baF0FY4j2LUEU4MmYxbwrTRDy0ZwwVOMsKH0qsyGAdPSqaXbz+cksos3vJD3ncbcjVYWl
	hOYBI2+OrDD4Uw1IaXOWGNZS2Vo8Q5cZflbrONQfl5Uf4GbFGNNA1Dq5qHjQDC8/mze70xc2+cG
	531IsD9SxdlI+xWpTKhYo0RTnEPnYn07uRBEQ9CGu7fw1OgmdYLibAOPIASBaeuKqLbJ0cIOitW
	W3poK/XDvcAVv1z3fwoIqm+mnd6lAPlxnyr4XBAkKpMIP1Q3B+aGiAfKn/R36yL6VvtLnVBTdHy
	fEQ==
X-Google-Smtp-Source: AGHT+IECZfBrc+AzA+5LfKHuhgle/QkdG0KHezJE31byGodBUKLEFLFk2mmygHC6OYjmlmscdlmdXg==
X-Received: by 2002:a5d:4a01:0:b0:3a1:fe77:9e1d with SMTP id ffacd0b85a97d-3a90d5a7e61mr1890018f8f.16.1751014337246;
        Fri, 27 Jun 2025 01:52:17 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e597a8sm2071994f8f.70.2025.06.27.01.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 01:52:16 -0700 (PDT)
Message-ID: <19302e67-7df1-4100-912d-c9b426a4b943@linaro.org>
Date: Fri, 27 Jun 2025 09:52:16 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] spi: spi-fsl-dspi: Report FIFO overflows as errors
To: Frank Li <Frank.li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Larisa Grigore <larisa.grigore@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
 <20250624-james-nxp-spi-dma-v3-6-e7d574f5f62c@linaro.org>
 <aFrXRDJmMgt0qTlL@lizhi-Precision-Tower-5810>
 <0e26494d-7b85-4874-a2e4-a498ce1864c8@linaro.org>
 <aFwN/LlXEmv82PcF@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aFwN/LlXEmv82PcF@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/06/2025 3:55 pm, Frank Li wrote:
> On Wed, Jun 25, 2025 at 11:09:57AM +0100, James Clark wrote:
>>
>>
>> On 24/06/2025 5:50 pm, Frank Li wrote:
>>> On Tue, Jun 24, 2025 at 11:35:36AM +0100, James Clark wrote:
>>>> In target mode, the host sending more data than can be consumed would be
>>>> a common problem for any message exceeding the FIFO or DMA buffer size.
>>>> Cancel the whole message as soon as this condition is hit as the message
>>>> will be corrupted.
>>>>
>>>> Only do this for target mode in a DMA transfer because we need to add a
>>>> register read.
>>>
>>> "We need to add a register read" is not reason.
>>>
>>
>> Maybe: "It's not likely to catch any errors in host mode so optimize by
>> avoiding an extra register read"?
>>
>>> Add checking FIFO error status at target mode in a DMA transfer since PIO
>>> mode already do it. It help catch some host mode ...
>>>
>>
>> Are you suggesting that we check for FIFO errors in host mode too? It
>> requires an extra read and check in dspi_tx_dma_callback(), but I'm not sure
>> what it could catch. Realistically as long as everything is setup correctly
>> then neither of those flags will be set. It will either always work or never
>> work.
>>
>> It might be better to add it later if a use becomes apparent otherwise it's
>> extra noise in the code.
> 
> I think your origial last phrase is not good enough. You may rephrase it
> to make it clear.
> 
> for example: according to your patch
> 
> "Only do this for target mode in a DMA transfer because we need to add a register read."
> 
> "add a register read" is result, not a reason. the reason should be "you want
> host side capture such error."
> 
> Frank
> 
> 

Got it, thanks

>>
>>>> In IRQ and polling modes always do it because SPI_SR was
>>>> already read and it might catch some host mode programming/buffer
>>>> management errors too.
>>>>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>> ---
>>>>    drivers/spi/spi-fsl-dspi.c | 28 +++++++++++++++++++++++++++-
>>>>    1 file changed, 27 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
>>>> index 58881911e74a..16a9769f518d 100644
>>>> --- a/drivers/spi/spi-fsl-dspi.c
>>>> +++ b/drivers/spi/spi-fsl-dspi.c
>>>> @@ -560,12 +560,24 @@ static void dspi_rx_dma_callback(void *arg)
>>>>    	complete(&dma->cmd_rx_complete);
>>>>    }
>>>>
>>>> +static int dspi_fifo_error(struct fsl_dspi *dspi, u32 spi_sr)
>>>> +{
>>>> +	if (spi_sr & (SPI_SR_TFUF | SPI_SR_RFOF)) {
>>>> +		dev_err_ratelimited(&dspi->pdev->dev, "FIFO errors:%s%s\n",
>>>> +				    spi_sr & SPI_SR_TFUF ? " TX underflow," : "",
>>>> +				    spi_sr & SPI_SR_RFOF ? " RX overflow," : "");
>>>> +		return -EIO;
>>>> +	}
>>>> +	return 0;
>>>> +}
>>>> +
>>>>    static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
>>>>    {
>>>>    	size_t size = dspi_dma_transfer_size(dspi);
>>>>    	struct device *dev = &dspi->pdev->dev;
>>>>    	struct fsl_dspi_dma *dma = dspi->dma;
>>>>    	int time_left;
>>>> +	u32 spi_sr;
>>>>    	int i;
>>>>
>>>>    	for (i = 0; i < dspi->words_in_flight; i++)
>>>> @@ -614,7 +626,8 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
>>>>
>>>>    	if (spi_controller_is_target(dspi->ctlr)) {
>>>>    		wait_for_completion_interruptible(&dspi->dma->cmd_rx_complete);
>>>> -		return 0;
>>>> +		regmap_read(dspi->regmap, SPI_SR, &spi_sr);
>>>> +		return dspi_fifo_error(dspi, spi_sr);
>>>>    	}
>>>>
>>>>    	time_left = wait_for_completion_timeout(&dspi->dma->cmd_tx_complete,
>>>> @@ -1069,6 +1082,10 @@ static void dspi_poll(struct fsl_dspi *dspi)
>>>>
>>>>    			if (spi_sr & SPI_SR_CMDTCF)
>>>>    				break;
>>>> +
>>>> +			dspi->cur_msg->status = dspi_fifo_error(dspi, spi_sr);
>>>> +			if (dspi->cur_msg->status)
>>>> +				return;
>>>
>>>
>>> Although fifo error may happen after you check, it may reduce some possilbity
>>> and catch some problems.
>>>
>>> Frak
>>>
>>
>> Not sure what you mean by this one. But I've seen a few small errors now
>> that I look again. The error check should be before the transfer complete
>> break. And tries should be reset for each part of the message.
>>
>>>>    		} while (--tries);
>>>>
>>>>    		if (!tries) {
>>>> @@ -1085,6 +1102,7 @@ static void dspi_poll(struct fsl_dspi *dspi)
>>>>    static irqreturn_t dspi_interrupt(int irq, void *dev_id)
>>>>    {
>>>>    	struct fsl_dspi *dspi = (struct fsl_dspi *)dev_id;
>>>> +	int status;
>>>>    	u32 spi_sr;
>>>>
>>>>    	regmap_read(dspi->regmap, SPI_SR, &spi_sr);
>>>> @@ -1093,6 +1111,14 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
>>>>    	if (!(spi_sr & SPI_SR_CMDTCF))
>>>>    		return IRQ_NONE;
>>>>
>>>> +	status = dspi_fifo_error(dspi, spi_sr);
>>>> +	if (status) {
>>>> +		if (dspi->cur_msg)
>>>> +			WRITE_ONCE(dspi->cur_msg->status, status);
>>>> +		complete(&dspi->xfer_done);
>>>> +		return IRQ_HANDLED;
>>>> +	}
>>>> +
>>>>    	dspi_rxtx(dspi);
>>>>
>>>>    	if (!dspi->len) {
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>

