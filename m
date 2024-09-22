Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA05B2772A
	for <imx@lists.linux.dev>; Sun, 22 Sep 2024 23:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727046227; cv=none; b=Eh0ECNUlqhxbvZFnr1sGhcGEgiMdCFqFQKjcPuZBYB8F8yvTjWlApB61kKWB0HCAgoeDUssico1DulEp+meB3EWS70pnL44jMYk9czAAoUO2H5O+IMTW92ejb2qxulXEesJ1h6zl+XGdfeBfPBPOukv0Lr+8eVCtAJtKgLc7aME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727046227; c=relaxed/simple;
	bh=wwfVNmUoXYIZO2OGaY8HrUPJD64dGCIlWxNjBolaHW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VV8z8+w8kMQlvzA+ky1/S6w5TPsXh9YHTBR5um+dPH7enRyghYgaxhimJUv+aG+HdSJ24D85dfVUz2nLsARLILh1Lx/DuZV/xlKpKUc5Mkp4Jp8aominciYARU40qWPbaG5Vw9+pmwkvnRtVU9fvbHXsAkPAvY2ynT6ECI/mKWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxK3T80w; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxK3T80w"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so48301785e9.0
        for <imx@lists.linux.dev>; Sun, 22 Sep 2024 16:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727046224; x=1727651024; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xMtXe+qwhue24/Vh2nNTzw9kAkSswIX5YjJHpwdrdMg=;
        b=TxK3T80wqPa//DvUq30+Zed7nPDXAREdIQKXBW9pwgb7oLWT8if+QejwDwAQMO64hG
         eBkikJK9JeoP9L5CFuleSFlXSXlDvUL+eJw8UsuTY+RrEyG8RB9RhCWHkRNU8p0EGPBd
         2kxNn/xY9T9IcilMrR/4YUIyb87ybZNBAwk853q24rcuzcc4VG8IRYhyaJ3vIBhKk6m+
         g23FG8AFdNeFADR7v1ohPhS0ifes7/uOT07ENcs+HmrF5qxtgGeH63Jc54ghYKup4ZRo
         cdwwVOAqP+8Jwkd5WPaCnPNfA4xylcMSRLZCu5VugaVbG4HoJFBuUpvy2JJ1aaPsYk4J
         oAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727046224; x=1727651024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMtXe+qwhue24/Vh2nNTzw9kAkSswIX5YjJHpwdrdMg=;
        b=BcU/KKtPLY0tJ3SlZPVdPVenncOcoG9dyMDP0qATSYj3BPHDqWGDNLdFxCG+x1P7w0
         BgGHu1X/JHDOmTzW5K1zoEn8AWHonkPUufHuGYav5iKN7ltG0Kq+VhBtPIzcooEic/6J
         6WmFQGvtuPbrpKyplVGt1AjlkwFoXbDJABXY4eTfZf3kYZVUaXC1fT7jS0Diq4WsA3+s
         geMfBuiLtE/lbjK07O+5bakjJ+/yMJY+Omb2tyGUmuLxhsE1EJIvaLRHgXTlHLBbQ/Er
         S8gGAF+/Am6TY4Lq/ztNR1SPPb1ffel0gqjGQiRgEJffAHQipLAbOpO3LpjmbMaGYvZE
         J0eg==
X-Forwarded-Encrypted: i=1; AJvYcCURs20PHug5MJC5ODGEpSwgGGGpEL/0q0uWEyiYyqPVnOrEZ2/asnYxS27AriinUSCr6NE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6jHNdxCNkh9k/cDAmnbpKZaFoTQE4l9gvA50G6KOkUV4x0Edx
	LbKfMjrnlWcB4xZ4yKHFyIFVK0JML4saY3F6m0jxGmgRU+lXcnRH
X-Google-Smtp-Source: AGHT+IHERED460bQf26PbmaFiMNdgb9tgvoFaNMY39SyzQWOQGcp5md0bmH5ap7eDnGkjMkPcyv6Zg==
X-Received: by 2002:a05:600c:190e:b0:42c:b555:43dd with SMTP id 5b1f17b1804b1-42e7abe4184mr108137915e9.3.1727046223890;
        Sun, 22 Sep 2024 16:03:43 -0700 (PDT)
