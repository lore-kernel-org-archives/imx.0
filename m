Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A7E207646
	for <imx@lists.linux.dev>; Thu, 13 Feb 2025 06:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739427168; cv=none; b=fGLnXzrLs12GcHplQ8jco/Q7lyuxS+zqCUjp2R2j+WQnVU/fUdGnvb8dlnTcvMYrrFF7HYAqUr3XHp+mxMV9QgMjhkellNHkos2ahStsHyDYC+s1yosRUivRYk/NYM+WDQMtvjLhxYDTOXv/xdzXumg9TTOfYtdQzgraUGBRbbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739427168; c=relaxed/simple;
	bh=7C3/E7K4p+lE3lRlzJSt5GqsDZ487XK98lSEw0sndWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFejR0waMdqjp5bEJQrMBGdyB36kQpvXcJLP6h2DKMJlMsUFkpfm8l7PvI+f/TwFmNMo7t4sA3azagqAC+hAgyGT059F7ZMTDyUtTfMJ0pl+mcWYFjOuaIp1YeF6LBMbQTVZ6nY7ixlHhbxWl/ji40/G+GJXwyOJyh+iQi13mG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no; spf=pass smtp.mailfrom=remarkable.no; dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b=d4ceIJtk; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remarkable.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b="d4ceIJtk"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaecf50578eso110036566b.2
        for <imx@lists.linux.dev>; Wed, 12 Feb 2025 22:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1739427165; x=1740031965; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BWTCEpW4ZKwSUbhFip1v+YkWAMK+zwwmcEHsy52JujU=;
        b=d4ceIJtkXwrMeriMSKkqugHGNRuCJpnqkOgUrl4sDeMs9NmD1QZUC8IRcLv3HXAuQE
         dxfHEZnyP22DLcgc1pPpWgECqEH9XOHaqsOpy03lIuZ4+k5hBmoumtkur9oBxMD6T00Y
         MkWqUrvtbJErzp4fN/m/HwswSGusqQNHlSQ+1q17yWLVF/INqlk7oAOECNUlk5VCw50o
         9SxZwzwCsk6VD6uf1DJZN1pB0KLzn1xbVvP5ooO+t9afzfE+Lqo5V2hSfARiEkIJ6cPQ
         4NQcYLEHkyxP38HMF3Z7G2Kwj96RVWUo26EqEeQ957j46HnN1MdAPRMWUUp99h4FATym
         xRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739427165; x=1740031965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWTCEpW4ZKwSUbhFip1v+YkWAMK+zwwmcEHsy52JujU=;
        b=WILqd3eyf4SlnkGKgE9R1I+nlzzJ1HOvbEcowgKRUpI6EvvnHY3QqQ0T5FkPun8GQW
         isDtt/hnq+GkJRMdZ/rDW5xGSlxEWQIA9wWVk4OlkJ+CPUfN6UHXvmTja9cosCXbW1ht
         yatERvfD5FUJzt1l4Vzz5u6JY3HDP6UpZ6/w4DYQD1MAb6ZxCSOtQTM/hcSmDnIEM7oT
         qvdB4DeBS6/7+A9IMgNVvj5vwo9d8Dv6u8aF97YE/DPIKh8Ek/iTW2DWDuvkOMC0G2sF
         Itbz/5+QNUmyzpA624RonUvVlGuSkvCPNmunc3Z1xtcYrBiiDTG7dmnaY5rgwkrTg7vn
         yygQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTRFGDRgtPkhhu3yj7lEDGplwWBmIHptqPyc76CjHuA2fqfMycLuXDV7H6MI1fACuyNq0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVVUdkpD+Qw/sdQDqWT+6MKP6rspSszKRfC0kwD6wv0Qdwl9Nz
	BMtLfSqROyJoT1V6vkL7f/8YZDfdzWW9OfxtCeG26qDWwUd+6N/BQBw1JzJM04SiH+RMexzzWSM
	=
X-Gm-Gg: ASbGncvEgzPVgKLgkZh8ZZSPhmbTpjYzRwHGMDl7FOVb2r1zVeBqbivLOvpmpwva2NV
	xorDR+uuBqd8XHL1Sg/BDqB3rJ5A5dmK+mLOYumHnAHauEzJFklp3FeGtZdRCdBnRd0J889qILU
	X9hyNhLgRnHo0wRh4ooLD+TBA9MvWSXhGifTOLMIIdCCelOsk9so3/KPTQwDmIV9GMAcPo/48L/
	+iPK/CNOtl9e4WZaZd5+75z+Rt74xVe7Frtf1PdAuwPG/MPG1kcbwH5kQx1wa6DlIcSmbUXOZ/p
	ez/YrWng4guu3JqYkAspfLkY0Q==
X-Google-Smtp-Source: AGHT+IGat6ZjbMuioQKBQXOqTHYElW/luqM/opPulIQKdKaydLsYSALBxKDrmlk/19b2RqF3Lb9tsg==
X-Received: by 2002:a17:907:7288:b0:ab7:b928:1e05 with SMTP id a640c23a62f3a-ab7f334a9e5mr548728666b.4.1739427164707;
        Wed, 12 Feb 2025 22:12:44 -0800 (PST)
