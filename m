Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E6C28C87D
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 12:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760359974; cv=none; b=DNBZEe1/IFv/k7Wtq/OIybEAK782kWNZ2q8rpzhXsZRcIRi+PDIu0N4a/NuGIBCpBa+x+5eo9EpEgKOT1rp7TDelsHvyoxIBuc2Zv/SlvP3wfw/m0YvQ4jKdQg69XevHK9IjHckYxZVKybeqEp04s6J99yj7s2JSixdTYmPROPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760359974; c=relaxed/simple;
	bh=veB2ekC+v+jOvBRwKgJpVvI2Ki/SBVYFi1JBEeYd+Dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gxJJwM/eBv8nBwzndQeLDRq2j18o6IP939pul+lM/lu/EootCiy+rRMcAFysIZKpV2f5gyXRfn9jIcaBiTL59oUhimVa35/TOrDmE4q+rYF/Yy7UzOVVCp3+PxFXKZJJNEVsPpC9WDUM4fxpORx9/99zGMAG2ytXwK4I3ayQOmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jmb+/Cb0; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jmb+/Cb0"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-63bc12a5608so634750a12.0
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 05:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760359971; x=1760964771; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RGTQzqOpqmdFB4gV3HPPWK1ZwdyzuxlpeMip3GTHBhA=;
        b=Jmb+/Cb0k8f+Kv1ipxMUI2DA6Vu1VHr/ADtDO2Y9mi6k7edpgw0gDWoJmW+xjOaNAG
         rJmQhoJ9xCTa4MOYx05fC9dp50xsSgR2VDDuUuuDNMbWOqh9bA4VHQdlbv1eDIu8BjMA
         v1iE4Dmnm/DMPbyAykoXmTymQSon/q7nv1VF6OGpT9jSyAlZsq/sGzJBBahQY6ue1p7v
         ACIwX5WdicZYsCGAw9jap80yH/HqGWYhRUJtiOmHt/hX2qt3GnlMYTGaSRBt+gJfqRvw
         PNHgM2uP5fl6kFZNnAxyGnTq999z58q8IiIMbqNq7ZbAB9YrPXIra7DCS1zVstXspnxv
         jS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760359971; x=1760964771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RGTQzqOpqmdFB4gV3HPPWK1ZwdyzuxlpeMip3GTHBhA=;
        b=CwH26gF2QXfXazfsJ/Plu65buahkU6deyYoIXN5ql0xf+ITaO3SCm7mA/Bz925rmfF
         Mf8iLU9dzXsyYkV3zhfTuiunn42rdCDs7V7V+L3N0ZyVCJ29IW9GED6qgsXCvVki8l6n
         9YmN7i5l573L/X9LhopF6aAjcSSiEFWhJD9PIy5ZiBA/gRCYxO1TvV742AMbD3pKc/uk
         /aqfQmf8iutEmHXQzfvVtvWud75GwcadMEt3jogBitTQ9W4qph7O9yJo+EOk71TQqb62
         VnmpsjxReE6gmsPPUbhLi3/R2LoomAIYHlCnuYEPqLnGdxBBKnClYgdVH9Jc1X27Kcaq
         MQPg==
X-Forwarded-Encrypted: i=1; AJvYcCVYlaemL7jDJDfc1Gr/aOLH/RGf2kTOLpBmStFoGsOZqHLVntk9RAE4pATxM2bMm7cNmmE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQdnQAY2KS2ylbtmezTs1ScGqqEj/hf5TxjEHBS3G1HJp1PVjw
	P4n5PVJkaPAkLAFdkcFlND6DOGIBXhz7VUdHTcMt6dGjFJoh0W9WNMx/
X-Gm-Gg: ASbGncvRGABBtHUInvkmEoGRCx4ArG0Qrk1rlpQsG240LbBcfJ5awpnl8PxVJTJaEur
	RAJlIWF8v3EQjq2onvhM3AG02XEpmRP/0y/PdK7w/TXfhzMnAuh49KGPH9s7iFUwGXdk7r62dMd
	DceI2amfWJwI68iXwa67gmpCCSeq7vE42N+wVZzX5l+NExXF90NXz61ioJwt57CLu/I1UjlQBkw
	U0u8WCSsviu2/K+V0R4nxJ+lnWfc3AevKIGBmuIrkUNkEMRadiug94mTnqqii4lkLJh3NV1VVg1
	X8ihrZwIFFsRNSb+mfewqiY0iNVJc/r9wlDH0Q1cYkCS6ZgFn86QYUevqNhThOHViUxElqWzuH9
	Y0gQtlrAT2cJRIgzbh2khAqkb+McVwwQAGNPPzxVbEcWXBER7rwHKEIhlo0oqnIYcIvtp/O0ouU
	9afRu2
X-Google-Smtp-Source: AGHT+IFmmG7MUY5yB4mZ2FFQqWGfn+1ow8HKXXWlks0nW+FmPuADWQrKCGGjfAyKnyrLWQQf+T1dkg==
X-Received: by 2002:a17:907:7290:b0:b45:a03f:d172 with SMTP id a640c23a62f3a-b50acc2f5bemr2364136766b.57.1760359970930;
        Mon, 13 Oct 2025 05:52:50 -0700 (PDT)
Received: from [192.168.4.55] ([92.120.5.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d95257c8sm920389866b.77.2025.10.13.05.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 05:52:50 -0700 (PDT)
Message-ID: <27b2e692-ecff-483f-bb88-392f6ce87574@gmail.com>
Date: Mon, 13 Oct 2025 15:52:49 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: clock: imx8ulp: add SIM LPAV clock gate
 ID definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
 <20250804155407.285353-3-laurentiumihalcea111@gmail.com>
 <20250805-natural-vulture-of-glamour-5fac8d@kuoka>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250805-natural-vulture-of-glamour-5fac8d@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/5/2025 10:02 AM, Krzysztof Kozlowski wrote:
> On Mon, Aug 04, 2025 at 11:54:02AM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add ID definitions for the clock gates managed by the SIM LPAV module.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  include/dt-bindings/clock/imx8ulp-clock.h | 7 +++++++
>>  1 file changed, 7 insertions(+)
> This is part of bindings patch.


ACK. Again, sorry for the easily avoidable mistakes.....


>
>
>> diff --git a/include/dt-bindings/clock/imx8ulp-clock.h b/include/dt-bindings/clock/imx8ulp-clock.h
>> index 827404fadf5c..ebebb4831761 100644
>> --- a/include/dt-bindings/clock/imx8ulp-clock.h
>> +++ b/include/dt-bindings/clock/imx8ulp-clock.h
>> @@ -255,4 +255,11 @@
>>  
>>  #define IMX8ULP_CLK_PCC5_END		56
>>  
>> +/* LPAV SIM */
>> +#define IMX8ULP_CLK_SIM_LPAV_HIFI_CORE		0
>> +#define IMX8ULP_CLK_SIM_LPAV_HIFI_PBCLK		1
>> +#define IMX8ULP_CLK_SIM_LPAV_HIFI_PLAT		2
>> +
>> +#define IMX8ULP_CLK_SIM_LPAV_END		3
> Drop. Not a binding (see other discussions for many SoCs why).


these definitions are being used by the clock driver we're introducing here


>
> Best regards,
> Krzysztof
>
