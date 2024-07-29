Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687A318C33E
	for <imx@lists.linux.dev>; Mon, 29 Jul 2024 21:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722289878; cv=none; b=V5U2LoDH16c5uKz6nCx6KXgwZc+QK+IDHP4ntn1hepr2eKcdJ9wfkx2dd5DmVNyXb2Qk6XGYkcexx/WTUvjv/ccsPu+YwCzzdOnIjHssAKiWAldsGse0/2oOmhz1lG1yhmVmoDIZ+faBAYjagi7sBfrrDPXnMuPUbKgKtP0M4aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722289878; c=relaxed/simple;
	bh=LrWqnISsEK8XrCpLK4+pJridYRM/C8H1gnw5Ws+3Xps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q3JOAUbHXCDq8peNo18aqhCLDbknPdtJgWMIS7VkUvZlrYvogpCk9McA42yRy4Au0hRLpbIm0v2sPfnNyJo2YBqrYF2t7dVJX4hbHeL22NFcmmTNUgcHvYqM96zxUFlBeVQkW66PgUWqGPIh97aeKq8udQGQx0FGbOKODPjDTtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSqMwZZL; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSqMwZZL"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70d25b5b6b0so2606188b3a.2
        for <imx@lists.linux.dev>; Mon, 29 Jul 2024 14:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722289876; x=1722894676; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HpKFNPu/eyMggjx9nIejJskxEf3iq1M/LEytVjF0bmE=;
        b=bSqMwZZLdYEUsZeyDCixrEgqxFzd+dwg7sowDySQyoW7ZrerYfyjpE6QRJUdBOdvQh
         fLvZZ4bQtuKCLO0Cu+xbI4WwbkyAww9UvZNvD9mOLCLSp5zBdebFsLxTiOTucXGeKrre
         ww3o8N9AEHgO5pz2jZfHU7T/HQa4W4LDMmyWwOGtbjrWdnxTtX6uLVLA2gqv9sQW7fhw
         gQ4Mysk1NSZWIVM57dFdqJa58nT03DWG21cXhbLV2wMaSqrF/GyG6VhL/rm7wfDG46ul
         lMKX4dDjkZS9l1t8Ex9iC29swlqv022f/eA59A10Ae6N9V1Mt5BxhLsHwT3BBjCgqHaC
         Wzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722289876; x=1722894676;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpKFNPu/eyMggjx9nIejJskxEf3iq1M/LEytVjF0bmE=;
        b=GyOhKx9wTOi6RvINNap+tnE9gCfrSmZkJOERbnQEi9QtNXR1hM+O69kchyfuDjk5q8
         cenYTF317dLOEFN5NWUv7UOkZVrcCobqeDtumpjQySSSqUNn2HLpVLoTDUW8R7Ku3e0Z
         det5yyTQDMgRQAIViRJa3up/Y+mOLKMnFDm421o6O7uttA0nv1llQCkIRgdNGnsxEvg7
         PGyoIFhIUwz7Als6DuWKx48yzI6H1YXpBImt8oFf5BjTLdWTBT0LsG+EhCATe1x13rUl
         sPGeEUiKWO25BGjEyNTSNPb8+Hd0eIVud6uMsnpeMB2V9Xrz+0qRe2CzQa8k6fi8eL70
         cB1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMY7iI2cOa9Ala+xnxRA9UzdP2VQva0oIrDemaGN3b7nztHVY+tjniAN4G3VLW/S4Zrp3pHOmpxioqWEE5K0z99fq8
X-Gm-Message-State: AOJu0YyWzFOkSrG23nKbQa1RAwkMnxEEF8T3KycxY+PP0Jjs0K6fKt9L
	F9YZ3hnF1lvHJBmho1M2g1XEICOkNaBGMn3QYkQlSdJEWbw102LnCQ96WA==
X-Google-Smtp-Source: AGHT+IFdoeF4n/4YIqBvowTatVW1tarAT1SSgsixYzO9oJIPThavqzeT2b87gN+FXSmK7pl8YlOz6g==
X-Received: by 2002:a05:6a00:b88:b0:70a:efd7:ada1 with SMTP id d2e1a72fcca58-70ecea3fd57mr7470387b3a.17.1722289875450;
        Mon, 29 Jul 2024 14:51:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8aa702sm7223969b3a.215.2024.07.29.14.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 14:51:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ca762afb-07e1-4b3e-9ab7-5bd5c128d7b7@roeck-us.net>
Date: Mon, 29 Jul 2024 14:51:13 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
To: Frank Li <Frank.li@nxp.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: alice.guo@nxp.com, festevam@gmail.com, imx@lists.linux.dev,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org, wim@linux-watchdog.org,
 ye.li@nxp.com
