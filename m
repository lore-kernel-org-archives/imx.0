Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4F4253B63
	for <imx@lists.linux.dev>; Wed, 12 Feb 2025 19:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739387095; cv=none; b=IehGIWfdqqAPOtLc2ac2Yr2RupJ7lKdghJknn2s7urReoMKdTWONF1D52Rso/qdJZq6EHpgBGE6ekMsPEr2HUsdbij3hAk782UT3xphppzY0Dshmz8DnLS9iUEuxQE+nYVa43DFyTYYnP6VhAFKuMEEGcXK7vr1Bo10AVhtSt08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739387095; c=relaxed/simple;
	bh=GByBzklmfX23pRSpc2MBYgFPIh6J9o3kWfHsq1LZtCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=joBLW8ZKSjLCtkkiRhbDkmBz0a4DBCVndicUdN+01JUBUB5LQQXbGN3u+uzjtJtLSsJPTYtNWK91pKe222FKFtgMJ4mxir9VfHZ1K/IdeGLv6yylcjIF4lUXzcivhOrV92u5H3bYmnkBosjhARCug60qXHxJkKEeK7DERkgGUl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZiugiIh/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZiugiIh/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5deb0d6787cso24748a12.0
        for <imx@lists.linux.dev>; Wed, 12 Feb 2025 11:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739387092; x=1739991892; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5n7rB0wdq5vMXsxf8BJiZz2GQf3El+y7mHlJDy65vBI=;
        b=ZiugiIh/Qkon8xy6FKWow5KHZer2lTDEscyw2I8ulBYfFR5rwlkjghnK5ahi7rtZcE
         zF9w2Vw3AdgEiEfKVqPpQ0TCyXMRHPt7OdiJK1ZuTdRAUVeqGqP+LUCS0F/aZxIDYvXW
         vWDNcX9DGbQ+rTXlbY8sGXqQAFlQCsG4T7z9F2oo1BqlSVAcFxuyraEjwdCcT5YLTpVx
         Sl9V4Q9DLtv2YmKXLD7GTCjimA9sdSV2cZoz4VVyF9zXVTqBBIjTJQ/94SFIIGJLoTEG
         i5w280KO6W5cyWyxqNIbtOV8MAEacWy+tKf5VvxlB0l/v8NFRiPUhQVExXZ13f7B9Ap6
         yw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739387092; x=1739991892;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5n7rB0wdq5vMXsxf8BJiZz2GQf3El+y7mHlJDy65vBI=;
        b=ReLqDWow/NACy0LVXCYlv2yM+jB62p3SE+jDcOiz2geDT8fved1/ANydz8AykacI6C
         kv7ir7Ej2pN2T+48CEqsavLQf4tPqftBMwgon6j4Ox1mArOxaueOiS4/aDLbjO7XW09Q
         U6m075ipjZQ2+SSuNiGBanzAyQyvjl8HzXZs+UiL2OdKmV6B0q90/Am8K+PfS6KxJjWq
         lsu77nfH0lClLuyrV6LUh/XaAoouPpbMNb/bVGcRF22N8mHVDPTikdHHt2KETxs6DFC7
         3/i/XfqpRHpbWLyaYFoIuMVam5ROsfwuZAf3BuxmAZPa45BgpSPWj1ehuH0Yx50EtIrq
         crNA==
X-Forwarded-Encrypted: i=1; AJvYcCWTIjdHHgRg/l73IJe1Xf1hRJ1gN7+/uBor87ld9PXSsYa6u2T06we9eaeVCVKoQ+oObC4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+B3WDV5lwfklDRDV/rtWWCxnpaJ2ZgKuMzuqRCEKYFDZOTDy3
	ZeSla3WWbIHFwNym3kMIX7Kxxx5a0yCbHHUQWkMeugptqjJpUdGT
X-Gm-Gg: ASbGncuqNU5Nza3SRlx8KeLbuHGCFyzbF9SbsXM+WyLl1cEpY2Zh/2ao7Yz+or3cBik
	K2l2aEkIgn0aUlV/sWi8zPrJoXfIyzLzJc1vCQu8U6gEEkuV6WJAifPqjG+Zx0n69jVj1c0isy9
	b18jnU3RZ+b4Pht8OTogTJKH4p/wvoyiRa8REFuaUco5tmcfqPeYWasW6P5InSkoE/tvT3fwo1k
	ons2ve/ZcPM823XPOWc/v6oOAKtgZvHEYVW6OmXAqSW8ufhXodRhtEKJg76nJOnti98oX0bSNvu
	j5yoOWkK5XPdIUphKtKpSr2ifK5XkxDyA/5Oxj0rb7eE
