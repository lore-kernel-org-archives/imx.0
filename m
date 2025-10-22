Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5328D2D7804
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 04:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761107664; cv=none; b=FEkONVW7Xy7nckoRZhDAyLVllrMpNuuH+/MsKbzIYpqlfOPV9VKq85pfDilD3/K8Q3GNmjv8VWinztWNqIDVik8kPHbfBjrvUGhR1jHEXuvywomvSrjHcM3XyC8Dw68Jo3iQgJ/F7dwqRWh4cqOQ7Sjc+iu+bnm9O36MTWvTZOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761107664; c=relaxed/simple;
	bh=szq/rOHUN+3GufB7hVfQTfjTIKoq4aYdgJfWA0SfWRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LAbtKCBZS5diAvPMI3YzQPxBJFjF7qlRSxaX9b6pR1OSp/OnFOLkuCNOZUdrRFAEMMwJ5x3TAJFNywmOyTEq6GzzANsTyzNaigqU9OWCxNAM6ntDZN5hohgGf2bs2QWxhRV6jaX/5QhOKe3BCQMC0T38cZVqUfrEJVMFom6ebXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=EwZv1Fps; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="EwZv1Fps"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-292fd52d527so9687085ad.2
        for <imx@lists.linux.dev>; Tue, 21 Oct 2025 21:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761107662; x=1761712462; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXV9nPTtzRS7GB0GpGCBfWyozkzIjx5wpujc/niwppI=;
        b=EwZv1FpsJTTl2m1QWwLOIrSERmnejkJNz3DSGsE8BhljFhPnGTUwdkwrxg7HnCfcXx
         FtcNq67dnyInvD681Y27EklRbDbq8IYk1bmb3hDogybqf9M4VwQvxOYZRF5y5Airis6H
         LZ4KkLb7ZrTm0vvySDxzuJ43R6ImvbdniG6OhzhbD0E4fTAgdrKF7XIjIWdrzsdRWohK
         Wb6Y7Sqi8ClGqKYMLa/DjX7JOtEWeetKIY8YigOaFK7vSMt8JaFg+hDFbShA2wOSGIQj
         GcVCtlMTMxJK0qzdUQEd/gR+Lu5lr02kZcPA/Q/FoMIDsM4MVmsk/v9kGhWyj28DtY6+
         pxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761107662; x=1761712462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXV9nPTtzRS7GB0GpGCBfWyozkzIjx5wpujc/niwppI=;
        b=hfXCpBcHT3x56gOYmpPQSZwzIIRHoPr1dLNcv+5i227qqF7Vumb0nERedRYFbxvW/I
         DOpUXVWMSFVq3P8ieEnvTZ0b0wyK40357tA+QuSVTXyf+iqOLDheDxrH9f2LAtZDqXU7
         kEcP1S9PfgX+Rmnaf1MUFFQEm5m6Zh9bZ8dEvPljX1c2u/rs8WwWJsRO8Iq6KuGfpoOd
         GveqcQJep8T+LP4RgutCApPaEoQ1b+Zj2zfVH2XLOd4pUvpAH2ysOjZ2Izrj0YWzHkbO
         V2Om7DzTuwa58UDeUsxq9pgFM30nN4o+Wj8u0ImbutfIa9OnAIwUfe7xFt9miD8Kwshm
         ziXA==
X-Forwarded-Encrypted: i=1; AJvYcCVp/61/uUwCtpW4EshCIOVMA4q6SrGiwQspQ1QvD6RF/Q35a1GGheij59QaP/RIrobhY3E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfDI9y1htXYzZnrwiWjcuV3A2XMQqLCKb7XU+mS5JZnNcdBY47
	jGQRTXgGwJrEDY9m6mw7JhwVI610vr6Ls94cyewB2TZ/OQTYbHgBxSvCt6RYsg8Lr6E=
