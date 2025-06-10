Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68322237194
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749570402; cv=none; b=JCRG8YezMwrwXA8PSM0JgSrB/VYxemJgTD4WUTg+HD5RXzGguLdUsXlbBbd0fD4tZOJKGbP+LrGZF/FhqLb0939T2+Th4+DOu6UF7QV+R68lsSZ+Nb3c+d1bkPq4WhMXcH9huTJV28JtXdicaUBzrh5Tkjfxd62ZlGIB6sJzMZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749570402; c=relaxed/simple;
	bh=vxuw3LvYAToyp49ZgYIxDv2CDjhyjusdO5Uv/G4/WzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NwocFsMEfbZPg3B1o3DUALg2GBgP1l7Ki3vlBKvvwEYu4trzues9b3uCLBbeV58OEwVspTwJF1ULbmra5D3urus8zDI9Qm8Tym6osnjIJUiVEa338gp4Pi3VSRq5qPvXAGM/LD2ppRo8v6Ve87KgbPuOSETMJIoGfRhGXKVjdYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x2cFGYIE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x2cFGYIE"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45305c280a3so10780275e9.3
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749570399; x=1750175199; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=32CoWJgbTlYUzAxIBjwb0Zjs1I5TbtzzAl+WJpqHnjE=;
        b=x2cFGYIE+MNmyeyXV4PGDDdJ8Kf958rO7YWE2ySVkfzzwyXo2/NbHqqWX+y5ahdM7N
         +brIgXVjAtNwQdoKk1QUGb82yCA2OroI4wSEu3FnSSYKB8XGtOJ+CfK9knGhQfruzk7U
         gBHUnbFAdvo+YKYlY7SDFu/PWRg4GJI0G2ejH90EViZ/gB584yw0Io8EqMtq5/QTNtCA
         BsMMMR229Ny3cakmdpQmYZbH1DfxdM5IPrqpD/sexmlQoXZSh5LvVn9T/EmrWMKVEkpC
         DrDLZjkvAjjRM8S3Sq0TFkTO38vW6huz862Fg3GYK+7hAjfbhS24ZaolYm5O6WokKT5M
         VcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749570399; x=1750175199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32CoWJgbTlYUzAxIBjwb0Zjs1I5TbtzzAl+WJpqHnjE=;
        b=fgQTvVB375YN1akKM2EVIZ51XLRd2X1drsF/ueqN03wfOerCl1PzRspWMYACtDeiOJ
         kcME0T5A2aUI7gfvOtEqdccKMNRgd4BACJli7onLmBwqF5PkbGtZJfzJhGWf3NtWNNTO
         SfiDHEPYXxGuO2tKJ5o3hdDcDfT2kCUjacrUFzp+NYQKs98CczO9Y+U5IOWh1/oWOsTs
         PIvNrZVj+M3Te2b57+cE6y5bRjKFqLNDQVudmF677v40cY5476mzs7KcWoGjxsDnQlbd
         /nsqRlRvlDaA7O5uRETwGDpwRdO0O0hNRTHKyp5Rabd9ovPyoHvYvSfKGvjbakqeHGmA
         S2hw==
X-Forwarded-Encrypted: i=1; AJvYcCXeUk8x6Sm856gSQ6zjxy28CDk2qvb6Cu8M6uPL+H+KjSr7GM2SPsJIxA3zc7GZmE+EKoA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyew9tpfXo4KAYohUhwqdSCsl771qB5eJGua6NDG3dK6WVhLwX7
	cVxBsye//3p29Za/W2vnL54PsRar17S+1iv34+NSF2jUksf0svpOAeplVjZPBwAECM9SsbSmtMd
	4RfQlSus=
X-Gm-Gg: ASbGnct9Gb7cD0hLCOZOzLDdYxKPM0fFk1uCZSD5FHnGv/l+IakwE2HxZL1qkOkxho1
	IzgLPWZNwpyuctHEpzckT1gYgJrhdCCTWvQhBHxhSn2NYk9akIz1nFFh1OX9jfecc4h0iLPX5Cn
	UWPdmQ6G9tTyyXGz8WFthSgTHaog9XLhi9N5nQ1Q9DHRDHjA3BYBrjkWjGKqXNG5YaR9x+QV5zY
	Jd2pPbxEvckX6kcaDey6xkI2faQluCXsNCtHQz6vM+pccJl/yPW1RJb1uCAxMxFqevhVMIlKlId
	+t0t83WMa9EXlAtQ/O5yAh6RWAya66KLHhmgEXYMU7SRgbIBzFlBTVddCUNZhojHlsmOT6x4zZe
	KdQ==