References: <20240729200601.1995387-1-Frank.Li@nxp.com>
 <716b9d31-f978-4384-b605-64896f8b2643@wanadoo.fr>
 <ZqgGtzLvV0QGR0PW@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZqgGtzLvV0QGR0PW@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/29/24 14:16, Frank Li wrote:
> On Mon, Jul 29, 2024 at 11:12:13PM +0200, Christophe JAILLET wrote:
>> Le 29/07/2024 à 22:06, Frank Li a écrit :
>>> Move post_rcs_wait into struct imx_wdt_hw_feature to simple code logic for
>>> difference compatible string.
>>>
>>> i.MX93 watchdog needn't wait 2.5 clocks after RCS is done. So needn't set
>>> post_rcs_wait.
>>>
>>> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>>> Signed-off-by: Alice Guo <alice.guo-3arQi8VN3Tc@public.gmane.org>
>>> Reviewed-by: Ye Li <ye.li-3arQi8VN3Tc@public.gmane.org>
>>> Signed-off-by: Frank Li <Frank.Li-3arQi8VN3Tc@public.gmane.org>
>>> ---
>>> Chagne from v3 to v4:
>>> - Go back to v2 according to Guenter's feedback
>>> Change from v2 to v3:
>>> - Set post_rcs_wait to false explicitly to maintain code consistency
>>> - Add Guenter review tag.
>>> Change from v1 to v2:
>>> - Combine to one patch
>>> ---
>>>    drivers/watchdog/imx7ulp_wdt.c | 21 +++++++++------------
>>>    1 file changed, 9 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
>>> index 94914a22daff7..3a75a6f98f8f0 100644
>>> --- a/drivers/watchdog/imx7ulp_wdt.c
>>> +++ b/drivers/watchdog/imx7ulp_wdt.c
>>> @@ -55,6 +55,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>>>    struct imx_wdt_hw_feature {
>>>    	bool prescaler_enable;
>>> +	bool post_rcs_wait;
>>>    	u32 wdog_clock_rate;
>>>    };
>>> @@ -62,7 +63,6 @@ struct imx7ulp_wdt_device {
>>>    	struct watchdog_device wdd;
>>>    	void __iomem *base;
>>>    	struct clk *clk;
>>> -	bool post_rcs_wait;
>>>    	bool ext_reset;
>>>    	const struct imx_wdt_hw_feature *hw;
>>>    };
>>> @@ -95,7 +95,7 @@ static int imx7ulp_wdt_wait_rcs(struct imx7ulp_wdt_device *wdt)
>>>    		ret = -ETIMEDOUT;
>>>    	/* Wait 2.5 clocks after RCS done */
>>> -	if (wdt->post_rcs_wait)
>>> +	if (wdt->hw->post_rcs_wait)
>>>    		usleep_range(wait_min, wait_min + 2000);
>>>    	return ret;
>>> @@ -334,15 +334,6 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
>>>    	/* The WDOG may need to do external reset through dedicated pin */
>>>    	imx7ulp_wdt->ext_reset = of_property_read_bool(dev->of_node, "fsl,ext-reset-output");
>>> -	imx7ulp_wdt->post_rcs_wait = true;
>>> -	if (of_device_is_compatible(dev->of_node,
>>> -				    "fsl,imx8ulp-wdt")) {
>>> -		dev_info(dev, "imx8ulp wdt probe\n");
>>> -		imx7ulp_wdt->post_rcs_wait = false;
>>> -	} else {
>>> -		dev_info(dev, "imx7ulp wdt probe\n");
>>> -	}
>>> -
>>>    	wdog = &imx7ulp_wdt->wdd;
>>>    	wdog->info = &imx7ulp_wdt_info;
>>>    	wdog->ops = &imx7ulp_wdt_ops;
>>> @@ -403,6 +394,12 @@ static const struct dev_pm_ops imx7ulp_wdt_pm_ops = {
>>>    static const struct imx_wdt_hw_feature imx7ulp_wdt_hw = {
>>>    	.prescaler_enable = false,
>>>    	.wdog_clock_rate = 1000,
>>> +	.post_rcs_wait = true,
>>> +};
>>> +
>>> +static const struct imx_wdt_hw_feature imx8ulp_wdt_hw = {
>>> +	.prescaler_enable = false,
>>> +	.wdog_clock_rate = 1000,
>>>    };
>>>    static const struct imx_wdt_hw_feature imx93_wdt_hw = {
>>> @@ -411,7 +408,7 @@ static const struct imx_wdt_hw_feature imx93_wdt_hw = {
>>>    };
>>>    static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
>>> -	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx7ulp_wdt_hw, },
>>> +	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },
>>
>> Nitpick: while touching something here, should imx8ulp be after imx7ulp?
> 
> Yes, it should be better.
> 
> Guenter: do you think it is okay to move it after 7ulp?
> 
Sure

Guenter

> Frank
> 
>>
>> CJ
>>
>>>    	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
>>>    	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
>>>    	{ /* sentinel */ }
>>

