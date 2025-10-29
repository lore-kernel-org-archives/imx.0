Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8517C3128DA
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 08:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761727343; cv=none; b=Cvd+uE9IOJ8oJHuLEbLdY/w5sLcKNLgOc/ybKQKr2SrQwG2XLeP9dcm7exzG1YPEoOjO3DQ1ApWqQi0qgJJncXVlELGTT0UTw7Lz+PMbgGrh+qMYkQIUhNcuzADbATu6D6LGNwBOkxMK6H++I33X1G+il7tYCFcmvYYeYvUqHBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761727343; c=relaxed/simple;
	bh=vdHoq0VF/CPXU2WRwDy2aBvJwoy4MK9QKZ23JGgkeXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4CCMZ4CReK4V+k+AG5D0az0zpSGH2CJmjNWmWbOk4M7C+oA/uivMS5QFvgdKdSo2cVlG3h52anyomG65ll/UgEGm4xJHWz/Zq0NA9RHmrzBl4KE4UGruVzfi/UJ30jB2vhPBse2g3GwoXcGUUwYlo0rBovD9Q1dQFH1PnyBJmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBvrpL6K; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBvrpL6K"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59303607a3aso5196637e87.0
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 01:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761727340; x=1762332140; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3we07e3UJvP1GOZyxsthN2v1+i0U7aVlrq0WJfskyK8=;
        b=nBvrpL6KabHhCEBtRVz8inSHzfL83NqqmYmIkUkWPbceZo4Wn28tPFO7vday4i3J9O
         Xd2Jqr2mfSEPsFIbEL38dO3mUOEs96JuqqZJNzZmy5WHHe1TRQjsbbQyGfTFkpJko6l9
         9WaPtAAoAuHXwORguUXQk4w9jaxi9clmTDN7n3Ge3OHFkupf2laLveewU84gllIYNG/s
         BiBsZTvrL5RvBMNA0TERXKSb4dLo6zNWStcXNDcGpGIhGiAGIKNvh0AWgwZKovoZbYgT
         WU4Ig307T8amMt1XLwXnW/3c5egCJ9nRCmo1e++4uJH7q8vacb9vSOMeSzrFYVZSDqd2
         1UBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761727340; x=1762332140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3we07e3UJvP1GOZyxsthN2v1+i0U7aVlrq0WJfskyK8=;
        b=AGGWPVyWjRh7P6Lc57EQK1xBFiuxP/Empq1n5c1CKCnY00tpFhc5H7s/Bsip5Lqb0m
         YFXZ4vo95S+KnkxeI4RYjwewpMZhOjaw/7StZB0N4f9h+mmh2Bfq4yW5qFa9wn+SjWHL
         ySHPEhu1IsQVnJVJ89FI0yRYjURrJz+MXR0Nvs3f8bIwUeLoomkS8Ac4pOj++wSZh/RR
         px31qNGgyyCSMmIbnTKiQg6aDuTEnYd7HeOCf2a1KWyoWn9xZe5M8J2DAH0m+JtBjMEf
         UAh9Q7gyREm2Z4TdtXhxFiI7A5HuW/rbcV65kWPns67V25i7xi/ljVKUSHYaw3FEXJLb
         /kCw==
X-Forwarded-Encrypted: i=1; AJvYcCUP7UUZvwXhZPz60+D4vfzo36cXHxpuvdtQCozhwqH0GbCK59h0KGRjDcjn5HC2By8eSjI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzuG6G4lrDRvsOAjyf2BdD7Or3dtrQ9QzbUWDeXkig66REiQsy
	GqpByWjR4HKEITFSMoOB1Gcbb7UpUUo4MxUqEXsOvZwj28KSBwgHKmNR
X-Gm-Gg: ASbGncspzZCq0Ef6qg5zgIWYxMVKghiwB+slsJG71ayYQ9UQYzfoDUe81/xlAprxmWl
	TH92f/zJuAdYi/YE9ojOdkSNTRw8IrP6oKqaMkDzzpkSkZOcrLnGA4R2E6Uwxca0GfM35Q4EpiL
	baBi0AEormeNe5vsaJ5hE3OfLL+lz4H/+8X00RRguj/BoYR6r6Z1FDgNlsuTQ2Kv6lF9ankzDHc
	ZHOwh2qbTSASqaQLFTdNJQhj55w1k8Ep4onbuzMAEHbJjEv1aElaX3YhqwIUmBJsHJanegJVy+W
	zbex1oqSuavSK66LFit8NQZRWENVZQVTK9w0O0SqKYAijD4mQENhpQUPt0H1+y1rEWtoXi1I5n2
	+Vwu+RaL5HNuToON8DuXuOnRde87qtoMUnPosbEXto5bydF3t3EOhon4zWXNkejn+S3tqh2NyvB
	GsNNLYcTB1MQ==
X-Google-Smtp-Source: AGHT+IEBJiRFPVFsvgo9dN9DCTuU4N9+tKqy36VEQJMKBJXWx4r2ceVpk4tbpOZEBYRZLo1hsmybxg==
X-Received: by 2002:a05:6512:4025:b0:593:3d5:f0e6 with SMTP id 2adb3069b0e04-594128b1140mr700531e87.35.1761727339236;
        Wed, 29 Oct 2025 01:42:19 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f83c96sm3667085e87.101.2025.10.29.01.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 01:42:18 -0700 (PDT)
Message-ID: <4a47b9b5-f482-41b6-a441-7728572c5a0c@gmail.com>
Date: Wed, 29 Oct 2025 10:42:17 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
To: =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>,
 Maud Spierings <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com>
 <20251022-mini_iv-v2-3-20af8f9aac14@gocontroll.com>
 <a7012995-c2a8-48a3-abe1-5c227272f21c@gmail.com>
 <65202d1f-6c4f-4d4e-9fef-85cfb74ec768@gocontroll.com>
 <938f85b0-4c9b-463a-960a-f5f4e4092480@gocontroll.com>
 <20251029081138.2161a92a@karo-electronics.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251029081138.2161a92a@karo-electronics.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/10/2025 09:11, Lothar Waßmann wrote:
