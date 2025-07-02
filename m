Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E1238F91
	for <imx@lists.linux.dev>; Wed,  2 Jul 2025 08:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445093; cv=none; b=ZRYpbHsYhe8Reg1f7b7AMIBQsTJP91EVyzvF+CYgfY3TBwVz9hmQwOWlt7DMopWe+Wj1AQlsIOtu+oXJlq+6jsnaIF4gTRaEcQjxUybig1UPSVciZ6DQHNl6Wrl/wkA3/ELezDZRFUvxbdpY69FIZ6O0JyrT/PyASTNGOW0QyGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445093; c=relaxed/simple;
	bh=JNmpxopemuV+JMfhr083rEc/bP1EJp3VvuBjftidUa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MC7CwiVJmjzQM3IE5OpegyoGxMUh8ZkA890DSa+15PJgI9H+QPgf1e+g8udW1IBy198vtl2f+Hzs5P3JOql44QgfPHZRSR/GV0AQKyS6a+Nf86EyqQt8L6zvYmXKg8MspeNjJy/ERS0wsqKRcfFrOBDXFZSIPnFDwMqvcJzFbkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4p9DwIy; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4p9DwIy"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0d4451a3fso713590566b.1
        for <imx@lists.linux.dev>; Wed, 02 Jul 2025 01:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751445090; x=1752049890; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYgO9gPGPFem/ue3nHcSi2VYa5driBXGjHPtXbD9tHw=;
        b=W4p9DwIycEbwqQ1R+yhLZ4kK/sW1h+JRBkZ7M6yzczfoTJ4BOlA6x6hMsfh1C7ikWn
         H2WRzxgnUKuqwe4wPu9x0knrpPWVPb4Cs5TfJ0yk4j4jjM/Q1mcLt/xWfudSe2gWIDXs
         E/chUQycx8uus6QPrvlj3q86q96FvH6Xk80P2jVqWtB/vcyqB3sDcbZDqAHWqQ/x7Ip7
         SDAoIvVJXYH3uqFgVvtzsZxrB/VkuZt2ZEYadhVtXItjj93ygCto16x+92ZRQsXKFZ8Q
         75TXchsy9ySBHJjw1htT57HS2Lf5AUGK9QWP+qXqohL5BeVzRGZuGZqkfFBW5VG+G+6f
         bTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751445090; x=1752049890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYgO9gPGPFem/ue3nHcSi2VYa5driBXGjHPtXbD9tHw=;
        b=QXYTKSkaKCozHqJc2phtUsQsqbDhyEcOyT40fYqBqsioH4zMx/UtifVXRa2f0mJmB7
         gCfe9TN1oaOSvlc05GeAyoA3/ndBa9VMK4kvFZL2QzF33NcDlX1WSzwywEl+ncNmhV4B
         T64gZ6OOAmbyulcFfjovwd3U4ujfTnCL0FGVc3Z6V6Jp71PEVoxlGvGdhGKs+4L6wL4B
         u9uWPuucxOs5C44+eMnur4RHqJAAN2G6eqvVG1f237jCxeBMqhsRPAZ0jiir5eeIC+fj
         bgH9rfbSfUwLYjY+wtFALsgt6o+25fp1UmMgBlpfZwgNnwastiNf0RUkyi0ZcCL66cTE
         uQsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa2NjHRzDVjYD2H7cPI/QT2t7aK+3njx5j34MiJwAohU0p4rAbl/l8JxK2cZv6RWTFT4E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTzxajRK8jHCiE92wQ9dPOf6OaqCm3IqhWHCdSD4Rt7tUmqHuP
	yDPu32Nd2+tJ11RrTiAoUw2CP2piaN+9DJus3dF6eJ0IabOHPY0Ylyu1
X-Gm-Gg: ASbGncuH5XHFxKbJ3vxwTpod7ufahCcjo6R0ffqLPXDMY6HI/TKcPKGv16J6ti8i8XT
	y6CLckMoYXNocBEZFWpiIEqbOIzA6Y8tIjai9WVuBTYkf5d/1Wi4+W81T1bFGzLm+SVRumR5wve
	GFTsCdHjtnppw7JsB/n7UGDjZiHmyR4w8w0/P4iy0A4R07/2weXPDmYE8WvzdsXqx4ljHj2VfuW
	g/FsrvFQbXs+79ZhvvvF8ODZqk6WSPnFhiyh1w02hg8VIHk94Ot0Hn82daL92rsDgTtjI8wryFm
	4q0MiRB7KU8Mud9BAFdHGbthQwi2Ajtmu56PKywfSSJyeyhUiw9px2nUpqt/0P/emqbrimWYIfw
	jCWxLVZrGmxON2Us5J+WKYgY=
