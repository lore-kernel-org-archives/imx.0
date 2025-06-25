Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF05C1F460B
	for <imx@lists.linux.dev>; Wed, 25 Jun 2025 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846202; cv=none; b=niDyd8vLcExlh+TKfoHvlWhRzK3fKRsUbw9sRb+feaIGSgLXHoobRku1MqqTc4mvZNLCesVxTN+E94pwGJNz2chNlhfdZl9Z8c5V2wh3tk2wSvHI7QH/7crwOihDlB3dVblE5HFPRjMuPH8KoXSP0P2GBptl3O2oqUtSNGz5rTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846202; c=relaxed/simple;
	bh=OylUmlOteTQZOUB8k3gp2U6i5Fi2b03eFfECFDhsR6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ANosPYEu4a8m2wFdEntthpa1zBKOTDp4iC++zAS4t+cR6OpbUNsnHOMRFyFR+hbvchopanv+kxJlQlvasvF+3butayuRTLpPHee/nWbbMLOdN36F2+IJL/r8YSYwPRnCHSgOrlecGVsbDgafjVtOZqgQrxSCb0KJZKgaRMb0mog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=baiRxtFb; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="baiRxtFb"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a52874d593so6121419f8f.0
        for <imx@lists.linux.dev>; Wed, 25 Jun 2025 03:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750846199; x=1751450999; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y4I1PJPpHezpA836vKI44sV4N989fSWCkW53dGjnJDg=;
        b=baiRxtFbXhwvFia0OdtYsICXTuqvulZLT9j/GPBQn91zE8paqeSPdD1ZqsINih4aFn
         wSrBmpkb2Em+F2H1hD8bIUpNoNt/kHiEbAh3iv0mHgaYgpS+PhXHPD0fMMu4mZN9era5
         XZJvmyS+a4cdLoNgrpGhcvZVLShMskOC46G9u3KCWaOajriUJFeM82HxvZWUrB9AEzLq
         kErgSlg/5JvXV11B+GozoV9kat0ewu+vXp8IyAlVBH7xh2QSlK3TyQnpK+vkgSuXzbLr
         FQduIZ8wWb8/6a2LxthzV+Sd+7q54PoPfVORZ0GGy70RCnwejQ+zFxbvXV/QGui0wXFS
         TXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750846199; x=1751450999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4I1PJPpHezpA836vKI44sV4N989fSWCkW53dGjnJDg=;
        b=iSfF7ql16/fMl4XfVj7oclyx4ljabqXz7dh+FovlxMrPcxOI2yv7P10VJ25pv1EsTe
         OCz+b+wPj2P4lLhpjFuta9AP9yGs7peFbkm6etZcrLL25EA8oY3QHMQOspEOsFYa58US
         LzFh5mBB0sswnmNzXws2kMuevPRt482G7xy+UssSJkN8L7rjc/6bcte/RgbfG9TtxcWa
         0lafoZdAaITb0D6MqiAWR3SIMddKI9W7V1emyNFkqJ0+vWlodrzfCxKYnX7ZQSgdUXw5
         83U7Vc+kLvPhM2w5dSYBgx92kvag4IPSC6IlJ0hm+qeXZFnz/QIuPVuy22QGPT85J4HP
         2wfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaJj1ZkpeAghzBIZkoPHe3HqiecQ+UKu6LQWr5K3wIM8TIQ50RFwhF69C08UFdi0qA/sQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yylnan3LTCXwSlMYhDzIxqsiKR2QL8uf5i0lmGhZcYZkiNdIDYB
	7zcoWetNRaa+f/cPwsbd2eeN6ArsNlYYmpvqccWDyzgYEalc6FdyEhncJkzCazOvDC8=
X-Gm-Gg: ASbGncsn8bThPmvna50q8ltMvZX7O/X/hp8fJwnhVx7bWsFZhRi8f3nVSSbKj2fU/+9
	rGV+s9bpxlvFOq3SUpZ6gkJnOI6jU+BKBfJ7J7l16OWerPB2IZdyvSui0xZFane0qM13JU0FU5q
	Nnj2t9Ln3Xn0v8TvlBoBJ+BTNq1xvOtnPT22ks4d3/mbNgBPhr4cgRacGNrwKacQCWhMKl9i2pk
	sE1BR2+s5Fiq/YcgCgMCD9VyhyqLj7FHrmkgZDxDXpz43D6k2I23ZQOLomCqqEVxHSNal7QveKb
	2ta/2PhYkwt4zxKSnLOTeJYp4B3mXqblr7+p8TCQUmwtbu1CF8fZMfl9t4IocgqMWMVxWmTrHed
	F5Q==
X-Google-Smtp-Source: AGHT+IEUMHqgZbLFHpHfwdSLV9qr4L6CCkcPkB2BptUFawy9i4DhryIcnKtQz1y2O+KERfW+BoO8YQ==
X-Received: by 2002:a05:6000:2207:b0:3a4:dfa9:ce28 with SMTP id ffacd0b85a97d-3a6ed5b880amr1909565f8f.5.1750846199010;
        Wed, 25 Jun 2025 03:09:59 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233a895sm15457165e9.3.2025.06.25.03.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 03:09:58 -0700 (PDT)
