Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3955E3D71
	for <imx@lists.linux.dev>; Mon, 25 Mar 2024 12:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711370688; cv=none; b=mDDkWpxdBDLlfpjuoJ3AgkSwncxIayUiJsG+dQ2T1W77l4g/wjte90CWHBigs4f2tAUi4GVJqVam8h2wlzxS6WRtqdS13JOKk2dgGjEmT95DMBtM+ll9fJXaoEVnQrkWL+pru2Xl7fA2vwaJWO+e6Iz/6qpERJiefuZKd3Qx5Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711370688; c=relaxed/simple;
	bh=/0c5YATi0wBoNSQaUbscPwIqGzPt6PDUNsLJXqr3t4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f5w3AAyvu/nkZfOfoynScS+b4P3TtxgmPURiPy5yer+p4D2G8u7exjROkudIETzBUMU95AJAqBrWqPe3I38pCWiMAcs5aDWC6zgquUcd7dL/rgX10hCudgnHULitZOK5btiEX5UVsp5nf41gwprh/dSGUgY36KZa/rnp+9xT8Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmR4LJgN; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmR4LJgN"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d68cf90ec4so73363621fa.1
        for <imx@lists.linux.dev>; Mon, 25 Mar 2024 05:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711370684; x=1711975484; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MzYr053l09e/3RIxhJmMgbVh55W1tuz1CI+cV74GXOw=;
        b=UmR4LJgN1zfoPGCH9hoIp4T4A8SCudI3C75ccSlgEWgkBFAt7hvbgVYlqL7+9UZ4Ir
         2fmIswwo6FK4gqXMpVFhtS5uLpbTDCJhetaeeRU6lkIzS2hJzpPW1tyQr74XTckJYZSk
         TyNcgqIgJtQ0dv8SxhPy+WYoZPqQm5Jb+YE66sAWZxB8wzluqBhdE73R6JT6L4ABd1Su
         slbMzTpcT8A4lgKWjQaFi5mqE9QmDcgb8aeINqmeWxVBmz+4AfMADWg4kaBPncdFAQ/c
         PKvG685Kj7Ibe0dJgIgpCBB0HSLL0lcFS/Kw1b2MHqc2KdyOHAZvKUGC4LZ6pd87Pg0I
         IZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711370684; x=1711975484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzYr053l09e/3RIxhJmMgbVh55W1tuz1CI+cV74GXOw=;
        b=cPSbDts6C43r5JH7vY3LH3P1qquaEL5HOTyi57L/C7DZcfABMpuviPC1Te491azv/L
         OwaU+fzkG9i9VziWafYzIZYVfdWKFfQbto+wN1firGcnh0CA8uLDTOS8/VTaNZJFhexd
         UJGL2Sn1oG1noPzZyru6SfzlNxlFYs7j1N+N2MuU00gJ0SrVq4cKA/QN+2Oj1NgF73kZ
         qDL9wpVm1iWFqllo0cLCWX4tKsHk9Zzv8EpxDG5+S5FlfPytn3L+uM8PNcCPQ753nr6F
         xZbY5QJ0/zXKjTwrv3PzOapMS4FDsUALbTexbjd/NEWWpswQYcbpfndtjJEx1C/PYBy4
         hOPg==
X-Forwarded-Encrypted: i=1; AJvYcCXGccC7xP5f6m+S5RSSJyVN+te0rp2Kz1Yd6jQlpC/ASYpeHdVF8eQaNnoLDspM5+2u3vZIIpr8B66/zPLzvUnW8PYS
X-Gm-Message-State: AOJu0YyFnu7CeElDIumAFwSINL9RZN0FmV1o69KbO9PGW2eV4KRh9Twp
	zeBW1mq3Bd3ue+OiAUNuRBNz5DbYCSjnkVvhwl9/eCBE8ONpQFxp
X-Google-Smtp-Source: AGHT+IEjQ+Bn0nPMrrVMKJnoSv6m7e+kPRqkDHwuPIBzpSeOd0b1YvwEsvE7hPPcpoIia4NzkR1SDQ==
X-Received: by 2002:a05:651c:685:b0:2d3:e0ec:36c7 with SMTP id x5-20020a05651c068500b002d3e0ec36c7mr3886653ljb.43.1711370684178;
        Mon, 25 Mar 2024 05:44:44 -0700 (PDT)
Received: from ?IPV6:2001:14ba:7426:df00::6? (drtxq0yyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:7426:df00::6])
        by smtp.gmail.com with ESMTPSA id s4-20020a05651c200400b002d4678aee97sm1427032ljo.108.2024.03.25.05.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 05:44:43 -0700 (PDT)
Message-ID: <81bf6604-9160-4bae-8da6-7034f8aa3f92@gmail.com>
Date: Mon, 25 Mar 2024 14:44:43 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] mfd: rohm-bd71828: Add power off functionality
To: Andreas Kemnade <andreas@kemnade.info>
Cc: lee@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
References: <20240324201210.232301-1-andreas@kemnade.info>
 <20240324201210.232301-3-andreas@kemnade.info>
 <472c6eaf-6cbc-484c-bc94-571d115176aa@gmail.com>
 <20240325131605.6607b778@aktux>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240325131605.6607b778@aktux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andreas,

