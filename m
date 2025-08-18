Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A4B32253C
	for <imx@lists.linux.dev>; Mon, 18 Aug 2025 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755523916; cv=none; b=aOKFVR34Mta19LBqilN6beNgzr82uoKKDzFjx+fqwtLaS5/spZ2F+wXRtscm+kklcwRRnWtQ8tEETJ7dMuidk5/wfjPxZzA3IyryvILa4Z+IHOwhtzyxklFY6u7rFGb/6txTp9DVWmQsO4lDgUQkjxv1POEBMEuzhnzJOIulcxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755523916; c=relaxed/simple;
	bh=psGGo+q29tQwkhb2p9+G6aCr6y6wqU+zBZ3myvRYS2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FMPydtwYGHulhKTyloC0XAJmMV+vq0GnxEE0IvUbkbCG6ddwG1j480jcd+pbbQbNxrHCPC6yfJnCJgIwTriVLRv1KwmXN8Zet8uUvpun0uLUhB3L0X2WlqiUUCIoCTGPYZKZBg+Cguw9ZoNqfb0amSsP/H/LHcAmQNC6qhlO2+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ecFS5gf0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ecFS5gf0"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9e415a68eso2119963f8f.2
        for <imx@lists.linux.dev>; Mon, 18 Aug 2025 06:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755523912; x=1756128712; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxqOAdTahBCTy7k9I2OysnH6iHbDX78DGOE9Ul6vuMg=;
        b=ecFS5gf0aC3sCDSBX4CpEbbRqzZ2rtgeN20S2MfM/LtnnGC2lIwJhiLSDsrLWWEg21
         oQVoDN65SLEYY86pGhm6tQRLZfYCUkysoRGeRfbVZeER+/IdCbXdydQVZJJDI26uHKxD
         o28x2NpeBAoxvCApb5G8AiCdSZjJO+uwPvp1xGM8EqehgOw2jESuHeimwRDo5Ad4zLnb
         gexlCz1VWddGX0RcGmIZ07zXpvSHMF+j0cPxkJ4/slOQ1L2tIL+eKSebAJsxd/bvUxL9
         kxG3xu/mFuapyErYXx2sU9gC/nZEjGf89vHe2Wb8e7Q1ktYX2fpbLCjy23xvaWtMTZ1t
         rFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755523912; x=1756128712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxqOAdTahBCTy7k9I2OysnH6iHbDX78DGOE9Ul6vuMg=;
        b=mkyT9/aBn6w4BhJfn2b3ZkPurd/lZye/noclnBWhngFcan6bnO4/SYQvUetF4OL1BA
         auBfuVeUE5ljUELoWCMhCTqzsTGAkxgK4fLkERNEUHhKxjVg0w2utQQr6NX6PqnH2kGT
         wrfoAhnBnx5kxPNOHH7F9PDZicxheJmQ2L0tiEOnYChPZSo0Ka5cSYdWiTDokWjHxz6/
         FrJVswaToQTxplIlWlPFJ6N4oVsBA7tGJwjGBzKQYUAWttSjTEa95LZDZ1ychLOxMUnM
         2bZFs6Cjk9mQ1mzC11g85Ihg3GFhkRIjohdSOJNWxSL3Jb+Mnqrd2mG/HbzzgOJQGkLq
         C5mg==
X-Forwarded-Encrypted: i=1; AJvYcCWPYRYDhK21wdstGCbqawUjRvWV93KNyGaclnsVNNNso4A5J8IiPqDpr0QyTMpUEfD3afA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj1Xr7w9/TOKOF6e0DN+w3DOViR/4tL8EE4oefjBqbJL3XrSd2
	15xYKQ5vhj3oTRqWoxDlMYxUNnHqO8V0b652En0sofRlPQpA+HPm6U1p1f2EDQwnxyw=
