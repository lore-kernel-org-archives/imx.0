Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596F12F5A09
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 09:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761730414; cv=none; b=r67yTl1sAoSNvcwx6Qaa/LmyoZpS7sEf/7xZPll6z4sgUiKr2RokLVsTweTGjWRrDhEgcPaWz4ChvPoaxMNLbSTRCP6j0O+zLn0uzR7V1ETA73SwXu5Lq67g+h4GyX5AznFPfzhA5wltmlhW01537gtydZlp1g4p3t8pMQd3y9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761730414; c=relaxed/simple;
	bh=FsH8szvWrBS1aEFh+5xGcdjg1TM83EPt/kJP+WhNKHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X4O3kipToTSLTx3AI4WHPWLbMNYj0yf1yDgtL0raGmxkRtuxWS74oX2AX6wwJbTBfCtW485iFMnZqGzAFMla+YR5vGdCudaCXqZF5IM/Fm8wZnJ4jvHNH/KX24fHzY9k0+HDUOAk1q/Tqh9C+MEOiz6ZdrASdDhlmEiwfl4EJMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGluQsZK; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGluQsZK"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-378e622e9e3so10672431fa.0
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 02:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761730410; x=1762335210; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EZsofUoQy4xDbUxi1JncXn4brcSZHYShastMGK+62Io=;
        b=nGluQsZKqlxSSfh8kL13skvQVQQ3dVFSXt7Xq1FOWogNyHR6zy2qMr2zvSXr/lSkuW
         lB3J3+aLUXsIx1Z3gRJIbHpQZ8PECsGLjUK87NbU5B/vnqrz6YLwh1aJ62ug/lAxYg4l
         y+LmjiFLcmnzOnLKmGX5iQObsus2UIp4bm2faPpX6CHX797dx2IrKdZi3vCF78f7MgyI
         Bokuj9PFv0+cM/UlnSMhn+syvAC1cawSw9vU1Ms4zznTrcCuh9eT7vpSg4w6o09ngCMn
         luP5DXGXciew07LZx+Ozrc5tOAVVlBiaYkvzWPIc5JVJN/rWTrJA8XAPQ66fY1Xnz2QZ
         +8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730410; x=1762335210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZsofUoQy4xDbUxi1JncXn4brcSZHYShastMGK+62Io=;
        b=fNbvYh4YiyVLXEI4cdVvEG8mtfz2oOyS8qUJihZWxarQesCuhsGP3AgRra/JRuvfI6
         cHYMIR6BdHfNs5s3UPLMkF+C+1ddbbuxRLSLQKhRnu/FrsoB0bkjbg/iWOx7YIDjwZN3
         kuqB0D14iVBfNpgHMHTm78D0GTSTm78aS8DQVpf2ewbUAlvVzchxB/ZnAcP2QpKCgZ1q
         tHRR4yk67hBmEWpmDqisbrApkn5Vpj2hYFmyq8vqT/FvOi0Br0O3ypr5IlSleFUHWK9l
         CYJMfZuFGyiVJa8b2pw4iyXD+tMdtKSyojgIcHQbnLyiVG/7jPNpcEjkei2UzQBQ4J96
         ub/A==
X-Forwarded-Encrypted: i=1; AJvYcCXHSg/ODTBeWN4yo2geMZ+cvXme/lyHoPevgqMFZSx7Z7W3D9YNGiETOF17aFTx12Pc9G8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8Z2R92FCFVk39R6M4YK6pzR7dQPr/OGflST5K1jdWW8UCfk43
	ghGBSzGFQGkabLcva6LThhhldiAw5aLrXKo9q7EGutRuyHupqBdtr4Mx