On 3/25/24 14:16, Andreas Kemnade wrote:
> On Mon, 25 Mar 2024 13:31:15 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> On 3/24/24 22:12, Andreas Kemnade wrote:
>>> Since the chip can power off the system, add the corresponding
>>> functionality.
>>> Based on https://github.com/kobolabs/Kobo-Reader/raw/master/hw/imx6sll-clara2e/kernel.tar.bz2
>>> No information source about the magic numbers found.
>>
>> Oh, interesting repository :) Thanks for linking to it! I didn't know
>> someone had reworked this driver...
>>
> which btw: contains this interesting snippet (output from fdtdump)
>    bd71828-i2c@4b {
>                      reg = <0x0000004b>;
>                      compatible = "rohm,bd71828";
>                      gpio_int = <0x00000008 0x00000013 0x00000001>;
>                      gpio_wdogb = <0x00000039 0x00000018 0x00000001>;
>                      #address-cells = <0x00000001>;
>                      #size-cells = <0x00000000>;
>                      pmic@4b {
>                          compatible = "rohm,bd71828";
>               	        regulators {
>                          	BUCK1 {
>                              		regulator-name = "buck1";
> 
> 
> and to make it work since basically no regulators are registered
> instead just some regmap_write()s are done to configure something
> in probe(). It is a pitfall to think that the information below pmic@4b
> is used, especially since it is not that obvious in the source.

Just to ensure there will be no misunderstanding - I have not authored 
the modifications seen in "Kobo-Reader" repository. Upstream driver does 
register the regulators - and it does not use the oddly named gpio_int 
or the gpio_wdogb:

https://elixir.bootlin.com/linux/v6.9-rc1/source/drivers/regulator/bd71828-regulator.c#L750

>> I have access to the data-sheets so I also have some pieces of
>> information. I hope I can clarify part of the puzzle. Unfortunately I
>> have no information about the magic delays. I guess I could try asking
>> though.
>>
>> Oh, it seems to me this handler is only working on BD71828, not on
>> BD71815. So, it should be tied to the ROHM_CHIP_TYPE_BD71828.
>>
>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>> ---
>>>    drivers/mfd/rohm-bd71828.c | 31 ++++++++++++++++++++++++++++++-
>>>    1 file changed, 30 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
>>> index 594718f7e8e1..5a55aa3620d0 100644
>>> --- a/drivers/mfd/rohm-bd71828.c
>>> +++ b/drivers/mfd/rohm-bd71828.c
>>> @@ -464,6 +464,24 @@ static int set_clk_mode(struct device *dev, struct regmap *regmap,
>>>    				  OUT32K_MODE_CMOS);
>>>    }
>>>    
>>> +static struct i2c_client *bd71828_dev;
>>
>> I'm not sure why to store pointer to the device and not a pointer to the
>> regmap?
>>
>>> +static void bd71828_power_off(void)
>>> +{
>>> +	i2c_smbus_write_byte_data(bd71828_dev, 0x03, 0xff);
>>
>> 0x03 is a "reset reason" - register. Spec I have states that the
>> register should clear when a reset occurs - but it also says the bits
>> are "write '1' to clear". So, for some reason(?), this clears the
>> previous reset reason.
> 
> well, so just check in bootloader what the reset reason is and check if
> there is anything odd.

I understand why bootloader would check this register - but I don't 
understand why the driver would clear it as it should be cleared by 
reset (unless I missread the spec).

>> I am unsure why i2c_smbus_write_byte_data() and
>> not regmap()?
>>
> regmap involves mutex_lock() and we are not allowed to sleep here.

Right. It makes perfect sense now. Thanks! (Do you think it's worth a 
comment?)

>>> +	mdelay(500);
>>> +	i2c_smbus_write_byte_data(bd71828_dev, BD71828_REG_INT_DCIN2, 0x02);
>>
>> This clears the DCIN monitoring status bit from the IRQ status register.
>> I don't understand the purpose though.
>>
> so maybe something to prevent power on by just plugging a usb cable? Will
> experiment a bit with it.

I still think this is odd because, if I read it right, this is an IRQ 
status and not a mask register. Well, wouldn't be a first undocumented 
"feature" I see...

>>> +	mdelay(500);
>>> +	while (true) {
>>> +		i2c_smbus_write_byte_data(bd71828_dev, BD71828_REG_PS_CTRL_1, 0x02);
>>
>> This write to PS_CTRL_1 initiates a state transition. 0x2 equals to HBNT
>> state. Eg, in usual cases this should be a start of the power-off sequence.
>>
>>> +		mdelay(500);
>>> +	}
>>> +}
>>
>> If you have the hardware to test this on, then it'd be great to see if
>> clearing the reset reason and IRQ status could be dropped. I can't
>> immediately think of a reason for those.
>>
> I will to so. That will also remove the need for all those delays.

Thanks :) Very much appreciated!

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