X-Google-Smtp-Source: AGHT+IHLIAeFsGaHxS4ciQ6iWXJqr5BcWAMimCo+KVlmSdchXq5TGkILRI11lt2Dhr4SijLUwuD1pA==
X-Received: by 2002:a17:907:96a8:b0:ae0:34d4:28a5 with SMTP id a640c23a62f3a-ae3c28bcd88mr187429266b.0.1751445090007;
        Wed, 02 Jul 2025 01:31:30 -0700 (PDT)
Received: from [192.168.7.237] ([92.120.5.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b24fsm1032167466b.34.2025.07.02.01.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 01:31:29 -0700 (PDT)
Message-ID: <a1b6039e-7020-4d17-8186-d40ac17ba730@gmail.com>
Date: Wed, 2 Jul 2025 11:31:28 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pwm: imx-tpm: reset counter if CMOD is 0
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pwm@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
References: <20250701220147.1007786-1-laurentiumihalcea111@gmail.com>
 <vwozlwajisjw5qomwtmnfdklmucevyxncsxl2cdmixn2yixxrk@x6j3r2lrl5qz>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <vwozlwajisjw5qomwtmnfdklmucevyxncsxl2cdmixn2yixxrk@x6j3r2lrl5qz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/2/2025 8:51 AM, Uwe Kleine-König wrote:
> Hello,
>
> On Tue, Jul 01, 2025 at 06:01:47PM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> As per the i.MX93 TRM, section 67.3.2.1 "MOD register update", the value
>> of the TPM counter does NOT get updated when writing MOD.MOD unless
>> SC.CMOD != 0. Therefore, with the current code, assuming the following
>> sequence:
>>
>> 	1) pwm_disable()
>> 	2) pwm_apply_might_sleep() /* period is changed here */
>> 	3) pwm_enable()
>>
>> and assuming only one channel is active, if CNT.COUNT is higher than the
>> MOD.MOD value written during the pwm_apply_might_sleep() call then, when
>> re-enabling the PWM during pwm_enable(), the counter will end up resetting
>> after UINT32_MAX - CNT.COUNT + MOD.MOD cycles instead of MOD.MOD cycles as
>> normally expected.
>>
>> Fix this problem by forcing a reset of the TPM counter before MOD.MOD is
>> written.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/pwm/pwm-imx-tpm.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
>> index 7ee7b65b9b90..30f271826aed 100644
>> --- a/drivers/pwm/pwm-imx-tpm.c
>> +++ b/drivers/pwm/pwm-imx-tpm.c
>> @@ -204,6 +204,19 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *chip,
>>  		val |= FIELD_PREP(PWM_IMX_TPM_SC_PS, p->prescale);
>>  		writel(val, tpm->base + PWM_IMX_TPM_SC);
>>  
>> +		/*
>> +		 * VERY IMPORTANT: if CMOD is set to 0 then writing
> The "VERY IMPORTANT" is correct today as this is missing and so
> disturbing operation. However once this patch is applied, it's only
> normal to have it. So I suggest to drop this.

ACK

>
>> +		 * MOD will NOT reset the value of the TPM counter.
>> +		 *
>> +		 * Therefore, if CNT.COUNT > MOD.MOD, the counter will reset
>> +		 * after UINT32_MAX - CNT.COUNT + MOD.MOD cycles, which is
>> +		 * incorrect.
>> +		 *
>> +		 * To avoid this, we need to force a reset of the
>> +		 * counter before writing the new MOD value.
>> +		 */
> Without the reference manual at hand or a deeper understanding of the
> hardware this isn't understandable. What is MOD? What is CMOD?

so, MOD is the reference value for the counter. The counter needs to count until this
value is reached, at which point the counter value gets reset to 0 and the output signal
is driven HIGH or LOW (depends on the configured polarity). This value is used to define
the period of the PWM.


CMOD, on the other hand, is a clocking-related configuration option. I'd say what we're most
interested in here is the fact that if CMOD is 0 then the counter will be disabled. Otherwise,
it will be enabled.

>
>> +		if (!cmod)
>> +			writel(0x0, tpm->base + PWM_IMX_TPM_CNT);
>>  		/*
>>  		 * set period count:
>>  		 * if the PWM is disabled (CMOD[1:0] = 2b00), then MOD register
> Best regards
> Uwe

