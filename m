Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F942EB10
	for <imx@lists.linux.dev>; Fri,  1 Aug 2025 12:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754050311; cv=none; b=uVi6EVOv9AJ83OOuOkb1wj8AYU/geThsFkjCOdKcjbUPYvHOD2ndHzk+WU9IHNdGO/PL9+sLmFOYw6JmELWGykNBHb/zog7IWDkY/Pkr/bBLzsi+K1Wd65WMkRnIScAs2E4cghFQ/ryrjNBrgVu9Yfd+CGdCTpRV0nib8zgEmRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754050311; c=relaxed/simple;
	bh=o+RvfAEKe0RomM6tA+1Yt7h1qdgjQPP7umZQVLXtH78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bcsD9PvksI71WZrHwVHxyn4+lno34nbQOQJz6wTKPtmgAmFVnbrXhEAIRU2z1q4k8RGclBDLmg167tQu93T6dh3E8+zu3yqHf3iKffymd465vPcR02n4Rw40tHDJJeGla+eTtkDjHUWSkpbeJb0TQ2VASkKkHZ06xspyGrZIhiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngIepcIA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngIepcIA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so7711395e9.3
        for <imx@lists.linux.dev>; Fri, 01 Aug 2025 05:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754050308; x=1754655108; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T12VqVTqT9QY5bVVlcekdmYIYdB9sxvGnJLlTnRGMWs=;
        b=ngIepcIAoreKPhRYxH39JvZhihL4CwqGK/pDWvxKr7ZSlKO3EpJSqO41Qu0EzZhGfH
         X+RiPOIRrKB+n0e9/Y2gP8ICFYTcpPJ7K8QSN4SMkeGwJridWYweA6/plrSaMIlyDYvV
         5KE20xGUheYuUGpv/R/It82/8mxXFxKEeYaTT1g1JCVSf2VuwdByxc5NzuyibhHsCvQz
         SXeGTKbPFcm6M32jJdN9P6smuJ4/K9CzmSQSKl5yaOQ9+7tli2mMw6OOPqgEj8h1WEV6
         R6p8uR1KIKEi6gePYIHuWD3KlgV84EVdHLy+QAtkP4kKIeqQx7zwewQkdQUFS5myNMS1
         9Nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754050308; x=1754655108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T12VqVTqT9QY5bVVlcekdmYIYdB9sxvGnJLlTnRGMWs=;
        b=m3/5vUMy5DbokIQ0ALMzhI9ybszIWIxOhh7vmRy8r2LLQ3vW1149AEd86hgzrO5r7M
         IAj0iyhWffarMDQ5G2TgvkL3GYjZQp5HB7n2uGiIA+qyqON/gajpKdPLUQwFkJk49Ybr
         OcQZ32SCkhxTwVHKeBz/VSnf6w7BOkLYLoeXL7FyVG0qBSNkEGctGVvGvURelGDwWmOL
         DNatTvSBXu3KSSRtcrlznxgALCOgskc1Kb7NQpCvRpEPrtE88IRjitNneuu9flgEjkL5
         QdUrUwaXGFMucXhNJ+1m+fQTpFSntGyikxxMeIhUtw/x0MbptmuSlOMGaV81JLd5sI5E
         6RzA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ6qyneZyVUQpu/9k1iJ8T0QmjGW1pCkcxczVcsZ1muUotHv0GejYyHvmAKSWILmXIRv8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPDUzAkaCPGAVx7eLQ+2d1i2eb7dsdUyCVgVjXALMDt0BEC8eE
	Igy7Wn6CNzfboq2u+BilcXKmoAqBXbi+qSuhMGrplLl4daQhBCKIYJcCny59yA==
X-Gm-Gg: ASbGnctkp6Akxbk708shmPn3pCFF3lVfZ7K4ekyWpqUGzdfzOA4V5FoxLG+hs6KxnCx
	irmOpKsl9opOZitglD5JUxs/vHuhWOaI+m1EiebmkBx105XATRqGKTthnq4coZhD2EcSkrY8wUa
	5cemymLwnFqJlRlLRtNSipTIX/fukSf8Ct+8gZIMrqHqHepK2y9l2enaC3oe04jPnEmLRaC0RGr
	YlEPjhjlqTw5UO9FDj6Ep6pfLT2PuizoZEUkvDpkoYR92GCfLDhJ+pjqZoZtRUFyGn15c43+BQr
	AbdrPPUQq6xojm+uoXToxccPkuqqhwcS4s9yfibFOYDgL70OUx2uwZPridcAyA1BcxKBGy0IpyT
	gy5epL+FQTV6yVsr0vPpNaLtU2bzwkyLfbCwafR/uMFBex5RkPVBUgF8aLerJ
X-Google-Smtp-Source: AGHT+IFvST29zGsk85DMEnhGey+/+aFmHxqKGQr+Apz5n2YWFAlf/V3qjSSG5bEiZMA7xIBl8huCNw==
X-Received: by 2002:a05:600c:3ba1:b0:456:1fd9:c8f0 with SMTP id 5b1f17b1804b1-45892b947c9mr122493875e9.2.1754050307932;
        Fri, 01 Aug 2025 05:11:47 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458a22365c0sm62954395e9.3.2025.08.01.05.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 05:11:47 -0700 (PDT)
Message-ID: <8bc1a3c6-b7e0-4256-93ef-57b7b6a41d94@gmail.com>
Date: Fri, 1 Aug 2025 15:11:46 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: defconfig: enable i.MX AIPSTZ driver
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Shawn Guo <shawnguo@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
 <20250707234628.164151-3-laurentiumihalcea111@gmail.com>
 <3894475.kQq0lBPeGt@steina-w>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <3894475.kQq0lBPeGt@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/8/2025 8:42 AM, Alexander Stein wrote:
> Hi,
>
> Am Dienstag, 8. Juli 2025, 01:46:28 CEST schrieb Laurentiu Mihalcea:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Enable the config (CONFIG_IMX_AIPSTZ) for the i.MX AIPSTZ driver, which
>> is required for platforms using the AIPSTZ bridge (e.g. i.MX8MP).
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  arch/arm64/configs/defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 739b19302865..4d7a60444bf5 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -262,6 +262,7 @@ CONFIG_GOOGLE_FIRMWARE=y
>>  CONFIG_GOOGLE_CBMEM=m
>>  CONFIG_GOOGLE_COREBOOT_TABLE=m
>>  CONFIG_EFI_CAPSULE_LOADER=y
>> +CONFIG_IMX_AIPSTZ=y
> Why not =m?

well, the thought process here was that since the audio block control driver (i.e.: clk-imx8mp-audiomix.c)
is compiled as built-in (CONFIG_CLK_IMX8MP=y) we'd want to have the bridge as built-in too so as to not
defer the probe of the clock provider and its consumers (in case there's any compiled as built-in).

however, the bridge driver could have just as well been compiled as a module so any of the two approaches
is fine with me.

>
> Best regards
> Alexander
>
>>  CONFIG_IMX_SCU=y
>>  CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
>>  CONFIG_QCOM_QSEECOM=y
>>
>

