Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5122639B
	for <imx@lists.linux.dev>; Fri, 12 Jul 2024 02:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720752080; cv=none; b=qJYCnc/3JCFnW+1S7tcZ2fNNHctzImbZbmRtzs9zagjx0AwrQaV2V4bYrATR+wH7JSWzt/Ntzc5LhTxSVFYgfgQmMbssr3aVgXQ217Y2Gkm1t/stnJ9pwuZbNf8IkP1Xdg1TtK4xtPR9+dYNfKTrqAs/o/WkaKXDcFmsdZ6y0IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720752080; c=relaxed/simple;
	bh=nNz8Np3BqnYRV4U4GsSfjjIgJJguONYrhvjHGtvS/Iw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhZ5H8T+9ZzlAbhxL1b/FG+NMLSk3uCQSy3oaTLmviQ2+XriiowQaRwDZl5IRUKNgSUBNz0X6nyyC9fj+3kXiL4Ws+XMrotZcfjfMX9bd8eskujuS8XeWQV3m15m3OCWWbMtwDpa47t1VI749S5jfW6/EwCxNWllHA3cuZHgx/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtJi/Z1d; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtJi/Z1d"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70b04cb28acso1272071b3a.0
        for <imx@lists.linux.dev>; Thu, 11 Jul 2024 19:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720752076; x=1721356876; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=v214KiYeqf8G1PHh+bBlPbq7O1sJRmEyJnCngtloDPM=;
        b=YtJi/Z1dPYolGHXBn7O0buqHMOskkaA9FBACtsahswo7eF/5wuJho51cq+n/6u8F2k
         UkbG+H6HhHfmnfmVLHLBH777j4XvMVkoYno4fj8oCV9nltwyndMy2fITxhUSRT+I1BRn
         iTJ2L8wEfzCnuFab6zq+t/mdK96ASwl4GVgVqNyKtzWFWipyYhxQmlc39w2xhfmpfte9
         LY5fO6CKUKL/1L0rMmzGh72g2uNotpUoK9IEyEJpu8nO11bTX4OZ7nS++BfO9sBkqqEh
         m9+wPKaMbrZF5iG3Qg67PSguVWO/08IL0N6V6q4puffXeKUtoMq6HO704b5KPAfUBBFD
         UPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720752077; x=1721356877;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v214KiYeqf8G1PHh+bBlPbq7O1sJRmEyJnCngtloDPM=;
        b=xNrjMAZO1hiS46qThnpNX1W9pLhZ95axefSgF2AlzYYzHYttlqQtcXdKGsEin3xy1f
         9uNIYGby/ewSHIy51LR9v2u4zP3wO6KId09xSHOHonTnxaBQZnB84/W6avE/Kyn8I0OK
         FQ3e+0EAFuZHGmMUEzLYjkHhxKlLRGV2LgXuceW+o1tfWtr9FyAOvBhzP8NMqCWbA6ft
         HNpnY+XEKwQ18TykS5IQkzB+Yxx3q2AA8j0ty2E0t05YbC61Qw/cgA123JM1ReBxfU96
         TEQg+0Wqi710Q2InmEn4PUxhrOJvkdSVo8rElDgF6F5Aa90YzJ83FBx/WeezGNDIWQZY
         8ZFw==
X-Forwarded-Encrypted: i=1; AJvYcCW4dtvPIxjIvZglpbkrj2I0MTDFjDN4qeIUxg/613AwU357/qN1ZXOREpabnkiOat9mPpWNCFkrxKJDtZX2k+1Iivm/
X-Gm-Message-State: AOJu0Yw+EvxOSLOjiswvSaesnHCklkpJa9LaBv2geA4S0jNu20r4iGLR
	9Hd5ruK8r3rMYX8EbscD1oAPnRn2DdKQp2N2yP8hGUIpfZqXKGPl
X-Google-Smtp-Source: AGHT+IFvNQj3igaMR3/Ml0SwuwpnsHLlnyo0OSBUvDad/una4zeYIBACJZle31z2IfugFnm88OjGPQ==
X-Received: by 2002:a05:6a00:4b51:b0:706:3d61:4b21 with SMTP id d2e1a72fcca58-70b6cae4c6amr1965416b3a.3.1720752076418;
        Thu, 11 Jul 2024 19:41:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438c7146sm6389899b3a.66.2024.07.11.19.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 19:41:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <273b53a5-c71d-423c-b27d-22c20a2eea51@roeck-us.net>
Date: Thu, 11 Jul 2024 19:41:13 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: imx7ulp_wdt: needn't wait 2.5 clocks after
 RCS is done for iMX93
To: Frank Li <Frank.li@nxp.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-watchdog@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ye Li <ye.li@nxp.com>,
 Alice Guo <alice.guo@nxp.com>
References: <20240711-wdt-v1-0-8955a9e05ba0@nxp.com>
 <20240711-wdt-v1-2-8955a9e05ba0@nxp.com>
 <696425a1-8e71-464f-9fe7-b965452b9d84@roeck-us.net>
 <ZpCJZZNDeTgi7Lzy@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZpCJZZNDeTgi7Lzy@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/11/24 18:39, Frank Li wrote:
> On Thu, Jul 11, 2024 at 03:55:52PM -0700, Guenter Roeck wrote:
>> On 7/11/24 15:41, Frank Li wrote:
>>> From: Alice Guo <alice.guo@nxp.com>
>>>
>>> i.MX93 watchdog needn't wait 2.5 clocks after RCS is done. So set
>>> post_rcs_wait to false for "fsl,imx93-wdt".
>>>
>>> Signed-off-by: Alice Guo <alice.guo@nxp.com>
>>> Reviewed-by: Ye Li <ye.li@nxp.com>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>>    drivers/watchdog/imx7ulp_wdt.c | 1 -
>>>    1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
>>> index 904b9f1873856..3a75a6f98f8f0 100644
>>> --- a/drivers/watchdog/imx7ulp_wdt.c
>>> +++ b/drivers/watchdog/imx7ulp_wdt.c
>>> @@ -405,7 +405,6 @@ static const struct imx_wdt_hw_feature imx8ulp_wdt_hw = {
>>>    static const struct imx_wdt_hw_feature imx93_wdt_hw = {
>>>    	.prescaler_enable = true,
>>>    	.wdog_clock_rate = 125,
>>> -	.post_rcs_wait = true,
>>>    };
>>>    static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
>>>
>> Introducing that flag in the previous patch just to remove it here doesn't
>> make sense to me, sorry.
> 
> Some maintainer want create function equal patch first if just code
> restructure/re-originzed. Then add additional change base on it.
> 

In general I would ask you to do that as well, but not if patch 1/2 introduces
a change and patch 2/2 does nothing but to remove part of the change introduced
in patch 1/2.

Guenter