Received: from [192.168.1.130] ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e801d66f6sm61765435e9.29.2024.09.22.16.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2024 16:03:42 -0700 (PDT)
Message-ID: <48b93ab0-7285-4cdc-9bea-ac41a5dcdb2f@gmail.com>
Date: Mon, 23 Sep 2024 02:03:38 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: dsp: fix power domain count
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Daniel Baluta
 <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240918182117.86221-1-laurentiumihalcea111@gmail.com>
 <20240918182117.86221-2-laurentiumihalcea111@gmail.com>
 <Zusguvhu+pld8UOi@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Zusguvhu+pld8UOi@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/18/2024 9:49 PM, Frank Li wrote:
> On Wed, Sep 18, 2024 at 02:21:13PM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Per the current binding, QM/QXP DSPs are supposed
>> to have 4 power domains, while the rest just 1.
>> For QM/QXP, the 4 power domains are: DSP, DSP_RAM,
>> MU13A, MU13B.
>>
>> First off, drop MU13A from the count. This is attached
>> to the platform device of lsio_mu13. This decreases the
>> count to 3.
>>
>> Secondly, drop DSP and DSP_RAM from the count for QXP.
>> These are attached to the platform devices of the lpcgs
>> (used as clock providers for the DSP).
>>
>> With this in mind, the number of required power domains for
>> QXP is 1 (MU13B), while for QM it's 3 (MU13B, DSP, DSP_RAM).
>>
>> Additionally, two extra power domains may be required in the
>> case of QM/QXP DSPs. These are IRQSTR_DSP and MU2A. For the nodes
>> using the "-hifi4" compatibles these PDs are optional, while for
>> nodes using the "-dsp" compatibles these are mandatory.
>>
>> These changes reflect all of this information.
> Can you wrap message to 75 char?
Shall fix in V2.
>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 62 +++++++++++++++----
>>  1 file changed, 49 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
>> index 9af40da5688e..e2f016af1048 100644
>> --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
>> +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
>> @@ -51,8 +51,6 @@ properties:
>>      description:
>>        List of phandle and PM domain specifier as documented in
>>        Documentation/devicetree/bindings/power/power_domain.txt
>> -    minItems: 1
>> -    maxItems: 4
>>
>>    mboxes:
>>      description:
>> @@ -97,16 +95,55 @@ allOf:
>>        properties:
>>          compatible:
>>            contains:
>> -            enum:
>> -              - fsl,imx8qxp-dsp
>> -              - fsl,imx8qm-dsp
>> -              - fsl,imx8qxp-hifi4
>> -              - fsl,imx8qm-hifi4
>> +            const: fsl,imx8qxp-hifi4
>>      then:
>>        properties:
>>          power-domains:
>> -          minItems: 4
>> -    else:
>> +          maxItems: 3
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: fsl,imx8qxp-dsp
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          minItems: 3
>> +          maxItems: 3
> I remember only need maxItems, if minItems == maxItems.
Might be off here but from my own testing and from looking at dtschema/fixups.py it would seem that's not really applicable to subschemas under "then"/"else" blocks.
>
> Frank
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: fsl,imx8qm-dsp
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          minItems: 5
>> +          maxItems: 5
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: fsl,imx8qm-hifi4
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          minItems: 3
>> +          maxItems: 5
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - fsl,imx8mp-dsp
>> +              - fsl,imx8mp-hifi4
>> +              - fsl,imx8ulp-dsp
>> +              - fsl,imx8ulp-hifi4
>> +    then:
>>        properties:
>>          power-domains:
>>            maxItems: 1
>> @@ -157,10 +194,9 @@ examples:
>>                   <&adma_lpcg IMX_ADMA_LPCG_OCRAM_IPG_CLK>,
>>                   <&adma_lpcg IMX_ADMA_LPCG_DSP_CORE_CLK>;
>>          clock-names = "ipg", "ocram", "core";
>> -        power-domains = <&pd IMX_SC_R_MU_13A>,
>> -                        <&pd IMX_SC_R_MU_13B>,
>> -                        <&pd IMX_SC_R_DSP>,
>> -                        <&pd IMX_SC_R_DSP_RAM>;
>> +        power-domains = <&pd IMX_SC_R_MU_13B>,
>> +                        <&pd IMX_SC_R_IRQSTR_DSP>,
>> +                        <&pd IMX_SC_R_MU_2A>;
>>          mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
>>          mboxes = <&lsio_mu13 2 0>, <&lsio_mu13 2 1>, <&lsio_mu13 3 0>, <&lsio_mu13 3 1>;
>>          memory-region = <&dsp_reserved>;
>> --
>> 2.34.1
>>

