Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB29D280CC8
	for <imx@lists.linux.dev>; Wed, 25 Jun 2025 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845148; cv=none; b=KpsgtChUn+7SCWki/k8ID+zeyAte0/qSBaFCxl/8EdoXYTWRVjzpG8oU1UGqF7I3JMovdIgLkiImde7xq9QXwpMjqjUo325nDPaSNsbfOqYIIFlpLUiGDkyoe9ogqOhQK8zbHRX0Bd8XjSsqxsIXmBWOuPp2+apjkhbwT33udAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845148; c=relaxed/simple;
	bh=MrRga72y9s3IG9s+3PWdhvyFhlYCAnz1dBzKqnRtsvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtATED/xLbbDDLaAp5IwJVPKUiCT5aaUmPEc3Igy3Cp5hSNAPHL5HyrQ2PKSb4aSnEXCm3iZzLPUBAKGFcEReMwCeJrMO7zVSLCF8FOdvT8bXQspSpwCthFqIuXPDNlJevOYGgLKnImubwreWQHYcBVpp5Bu8Fwhm8OSHTDMOz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yvQmp1pe; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yvQmp1pe"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442fda876a6so57147245e9.0
        for <imx@lists.linux.dev>; Wed, 25 Jun 2025 02:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750845145; x=1751449945; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvynr5GPXAD7xF14LG7ABlRKJ5SF08nktafK/D9Sp4o=;
        b=yvQmp1pej00z1MRPcn7Y0/GMU1N1aJ05i5xId3xkzbl19lluBtOVQR1E5IBt1NmBjA
         EzaKCjDy6L/SyABbkPhEvEVynKcR/yqMyQcwlCB4ZKJuLbkJ5LXxj2Pj+MbPsjxfJEWQ
         uCsAsnytqtr5cCsbsG2Xu650MJloQh9DCLWhOthdc1//inO5BDw3r598wK60tzgb63tm
         5oFtj6m8snGs2ZhN78swo/6rXYrq6jaAgYvwGfYOOkJw6o05/REhrnKOSkX4A63HwvG7
         pz6dYsEXWsH/jt6bxwZaEAmC/eSdexrLJ8pEE/NXzOe+hcCDGWXNuDdzUfNFX3SZFVEV
         w1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845145; x=1751449945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gvynr5GPXAD7xF14LG7ABlRKJ5SF08nktafK/D9Sp4o=;
        b=sAAp2uI17mUZF9PWmSSthB06UE2oKGignV7KeIO0MQWZCn/MnKXE4BA046KV3tW835
         SbQgmFNTevOiEwmHF2aYMIuLZvOBi7VSGao2P2LY84fYZmFGu4fHBcadq8pk6zQhLUUf
         M6FNyp6ByQWb1aqGztzP6I/X0jo18bgxt3k5KbDJNHx6ktJofm7bPBDtzZl0d1MedNot
         V1PRLO5sDCDs/nzSw7V1plBDcAT5Z64cxXwOfzg6xnLtsvp2t/wKmEu+1vSZHRfnx8nL
         Go2FvmjFr4itWt637CATe+n4yuajWzprKtXmorW5MzXCM2dh3gbgFqjaL88CdMuukHYs
         aOpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYwch9jit63Gg61YH/27fJSFhZSZnIxPlGHp4K4Du/ZGf6IPhrf2Jqdl99lOeSlDfqTks=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7zc1PhfWDFrdt32pUIfIcIIUYPcOmNa/IrS+1Z+nxaWH6HPQd
	QjOJ5OhDrAtDYmKy4m3lLXRCOq00txQb4tIfT80/SUaWA/ZX2ubGxRDrOgNR0cprW9k=
