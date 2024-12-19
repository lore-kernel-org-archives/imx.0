Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B322AE72
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 03:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734578942; cv=none; b=MMKKHTEk4Pot43mxVgw9Uebiutex0/LmgEh59LlMrovSw2Qg+Pvu0qYRsCr3hdiUVbxvs1NhsgN8I49EVOtPHZ3GhM0CClwcOTqCTzjNXSomvDvzjbcOHBEGTsUFt5VMCo4YqWyQ0oACeEdEEBo7nj/2xm1hwkMuTnPNc7paEk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734578942; c=relaxed/simple;
	bh=QEhJ+kyX2Te0LXfnqeUdbxfZ5TqhG9m8pI8EZNvzRcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Klsyr2LqZCwkapGs8dYQHnQXnFY40B+y/sD87+Gjpl2Vc1QShQPFainnhZMtWPMrVwgi+3j8E+BfhtJUi6D2rTvCAmw9qaIj5PXYnSvGs5Ot8+L7ALaP9DlY7BIXHi6jifHvChBQLBU43GUwvQ3/clxJiCtHbb1CK5Joobk3Pow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=pVuIDhPh; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="pVuIDhPh"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-728f1525565so428493b3a.1
        for <imx@lists.linux.dev>; Wed, 18 Dec 2024 19:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734578940; x=1735183740; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rvaWcqt3DdZfe8gubmvaMv07BeNtiRXWvTpME62qtto=;
        b=pVuIDhPhyJr0lnOebv28Q8rriWiPyn/I1we+VNhrlCkIxGn6z0HTt5v363g5TVncTg
         SFOgJzJG8TJUZxZ+I/VNmJRDPsaAsaloV/vlzWz3qRuWRcQFMXi8RJ4EcoMF8hnrBHBT
         lXh/UrP1DDRe99/vnTCFq2N05eH7a/Rk0kk9P+/pUhqymktpSAFSL+h616uq7Li2P+DA
         Eptv7H2ZQ7urvecwwAkYtLGzg3h93Dg/aXCVzs0vuIPBHNHEzfRI8rXVeIpgnKQB1ykE
         7r+sS13soyjIoxH8Pa+OEQLztVmXbSVKa8UmECIVobHwslIEPmY5szN+YV1KSMamong6
         60YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734578940; x=1735183740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvaWcqt3DdZfe8gubmvaMv07BeNtiRXWvTpME62qtto=;
        b=uoELTltH8DQ2SoRPXq0KBNs6n6KLyXKhSI/R52uBe9eKLWbceG+QvFTGSQqFnolH2f
         dG/lF51wnCd3vAPw7Td1++gc7CR0g3oId2vap/BaB8VpFSfVjSCVAWB6VL57NTyW1KYI
         Ntu36msXap1iFf3zjnqnr02nfQ+5ocUV8EUJuoVq5QIPOsY9RUzcxC6pvGuVst8RTnB0
         PM4jXg0ZkPSfjRFjrzSx6RZed2cjmx2wVc4X7/cZxPvQgHQieA0QEuaNfIXvPsxlZU6N
         gWJAPlkuLi/y/Hw9t5o51NLOguHGIlzZG3wx7kL1d8W1kEmKkr6utbUrblOqRmpYNi6F
         /LJg==
X-Forwarded-Encrypted: i=1; AJvYcCXQas7zzATC32EO8T6lc3ZTQ740bBga5uAquCMO9NWipN5+LQJkvDpv9QHUowN1SKO3oj0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCvfk9OA/KGy8tMyCopCGLA5uoWsYojgAnuzVNqCR/kwfk84QK
	nHh4paHeTALc/CbUJ6bLMc06ojgFKgK0KhZx1TxrCSbL4e8pnSXqLw1hjm+tt2+cw5n3vInmwqc
	0H2FouA==
X-Gm-Gg: ASbGncssGFxkHmAw/XvQyGcjPmgVOEdWeIaJYf727YxhNlcgPPgRX5OM1hcS1hToOvA
	z+0Kxdh1PL7tkCXNK4Y0Z1YhwjYpkA6JRXCLQPhX0JbE3UdqSaLryIInSdbSuLcvhJbVA5pA9IE
	egKbqavA3gZE7yXsWKr64D4qobTccxnAn9W++AvNcaBxhlEqcXSCr+1yBU8bGIoNBKqtL+V9m+v
	1ZKRckySH3hZgUhUFVwis1tHK5BEnoOC1tvM+CoQCnb6Yz7Z+1FqKC0suthr4i8RzTT48gyN6K5
	Pxd9a/BaIdA1+lSuzaBPR2kofJYOQTwq/g==