X-Google-Smtp-Source: AGHT+IHd43zcj5bc6he9pS95vdOv9J2OpBXBfAtfcsa4Xb6ZIBuGjAUEVSk6r3PPapBN44C27mrqDA==
X-Received: by 2002:a05:600c:8b57:b0:442:ccfa:fa with SMTP id 5b1f17b1804b1-4520141af75mr154049975e9.27.1749570398686;
        Tue, 10 Jun 2025 08:46:38 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e155500sm141292965e9.9.2025.06.10.08.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 08:46:38 -0700 (PDT)
Message-ID: <d364667f-e0b1-4f1b-9034-2fadfd5d457b@linaro.org>
Date: Tue, 10 Jun 2025 16:46:36 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Frank Li <Frank.li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
 <aEhMBsqlx9I4XqJS@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aEhMBsqlx9I4XqJS@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/06/2025 4:15 pm, Frank Li wrote:
> On Mon, Jun 09, 2025 at 04:32:39PM +0100, James Clark wrote:
>> Using coherent memory here isn't functionally necessary.
>> Because the
>> change to use non-coherent memory isn't overly complex and only a few
>> synchronization points are required, we might as well do it while fixing
>> up some other DMA issues.
> 
> Any beanfit by use on-coherent memory here?
> 
> Frank
> 

Presumably less cache maintenance traffic?

Thanks
James