> Hi,
> 
> On Tue, 28 Oct 2025 14:10:04 +0100 Maud Spierings wrote:
>> On 10/28/25 13:42, Maud Spierings wrote:
>>> On 10/28/25 13:15, Matti Vaittinen wrote:
> [...]
>>>> Could/Should this be described using the:
>>>> 'rohm,feedback-pull-up-r1-ohms' and
>>>> 'rohm,feedback-pull-up-r2-ohms'? If I understand the comment
>>>> correctly, that might allow the driver to be able to use correctly
>>>> scaled voltages.
>>>>
>>>> https://elixir.bootlin.com/linux/v6.18-rc1/source/Documentation/
>>>> devicetree/bindings/regulator/rohm,bd71837-regulator.yaml#L108
>>>>   
>>>
>>> Ah I didn't know those existed, should've checked the bindings in more
>>> detail, thanks for the hint!
>>>
>>> I will have to investigate this carefully, since I don't have access to
>>> the actual design of the COM, so I don't know exactly what is there.
>>>    
>>
>> So I am not yet entirely sure if this works out, I used the calculation
>> in the driver:
>>
>> /*
>>    * Setups where regulator (especially the buck8) output voltage is scaled
>>    * by adding external connection where some other regulator output is
>> connected
>>    * to feedback-pin (over suitable resistors) is getting popular amongst
>> users
>>    * of BD71837. (This allows for example scaling down the buck8 voltages
>> to suit
>>    * lover GPU voltages for projects where buck8 is (ab)used to supply power
>>    * for GPU. Additionally some setups do allow DVS for buck8 but as this do
>>    * produce voltage spikes the HW must be evaluated to be able to
>> survive this
>>    * - hence I keep the DVS disabled for non DVS bucks by default. I
>> don't want
>>    * to help you burn your proto board)
>>    *
>>    * So we allow describing this external connection from DT and scale the
>>    * voltages accordingly. This is what the connection should look like:
>>    *
>>    * |------------|
>>    * |	buck 8  |-------+----->Vout
>>    * |		|	|
>>    * |------------|	|
>>    *	| FB pin	|
>>    *	|		|
>>    *	+-------+--R2---+
>>    *		|
>>    *		R1
>>    *		|
>>    *	V FB-pull-up
>>    *
>>    *	Here the buck output is sifted according to formula:
>>    *
>>    * Vout_o = Vo - (Vpu - Vo)*R2/R1
>>    * Linear_step = step_orig*(R1+R2)/R1
>>    *
>>    * where:
>>    * Vout_o is adjusted voltage output at vsel reg value 0
>>    * Vo is original voltage output at vsel reg value 0
>>    * Vpu is the pull-up voltage V FB-pull-up in the picture
>>    * R1 and R2 are resistor values.
>>    *
>>    * As a real world example for buck8 and a specific GPU:
>>    * VLDO = 1.6V (used as FB-pull-up)
>>    * R1 = 1000ohms
>>    * R2 = 150ohms
>>    * VSEL 0x0 => 0.8V – (VLDO – 0.8) * R2 / R1 = 0.68V
>>    * Linear Step = 10mV * (R1 + R2) / R1 = 11.5mV
>>    */
>>
>> Because I do not know the pull up voltage, and I am not sure if it is a
>> pull up.
>>
>> So:
>> Vout_o = 1.35V
>> Vo = 1.1V
>> Vpu = unknown
>> R2 = 499 Ohm
>> R1 = 2200 Ohm
>> Gives:
>> Vpu = ~0V
>>
>> And:
>> Vout_o = 1.35V
>> Vo = 1.1V
>> Vpu = unknown
>> R2 = 2200 Ohm
>> R1 = 499 Ohm
>> Gives:
>> Vpu = ~1.04V
>>
>> I am not quite sure which resistor is R1 and which is R2 but having
>> there be a pull down to 0V seems the most logical answer?
>>
>> I am adding Lothar from Ka-Ro to the CC maybe he can shed some light on
>> this setup.
>>
> R2 is connected to GND, so Vpu = 0.
> With:
> 	regulator-min-microvolt = <1350000>;
> 	regulator-max-microvolt = <1350000>;
> 	rohm,fb-pull-up-microvolt = <0>;
> 	rohm,feedback-pull-up-r1-ohms = <2200>;
> 	rohm,feedback-pull-up-r2-ohms = <499>;
> the correct voltage should be produced on the BUCK8 output, but a quick
> test with these parameters led to:
> |failed to get the current voltage: -EINVAL
> |bd718xx-pmic bd71847-pmic.3.auto: error -EINVAL: failed to register buck6 regulator
> |bd718xx-pmic: probe of bd71847-pmic.3.auto failed with error -22
> 
> Apparently noone has ever tested this feature in real life.

Thanks for trying it out Lothar. I am positive this was tested - but 
probably the use-case has been using a pull-up. I assume having the zero 
pull-up voltage causes the driver to calculate some bogus values. I 
think fixing the computation in the driver might not be that big of a 
task(?) The benefit of doing it would be that the correct voltages would 
be calculated by the driver.

If real voltages aren't matching what is calculated by the driver, then 
the voltages requested by regulator consumers will cause wrong voltages 
to be applied. Debug interfaces will also show wrong voltages, and the 
safety limits set in the device-tree will not be really respected.

I think this would be well worth fixing.

Yours,
	-- Matti

> 
> 
> Lothar Waßmann