X-Gm-Gg: ASbGnctk3Bf/Pfg8rc3Ij/S/QaZhopuTQqlYJ7CEbFVaNWMHwB0rUXPMQhDou5Ft/mU
	eFnoZlqaXDqyhqBmeibFpPH1JY3at7AnqMrUDCyQ8WMlekEx0tRd8qiK5burmPZVIC+yr5mEmWG
	hSMNXxKWRtnTblhY56QtH9eSDG8Q1qI4i0Fn8iidTswou7QKAkWU3HIH8vZ1DGukD6IwWrQuwBF
	uWgFhs+yI0GRp3GhhX47+gyXTuxF5TrJsjlAlFkwvBSZCwjNu8xUwdA5eeFseoP+iZabmC0bf24
	vbBUqQWbwAvtEVBbGAC/RwESw1vD+bnDazxyxgPV/a43TxjpCN2JFaweelxAS7pAfzY5B/FMVWG
	EdAmNrr62R7sP8FXWA+BXC0BkogE=
X-Google-Smtp-Source: AGHT+IEHaxfhHyN2OlOCJM1LCuzQK+0ngY10UoeZqNZoqkFY+N+fhTjcOBUMDDIKBauOY81Na0BJmA==
X-Received: by 2002:a05:6000:18aa:b0:3b7:9af4:9c75 with SMTP id ffacd0b85a97d-3bb68545c71mr8765815f8f.30.1755523912274;
        Mon, 18 Aug 2025 06:31:52 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c96dasm12687711f8f.43.2025.08.18.06.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:31:51 -0700 (PDT)
Message-ID: <3f401e84-7236-457f-a2ce-ee45898f1ab9@linaro.org>
Date: Mon, 18 Aug 2025 14:31:50 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] dt-bindings: lpspi: Update maximum num-cs value
To: Frank Li <Frank.li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Clark Wang <xiaoning.wang@nxp.com>,
 Fugang Duan <B38611@freescale.com>, Gao Pan <pandy.gao@nxp.com>,
 Fugang Duan <fugang.duan@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Larisa Grigore <larisa.grigore@oss.nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Ciprianmarian Costea <ciprianmarian.costea@nxp.com>, s32@nxp.com,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
 <20250814-james-nxp-lpspi-v1-11-9586d7815d14@linaro.org>
 <aJ4qw5eF10oJMIIA@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aJ4qw5eF10oJMIIA@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/08/2025 7:28 pm, Frank Li wrote:
> On Thu, Aug 14, 2025 at 05:06:51PM +0100, James Clark wrote:
>> As mentioned in commit f46b06e62c86 ("spi: spi-fsl-lpspi: Read
>> chip-select amount from hardware for i.MX93"), some devices support up
>> to 3 chip selects so update the max value.
>>
>> This isn't a fix or functional change because the devices with 3 chip
>> selects support reading the number of chip selects from hardware, so the
>> value wouldn't have needed to be set here. However the commit states
>> that the DT could be used to overwrite any HW value, so the full range
>> should be supported. This also avoids confusion for any readers about
>> how many chip selects there are.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
>> index a65a42ccaafe..ce7bd44ee17e 100644
>> --- a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
>> @@ -64,7 +64,7 @@ properties:
>>       description:
>>         number of chip selects.
>>       minimum: 1
>> -    maximum: 2
>> +    maximum: 3
> 
> You need keep the same restriction for other compatible string, or need

Not sure I follow here. Don't the binding docs only cover the maximum 
range of valid inputs for all covered platforms? They don't go into 
details about which ranges are valid for every individual sub-platform.

For example if a platform didn't support DMA we wouldn't say it's not 
valid to label DMA channels in the binding doc. If someone puts 3 
instead of 2 then that's just a mistake, but documenting valid ranges 
can't really fix a mistake like that. And changing 2 to 3 doesn't break 
existing DTs, only making it smaller would.

> reason for other platform which also support up to 3.

The reason is that some platforms support 3, so I thought it made most 
sense to set the max to 3. I replied more on the thread with Rob, but we 
can just drop this one.

> 
> Frank
> 
>>       default: 1
>>
>>     power-domains:
>>
>> --
>> 2.34.1
>>

