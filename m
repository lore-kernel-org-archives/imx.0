Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA7723F40A
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 08:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273982; cv=none; b=FUyHEXV3kSAmPtnsgIL/Lj4p8AptLiXpwkABkKuNDYRAcCCNYoUxsd6IBMRkwOt53wiT4bj0O5TIPyMdKwV0T7NjO/Qqd9w3MBOPxpRqbBNpAFhhtnONLl6h06kkiye3DyR5zNGQrH07/fxXYXVAV7Xqo5uB+4jDvlxDv14YduA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273982; c=relaxed/simple;
	bh=0d4NWuuezUBZlI0MbfJ8R55nhZk0xBUsGlRY5Ft/aiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4UdI2qC9xzvkeH+tp4oIpq4E+4Kqjxs0oUXQjZsAzg7tUSF32BzCY0EWIPgo69LkK3wSk73WoUlEhiR7Bjr/4/ytrpaYxSinUIoMtuKU2Dmy7fSOhfzCIkjtG1Ui137loQzX6BDk3Mi8AXodm/DlkwhfgWY7VGdwbd879V0LBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jU85wJY4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jU85wJY4"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so3249625f8f.0
        for <imx@lists.linux.dev>; Mon, 30 Jun 2025 01:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751273978; x=1751878778; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VFQu7mhixaS1abvpxxXFoPLoeKYeIfJ3hDE1BdxuAGs=;
        b=jU85wJY4uZ4oEiV5aNS1RwUCk9ZpFbPzlEwxDfrxlLbXI4oRpReT7kuonzzNmPQ/MS
         jCO8Y6hW162DriTCfNQrqv5eqtAuhb6aWW4VbrygUuUULmqyIEuufPnlzW9UMxckXMua
         /F1ZCopthLOtCL4q/v4DDv1MYkIGRSgrFIuinhqOfJ2PC7GHVGOZS1raNbZXm7bgkuka
         4FWvLem0zGSG0ukXqYG07UxJdDBrGbsm7lwUDanreJ0weXOYsmHp07iwZIqoiOrTFgyg
         N5Y8/fcGwann/0VtjWx1AXwauHNd26PrFtFeqY6CrIHndbEIUL67u9m/M/ffA9SeMMMh
         JMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751273978; x=1751878778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFQu7mhixaS1abvpxxXFoPLoeKYeIfJ3hDE1BdxuAGs=;
        b=OdiY9PI2QQkh3ZOu0KbnRnGpQAjEGyX6la8Dxx8ARBS7eHxl/CXNoZOLJ/VRpvCQQ+
         nqYYjr20wcakoALHVl8KSxpnEyGbbwo5+8AqfTttkZ2rI4TCrADpREypkaSiEs/JMoIo
         q8uy6bcJif7wBER2van9eHN43C/SlT4h9ZxHE7ZzuhbAGb9LX+Pa5sUsoAwGKwkpKVMA
         UzFXXrXo/Ndfc/qjWN+GJMfqdKEO9COFIUK0sZieHYPlthETbQOtFxEtdLP+TuKmQoDM
         3gwzahxS/Bs4l2wr+k5dUSCYH2DcBIoe30UuIwGmID1zt73jEv8Q5RW0JtVpCFsPeZTj
         MiFA==
X-Forwarded-Encrypted: i=1; AJvYcCWSn/CILRLwV0mz/zN/SompNT1tFyZ3eiA1KeKXbuXn9b/OEJyPW6irHH4khU6+jJ9Zv+w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKX1cklp78rJkRzR7O/S+hnJ1zygM7D9iKOXDLxo6AT1xpGLqb
	wdvfYfS2QBsmXxVXq8tFOoI/sMuhjZC925xPNxgJ94Bkcfn1nqMwaZCgBt0aNtnvbpQ=
X-Gm-Gg: ASbGncvX7ZH5YRtmcSpYdexP1mgJ4RswEAF8kqdu3xiNunqYEsDBQifuBYaBepQSJZ/
	DNYa7kf2Itj7aM+/MYtcPUYp6O+RPjLNKoBHWqyclWXBKYuAj2SXKtiUJegWEaB89xFrkiLpnx5
	bzhQ7TJVViiD4+L8Wf3Pnt9cjBiiU1ELG7G9BNMk71C/n3fp1kibSPbU4/5C8FKVowOa6GltdTC
	cBfyzmDTW5yMf7UvFx2OBslK1SrZvBZ6pU+zj+qs8ZvMu6QVgq/E5sNZOv1vO2Pv+z717A1UTck
	o4PZGnN+D2PasgV7u7a28FumkFi/X3VPpi6VbX0pggzSy7kMotSxE7afDAadPLTYsAQ=
X-Google-Smtp-Source: AGHT+IG5ktpnxyBI4y1IzWi1qogVxb1CyTNnkfSh78AccIm7IuhUZAbeEi1X7pwMTpV3iZq17jhRIQ==
X-Received: by 2002:a05:6000:3103:b0:3a5:5136:bd25 with SMTP id ffacd0b85a97d-3a6f30fc160mr14023708f8f.1.1751273977592;
        Mon, 30 Jun 2025 01:59:37 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fada5sm9958423f8f.32.2025.06.30.01.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 01:59:37 -0700 (PDT)