Message-ID: <0e26494d-7b85-4874-a2e4-a498ce1864c8@linaro.org>
Date: Wed, 25 Jun 2025 11:09:57 +0100
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aFrXRDJmMgt0qTlL@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/06/2025 5:50 pm, Frank Li wrote:
> On Tue, Jun 24, 2025 at 11:35:36AM +0100, James Clark wrote:
>> In target mode, the host sending more data than can be consumed would be
>> a common problem for any message exceeding the FIFO or DMA buffer size.
>> Cancel the whole message as soon as this condition is hit as the message
>> will be corrupted.
>>
>> Only do this for target mode in a DMA transfer because we need to add a
>> register read.
> 
> "We need to add a register read" is not reason.
> 

Maybe: "It's not likely to catch any errors in host mode so optimize by 
avoiding an extra register read"?

> Add checking FIFO error status at target mode in a DMA transfer since PIO
> mode already do it. It help catch some host mode ...
> 

Are you suggesting that we check for FIFO errors in host mode too? It 
requires an extra read and check in dspi_tx_dma_callback(), but I'm not 
sure what it could catch. Realistically as long as everything is setup 
correctly then neither of those flags will be set. It will either always 
work or never work.

It might be better to add it later if a use becomes apparent otherwise 
it's extra noise in the code.

>> In IRQ and polling modes always do it because SPI_SR was
>> already read and it might catch some host mode programming/buffer
>> management errors too.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/spi/spi-fsl-dspi.c | 28 +++++++++++++++++++++++++++-
>>   1 file changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
>> index 58881911e74a..16a9769f518d 100644
>> --- a/drivers/spi/spi-fsl-dspi.c
>> +++ b/drivers/spi/spi-fsl-dspi.c
>> @@ -560,12 +560,24 @@ static void dspi_rx_dma_callback(void *arg)
>>   	complete(&dma->cmd_rx_complete);
>>   }
>>
>> +static int dspi_fifo_error(struct fsl_dspi *dspi, u32 spi_sr)
>> +{
>> +	if (spi_sr & (SPI_SR_TFUF | SPI_SR_RFOF)) {
>> +		dev_err_ratelimited(&dspi->pdev->dev, "FIFO errors:%s%s\n",
>> +				    spi_sr & SPI_SR_TFUF ? " TX underflow," : "",
>> +				    spi_sr & SPI_SR_RFOF ? " RX overflow," : "");
>> +		return -EIO;
>> +	}
>> +	return 0;
>> +}
>> +
>>   static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
>>   {
>>   	size_t size = dspi_dma_transfer_size(dspi);
>>   	struct device *dev = &dspi->pdev->dev;
>>   	struct fsl_dspi_dma *dma = dspi->dma;
>>   	int time_left;
>> +	u32 spi_sr;
>>   	int i;
>>
>>   	for (i = 0; i < dspi->words_in_flight; i++)
>> @@ -614,7 +626,8 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
>>
>>   	if (spi_controller_is_target(dspi->ctlr)) {
>>   		wait_for_completion_interruptible(&dspi->dma->cmd_rx_complete);
>> -		return 0;
>> +		regmap_read(dspi->regmap, SPI_SR, &spi_sr);
>> +		return dspi_fifo_error(dspi, spi_sr);
>>   	}
>>
>>   	time_left = wait_for_completion_timeout(&dspi->dma->cmd_tx_complete,
>> @@ -1069,6 +1082,10 @@ static void dspi_poll(struct fsl_dspi *dspi)
>>
>>   			if (spi_sr & SPI_SR_CMDTCF)
>>   				break;
>> +
>> +			dspi->cur_msg->status = dspi_fifo_error(dspi, spi_sr);
>> +			if (dspi->cur_msg->status)
>> +				return;
> 
> 
> Although fifo error may happen after you check, it may reduce some possilbity
> and catch some problems.
> 
> Frak
> 

Not sure what you mean by this one. But I've seen a few small errors now 
that I look again. The error check should be before the transfer 
complete break. And tries should be reset for each part of the message.

>>   		} while (--tries);
>>
>>   		if (!tries) {
>> @@ -1085,6 +1102,7 @@ static void dspi_poll(struct fsl_dspi *dspi)
>>   static irqreturn_t dspi_interrupt(int irq, void *dev_id)
>>   {
>>   	struct fsl_dspi *dspi = (struct fsl_dspi *)dev_id;
>> +	int status;
>>   	u32 spi_sr;
>>
>>   	regmap_read(dspi->regmap, SPI_SR, &spi_sr);
>> @@ -1093,6 +1111,14 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
>>   	if (!(spi_sr & SPI_SR_CMDTCF))
>>   		return IRQ_NONE;
>>
>> +	status = dspi_fifo_error(dspi, spi_sr);
>> +	if (status) {
>> +		if (dspi->cur_msg)
>> +			WRITE_ONCE(dspi->cur_msg->status, status);
>> +		complete(&dspi->xfer_done);
>> +		return IRQ_HANDLED;
>> +	}
>> +
>>   	dspi_rxtx(dspi);
>>
>>   	if (!dspi->len) {
>>
>> --
>> 2.34.1
>>

