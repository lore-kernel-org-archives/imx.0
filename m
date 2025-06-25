Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2215A30749E
	for <imx@lists.linux.dev>; Wed, 25 Jun 2025 09:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845390; cv=none; b=LAJlEhc+hYv2STrNNIsXow2gfnsnmKY6CB8EAubtRvhHW4axrqzghH/dlRaGZqqEG0g67zXCJwdpF4Rqj2XhGvOLA8XEmm42BQudIRaM2TEOvGTJOiCHVXvq4YGND+WQ/PEQkSpTRsUC7H45J3YwHZpEKNbt9XhxfAg6tLMlSJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845390; c=relaxed/simple;
	bh=8FU/7tPeSpa7lK21KpiF9ik38Y+Bs84pnJnck2VkIBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWP9NZrVjieBVHj7TtdbopmjxO7b3soX8xajyXb8Mr7cHob+TEffEQ1DpsMPbjo4JMmR0QKoh4VJAwJbQ/lwcjcKaW7hJZdC0KMq22MyW8ussge4/Noi3Ldw1a/mrMh11ASunIWdzqj0m/wqRHPczqIkRZrATHFmXCS0yhtWFrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OijtOTkk; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OijtOTkk"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so482073f8f.0
        for <imx@lists.linux.dev>; Wed, 25 Jun 2025 02:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750845387; x=1751450187; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mnv6+0ikBWTu5GUwzfXL+31J9Qfk+uEDhfcL5PdN9P4=;
        b=OijtOTkk3J34I379dFNhEawKlnDLzpPGWWFgGCJQEpvHLUKLxty5rq4+H056WxYZ6u
         qjSPGHu0EJJYYROArVMemdpGYRntk9TVhjfr+Xd8sCQaax3efnBVd+DRK4WI/m6AwOnZ
         YK5agu/0EIsDcS+C+bzP1745BSKVfHr1bVgo3z4lJYUjhFdPnD8EgQXvFTZkd144Txdr
         qOhqCsHt3ExBUv1Mu1Wkx6DqucSDXJTCcXy+8XAPxpKwzVbeclKaiu+Cptnl7uPnF7lS
         t5CS/BUq6poXZg799oGuhAXrU7bMXnHOXhEatpPDr0bqQANRJUxmucP+sh4DzQZsVzYI
         QnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845387; x=1751450187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mnv6+0ikBWTu5GUwzfXL+31J9Qfk+uEDhfcL5PdN9P4=;
        b=UBg0e9lgMsrm6JUJ9GMm5QGx2RfraPl1F16GlpY8ugOpx5Ixa+2T7AGfHMNFeU+KU/
         wIuAG6/gMRB4nk2nyEFLTayf845mmOatzqhf2loMcuaaKQSA+t4rsofeWAeCSrGBHgcO
         gIomwSGfF/TKKp2OmCTfwkVw6hqFG5dmw9+EIdMSu0jsXZDk4XhlB8XouhiTMh0mtXFc
         0ijAUkXsMGDu22mBsyvcrqi6Lc2YdL/9W7gGvFWyI5ANG4B+bCfHmET25ypi+8rRQ1lR
         i0z7Laeh9J+z7mmAIs1sQoNpnZ49xE+Q8kkqFc3yAfDx4Z/Q/+TlMKgIjAYm0XsqlTdd
         vISw==
X-Forwarded-Encrypted: i=1; AJvYcCXrOCV5Q0Pbkkiskgx/lH63UO315VpY1iMvqN1nm6HWJCpu7O8IYPf5vMEHra3zg/mMIHY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPgZCacqb/0z0/zEHBvpQ18ZMSCECGTDeD/nGl+pHaMuS2lOzo
	59Axp0CQLetsT5eLaI5yJFZhjC0NAzXMISULIqhSiXERV/KZbKU2s/aVsVz833q6l5E=
X-Gm-Gg: ASbGncsg2JXvftFmuhn8mrTiUtzgVn61NnK8YtDIAAsWvQaF2gIpppOtz7KnqhP9gPw
	RkhhoZayVfh9NQTylBeLrVZveI7atV/vz9oBDyz4vU0DlV47fXKU/KFVOqX3uXwLKRjR9te/oZL
	FOrb1IIAVZMxkb9TjB4W8hVolDX7kxOVZ2JrYx8GTsBPQTtFQwawvlg/fgwg8crbM853NrfNln5
	mmFg869i84FlbN3jm+qZRvT9Rs6unuYSQzDiZPLEWTChgjLnSIbRm+D5ENM2Xb8loquN7MjJ/a7
	vJdGSuPMdwPsqMY2HhbDh0ZqaM8fWXavOWrIq+1y7bOljrtitMurlk4HPPgUigFaYAc=