X-Google-Smtp-Source: AGHT+IFeKBtE24rAacaKU9BWB5N2uhLBiJLXb+l8oIt7jcFNoLLD+4/4UJLYliRM3yNFG+uTUJ50ng==
X-Received: by 2002:a05:6a20:6a06:b0:1e1:384e:20f1 with SMTP id adf61e73a8af0-1e5b4820e71mr9315878637.25.1734578940507;
        Wed, 18 Dec 2024 19:29:00 -0800 (PST)
Received: from [192.168.0.78] (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbaa6sm228665b3a.91.2024.12.18.19.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 19:29:00 -0800 (PST)
Message-ID: <f75932aa-b005-44f7-abc0-0795ae4e3ffa@pf.is.s.u-tokyo.ac.jp>
Date: Thu, 19 Dec 2024 12:28:57 +0900
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: fsl-edma: implement the cleanup path of
 fsl_edma3_attach_pd()
To: Frank Li <Frank.li@nxp.com>
Cc: vkoul@kernel.org, imx@lists.linux.dev
References: <20241214040113.626275-1-joe@pf.is.s.u-tokyo.ac.jp>
 <Z2BgCnf+DTiir/uV@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <Z2BgCnf+DTiir/uV@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you for your review.

On 12/17/24 02:14, Frank Li wrote:
> On Sat, Dec 14, 2024 at 01:01:13PM +0900, Joe Hattori wrote:
>> Current implementation of fsl_edma3_attach_pd() does not provide a
>> cleanup path, resulting in memory leak. Thus, implement an error path of
>> fsl_edma3_attach_pd(), which detaches PM domains, removes device links,
>> and unwind the runtime PM settings. Also add fsl_edma3_detach_pd() and
>> call it on the error path of the .probe().
>>
>> This bug was found by an experimental static analysis tool that I am
>> developing.
> 
> static analysis often false alarm. Descript problem itself. for example
> how memory leak happen when call func1(), .. func2()...

Updated the commit message in the v2 patch.

> 
>>
>> Fixes: 72f5801a4e2b ("dmaengine: fsl-edma: integrate v3 support")
>> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
>> ---
>>   drivers/dma/fsl-edma-common.h |  1 +
>>   drivers/dma/fsl-edma-main.c   | 54 ++++++++++++++++++++++++++++-------
>>   2 files changed, 45 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
>> index ce37e1ee9c46..fe8f103d4a63 100644
>> --- a/drivers/dma/fsl-edma-common.h
>> +++ b/drivers/dma/fsl-edma-common.h
>> @@ -166,6 +166,7 @@ struct fsl_edma_chan {
>>   	struct work_struct		issue_worker;
>>   	struct platform_device		*pdev;
>>   	struct device			*pd_dev;
>> +	struct device_link		*pd_dev_link;
>>   	u32				srcid;
>>   	struct clk			*clk;
>>   	int                             priority;
>> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
>> index 60de1003193a..5204c06589ea 100644
>> --- a/drivers/dma/fsl-edma-main.c
>> +++ b/drivers/dma/fsl-edma-main.c
>> @@ -420,7 +420,6 @@ MODULE_DEVICE_TABLE(of, fsl_edma_dt_ids);
>>   static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_engine *fsl_edma)
>>   {
>>   	struct fsl_edma_chan *fsl_chan;
>> -	struct device_link *link;
>>   	struct device *pd_chan;
>>   	struct device *dev;
>>   	int i;
>> @@ -436,15 +435,16 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
>>   		pd_chan = dev_pm_domain_attach_by_id(dev, i);
>>   		if (IS_ERR_OR_NULL(pd_chan)) {
>>   			dev_err(dev, "Failed attach pd %d\n", i);
>> -			return -EINVAL;
>> +			goto err;
>>   		}
>>
>> -		link = device_link_add(dev, pd_chan, DL_FLAG_STATELESS |
>> +		fsl_chan->pd_dev_link = device_link_add(dev, pd_chan, DL_FLAG_STATELESS |
>>   					     DL_FLAG_PM_RUNTIME |
>>   					     DL_FLAG_RPM_ACTIVE);
>> -		if (!link) {
>> +		if (!fsl_chan->pd_dev_link) {
>>   			dev_err(dev, "Failed to add device_link to %d\n", i);
>> -			return -EINVAL;
>> +			dev_pm_domain_detach(pd_chan, false);
>> +			goto err;
>>   		}
>>
>>   		fsl_chan->pd_dev = pd_chan;
>> @@ -455,6 +455,33 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
>>   	}
>>
>>   	return 0;
>> +err:
>> +	while (--i >= 0) {
>> +		if (fsl_edma->chan_masked & BIT(i))
>> +			continue;
>> +		fsl_chan = &fsl_edma->chans[i];
>> +		dev_pm_domain_detach(fsl_chan->pd_dev, false);
>> +		device_link_del(fsl_chan->pd_dev_link);
>> +		pm_runtime_dont_use_autosuspend(fsl_chan->pd_dev);
>> +		pm_runtime_set_suspended(fsl_chan->pd_dev);
>> +	}
> 
> can you call helper funciton fsl_edma3_detach_pd()?

Makes sense, addressed in the v2 patch.

> 
>> +	return -EINVAL;
>> +}
>> +
>> +static void fsl_edma3_detach_pd(struct fsl_edma_engine *fsl_edma)
>> +{
>> +	struct fsl_edma_chan *fsl_chan;
>> +	int i;
>> +
>> +	for (i = 0; i < fsl_edma->n_chans; i++) {
>> +		if (fsl_edma->chan_masked & BIT(i))
>> +			continue;
>> +		fsl_chan = &fsl_edma->chans[i];
>> +		dev_pm_domain_detach(fsl_chan->pd_dev, false);
>> +		device_link_del(fsl_chan->pd_dev_link);
>> +		pm_runtime_dont_use_autosuspend(fsl_chan->pd_dev);
>> +		pm_runtime_set_suspended(fsl_chan->pd_dev);
>> +	}
>>   }
>>
>>   static int fsl_edma_probe(struct platform_device *pdev)
>> @@ -577,8 +604,10 @@ static int fsl_edma_probe(struct platform_device *pdev)
>>   			fsl_chan->clk = devm_clk_get_enabled(&pdev->dev,
>>   							     (const char *)clk_name);
>>
>> -			if (IS_ERR(fsl_chan->clk))
>> -				return PTR_ERR(fsl_chan->clk);
>> +			if (IS_ERR(fsl_chan->clk)) {
>> +				ret = PTR_ERR(fsl_chan->clk);
>> +				goto err;
>> +			}
>>   		}
>>   		fsl_chan->pdev = pdev;
>>   		vchan_init(&fsl_chan->vchan, &fsl_edma->dma_dev);
>> @@ -591,7 +620,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
>>
>>   	ret = fsl_edma->drvdata->setup_irq(pdev, fsl_edma);
>>   	if (ret)
>> -		return ret;
>> +		goto err;
>>
>>   	dma_cap_set(DMA_PRIVATE, fsl_edma->dma_dev.cap_mask);
>>   	dma_cap_set(DMA_SLAVE, fsl_edma->dma_dev.cap_mask);
>> @@ -642,7 +671,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
>>   	if (ret) {
>>   		dev_err(&pdev->dev,
>>   			"Can't register Freescale eDMA engine. (%d)\n", ret);
>> -		return ret;
>> +		goto err;
>>   	}
>>
>>   	ret = of_dma_controller_register(np,
>> @@ -652,7 +681,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
>>   		dev_err(&pdev->dev,
>>   			"Can't register Freescale eDMA of_dma. (%d)\n", ret);
>>   		dma_async_device_unregister(&fsl_edma->dma_dev);
>> -		return ret;
>> +		goto err;
>>   	}
>>
>>   	/* enable round robin arbitration */
>> @@ -660,6 +689,11 @@ static int fsl_edma_probe(struct platform_device *pdev)
>>   		edma_writel(fsl_edma, EDMA_CR_ERGA | EDMA_CR_ERCA, regs->cr);
>>
>>   	return 0;
>> +
>> +err:
>> +	if (drvdata->flags & FSL_EDMA_DRV_HAS_PD)
>> +		fsl_edma3_detach_pd(fsl_edma);
>> +	return ret;
> 
> Use devm_add_action() to avoid goto.

Fixed in the v2 patch.

> 
> Frank
> 
>>   }
>>
>>   static void fsl_edma_remove(struct platform_device *pdev)
>> --
>> 2.34.1
>>

Best,
Joe
