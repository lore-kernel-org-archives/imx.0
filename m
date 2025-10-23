Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91CD223702
	for <imx@lists.linux.dev>; Thu, 23 Oct 2025 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761235283; cv=none; b=pdbzbChb7bmG4VlAuI+86vPqgHrnULHmzXpma4iXtghTUOeZetNX0dzc9YyLnxg/DE+Z1WvknpHS6PRXFCvVaQRgO0GiznXf417lCQS72vSvzmT0bsxE3sqNMe2roKNzIJ939DvOxVLrBoxQmozF4Nur5fFVIKUwwCskjdJL0Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761235283; c=relaxed/simple;
	bh=c6kA44hknx8v12LG3Pmdwbh/PFufu9IqhXaWh9P4JOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1tUm6aFbOai7hRNxWHE8M+mbl18BNORfk6yYpt50VuqQI+jhaUdHWcGuMj0EFys1qp7J779HF4ySUk94ZWDwMStDr+vmCFQZFKecyv/pslLv9+hdUXjJ81/VKv+kVSBjQTQYm7yMWOIn6f41GzSZWYc33XEujEfFwB2XpP7Ruo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tpOODpgv; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tpOODpgv"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-40d0c517f90so71786f8f.0
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761235280; x=1761840080; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HMMM1M4ymK35clYhylXYL1Gxaw7kdFwoXGgw7ibB7f4=;
        b=tpOODpgvp2prvhstDATh84KUSbRX3Z7z25qO+qoIQymul558Si22eIm/mSEv4A3Tr9
         z6+KOhOUjXDfko+QCa3NshirmAk1szQ1ywQhX9w+1N1WF0Rt6stXdlE/Cwv977NdRR4q
         2FX1tYqbiymGnbBw5SfQNPycgibce5jrA/R/Z9KMXAqDDd/L9cq5cLoNtqsujMAnelGY
         2TvDvUilxlU+FamdZtN/JObEUheOZ+hZgO3IWeg2DsTpVPXWuyP2t1Io/37ExIaIzKLK
         KKoD98b3Qzjn6+nIcHYCuFCZ3wxaGJpJ7c8ITdb6S1RJNvWXAuDozKt2zNLwxJivg9I9
         y+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761235280; x=1761840080;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMMM1M4ymK35clYhylXYL1Gxaw7kdFwoXGgw7ibB7f4=;
        b=XOSBEYezGdKBqw3ddKcjU5iiLxY5FnqxRV+dGH8I7kYUIuZt22mo1O2lCOaiwFZAy3
         ChcxpOFQLbzYrVo6n+OwptQuDWW+BYu/XInJqngZgMFp/nGehd00zt1aYU42ewsYkoBl
         Bm28uwQTYG86YA5IhXod5RgsneKRPmJe80xhwiTwb+rUP7PwMMKT2Q4PBcCKDhKYeThn
         9nVgxZSUDr+V4JvCJu+3CE363offVOzcgrksjn7ZNivHFK+j5F3Mivwn5Cwfc5vQrlA8
         zZTvoQNLnXYr6UUsOYpRBUGBw/20Xdc7fsLDvITghxE9lNo+A5Jv1TUb4xzdFuCVbRXz
         VFKg==
X-Forwarded-Encrypted: i=1; AJvYcCUB11UlgwfJakA8Y07kBDa4+YrVjf2QnCMkc7hYPJC4rabLAm/gjl9aQtyCbJ686dLeQ7E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyR7FT7vbjeE/8T6n4NUgiTPf2DvLc7i1QpKukF4mcksf++TyNR
	vnLwY1oshSPcS/zZn4sVISera8IbzwD/1u3M02hxArBv7Pm/giXXUznySzQCkiohr4o=
X-Gm-Gg: ASbGncuBahbs4nwfHXT4z1nF00YtMtJXo+uBzRO8wgrpWsiOxzLJT0yNDX3g1Y3HABd
	76KvUK5Ry9vXGkgAhO10ds1FTkLlmV7YQ5+M/xWgx5G6j9wt4GOXNIHi1i36JHwanCMkaTH4DtD
	+UvmdHdXGqbbqGIRcjSRUN3Q/ShoD/X4TtTPEFgdVZY/AI+Olr5yG0FljpYT9fQQMXhXTwILyi3
	1cF6V+xD+anEUGHPHzJfIhKB/sBIdIdiIEeEL0ypaPktNGgME/GkXfPIPy63jE6/P3uaS6Z3Te4
	5Z2aVkv7NLAyuGAk2Om53R5yXamwJGd5Rn6v+GBHZy7IT1mQHsim26FjRc4Wytvrqybyc7ZSVJ3
	RhkL0MO8Gkk3nGwJmhCBf9a8ZeqjjrI/RaI24eRE6ceSGwnqzzZ+NXQKViicsyaNBpivIAKAsi2
	0rVv/lYJU7RbpsjQX+id3KlJ9u4k6ZXGuHYIQKHvEEwg==