Received: from [10.0.72.158] ([213.52.63.204])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5337697fsm60116666b.105.2025.02.12.22.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 22:12:44 -0800 (PST)
Message-ID: <7df4608e-8016-4b16-a837-4cd7c3dd8c82@remarkable.no>
Date: Thu, 13 Feb 2025 07:12:43 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: vf610: add locking to gpio direction functions
To: Bough Chen <haibo.chen@nxp.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20250206181714.417433-1-johan.korsnes@remarkable.no>
 <CACRpkdaNDJrGZ4Y2PPUWQfm6BprfNACYWD7srs3sYHMEsdX1Ew@mail.gmail.com>
 <DU0PR04MB94963632094E71ABE730631990F12@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <cb75162b-de5a-475b-aeb6-9a3c39de108e@remarkable.no>
 <DU0PR04MB94964AA34ADC1564E685E13590F22@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Johan Korsnes <johan.korsnes@remarkable.no>
In-Reply-To: <DU0PR04MB94964AA34ADC1564E685E13590F22@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/10/25 10:35 AM, Bough Chen wrote:
>> -----Original Message-----
>> From: Johan Korsnes <johan.korsnes@remarkable.no>
>> Sent: 2025年2月10日 16:53
>> To: Bough Chen <haibo.chen@nxp.com>; Linus Walleij <linus.walleij@linaro.org>
>> Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
>> <bartosz.golaszewski@linaro.org>; imx@lists.linux.dev
>> Subject: Re: [PATCH] gpio: vf610: add locking to gpio direction functions
>>
>> [You don't often get email from johan.korsnes@remarkable.no. Learn why this is
>> important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> On 2/7/25 7:21 AM, Bough Chen wrote:
>>>> -----Original Message-----
>>>> From: Linus Walleij <linus.walleij@linaro.org>
>>>> Sent: 2025年2月7日 2:29
>>>> To: Johan Korsnes <johan.korsnes@remarkable.no>
>>>> Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
>>>> <bartosz.golaszewski@linaro.org>; Bough Chen <haibo.chen@nxp.com>
>>>> Subject: Re: [PATCH] gpio: vf610: add locking to gpio direction
>>>> functions
>>>>
>>>> Hi Johan,
>>>>
>>>> thanks for your patch!
>>>>
>>>> On Thu, Feb 6, 2025 at 7:17 PM Johan Korsnes
>>>> <johan.korsnes@remarkable.no>
>>>> wrote:
>>>>
>>>>> Add locking to `vf610_gpio_direction_input|output()` functions.
>>>>> Without this locking, a race condition exists between concurrent
>>>>> calls to these functions, potentially leading to incorrect GPIO direction
>> settings.
>>>>>
>>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>>> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>> Cc: Haibo Chen <haibo.chen@nxp.com>
>>>>> Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>
>>>>
>>>> Looks correct to me, verified by looking at the most tested driver
>>>> gpio-mmio.c and seeing there is a lock there indeed.
>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>>
>>>>> where after a couple of reboots the race was confirmed. I.e., one
>>>>> user had to wait before acquiring the lock. With this patch the race
>>>>> has not been encountered. It's worth mentioning that any type of
>>>>> debugging (printing, tracing, etc.) would "resolve" the issue.
>>>>
>>>> Typical. I would include this in the commit message, people care.
>>>>
>>
>> Hi Linus and Haibo,
>>
>> Thanks for the review! I'll include this in v2.
>>
>>>> Looking at the driver it seems
>>>> vf610_gpio_irq_mask()/vf610_gpio_irq_unmask()
>>>> could have a similar issue, both write the same register.
>>>
>>> Indeed, and also the vf610_gpio_set() / vf610_gpio_irq_ack().
>>>
>>
>> Could you please explain the race condition we fix by adding locking to these
>> other functions? F.ex. the vf610_gpio_set(), in which scenario would the lack of
>> locking cause an issue? It's a single write to either the set or clear register. Is this
>> related to how the writel_relaxed() works on different architectures?
>>
> 
> Sorry, I think twice of this condition, seems no need to add lock for these functions.
> 

Hi Haibo,

May I add your Reviewed-by or Acked-by in v2?

Kind regards,
Johan

> Regards
> Haibo Chen
> 
>> Kind regards,
>> Johan
>>
>>>>
>>>> Both issues could be fixed by converting the driver to use
>>>> gpio-mmio() with bgpio_init() which would also implement
>>>> get/set_multiple support for free.
>>>>
>>>> I have no idea why this driver isn't using gpio-mmio.
>>>> Not your fault though, just pointing out obvious improvement opportunities.
>>>
>>> I check the code, for
>> vf610_gpio_direction_input()/vf610_gpio_direction_output(), to let the
>> input/output really works, need to call pinctrl_gpio_direction_input() for
>> vf610/imx7ulp/imx8ulp SoC.
>>> Refer to drivers/pinctrl/freescale/pinctrl-vf610.c, it implement
>> gpio_set_direction callback. Also for imx7ulp/imx8ulp pinctrl drivers.
>>> This should be the reason why not using gpio-mmio.
>>>
>>> Regards
>>> Haibo Chen
>>>>
>>>> Yours,
>>>> Linus Walleij
> 