X-Google-Smtp-Source: AGHT+IHUT2mOdBDTYilOC0pGw2ewz3RMDzSyuUrAJ3h5EYqrxtwLBoi5uS6ecJ7xvkaUQCE+iExiWw==
X-Received: by 2002:a5d:64e6:0:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3a6e71ff6aamr6132185f8f.15.1750845387416;
        Wed, 25 Jun 2025 02:56:27 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c749sm15055145e9.4.2025.06.25.02.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:56:26 -0700 (PDT)
Message-ID: <a27378b4-45f7-4f5f-b01f-72eb9b7d2d8f@linaro.org>
Date: Wed, 25 Jun 2025 10:56:25 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] spi: spi-fsl-dspi: Store status directly in
 cur_msg->status
To: Frank Li <Frank.li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Larisa Grigore <larisa.grigore@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
 <20250624-james-nxp-spi-dma-v3-2-e7d574f5f62c@linaro.org>
 <aFrP1ZNvjHCPmbWG@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aFrP1ZNvjHCPmbWG@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/06/2025 5:18 pm, Frank Li wrote:
> On Tue, Jun 24, 2025 at 11:35:32AM +0100, James Clark wrote:
>> This will allow us to return a status from the interrupt handler in a
>> later commit and avoids copying it at the end of
>> dspi_transfer_one_message(). For consistency make polling and DMA modes
>> use the same mechanism.
>>
>> Refactor dspi_rxtx() and dspi_poll() to not return -EINPROGRESS because
>> this isn't actually a status that was ever returned to the core layer
>> but some internal state. Wherever that was used we can look at dspi->len
>> instead.
>>
>> No functional changes intended.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/spi/spi-fsl-dspi.c | 68 ++++++++++++++++++++++++----------------------
>>   1 file changed, 35 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
>> index 744dfc561db2..feb29bb92a77 100644
>> --- a/drivers/spi/spi-fsl-dspi.c
>> +++ b/drivers/spi/spi-fsl-dspi.c
>> @@ -591,11 +591,10 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
>>
>>   static void dspi_setup_accel(struct fsl_dspi *dspi);
>>
>> -static int dspi_dma_xfer(struct fsl_dspi *dspi)
>> +static void dspi_dma_xfer(struct fsl_dspi *dspi)
>>   {
>>   	struct spi_message *message = dspi->cur_msg;
>>   	struct device *dev = &dspi->pdev->dev;
>> -	int ret = 0;
>>
>>   	/*
>>   	 * dspi->len gets decremented by dspi_pop_tx_pushr in
>> @@ -612,14 +611,12 @@ static int dspi_dma_xfer(struct fsl_dspi *dspi)
>>   		message->actual_length += dspi->words_in_flight *
>>   					  dspi->oper_word_size;
>>
>> -		ret = dspi_next_xfer_dma_submit(dspi);
>> -		if (ret) {
>> +		message->status = dspi_next_xfer_dma_submit(dspi);
>> +		if (message->status) {
>>   			dev_err(dev, "DMA transfer failed\n");
>>   			break;
>>   		}
>>   	}
>> -
>> -	return ret;
>>   }
>>
>>   static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
>> @@ -986,36 +983,40 @@ static void dspi_fifo_write(struct fsl_dspi *dspi)
>>   				dspi->progress, !dspi->irq);
>>   }
>>
>> -static int dspi_rxtx(struct fsl_dspi *dspi)
>> +static void dspi_rxtx(struct fsl_dspi *dspi)
>>   {
>>   	dspi_fifo_read(dspi);
>>
>>   	if (!dspi->len)
>>   		/* Success! */
>> -		return 0;
>> +		return;
>>
>>   	dspi_fifo_write(dspi);
>> -
>> -	return -EINPROGRESS;
>>   }
>>
>> -static int dspi_poll(struct fsl_dspi *dspi)
>> +static void dspi_poll(struct fsl_dspi *dspi)
>>   {
>>   	int tries = 1000;
>>   	u32 spi_sr;
>>
>> -	do {
>> -		regmap_read(dspi->regmap, SPI_SR, &spi_sr);
>> -		regmap_write(dspi->regmap, SPI_SR, spi_sr);
>> +	while (dspi->len) {
> 
> Preivous have not checked dspi->len.
> 
> Not sure if it is logical equivalence
> 

It used to be this:

    status = dspi_poll(dspi);
  } while (status == -EINPROGRESS);

Where checking status for -EINPROGRESS is equivalent to checking dspi->len.

>> +		do {
>> +			regmap_read(dspi->regmap, SPI_SR, &spi_sr);
>> +			regmap_write(dspi->regmap, SPI_SR, spi_sr);
>>
>> -		if (spi_sr & SPI_SR_CMDTCF)
>> -			break;
>> -	} while (--tries);
>> +			if (spi_sr & SPI_SR_CMDTCF)
>> +				break;
>> +		} while (--tries);
>>
>> -	if (!tries)
>> -		return -ETIMEDOUT;
>> +		if (!tries) {
>> +			dspi->cur_msg->status = -ETIMEDOUT;
>> +			return;
>> +		}
>>
>> -	return dspi_rxtx(dspi);
>> +		dspi_rxtx(dspi);
>> +	}
>> +
>> +	dspi->cur_msg->status = 0;
>>   }
>>
>>   static irqreturn_t dspi_interrupt(int irq, void *dev_id)
>> @@ -1029,8 +1030,13 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
>>   	if (!(spi_sr & SPI_SR_CMDTCF))
>>   		return IRQ_NONE;
>>
>> -	if (dspi_rxtx(dspi) == 0)
>> +	dspi_rxtx(dspi);
>> +
>> +	if (!dspi->len) {
>> +		if (dspi->cur_msg)
>> +			WRITE_ONCE(dspi->cur_msg->status, 0);
>>   		complete(&dspi->xfer_done);
>> +	}
>>
>>   	return IRQ_HANDLED;
>>   }
>> @@ -1060,7 +1066,6 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
>>   	struct spi_device *spi = message->spi;
>>   	struct spi_transfer *transfer;
>>   	bool cs = false;
>> -	int status = 0;
>>   	u32 val = 0;
>>   	bool cs_change = false;
>>
>> @@ -1120,7 +1125,7 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
>>   				       dspi->progress, !dspi->irq);
>>
>>   		if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE) {
>> -			status = dspi_dma_xfer(dspi);
>> +			dspi_dma_xfer(dspi);
>>   		} else {
>>   			/*
>>   			 * Reset completion counter to clear any extra
>> @@ -1133,15 +1138,12 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
>>
>>   			dspi_fifo_write(dspi);
>>
>> -			if (dspi->irq) {
>> +			if (dspi->irq)
>>   				wait_for_completion(&dspi->xfer_done);
>> -			} else {
>> -				do {
>> -					status = dspi_poll(dspi);
>> -				} while (status == -EINPROGRESS);
>> -			}
>> +			else
>> +				dspi_poll(dspi);
>>   		}
>> -		if (status)
>> +		if (READ_ONCE(message->status))
> 
> Why need READ_ONCE()? Does any hardware (DMA) set status?
> 
> where update message->status at pio mode.
> 
> Frank

Because message->status is set from dspi_interrupt(), so the compiler 
wouldn't be aware that this variable can be changed from elsewhere. 
Otherwise it could assume that it's never written to in 
dspi_transfer_one_message() and not bother to read it again.

>>   			break;
>>
>>   		spi_transfer_delay_exec(transfer);
>> @@ -1150,7 +1152,8 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
>>   			dspi_deassert_cs(spi, &cs);
>>   	}
>>
>> -	if (status || !cs_change) {
>> +	dspi->cur_msg = NULL;
>> +	if (message->status || !cs_change) {
>>   		/* Put DSPI in stop mode */
>>   		regmap_update_bits(dspi->regmap, SPI_MCR,
>>   				   SPI_MCR_HALT, SPI_MCR_HALT);
>> @@ -1159,10 +1162,9 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
>>   			;
>>   	}
>>
>> -	message->status = status;
>>   	spi_finalize_current_message(ctlr);
>>
>> -	return status;
>> +	return message->status;
>>   }
>>
>>   static int dspi_set_mtf(struct fsl_dspi *dspi)
>>
>> --
>> 2.34.1
>>