X-Gm-Gg: ASbGncugxxSZZB6c2g+B4zr6meUBQMBOfitKPFKHEjRLMf1SQ5XUjiuw5bLCyjMUgQJ
	TrwHT9uj3iEcHuymR/cPGoGSNYe7iSI5R1EaJtchX/qRFK6bBLfHYWCJneIOjk91p+vooA2E1fg
	87pGskJtejdv+ow4TOIpEd3K8QKzDp+K22hGJQb+u1KpL7wmGaTmJnsdnN87PeAMOVNx6Qilqvf
	/0/JjmXPkHh6XUtdBsZxGI9NnTkok60yBewsay9EhhpvcdwSpHEEbRUOE/ePKgbW4uFLKrqIQyc
	exH3Mmqeb2dh4zZ5ATb3KjH/P6PEF/N+L/FQUegAHUJXzvT3vJh54nIGw3JA09SY8g03Va6mCwz
	2wk8ROfENZfLxDX9qzeiqxGdJUsxGNsLyeWngu2Etl072G4HTZxtWdwRBCpTKV2TahcIu8EjrGA
	FPxsFP4QtLyqD6srRKrDSv
X-Google-Smtp-Source: AGHT+IGzr4p5MyvY1ejjzx35Qq65bjiAfmxFhDvnxLZNuTYbHxWS6cLUXfrqNYmxCV8A0Im+UkyGJQ==
X-Received: by 2002:a2e:bc22:0:b0:336:b891:18db with SMTP id 38308e7fff4ca-37a05bd1dc8mr9065371fa.2.1761730410092;
        Wed, 29 Oct 2025 02:33:30 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee09c957sm32130781fa.14.2025.10.29.02.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:33:29 -0700 (PDT)
Message-ID: <160bf6cf-5385-4304-9afa-e1d2af589397@gmail.com>
Date: Wed, 29 Oct 2025 11:33:28 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
To: Maud Spierings <maudspierings@gocontroll.com>,
 =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
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
 <4a47b9b5-f482-41b6-a441-7728572c5a0c@gmail.com>
 <4733e8cd-3a2d-4d75-adbd-a3101760d13a@gocontroll.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <4733e8cd-3a2d-4d75-adbd-a3101760d13a@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/10/2025 11:00, Maud Spierings wrote:
