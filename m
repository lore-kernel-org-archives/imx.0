Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B9A2AF17
	for <imx@lists.linux.dev>; Sun, 22 Sep 2024 23:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727046967; cv=none; b=kBbM4XAsVtHPmPDlbz34TmMq3wUN68m9trJ7WFtjY3e7LWAwq3zMZVZ9ts6BHtdRPbEc24TPltWp5gNKrbrqhsEHayLJSNtaw7dI/4LiB41dcUrFAVkhyea5yWvZOGTsHaEbB1AwDbBs+wln8JPUFyNFN3NVtUtbFvrwn3tdtkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727046967; c=relaxed/simple;
	bh=fx3QNRbAVm1b74xZ/F/27pxOipNT34BcVyOmdEBu3bU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JyDkmvNhjOstNrRG6G9CQ7Nsw2o4YEB83gkYvI4vyBpq2aSy7RPYC3eiAcWQ0ptqSZ/vovoMzKtIezQKjZ2u/MAyR0Q6RexC6HNDaQZBPGat6k4HobWqlEhxvinNQmvvqE+TZ7k/s7yi6xGXgScSxZ421ADXDnnx1IUTExHhfrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INr8Rffc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INr8Rffc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so35936215e9.3
        for <imx@lists.linux.dev>; Sun, 22 Sep 2024 16:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727046964; x=1727651764; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XQKrIsMaR5H73uXstbYvKgdNX2p28gN7WwxvuQwKaBw=;
        b=INr8RffcF5hmzv4vqnmOVY67CBpJyN6Fmelu7oG2i9lXmnjpJqoo0rvYWol911PlkD
         BATNWyt9wlduWEEzb+za1PB+twr80qamBUwmHelLXiS1grq1vp+ki5+7ZTqWcBGANaar
         zZGbfuKJhFiTwfSAIdPBjxPyjKQy/Z50bHe73dgsXowFTbrvAx88vk8YC7o7D+E5aYi8
         7XD0SE0gMzFQoLiE7a7MuT72cn1Fd5JZWGA8veuSSNbkiqf5hpC1XLxroKPDHSzazN66
         rYU+U7c8fWM7Gk1Dapv/AgL48gwTta5kIlmT090NqKlmcNRbWnpe+UIDoeWhrtdn/ZlU
         ARtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727046964; x=1727651764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQKrIsMaR5H73uXstbYvKgdNX2p28gN7WwxvuQwKaBw=;
        b=bpuZ0TRE54zyFQdn47h+zdWp+BkMQx+EL8GM99C6Qp5+BRgHv5T4bpGGpO3SxtdOr8
         mADH4M7n/ZqODF1E66FJDuzItTrurEALGTWVpRXZ7UH788IYBAGqCvyw5DwmIv6JFsr+
         8p+tLKoqlxQwij8MEL2Lvz+07VBXdqzYXtL9NL8qrxLyqQJaa9FXrlSvE+rdrukT4ICX
         lzo0KIaDRU4Gz9KuqKC6qfknn6zV2TeRJLbryV3bIdDitRWk58BeNlgHr7eL8biHi3Xv
         Xs66VYYFIevPo0ca/6v9n3zqgA+WXb4bsgwAWPluQxD8gpfa5glfRq7MFMWl8x7yTXIc
         AJCw==
X-Forwarded-Encrypted: i=1; AJvYcCVbzcJHMCJVcpz3vtTjSatlX7LCT8BOiKRkKF4NPGU+MOtXIrunKCwGZkYEuyGaGF4UCc4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOoYRF4utQuYlz3GpBK+2jbQ/K/v9qSiNeghCu0pOOIeZPgL/x
	yCg6Ic+KhuieifcfneUEgLbmg95rWBzRzwp7oJHK8Dn7iGtL9L4yXxgs0yk4
X-Google-Smtp-Source: AGHT+IEDinjp0rRpmKvDlaxodTCIjSMZRPmtYU8gpGpSTP+j0fpbwp/LZwEehvOmUrmngjmPQEGmIw==
X-Received: by 2002:a05:600c:1c29:b0:42c:b4a2:a1aa with SMTP id 5b1f17b1804b1-42e7c16e861mr77676245e9.17.1727046963880;
        Sun, 22 Sep 2024 16:16:03 -0700 (PDT)
Received: from [192.168.1.130] ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7afeb1c2sm84618145e9.36.2024.09.22.16.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2024 16:16:02 -0700 (PDT)
Message-ID: <1652f001-742c-4ef0-abee-c9645a3ae63f@gmail.com>
Date: Mon, 23 Sep 2024 02:15:59 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: imx8qm: enable dsp node for rproc usage
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Daniel Baluta
 <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240918182117.86221-1-laurentiumihalcea111@gmail.com>
 <20240918182117.86221-6-laurentiumihalcea111@gmail.com>
 <ZusjSPQ0vpqIUtlL@lizhi-Precision-Tower-5810>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ZusjSPQ0vpqIUtlL@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/18/2024 10:00 PM, Frank Li wrote:
> On Wed, Sep 18, 2024 at 02:21:17PM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Set the status of the dsp node to "okay" and assign
>> its reserved memory regions.
> wrap at 75 chars.
>
> Add dsp node and related reserved memory regions.
>
> Frank
>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 27 ++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
>> index 62203eed6a6c..7ee69ce7b193 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
>> @@ -92,6 +92,27 @@ vdevbuffer: memory@90400000 {
>>  			reg = <0 0x90400000 0 0x100000>;
>>  			no-map;
>>  		};
>> +
>> +		dsp_reserved: dsp@92400000 {
>> +			reg = <0 0x92400000 0 0x1000000>;
>> +			no-map;
>> +		};
>> +
>> +		dsp_vdev0vring0: vdev0vring0@942f0000 {
> 'vdev0vring0' should be genernal name, such as 'memory'

Driver expects reserved memory node names to have a certain format.
If possible and if too problematic I'd rather have this fixed in a separate patch series.

>
>> +			reg = <0 0x942f0000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		dsp_vdev0vring1: vdev0vring1@942f8000 {
>> +			reg = <0 0x942f8000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		dsp_vdev0buffer: vdev0buffer@94300000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0 0x94300000 0 0x100000>;
>> +			no-map;
>> +		};
>>  	};
>>
>>  	lvds_backlight0: backlight-lvds0 {
>> @@ -640,6 +661,12 @@ &sai7 {
>>  	status = "okay";
>>  };
>>
>> +&vpu_dsp {
>> +	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
>> +			<&dsp_vdev0vring1>, <&dsp_reserved>;
>> +	status = "okay";
>> +};
>> +
>>  &iomuxc {
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&pinctrl_hog>;
>> --
>> 2.34.1
>>