>>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/spi/spi-fsl-dspi.c | 55 +++++++++++++++++++++++++++++-----------------
>>   1 file changed, 35 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
>> index 386a17871e79..567632042f8f 100644
>> --- a/drivers/spi/spi-fsl-dspi.c
>> +++ b/drivers/spi/spi-fsl-dspi.c
>> @@ -247,6 +247,11 @@ struct fsl_dspi {
>>   	void (*dev_to_host)(struct fsl_dspi *dspi, u32 rxdata);
>>   };
>>
>> +static int dspi_dma_transfer_size(struct fsl_dspi *dspi)
>> +{
>> +	return dspi->words_in_flight * DMA_SLAVE_BUSWIDTH_4_BYTES;
>> +}
>> +
>>   static void dspi_native_host_to_dev(struct fsl_dspi *dspi, u32 *txdata)
>>   {
>>   	switch (dspi->oper_word_size) {
>> @@ -361,7 +366,10 @@ static void dspi_tx_dma_callback(void *arg)
>>   {
>>   	struct fsl_dspi *dspi = arg;
>>   	struct fsl_dspi_dma *dma = dspi->dma;
>> +	struct device *dev = &dspi->pdev->dev;
>>
>> +	dma_sync_single_for_cpu(dev, dma->tx_dma_phys,
>> +				dspi_dma_transfer_size(dspi), DMA_TO_DEVICE);
>>   	complete(&dma->cmd_tx_complete);
>>   }
>>
>> @@ -369,9 +377,13 @@ static void dspi_rx_dma_callback(void *arg)
>>   {
>>   	struct fsl_dspi *dspi = arg;
>>   	struct fsl_dspi_dma *dma = dspi->dma;
>> +	struct device *dev = &dspi->pdev->dev;
>>   	int i;
>>
>>   	if (dspi->rx) {
>> +		dma_sync_single_for_cpu(dev, dma->rx_dma_phys,
>> +					dspi_dma_transfer_size(dspi),
>> +					DMA_FROM_DEVICE);
>>   		for (i = 0; i < dspi->words_in_flight; i++)
>>   			dspi_push_rx(dspi, dspi->dma->rx_dma_buf[i]);
>>   	}
>> @@ -381,6 +393,7 @@ static void dspi_rx_dma_callback(void *arg)
>>
>>   static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
>>   {
>> +	size_t size = dspi_dma_transfer_size(dspi);
>>   	struct device *dev = &dspi->pdev->dev;
>>   	struct fsl_dspi_dma *dma = dspi->dma;
>>   	int time_left;
>> @@ -389,10 +402,9 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
>>   	for (i = 0; i < dspi->words_in_flight; i++)
>>   		dspi->dma->tx_dma_buf[i] = dspi_pop_tx_pushr(dspi);
>>
>> +	dma_sync_single_for_device(dev, dma->tx_dma_phys, size, DMA_TO_DEVICE);
>>   	dma->tx_desc = dmaengine_prep_slave_single(dma->chan_tx,
>> -					dma->tx_dma_phys,
>> -					dspi->words_in_flight *
>> -					DMA_SLAVE_BUSWIDTH_4_BYTES,
>> +					dma->tx_dma_phys, size,
>>   					DMA_MEM_TO_DEV,
>>   					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>>   	if (!dma->tx_desc) {
>> @@ -407,10 +419,10 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
>>   		return -EINVAL;
>>   	}
>>
>> +	dma_sync_single_for_device(dev, dma->rx_dma_phys, size,
>> +				   DMA_FROM_DEVICE);
>>   	dma->rx_desc = dmaengine_prep_slave_single(dma->chan_rx,
>> -					dma->rx_dma_phys,
>> -					dspi->words_in_flight *
>> -					DMA_SLAVE_BUSWIDTH_4_BYTES,
>> +					dma->rx_dma_phys, size,
>>   					DMA_DEV_TO_MEM,
>>   					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>>   	if (!dma->rx_desc) {
>> @@ -512,17 +524,17 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
>>   		goto err_tx_channel;
>>   	}
>>
>> -	dma->tx_dma_buf = dma_alloc_coherent(dma->chan_tx->device->dev,
>> -					     dma_bufsize, &dma->tx_dma_phys,
>> -					     GFP_KERNEL);
>> +	dma->tx_dma_buf = dma_alloc_noncoherent(dma->chan_tx->device->dev,
>> +						dma_bufsize, &dma->tx_dma_phys,
>> +						DMA_TO_DEVICE, GFP_KERNEL);
>>   	if (!dma->tx_dma_buf) {
>>   		ret = -ENOMEM;
>>   		goto err_tx_dma_buf;
>>   	}
>>
>> -	dma->rx_dma_buf = dma_alloc_coherent(dma->chan_rx->device->dev,
>> -					     dma_bufsize, &dma->rx_dma_phys,
>> -					     GFP_KERNEL);
>> +	dma->rx_dma_buf = dma_alloc_noncoherent(dma->chan_rx->device->dev,
>> +						dma_bufsize, &dma->rx_dma_phys,
>> +						DMA_FROM_DEVICE, GFP_KERNEL);
>>   	if (!dma->rx_dma_buf) {
>>   		ret = -ENOMEM;
>>   		goto err_rx_dma_buf;
>> @@ -557,11 +569,12 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
>>   	return 0;
>>
>>   err_slave_config:
>> -	dma_free_coherent(dma->chan_rx->device->dev,
>> -			  dma_bufsize, dma->rx_dma_buf, dma->rx_dma_phys);
>> +	dma_free_noncoherent(dma->chan_rx->device->dev, dma_bufsize,
>> +			     dma->rx_dma_buf, dma->rx_dma_phys,
>> +			     DMA_FROM_DEVICE);
>>   err_rx_dma_buf:
>> -	dma_free_coherent(dma->chan_tx->device->dev,
>> -			  dma_bufsize, dma->tx_dma_buf, dma->tx_dma_phys);
>> +	dma_free_noncoherent(dma->chan_tx->device->dev, dma_bufsize,
>> +			     dma->tx_dma_buf, dma->tx_dma_phys, DMA_TO_DEVICE);
>>   err_tx_dma_buf:
>>   	dma_release_channel(dma->chan_tx);
>>   err_tx_channel:
>> @@ -582,14 +595,16 @@ static void dspi_release_dma(struct fsl_dspi *dspi)
>>   		return;
>>
>>   	if (dma->chan_tx) {
>> -		dma_free_coherent(dma->chan_tx->device->dev, dma_bufsize,
>> -				  dma->tx_dma_buf, dma->tx_dma_phys);
>> +		dma_free_noncoherent(dma->chan_tx->device->dev, dma_bufsize,
>> +				     dma->tx_dma_buf, dma->tx_dma_phys,
>> +				     DMA_TO_DEVICE);
>>   		dma_release_channel(dma->chan_tx);
>>   	}
>>
>>   	if (dma->chan_rx) {
>> -		dma_free_coherent(dma->chan_rx->device->dev, dma_bufsize,
>> -				  dma->rx_dma_buf, dma->rx_dma_phys);
>> +		dma_free_noncoherent(dma->chan_rx->device->dev, dma_bufsize,
>> +				     dma->rx_dma_buf, dma->rx_dma_phys,
>> +				     DMA_FROM_DEVICE);
>>   		dma_release_channel(dma->chan_rx);
>>   	}
>>   }
>>
>> --
>> 2.34.1
>>