> 
> 
> On 10/29/25 09:42, Matti Vaittinen wrote:
>> On 29/10/2025 09:11, Lothar Waßmann wrote:
>>> Hi,
>>>
>>> On Tue, 28 Oct 2025 14:10:04 +0100 Maud Spierings wrote:
>>>> On 10/28/25 13:42, Maud Spierings wrote:
>>>>> On 10/28/25 13:15, Matti Vaittinen wrote:
>>> [...]
>>>>>> Could/Should this be described using the:
>>>>>> 'rohm,feedback-pull-up-r1-ohms' and
>>>>>> 'rohm,feedback-pull-up-r2-ohms'? If I understand the comment
>>>>>> correctly, that might allow the driver to be able to use correctly
>>>>>> scaled voltages.
>>>>>>
>>>>>> https://elixir.bootlin.com/linux/v6.18-rc1/source/Documentation/
>>>>>> devicetree/bindings/regulator/rohm,bd71837-regulator.yaml#L108
>>>>>
>>>>> Ah I didn't know those existed, should've checked the bindings in more
>>>>> detail, thanks for the hint!
>>>>>
>>>>> I will have to investigate this carefully, since I don't have 
>>>>> access to
>>>>> the actual design of the COM, so I don't know exactly what is there.
>>>>
>>>> So I am not yet entirely sure if this works out, I used the calculation
>>>> in the driver:
>>>>
>>>> /*
>>>>    * Setups where regulator (especially the buck8) output voltage is 
>>>> scaled
>>>>    * by adding external connection where some other regulator output is
>>>> connected
>>>>    * to feedback-pin (over suitable resistors) is getting popular 
>>>> amongst
>>>> users
>>>>    * of BD71837. (This allows for example scaling down the buck8 
>>>> voltages
>>>> to suit
>>>>    * lover GPU voltages for projects where buck8 is (ab)used to 
>>>> supply power
>>>>    * for GPU. Additionally some setups do allow DVS for buck8 but as 
>>>> this do
>>>>    * produce voltage spikes the HW must be evaluated to be able to
>>>> survive this
>>>>    * - hence I keep the DVS disabled for non DVS bucks by default. I
>>>> don't want
>>>>    * to help you burn your proto board)
>>>>    *
>>>>    * So we allow describing this external connection from DT and 
>>>> scale the
>>>>    * voltages accordingly. This is what the connection should look 
>>>> like:
>>>>    *
>>>>    * |------------|
>>>>    * |    buck 8  |-------+----->Vout
>>>>    * |        |    |
>>>>    * |------------|    |
>>>>    *    | FB pin    |
>>>>    *    |        |
>>>>    *    +-------+--R2---+
>>>>    *        |
>>>>    *        R1
>>>>    *        |
>>>>    *    V FB-pull-up
>>>>    *
>>>>    *    Here the buck output is sifted according to formula:
>>>>    *
>>>>    * Vout_o = Vo - (Vpu - Vo)*R2/R1
>>>>    * Linear_step = step_orig*(R1+R2)/R1
>>>>    *
>>>>    * where:
>>>>    * Vout_o is adjusted voltage output at vsel reg value 0
>>>>    * Vo is original voltage output at vsel reg value 0
>>>>    * Vpu is the pull-up voltage V FB-pull-up in the picture
>>>>    * R1 and R2 are resistor values.
>>>>    *
>>>>    * As a real world example for buck8 and a specific GPU:
>>>>    * VLDO = 1.6V (used as FB-pull-up)
>>>>    * R1 = 1000ohms
>>>>    * R2 = 150ohms
>>>>    * VSEL 0x0 => 0.8V – (VLDO – 0.8) * R2 / R1 = 0.68V
>>>>    * Linear Step = 10mV * (R1 + R2) / R1 = 11.5mV
>>>>    */
>>>>
>>>> Because I do not know the pull up voltage, and I am not sure if it is a
>>>> pull up.
>>>>
>>>> So:
>>>> Vout_o = 1.35V
>>>> Vo = 1.1V
>>>> Vpu = unknown
>>>> R2 = 499 Ohm
>>>> R1 = 2200 Ohm
>>>> Gives:
>>>> Vpu = ~0V
>>>>
>>>> And:
>>>> Vout_o = 1.35V
>>>> Vo = 1.1V
>>>> Vpu = unknown
>>>> R2 = 2200 Ohm
>>>> R1 = 499 Ohm
>>>> Gives:
>>>> Vpu = ~1.04V
>>>>
>>>> I am not quite sure which resistor is R1 and which is R2 but having
>>>> there be a pull down to 0V seems the most logical answer?
>>>>
>>>> I am adding Lothar from Ka-Ro to the CC maybe he can shed some light on
>>>> this setup.
>>>>
>>> R2 is connected to GND, so Vpu = 0.
>>> With:
>>>     regulator-min-microvolt = <1350000>;
>>>     regulator-max-microvolt = <1350000>;
>>>     rohm,fb-pull-up-microvolt = <0>;
>>>     rohm,feedback-pull-up-r1-ohms = <2200>;
>>>     rohm,feedback-pull-up-r2-ohms = <499>;
>>> the correct voltage should be produced on the BUCK8 output, but a quick
>>> test with these parameters led to:
>>> |failed to get the current voltage: -EINVAL
>>> |bd718xx-pmic bd71847-pmic.3.auto: error -EINVAL: failed to register 
>>> buck6 regulator
>>> |bd718xx-pmic: probe of bd71847-pmic.3.auto failed with error -22
>>>
>>> Apparently noone has ever tested this feature in real life.
>>
>> Thanks for trying it out Lothar. I am positive this was tested - but 
>> probably the use-case has been using a pull-up. I assume having the 
>> zero pull-up voltage causes the driver to calculate some bogus values. 
>> I think fixing the computation in the driver might not be that big of 
>> a task(?) The benefit of doing it would be that the correct voltages 
>> would be calculated by the driver.
>>
>> If real voltages aren't matching what is calculated by the driver, 
>> then the voltages requested by regulator consumers will cause wrong 
>> voltages to be applied. Debug interfaces will also show wrong 
>> voltages, and the safety limits set in the device-tree will not be 
>> really respected.
>>
>> I think this would be well worth fixing.
>>
> 
> Do you intend to do this Matti?
> 
> Otherwise I will give it a try.

It would be great if you had the time and enthusiasm to take a look at it!

Yours,
	-- Matti