X-Gm-Gg: ASbGncvLzblnOzyJpxHw1lZ3vG1Ev1Sfp6hJMgxuDCwiAE8+WzqpRujUeoTKBDwaitU
	ArUBsCQv8mqtaa9ZQtxhWMZybc5/TfRwit42LPTWxJScSaMyEJFu3ImWs0vCIEo6/yll9MmcTN0
	UJi+cFt70oMIXoz+x6ZKlbl7vJ16GP5KJwjF32e7fLlaS/Y/FTV1EaiJHmuGdAbuWmZSx5V/XNB
	rBJqNoJ9aegCqLNGj7n4ebMvpMkcMAGJ1/9a/ClyqlhLahWH0QAxZgIkyssNszYHzyz56uJaEhl
	ZYjeseSfhJpDQM0c51d80bB6v2qzehPrfjRV3lyo6Tz4sPBtIeZ/GUx0+3sHWz5LSEQ=
X-Google-Smtp-Source: AGHT+IGWhnH2ozWlkqt9r0oHgwgVkhzmM8aFffesqO/fLKJ2oKRNU+kDEm/CqDK4ln1Y/aAeqeYL2g==
X-Received: by 2002:a05:600c:8b70:b0:442:cab1:e092 with SMTP id 5b1f17b1804b1-45381ab1724mr20000025e9.11.1750845144979;
        Wed, 25 Jun 2025 02:52:24 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453822c3084sm15607705e9.0.2025.06.25.02.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:52:24 -0700 (PDT)
Message-ID: <3eddec49-f41a-4b59-972f-92693677bb7c@linaro.org>
Date: Wed, 25 Jun 2025 10:52:23 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] spi: spi-fsl-dspi: Clear completion counter before
 initiating transfer
To: Frank Li <Frank.li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Larisa Grigore <larisa.grigore@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
 <20250624-james-nxp-spi-dma-v3-1-e7d574f5f62c@linaro.org>
 <aFrLMCq6hRJj5FjI@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aFrLMCq6hRJj5FjI@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/06/2025 4:58 pm, Frank Li wrote:
> On Tue, Jun 24, 2025 at 11:35:31AM +0100, James Clark wrote:
>> In target mode, extra interrupts can be received between the end of a
>> transfer and halting the module if the host continues sending more data.
>> If the interrupt from this occurs after the reinit_completion() then the
>> completion counter is left at a non-zero value. The next unrelated
>> transfer initiated by userspace will then complete immediately without
>> waiting for the interrupt or writing to the RX buffer.
>>
>> Fix it by resetting the counter before the transfer so that lingering
>> values are cleared. This is done after clearing the FIFOs and the
>> status register but before the transfer is initiated, so no interrupts
>> should be received at this point resulting in other race conditions.
>>
>> Fixes: 4f5ee75ea171 ("spi: spi-fsl-dspi: Replace interruptible wait queue with a simple completion")
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/spi/spi-fsl-dspi.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
>> index 04c88d090c4d..744dfc561db2 100644
>> --- a/drivers/spi/spi-fsl-dspi.c
>> +++ b/drivers/spi/spi-fsl-dspi.c
>> @@ -1122,11 +1122,19 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
>>   		if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE) {
>>   			status = dspi_dma_xfer(dspi);
>>   		} else {
>> +			/*
>> +			 * Reset completion counter to clear any extra
>> +			 * complete()s from spurious interrupts that may have
>> +			 * happened after the last message's completion but
>> +			 * before the module was fully in stop mode.
>> +			 */
> 
> I think you change is correct. reinit_completion() should be called before
> dspi_fifo_write().
> 
> comments is quite confused. how about below comments?
> 
> /*
>   * Reinitialize the completion before transferring data to avoid the case where
>   * it might remain in the done state due to a spurious interrupt from a previous
>   * transfer. This could falsely signal that the current transfer has completed.
>   */
> 
> Frank

Will do

>> +			if (dspi->irq)
>> +				reinit_completion(&dspi->xfer_done);
>> +
>>   			dspi_fifo_write(dspi);
>>
>>   			if (dspi->irq) {
>>   				wait_for_completion(&dspi->xfer_done);
>> -				reinit_completion(&dspi->xfer_done);
>>   			} else {
>>   				do {
>>   					status = dspi_poll(dspi);
>>
>> --
>> 2.34.1
>>

