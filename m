Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E489B17278D
	for <imx@lists.linux.dev>; Thu, 24 Oct 2024 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729766881; cv=none; b=okntkZy8HLBuNWb+9DlodFf+5hnBV6w5TLYM/rDiSa2Kr2NKOltYQxpQ/9pMbGQljOsNGeAR0EPfw+hxdEoUv8zXX+M+JgmBe3rWxocPw1LF1Co5LEttXa8+QJILksvOho4Y/IIYoXcYyD+zmih4SWhICcWRxEH07HX9VZGHgfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729766881; c=relaxed/simple;
	bh=Fa4ZeugCZulqq3yRjA8uOwaDIqdku/njHsQsYlodq+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIFCFiqcUY+gejHeH0EZcEgzIGpUF8b8TK5HWYhHrWYaFWUAIIAuGHGFD9+gCDQS/6TVWrRwFmEmCpj8ES6UzLyKKOmeW/A5hcxS/MKHLMa0YLNO/K5KpUjRasJYUJmU2DlZDT1S1VM+mNggeMuuqSXsRaCvJAz/SJxNjfaagqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9ptpFe5; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9ptpFe5"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso9675721fa.2
        for <imx@lists.linux.dev>; Thu, 24 Oct 2024 03:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729766877; x=1730371677; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V3DKzoGRNNveCs6SOsESX4/t1nglUdmun8SVRIZGpys=;
        b=i9ptpFe5U2ClSK63uN5d/vBTkkjbUOi+uzHZraCBYabz/HdXF+U+mb2sZbzthEXnqM
         VvcHwzAwy13RgYzI6wIXTnBYAjVEcOn7wpivaPVKPJyllaxpP5szU3Ocg7xvCHXWZg67
         tZtAUr6P/7uVcs+79v8hP7sCiyBjYpDXGm72U05ygF4iM5dJp1ZDsb9hXmRYvaPN1LQk
         AC0KEWbWQAjoqgSCJsBr1Zb5XW+Qi6aoIpJvibbCtBMmUtbLcKGeyRvEirus3easc6h2
         Nv3hgO+jiCfAhGK69g2MhvIpsih2R6t4Cl5rBSuhHfNlp8Sf4+nerVO5yW/zHaJPAQHx
         5oSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729766877; x=1730371677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V3DKzoGRNNveCs6SOsESX4/t1nglUdmun8SVRIZGpys=;
        b=ev4lP1METGXk/0LFYRgCcG3bw9GOtElHgiYvQjyOjg5RLG8LE6ic9KZqc4wCVANzgr
         Zxr88CmWl8rBr0YscqwW8pHuftVB6ZLvOsT0HLWkT8iV1YiHYbeQ7zYlymijWskm3UT3
         B6hAGHAtGUIhC30+P1p1XFIonk8ROYj335TJRLBTl4jy7Twft7GIWaf+WS7PL2kXHRtf
         Fk9c+EB7EtulQ9MkU/FWd6eWm0lnOPAoeeP+XNf6TU1+344xcnvfzHyj7Frua7dM0Zsc
         ua67ntPNwI/+qNIGTd2YiMclF7o8PHX3MBx0G2yqmUvRoOqS/Ln47IJZ78yK3poDkw5M
         ulzw==
X-Forwarded-Encrypted: i=1; AJvYcCWmG3w1l2TvgXUppLyOGu5wRTOopLMUGPI6IhBKVDkFia36Avq/8EjC3ursEMYIZWlRoGw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi6QgkbGYVFDBfebxCzK9QauVKvTShndaw5QF93j7dODOYEXYq
	bSVzVT+A6RP1P1WnUlejp1viULyLIH/KKCPrQcrcclcHCe/jkfvu
X-Google-Smtp-Source: AGHT+IHHCGUunbU1WBMJq+sAZx9YzaIXr41UGHDPNjS2vbTVWpJJQid4DmPQCcWS5iyhHtNJjwXglg==
X-Received: by 2002:a05:6512:4489:b0:53b:1f59:dc59 with SMTP id 2adb3069b0e04-53b1f59de4cmr4200149e87.6.1729766876589;
        Thu, 24 Oct 2024 03:47:56 -0700 (PDT)
Received: from [192.168.4.167] ([92.120.5.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91306fc0sm600659666b.91.2024.10.24.03.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 03:47:56 -0700 (PDT)
Message-ID: <8a017e66-6d84-4bdf-8188-9ae3428b6d17@gmail.com>
Date: Thu, 24 Oct 2024 13:47:53 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: fsl,imx-rproc: add new
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
 <20241023162114.3354-2-laurentiumihalcea111@gmail.com>
 <ub7yylef6qyztjtg3pciamg6jjznxh3ydlqsdcg2xcoxqngpi4@j5jlex4qukyz>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ub7yylef6qyztjtg3pciamg6jjznxh3ydlqsdcg2xcoxqngpi4@j5jlex4qukyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/24/2024 10:45 AM, Krzysztof Kozlowski wrote:
> On Wed, Oct 23, 2024 at 12:21:11PM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add new compatible for imx95's CM7 with SOF.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 58 +++++++++++++++++--
>>  1 file changed, 53 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>> index 57d75acb0b5e..ab0d8e017965 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>> @@ -28,6 +28,15 @@ properties:
>>        - fsl,imx8qxp-cm4
>>        - fsl,imx8ulp-cm33
>>        - fsl,imx93-cm33
>> +      - fsl,imx95-cm7-sof
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dram
>> +      - const: mailbox
> That's quite different programming model. Are you sure these are devices
> from similar class/type?
Yep, these are all Cortex-M cores. It's just that their usage differs quite a lot.
>
> Your big if:then: block suggests this could be separate binding.
Ideally I would have wanted to place the compatible inside dsp/fsl,dsp.yaml as the
programming model would have been more similar.

Unfortunately, these are different physical devices (HiFi DSP core vs CM core) even
though they're all used for DSP purposes so I'm not sure this is entirely appropriate.

Alternatively, if you think grouping these devices (i.e: those represented by the -dsp compatibles
from fsl,dsp and the one represented by the compatible introduced here) under the same binding
is alright we can just branch off from fsl,dsp and fsl,imx-rproc and create a new binding for
these devices. I'm expecting this to be relatively clean as they have the same programming
model.

Let me know your thoughts on this.
>
> Best regards,
> Krzysztof
>

