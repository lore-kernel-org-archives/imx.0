Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED741269CEC
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 14:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740492343; cv=none; b=i5+g0+LV8atkti2AGa//hM5aJIxIMgJt5pbKpsPuxOfylccx/tHBsc/2jUs/ml4No/yT4DN9uAwepd4AZCg79xi0J4V7IhGdPNYBhW4DjlYb9UonNNBItV7CE+AirsdRILGKLOAH/CWrQuL0rbTxDBD2dI88rw1D22mV+//S5U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740492343; c=relaxed/simple;
	bh=kwghDFALfMvkIRmE1HPwrpB/0PzINC5FZ1kBkLfD77w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQC34gRgR8o34ZFl6+FTSiL4mDDzNNakEWfJpAdoapv9MgqdIFeZc2qwXsJu/Z/+mzJ+EwZ0Y3mgmkfKWHAHDdDp1dDPV7iLlAlXvDSJPOofFb2940jNRucsfzQHslmCXMe/3KANVFjEInT/l/X6OozowHZ8/pNnH2Af1KLc3oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNZIfkO/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNZIfkO/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so8747092a12.0
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 06:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740492340; x=1741097140; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tPd/d1lS+e5D1SoZ8oB+qy8yBKc1e4tlJLwqgs9YB9g=;
        b=lNZIfkO/zdEZAup9UAYWo8g3fYOMvlJPN33ex4cm7Jp0rXCH+dGWX3kDmrkmBok9aC
         UnLH1tX5TrEPz7QoD4XEdxi6w1gMBpNRGQtTiJf4WZ2RcR2e7w01EvkIBxun3E3u10Dh
         SJ1DnbcewA60MSgt0jdCa+F9KzQ9wZMJLWkbMxPSh1RtPibGRIOv/DoNSzsU0uBXqlge
         TafuIdBBYhzO3CX+fJsFevrij+QdhZ2J0mO74HAgI9GTiP+5C0MCpUdk5B6u7CS5s6bx
         VngB6joRyWw84gk+hZgfigLUCzNeK+XJjeupgtzYJcdJjF1R6SXmRfhDhFC9h5YLKIUk
         B/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740492340; x=1741097140;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tPd/d1lS+e5D1SoZ8oB+qy8yBKc1e4tlJLwqgs9YB9g=;
        b=jnsuI2cd17zYewoittO9p5tCljj+ldHcIagBFGcvprR+kwoLPP9T3ie58k9py3X8Oz
         Ydp1DU3wVVs65zf9Uimo6Q8nrWSYELubVF7BohjF6nHYpJc13XMwRaTo+hBCGcbj26FS
         jDQqvDmhlPkuvz4+9Dz0Yiyn58Kb19MLMEwe6peC6sAJROielPypieTzc45g77EPO+bc
         R/YgdU5BMx+qKrUnP6UhwGiC8Cw3307WbYjZS+QpOHqjdF1QLj13NprSS8RzFGzVuUYP
         A1rQpPHLiyafeAHk4BG9CYs9iT2pAIRCw9SU2CoXAscWCq9vTLtwgO/xUFlhoNc2oHYT
         KWGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNGk2qbODklH4Kii8BUW4A6nTz3j2fe51jm8y5rdzBZf3OTWU5tbw5suToEM1f886nJHw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZt6LK0IqJhphna/BeyXcWavSXxXKGqRYtPLKE4s5AtuSDPVzz
	vG4WTvAkIb3tQ3fbffBR+ygCLiorg1OoPJdGSQMPlEXYmvs+BdFv
X-Gm-Gg: ASbGncvtwET4ihIaDNa6huw/myZsT0/8i7Eir8wz9VWytYU1NOxa8wn5ektTb/5shTq
	J2fEBGqEKKZI9PChF2gsYQG1hyqPLh9CBqAQG5CpkEsAgX5R9B4FjK+YSQXY8A2U9PaxqxZffKO
	paTXUD7ZNIOMLqv+EyKTbq/B4XHoZXmwPYDjfVKsA4m3RjSAamnJJvyrUoYI7DnzVN8lZ+QMVp4
	PCesHckcImxl7KScGlQVqZYHIaPT21EIKli6ZSyNfgMzP0XNUJwl3kK7cmQTndiyY7UZWVusG8n
	RfLpw4AVGTA44odXrjgrkOwWiP6/M7Djr7+C6m/VOcUiDG8rMWc=
X-Google-Smtp-Source: AGHT+IEduCdNbL7IFjCYL/sa3Uw1eSpI/ch7S+DMg3yhWwQhhBhMD+Xp89Ze8+kev4lk/55fC5U9WQ==
X-Received: by 2002:a05:6402:1e8c:b0:5de:3478:269b with SMTP id 4fb4d7f45d1cf-5e44ba3ff2emr3170354a12.32.1740492339723;
        Tue, 25 Feb 2025 06:05:39 -0800 (PST)
Received: from [192.168.6.238] ([92.120.5.7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e45b716aadsm1258001a12.36.2025.02.25.06.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 06:05:39 -0800 (PST)
Message-ID: <cd6a84cd-ff17-45df-becc-9bfc74522f73@gmail.com>
Date: Tue, 25 Feb 2025 16:14:34 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Content-Language: en-GB
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
 <20250221191909.31874-5-laurentiumihalcea111@gmail.com>
 <Z7jahtO3bxjkMfnc@lizhi-Precision-Tower-5810>
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z7jahtO3bxjkMfnc@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 21.02.2025 21:56, Frank Li wrote:
> On Fri, Feb 21, 2025 at 02:19:08PM -0500, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> AIPS5 is actually AIPSTZ5 as it offers some security-related
>> configurations. Since these configurations need to be applied before
>> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
>> be their parent instead of keeping AIPS5 and adding a child node for
>> AIPSTZ5. Also, because of the security configurations, the address space
>> of the bus has to be changed to that of the configuration registers.
> The orginal 0x30c0_0000..0x31200000 include 0x30df0000, why not map only
> config address part in your drivers.
>
> Frank


Any concerns/anything wrong with current approach?


I find it a bit awkward to have the whole bus address space

in the DT given that we're only interested in using the access

controller register space.


I'm fine with the approach you suggested but I don't see a

reason for using it?


>
>> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
>> missing 'power-domains' property. The domain needs to be powered on before
>> attempting to configure the security-related registers.
>>
>> The DT node name is not changed to avoid potential issues with DTs in
>> which this node is referenced.
>>
>> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> index e0d3b8cba221..a1d9b834d2da 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> @@ -1399,11 +1399,13 @@ eqos: ethernet@30bf0000 {
>>  			};
>>  		};
>>
>> -		aips5: bus@30c00000 {
>> -			compatible = "fsl,aips-bus", "simple-bus";
>> -			reg = <0x30c00000 0x400000>;
>> +		aips5: bus@30df0000 {
>> +			compatible = "fsl,imx8mp-aipstz", "simple-bus";
>> +			reg = <0x30df0000 0x10000>;
>> +			power-domains = <&pgc_audio>;
>>  			#address-cells = <1>;
>>  			#size-cells = <1>;
>> +			#access-controller-cells = <0>;
>>  			ranges;
>>
>>  			spba-bus@30c00000 {
>> --
>> 2.34.1
>>
