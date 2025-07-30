Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9BE225A32
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 21:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753910160; cv=none; b=aBAi49LAheNyTzPQhXDBiQqRECqfCSOJlJCIyieb0XmePr/Cd1EgWwa8qYm2iF0u700K79A4EA8gi8v/ig1R0qzjz+mwvBV8HerJ9dk6UIXGxOH9PziaBWzx8CPPxvA/938pvQjnZaM1FeTvq2mjkfHKVo7mYMUfmCo86rDu/UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753910160; c=relaxed/simple;
	bh=MhTEx3J9zNXBfEucck8oQ1XK6cImKP7msyEGVpc96GA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOFBdDfjerm4U+UiVMIQCFICQVas1ITYNkDwzWQ7x3unVm3Qu4pVzwLIuME6o7DcsF3wthYZqzw54y0mYXEcwrJpDYeR8JjamJGTD0yKFrio2dXLY3cdIkx/D98tY9eOm9y9rGmh+Wwiax3HrxeAKNLqsfUQf2cxqUhHX8nz3fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Au5Pvta6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Au5Pvta6"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b788feab29so167540f8f.2
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 14:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753910156; x=1754514956; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HTZ24rJm+Pue1YLQjE0bpMb81Dlei+K5VJgH8GnuVPg=;
        b=Au5Pvta6udZt2XE7NpwLb/iQ9/D83GmxiHW89dv9SpRQmCyLEXiEW8M5gpzRxF+Bfk
         qI8scVIz6aK4nau0hcge+kedMYT096Y5OPJlHX7HnKZbj+h9WhpxCkgs2cgbT0663lSh
         MPtXF8MLpC15bkk+QtMRq3CsXpPDqGxns4daP4AtESnaMhCsLNYyjiCuPR94t8gSZZE/
         532obNR3UssC5hoMSFUhvrizuxEk0PXDgq53Nl73l5r4GkZFsViv6x5qQiShDu+AtGrX
         5ho4k3GoK3LT1osjllkOPXvAwIIFBwTj3czvYcHij1YaLoqs+wRVjSWuG68r+jX0CfMX
         NsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753910156; x=1754514956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HTZ24rJm+Pue1YLQjE0bpMb81Dlei+K5VJgH8GnuVPg=;
        b=Ujrz4Y33yLioKOMyV6uH/64dHxvFYyr+GLrR0CuURu6GYGvmtaPupuBq1l4CT07Ds1
         7tfbBLlpLYb4ivBkOB/SN5p4ZsLBc3V2upgqAAS2fFYV+4iqHOkCT5O1UB4XMeB2pDw9
         XP6GDO9RKnIDeXbtgMmehYvrxnbi2Bqvkl9v8jGj2HG7sdXDAu8EBTL/xAARYGoWRU4G
         wEZAAS3rFxtFGR26Y/1+sysadr/S7AAfq7k0WJWa4XrtyOkMiJ1Cu250EY9Q8N1abidv
         Ue0JPgG8UhWMFi5gNnGCio8BIa+mgr4q12IYglMCTYzQdS2L9vql+FAD37MfYP3vnpc5
         tTvw==
X-Forwarded-Encrypted: i=1; AJvYcCWhGDdCDu9I75H8UYW+CWRAF4zQ4ocKeZz75q+eXQ/MSFyxqoZvO/84OcxqgKoURrRHYzk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr2GcsVivcSf607ssN6bxB/e85lKLbVoX2XcSHCLp/z1BAY9Fn
	IRuZImmUrOsS24yCSSvxnXUN2OXcKzcp/uTSteCRY7/ppL7w7NXt+d9KYgaG8sfzhVo=
X-Gm-Gg: ASbGncvANAI+N3VfLCLmXw15QrP/8RB9FBZiB+26jmcTJKmMItzQvOXd+L2HtmFgd6d
	mALnZMWd2s4oOPtkHiP2QkMyOvsiOzlcqS5z69y3IFVvbnSf4KeKOTp3DhaaeNXieOC8/zknqKq
	o8vAeAk1EEUQo2BpGX/mQEd8zfbdpnh21KgvCm2s8TCxy9bOROckrgqj0bqUaAK9GinGkmBdxf5
	yk+EXdC+0nXIlNRciWo/y3fjcKMWfCvv/0o7LvQYSqt/Tcpkjs51dGCP/kYjljN0vtIsw+xtMHq
	/UExZJ+LHcFzh+vGB+yDIZAdX3jvU4qqp9JwQ+l49gU+8nR8k2ywWXfl284EYwTIt1GpydkE9IQ
	1HMccG3J29X5nenzNQeGn5j2yRq72Sx84J8JwAYIBKK1O4Ev8Ngo06sl0h9ScgA==
X-Google-Smtp-Source: AGHT+IHQkznpibqUF8XL+omLAf+uDsGuaH8lAZ0YQHFkhu+hPUSUSN7QyTWCfS2BgMUd882X/GeefQ==
X-Received: by 2002:a05:6000:1a8d:b0:3b7:8481:e365 with SMTP id ffacd0b85a97d-3b794fbe269mr3794834f8f.10.1753910156462;
        Wed, 30 Jul 2025 14:15:56 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm122454f8f.39.2025.07.30.14.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 14:15:55 -0700 (PDT)
Message-ID: <87d40626-8789-4e71-8ac3-fa8fff0a7435@linaro.org>
Date: Wed, 30 Jul 2025 23:15:54 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: s32g274-rd2: Enable the STM timers
To: Frank Li <Frank.li@nxp.com>
Cc: mbrugger@suse.com, chester62515@gmail.com,
 ghennadi.procopciuc@oss.nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, s32@nxp.com, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Thomas Fossati <thomas.fossati@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
 <20250730195022.449894-3-daniel.lezcano@linaro.org>
 <aIp+4mWS1k73Vf/A@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aIp+4mWS1k73Vf/A@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/07/2025 22:21, Frank Li wrote:
> On Wed, Jul 30, 2025 at 09:50:15PM +0200, Daniel Lezcano wrote:
>> Enable the timers STM0 -> STM3 on the s32g274-rd2
>>
>> The platform has 4 CPUs and the Linux STM timer driver is per
>> CPU. Enable 4 timers which will be used, other timers are useless for
>> the Linux kernel and there is no benefit to enable them.
> 
> S32 have not ARM local timer? It is quite strange!

I'm not saying there is no architected timers but there are the STM. May 
be I can reword the sentence to prevent this ambiguity.

>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>> ---
>>   arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
>> index b5ba51696f43..505776d19151 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
>> +++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
>> @@ -40,6 +40,22 @@ &uart1 {
>>   	status = "okay";
>>   };
>>
>> +&stm0 {
>> +	status = "okay";
>> +};
>> +
>> +&stm1 {
>> +	status = "okay";
>> +};
>> +
>> +&stm2 {
>> +	status = "okay";
>> +};
>> +
>> +&stm3 {
>> +	status = "okay";
>> +};
>> +
>>   &usdhc0 {
>>   	pinctrl-names = "default", "state_100mhz", "state_200mhz";
>>   	pinctrl-0 = <&pinctrl_usdhc0>;
>> --
>> 2.43.0
>>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