X-Gm-Gg: ASbGncvI8HSFCW+xTTbysqAr9TjKeJQWiZ9Nf/N67xjy3Rg4EJi91XqsU8tRip5F2Mn
	RL5vCZSJPB7i6987+PFINomZRHfxU7KkiKSbo++4an98BiZBpyW7mEYntOMWiMs84tuqMcuMj/S
	YTAnu1gqDLAaUWvoROTfky2mvttMtAgaIgldY3egRawSC5SCD9ai/xMbv9RGATH4Ld7UU3jt3Yj
	RAmC3Rs7iNTYVOHLQOXVmr4g0lAuz4/8RYjjOm9AENI8hGwExgR16BOohtNAq9KU9fK2tasEDz6
	tPKcrYHvxyAw3M5mr9jEACTgU2f0ZDm30SDTRHRvRHmlnYz406iWNdRcr4TpMFbxsSdIpjrqbj9
	DtrsKNAzDErJQjlhBhsuJW3bl3TauTdc+4lsWfiBpdtWiJ2hDoHJwrZ0WN9HMQKoc45hJRjrY8p
	TwsyFAKCMILMCq
X-Google-Smtp-Source: AGHT+IGMxMq8ODA384WIjA22NE56jXOrifm3A5Z150bOKY/fGOgxvMMpMNK8BhQcEf3SEUsHJhYpWg==
X-Received: by 2002:a17:903:298d:b0:267:87be:505e with SMTP id d9443c01a7336-290c9cbc185mr219746635ad.23.1761107661774;
        Tue, 21 Oct 2025 21:34:21 -0700 (PDT)
Received: from [10.211.55.5] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fe4cdsm126257025ad.97.2025.10.21.21.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 21:34:21 -0700 (PDT)
Message-ID: <c93c1319-2f1f-4303-bb4b-751979f58149@riscstar.com>
Date: Tue, 21 Oct 2025 23:34:20 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] spi: fsl-qspi: add optional reset support
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, p.zabel@pengutronix.de,
 dlan@gentoo.org, guodong@riscstar.com, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-4-elder@riscstar.com>
 <aPaIezCu/gXxJC01@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPaIezCu/gXxJC01@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 2:07 PM, Frank Li wrote:
> On Mon, Oct 20, 2025 at 11:51:46AM -0500, Alex Elder wrote:
>> Add support for one or more optional exclusive resets.  These
>> simply need to be deasserted at probe time, and can remain that
>> way for the life of the device.
> 
> Nit: please wrap at 75 chars

You're saying wrap at *longer* lengths, right?  If not, please
clarify.  I'll update in v2.

Thanks for the  review.

					-Alex

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/spi/spi-fsl-qspi.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index c887abb028d77..1e27647dd2a09 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -36,6 +36,7 @@
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_qos.h>
>> +#include <linux/reset.h>
>>   #include <linux/sizes.h>
>>
>>   #include <linux/spi/spi.h>
>> @@ -267,6 +268,7 @@ struct fsl_qspi {
>>   	const struct fsl_qspi_devtype_data *devtype_data;
>>   	struct mutex lock;
>>   	struct completion c;
>> +	struct reset_control *resets;
>>   	struct clk *clk, *clk_en;
>>   	struct pm_qos_request pm_qos_req;
>>   	struct device *dev;
>> @@ -857,6 +859,8 @@ static void fsl_qspi_cleanup(void *data)
>>   {
>>   	struct fsl_qspi *q = data;
>>
>> +	reset_control_assert(q->resets);
>> +
>>   	fsl_qspi_clk_disable_unprep(q);
>>
>>   	mutex_destroy(&q->lock);
>> @@ -902,6 +906,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>>   	if (!q->ahb_addr)
>>   		return -ENOMEM;
>>
>> +	q->resets = devm_reset_control_array_get_optional_exclusive(dev);
>> +	if (IS_ERR(q->resets))
>> +		return PTR_ERR(q->resets);
>> +
>>   	/* find the clocks */
>>   	q->clk_en = devm_clk_get(dev, "qspi_en");
>>   	if (IS_ERR(q->clk_en))
>> @@ -923,6 +931,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>
>> +	ret = reset_control_deassert(q->resets);
>> +	if (ret)
>> +		return ret;
>> +
>>   	/* find the irq */
>>   	ret = platform_get_irq(pdev, 0);
>>   	if (ret < 0)
>> --
>> 2.48.1
>>