X-Google-Smtp-Source: AGHT+IE7SLxl/2nK3Pkv0EEIxnqVO2wMoT+5I1j2a16NOwPkp24r6heWqdb+7CWJTEKpXFlALZ1nbA==
X-Received: by 2002:a05:600c:1994:b0:45f:2c33:2731 with SMTP id 5b1f17b1804b1-47117874694mr104333465e9.2.1761235279954;
        Thu, 23 Oct 2025 09:01:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428e9b2sm103977805e9.5.2025.10.23.09.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 09:01:19 -0700 (PDT)
Message-ID: <f1bc82c0-8800-42e5-8a4d-aea209acd0f2@linaro.org>
Date: Thu, 23 Oct 2025 18:01:17 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: defconfig: Enable i.MX95 configs for booting
 and Ethernet
To: Marek Vasut <marek.vasut@mailbox.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Peng Fan <peng.fan@nxp.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
References: <20251023-upstream-imx95-smarc-defconfig-v1-1-62c6e6f5b315@toradex.com>
 <3381308.aeNJFYEL58@steina-w>
 <e6b282cf-e9de-43b7-a8d4-30e67cefe430@linaro.org>
 <5d042f21-274e-4b69-849a-3342d77942eb@mailbox.org>
 <00555ed7-1aee-459a-ae60-0242809d7b85@linaro.org>
 <07aba8d4-533d-40f7-bcd3-548704d7d228@mailbox.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <07aba8d4-533d-40f7-bcd3-548704d7d228@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/10/2025 17:53, Marek Vasut wrote:
> On 10/23/25 5:32 PM, Krzysztof Kozlowski wrote:
>> On 23/10/2025 17:27, Marek Vasut wrote:
>>> On 10/23/25 5:22 PM, Krzysztof Kozlowski wrote:
>>>> On 23/10/2025 16:03, Alexander Stein wrote:
>>>>> Hi,
>>>>>
>>>>> Am Donnerstag, 23. Oktober 2025, 14:19:15 CEST schrieb João Paulo Gonçalves:
>>>>>> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
>>>>>>
>>>>>> Enable the necessary missing configs for the i.MX95 to boot and also
>>>>>> have Ethernet working:
>>>>>>
>>>>>> * CONFIG_NXP_ENETC4 for the network controller driver
>>>>>> * CONFIG_NXP_NETC_BLK_CTRL for the NETC hardware domain controller
>>>>>> * CONFIG_PINCTRL_IMX_SCMI for the pinctrl driver
>>>>>> * CONFIG_CLK_IMX95_BLK_CTL for the shared hardware domain controller
>>>>>>
>>>>>> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
>>>>>> ---
>>>>>>    arch/arm64/configs/defconfig | 4 ++++
>>>>>>    1 file changed, 4 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>>>>> index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..787d3ae3f5afeac486a905e0943e7b0e1dcee3a9 100644
>>>>>> --- a/arch/arm64/configs/defconfig
>>>>>> +++ b/arch/arm64/configs/defconfig
>>>>>> @@ -354,8 +354,10 @@ CONFIG_FSL_FMAN=y
>>>>>>    CONFIG_FSL_DPAA_ETH=y
>>>>>>    CONFIG_FSL_DPAA2_ETH=y
>>>>>>    CONFIG_FSL_ENETC=y
>>>>>> +CONFIG_NXP_ENETC4=m
>>>>>>    CONFIG_FSL_ENETC_VF=y
>>>>>>    CONFIG_FSL_ENETC_QOS=y
>>>>>> +CONFIG_NXP_NETC_BLK_CTRL=m
>>>>>
>>>>> Are you sure this should be module? Shouldn't NFS boot be supported by
>>>>> default? I might be wring here though.
>>>>
>>>>
>>>> NFS root is supported already with this being module. Yes, it must be a
>>>> module, cannot be built in.
>>> It seems I am using it as built-in on MX95 Verdin (patch is posted on
>>> the ML), and yes, I do boot from NFS root without any initrd/initramfs.
>>> It has to be built-in for that use case to work.
>>
>>
>> Every arm64 platform is supposed to use initramfs and we already use all
>> over the place.
> 
> Shouldn't the platform also be at least bootable with the defconfig ? If 
> yes, then initramfs is a mandatory requirement for a NFS root boot (not 
> a ... supposed to ... optional one), which does not seem to be the case 
> until now.

It always was a requirement, nothing new here.

> 
> I would argue the ethernet MAC support should be built-in to achieve 
> maximum utility with the defconfig.

No, you missed my earlier point - all decent platforms already use
initramfs since it is really not complicated.


Best regards,
Krzysztof
