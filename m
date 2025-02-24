Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65EB19408C
	for <imx@lists.linux.dev>; Mon, 24 Feb 2025 19:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740424098; cv=none; b=osYkUf1qCnNRGVPB0zwKWAUMPgVnBbhIbwhoMElhzNXat5B4KH+4iLxvVSElMeA1Mhd8L/72CTUzzxz4Erc9EYRgORqOKh96MNPdpPjml+EvUARz6hwyRsKJvvcABHV7izc/B6y9LtWz1TQd61USMM8diZVECZ7IEJIA4JG6LJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740424098; c=relaxed/simple;
	bh=YgKHn0SXS01Q9qbQJ2WsiYEUqdwLjv45aY/6JKyfLuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FnIH/gcmoRuq51ctwkMANWtuPGBu4F7diM/Gkpf69DIrY26wPbfkSwcG03T+RkINn6OLnH1WxunbjQGZ0RCl7UO/sbfRlg38PuM0Kr8hb05V1LxSIrKHfYEQfJUtG4r5hIedNyZj+TcHvd9hfGMmmc74Kupzy/vya6gWvWaWxIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzL21RHT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzL21RHT"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-439a4fc2d65so46045405e9.3
        for <imx@lists.linux.dev>; Mon, 24 Feb 2025 11:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740424095; x=1741028895; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pU5W+dP5hQjBmGloMvFYYbU1gFy16R79+oo7OXi+20M=;
        b=HzL21RHTWBxe68uA8Zi12UBZvF61T1Mqq7GevJUuPGgFAyaAb0lhG8gCo8M9hG6nAd
         ChzbBsy7WQtjtAWwVG/QIzyfQD7L2uyA5byyIsLPzyk3CqAHUV2z1IXPYGqt80W73P+c
         OzRnViIfSkez4GeRiGP7U51+1LZwIy+1lSMKRpyaoZgiTbjw+vMTkgqAeT7PTUPcUYFN
         bckxAd3rdEoCToV0tQ9BS7lfNSst3Ig2w+Vi8++CjTYvh9kqD9rkO2INzvDi4OAh4mZy
         mWxeByZSuHy5wP4BSWVErADlg27LpwKE5L9nnNqmmiWrTNd+mf1tWJ24QGO0jkqULiJO
         l4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740424095; x=1741028895;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pU5W+dP5hQjBmGloMvFYYbU1gFy16R79+oo7OXi+20M=;
        b=I2d3zm87kie3ikc94fNJfI1qEalIGGXzfqaneWPUp0w57oOqSw0EUtbO08C4Z9kHvt
         Bt1jB/sNsor441+cUqE7aMZzftsH/g/kcvsrXM65qXmwmyUA0atp/Ib3Rm3i6CEMkinc
         VsVFrHzywRRCuKDWze7DkbmPxNp1r3q0LRUCsj0RjNsXV+IUdhGCvjWoqZe9DX/0JtXA
         D723Lyye2+ZfE0d+o+MuHXda6q++mDOls7+Hz+ifMSeXTWy3JDtLhArB7emF3LurYy61
         u/ozkHflu1FhgF9HlQiG5jX5GhVrKgQmHyLVxtwRPTjkCl8rMNPg+FuMGRi53eWhR+2S
         jxAw==
X-Forwarded-Encrypted: i=1; AJvYcCX99VIj0hohx41w2MLqjyVogwx79IXx5ie41KhBED03jwuVg/+ZDwn5CoF8uaNUdDdmPmQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YySs9W45p4qzHZu8QwBLTv9CUuZZGjupFoBBDXQoSEmOfPa9laa
	ddaX/Pky1oF5PDQJK8uUs5tczp7ddr+cXFvNHLCDJJaW2q8S/DE/
X-Gm-Gg: ASbGncse5l6pX7fX68nZNVvKB/tI0OA4bfTsX2AV2Vnt5wXvcQMWxF8NBVfHORr4vIQ
	Z7INvLH8q1CFH9NaVQo0dYrAVPSkefjzcnwD0bfuJLGP1c2NPoNMvFjs1dP5l16w6Lx/HYbuIVJ
	FFwC4Gq/iz4gboHLerbgKzZGaoW4I1hzJgkcRtGBnx2yiFc7xUv9tSecDARrdrziZFqj7J2P37S
	JUsHwo+8eAtMAQEFm1hIzLcbapYQqGlXW4GqVzvUPvzwNiSFTLMYMjIbZ2ZJ3tuhiGSi56sU0Ya
	I4hA3UO6SZv6vNQpw3s0IelULYT285iHX7bLPmav0oRLW7fuvelfnZI=
X-Google-Smtp-Source: AGHT+IFMZpSkj8mOeTbZpxScUGNxroU6s1DGkIhvD1LVcsUzWU2LZzSOcO2UmaPQci+OsYqbI2Wf4Q==
X-Received: by 2002:a05:6000:154b:b0:38d:d666:5457 with SMTP id ffacd0b85a97d-390cc631b04mr259493f8f.42.1740424094433;
        Mon, 24 Feb 2025 11:08:14 -0800 (PST)
Received: from [192.168.1.143] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d552e7sm8482966b.48.2025.02.24.11.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 11:08:13 -0800 (PST)
Message-ID: <36ca7549-aee7-4f14-9311-77978a42362a@gmail.com>
Date: Mon, 24 Feb 2025 21:17:03 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: imx: add imx95 dts for sof
Content-Language: en-GB
To: Frank Li <Frank.li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
 <20250211225808.3050-4-laurentiumihalcea111@gmail.com>
 <Z6vcBvs4xGQ+pGCJ@lizhi-Precision-Tower-5810>
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z6vcBvs4xGQ+pGCJ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 12.02.2025 01:23, Frank Li wrote:
> On Tue, Feb 11, 2025 at 05:58:08PM -0500, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add imx95 DTS for SOF usage.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>>  .../dts/freescale/imx95-19x19-evk-sof.dts     | 85 +++++++++++++++++++
>>  2 files changed, 86 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
>>
>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>> index 839432153cc7..27f64e333e4b 100644
>> --- a/arch/arm64/boot/dts/freescale/Makefile
>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>> @@ -282,6 +282,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>> +dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
> look like should use dt overlay ?


can you pls explain why you'd see this as an overlay?

(snip)

>> +
>> +	sof-sound-wm8962 {
>> +		compatible = "audio-graph-card2";
>> +		links = <&cpu>;
>> +		label = "wm8962-audio";
>> +		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_hp>;
>> +		widgets =
>> +			"Headphone", "Headphones",
>> +			"Microphone", "Headset Mic";
> Generally, align to  =
> 	widgets = "Headphone", "Headphones",
> 		  "Microphone", "Headset Mic";


sure


>> +		routing =
>> +			"Headphones", "HPOUTL",
>> +			"Headphones", "HPOUTR",
>> +			"Headset Mic", "MICBIAS",
>> +			"IN3R", "Headset Mic",
>> +			"IN1R", "Headset Mic";
>> +	};
>> +
>> +	sound-wm8962 {
>> +		status = "disabled";
>> +	};
>> +
>> +};
>> +
>> +&edma2 {
>> +	dma-channel-mask = <0xc0000000>, <0x0>;
>> +};
> Not sure why need mask edma2's some channel, can you add comments for it
>
> Frank


sure, can add comment in commit msg