Message-ID: <65622175-1c5a-4228-831b-6e2f8c05a9f0@linaro.org>
Date: Mon, 30 Jun 2025 09:59:36 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] spi: spi-fsl-dspi: Increase DMA buffer size
To: Frank Li <Frank.li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Larisa Grigore <larisa.grigore@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
 <20250627-james-nxp-spi-dma-v4-5-178dba20c120@linaro.org>
 <aF70skVHeSRU3BTu@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aF70skVHeSRU3BTu@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/06/2025 8:44 pm, Frank Li wrote:
> On Fri, Jun 27, 2025 at 11:21:41AM +0100, James Clark wrote:
>> From: Larisa Grigore <larisa.grigore@nxp.com>
>>
>> When the device is configured as a target, the host won't stop sending
>> data while we're draining the buffer which leads to FIFO underflows
>> and corruption.
>>
>> Increase the DMA buffer size to the maximum words that edma can
>> transfer once to reduce the chance of this happening.
>>
>> While we're here, also change the buffer size for host mode back to a
>> page as it was before commit a957499bd437 ("spi: spi-fsl-dspi: Fix
>> bits-per-word acceleration in DMA mode"). dma_alloc_noncoherent()
>> allocations are backed by a full page anyway, so we might as well use it
>> all.
>>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/spi/spi-fsl-dspi.c | 42 ++++++++++++++++++++++++++++++++++++++----
>>   1 file changed, 38 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
>> index e7856f9c9440..46d3cae9efed 100644
>> --- a/drivers/spi/spi-fsl-dspi.c
>> +++ b/drivers/spi/spi-fsl-dspi.c
>> @@ -493,6 +493,39 @@ static u32 dspi_pop_tx_pushr(struct fsl_dspi *dspi)
>>   	return cmd << 16 | data;
>>   }
>>
>> +static int dspi_dma_bufsize(struct fsl_dspi *dspi)
>> +{
>> +	if (spi_controller_is_target(dspi->ctlr)) {
>> +		/*
>> +		 * In target mode we have to be ready to receive the maximum
>> +		 * that can possibly be transferred at once by EDMA without any
>> +		 * FIFO underflows. This is CITER * SSIZE, where SSIZE is a max
>> +		 * of 4 when transferring to a peripheral.
>> +		 */
>> +		return GENMASK(14, 0) * DMA_SLAVE_BUSWIDTH_4_BYTES;
>> +	}
>> +
>> +	return PAGE_SIZE;
>> +}
>> +
>> +static int dspi_dma_max_datawords(struct fsl_dspi *dspi)
>> +{
>> +	/*
>> +	 * Transfers look like this so we always use a full DMA word regardless
>> +	 * of SPI word size:
>> +	 *
>> +	 * 31              16 15                   0
>> +	 * -----------------------------------------
>> +	 * |   CONTROL WORD  |     16-bit DATA     |
>> +	 * -----------------------------------------
>> +	 * or
>> +	 * -----------------------------------------
>> +	 * |   CONTROL WORD  | UNUSED | 8-bit DATA |
>> +	 * -----------------------------------------
>> +	 */
>> +	return dspi_dma_bufsize(dspi) / DMA_SLAVE_BUSWIDTH_4_BYTES;
>> +}
>> +
>>   static int dspi_dma_transfer_size(struct fsl_dspi *dspi)
>>   {
>>   	return dspi->words_in_flight * DMA_SLAVE_BUSWIDTH_4_BYTES;
>> @@ -608,6 +641,7 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
>>   static void dspi_dma_xfer(struct fsl_dspi *dspi)
>>   {
>>   	struct spi_message *message = dspi->cur_msg;
>> +	int max_words = dspi_dma_max_datawords(dspi);
>>   	struct device *dev = &dspi->pdev->dev;
>>
>>   	/*
>> @@ -619,8 +653,8 @@ static void dspi_dma_xfer(struct fsl_dspi *dspi)
>>   		dspi_setup_accel(dspi);
>>
>>   		dspi->words_in_flight = dspi->len / dspi->oper_word_size;
>> -		if (dspi->words_in_flight > dspi->devtype_data->fifo_size)
>> -			dspi->words_in_flight = dspi->devtype_data->fifo_size;
>> +		if (dspi->words_in_flight > max_words)
>> +			dspi->words_in_flight = max_words;
> 
> you touch this line
> 
> 		dspi->words_in_flight = min(dspi->words_in_flight, max_words);
> 
> Frank

Ack

>>
>>   		message->actual_length += dspi->words_in_flight *
>>   					  dspi->oper_word_size;
>> @@ -635,7 +669,7 @@ static void dspi_dma_xfer(struct fsl_dspi *dspi)
>>
>>   static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
>>   {
>> -	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
>> +	int dma_bufsize = dspi_dma_bufsize(dspi);
>>   	struct device *dev = &dspi->pdev->dev;
>>   	struct dma_slave_config cfg;
>>   	struct fsl_dspi_dma *dma;
>> @@ -719,7 +753,7 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
>>
>>   static void dspi_release_dma(struct fsl_dspi *dspi)
>>   {
>> -	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
>> +	int dma_bufsize = dspi_dma_bufsize(dspi);
>>   	struct fsl_dspi_dma *dma = dspi->dma;
>>
>>   	if (!dma)
>>
>> --
>> 2.34.1
>>