X-Google-Smtp-Source: AGHT+IEZn0+ju/iW8MyZm8pcKU9jLpSB3rBPfVfpKrwdB6064zci1oEw5mVOcdEw7A8E0QsKoeQlTA==
X-Received: by 2002:a05:6402:348d:b0:5dc:882f:74b7 with SMTP id 4fb4d7f45d1cf-5deade1c945mr4021549a12.30.1739387091464;
        Wed, 12 Feb 2025 11:04:51 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm9343226a12.45.2025.02.12.11.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 11:04:50 -0800 (PST)
Message-ID: <da63fc79-76f6-443f-b1fe-c4242cb45328@gmail.com>
Date: Wed, 12 Feb 2025 21:04:47 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: imx8mp: Add fsl,dsp-ctrl property for
 dsp
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 aisheng.dong@nxp.com, daniel.baluta@gmail.com, laurentiu.mihalcea@nxp.com,
 shengjiu.wang@nxp.com, iuliana.prodan@nxp.com, a.fatoum@pengutronix.de,
 Peng Fan <peng.fan@nxp.com>
References: <20250212085222.107102-1-daniel.baluta@nxp.com>
 <20250212085222.107102-6-daniel.baluta@nxp.com>
 <Z6zGLn3B6SVXhTV1@lizhi-Precision-Tower-5810>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z6zGLn3B6SVXhTV1@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/12/2025 6:02 PM, Frank Li wrote:
> On Wed, Feb 12, 2025 at 10:52:21AM +0200, Daniel Baluta wrote:
>> Audio block control contains a set of registers and some of them used for
>> DSP configuration.
>>
>> Drivers (rproc, SOF) are using fsl,dsp-ctrl property in order to control
>> the DSP, particularly for Run/Stall bit.
>>
>> Note that audio block control doesn't offer the functionality to reset
>> thte DSP. Reset is done via DAP interface.
>>
>> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
>> Reviewed-by: Peng Fan <peng.fan@nxp.com>
>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> index 14cfbd228b45..46b33fbb9bd1 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> @@ -1609,7 +1609,7 @@ sdma2: dma-controller@30e10000 {
>>  			};
>>
>>  			audio_blk_ctrl: clock-controller@30e20000 {
>> -				compatible = "fsl,imx8mp-audio-blk-ctrl";
>> +				compatible = "fsl,imx8mp-audio-blk-ctrl", "syscon";
>>  				reg = <0x30e20000 0x10000>;
>>  				#clock-cells = <1>;
>>  				#reset-cells = <1>;
>> @@ -2425,6 +2425,7 @@ dsp: dsp@3b6e8000 {
>>  			mboxes = <&mu2 0 0>, <&mu2 1 0>, <&mu2 3 0>;
>>  			firmware-name = "imx/dsp/hifi4.bin";
>>  			memory-region = <&dsp_reserved>;
>> +			fsl,dsp-ctrl = <&audio_blk_ctrl>;
> I think kk's comments in v3
>
> "This should have been implemented as reset controller, not syscon. It's
> really poor choice to call everything syscon. It does not scale, does
> not provide you runtime PM or probe ordering (device links). Quick look
> at your drivers suggest that you have exacvtly that problems."
>
> The above is quite good suggestion.
>
> Your reply "But for Run/Stall bits we need to use a syscon.",
>
> Run/Stall actually is reset, Most system, release reset signal means dsp/core
> RUN.
>
> Frank

RESET and STALL are quite different signals w/ different purposes so
calling them both RESET is confusing and inaccurate.

The syscon is used here to control the STALL signal (name of the bit we're using is RunStall)
and has nothing to do with the RESET signal, which is why it's implemented as a syscon rather
than a reset controller.

While Krzysztof's comment does make sense, I still find it odd to have this implemented as a
reset controller despite it not having anything to do with the RESET signal.

Also, do note that the two nodes are in clock provider-consumer relationship
so unless I'm gravely mistaken this should at least guarantee the probe order.
