Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0844246BB7
	for <imx@lists.linux.dev>; Mon, 18 Aug 2025 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755529242; cv=none; b=pFQRbs8ef14uNCJE6tG3Ei+CMhS2K6giygxYdfdFfjRzUUlkKwYBYLcbnFef3XK6h1K7Hr7720aybod6q1WXmz13M903iCtYwFrBBxM3lRr5RTON+6Zx01g9RzmIXiNw4ye68+2P7kCT9eO1kks2wH79dH3c680RRNRCWpWb5fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755529242; c=relaxed/simple;
	bh=0JNZqbkaZPSHbtSv2NDjMryyfTS1TeGtEneKo4TuKFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aj92BClQy30Gl5P0ZZxb56bt6OHgnWG9QWQyOUvYsf9JjOhd6sSJgE0VAH6RG4KfZSY8pQPG0AjxZyAgh43PqWbO1RJc2g/mb30j4NdfYfU+4Iq3CCLHhpEFSAPCOUIG5ixSD1937sa5D/viINvUcIT2mCdHHcgM6tBYVXcyKzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u5Ar7NWT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u5Ar7NWT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b0b42d5so29090595e9.2
        for <imx@lists.linux.dev>; Mon, 18 Aug 2025 08:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755529239; x=1756134039; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l3C186B02aTHKwHlpf9PgYbUa4D0oYowUZVonNLOuWk=;
        b=u5Ar7NWTSe6l6IKvdFYGDvI3SyYWHU68Y9WBTShxU0RlW4rCXdP5lsAsTGZ2eZS7fd
         k92cT5pk6MhTATa3X+AMZr7Km+NSiduNoOpxfLfDNEWqvJ71BsVRjo2irB3NXgWkGhJK
         9ZCguvBLNyhUuYqc5VF+hYy+hfm7/+DKEpHjKj2MPlklFC7MTrFfZNnBH1QJj/Xu0Oas
         npQJ+11e8RqxcouH20h4sdrxpN2vKkmivehMxHHHmOeRRCdmcv8tfxdyw55nWBztDtyb
         h8PHhL8J631S6qvYUkTLOj7DObCZdSezSOquDMVLUFagGqnGkzwNXZcmTLo5mZkV1sD0
         rVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755529239; x=1756134039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l3C186B02aTHKwHlpf9PgYbUa4D0oYowUZVonNLOuWk=;
        b=QE4kHpMc0lD+R6h2C3w31N32JmN/WfNSDW3JRlie8KdN6DHUn4fYu6zassIiAA1cIQ
         SA0ZszkYNtk850Y2tJcJj1maFpacLD2AFgrfNItApIUUMAKbYCNexmiu1dk4BFJ5Zwq8
         bK2No1gLDsiZ7SIt0QWky4olT8t1sK0XIwyBp2Sv1IHknkaZp8TNyj6ILSbN2FLTqS0T
         eVeMopkJxHxVj9wVIOPPMazla0IhFQFVhiIZ/p/Ttz1Kcmw10QZYHKennB//DHJAikxp
         wAv+7OI96/3mQfbadY0e90VJ+ajPASSFq5tNVjY4Z8tw8noeMCmMFikD/A/tccItn6sN
         AjMA==
X-Forwarded-Encrypted: i=1; AJvYcCXkb18Hh2++MV4j/w4wxdRRGM+31wyifpYhHLaMtZXBvTtvOC/FPDkonKp1Ag1eQ+basbc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ9+VwMh/0V2xJ087pkmXDY2OfVztvGGFzkFWjkoqral2tTrkR
	XVS0l9BrtCE7aFz+ETQa/btMbyHpiRyAsh9wkW9oIbUbs3owMJQs2N+Sj1vOfP6PeaQIQVDQcXF
	MkuFO
X-Gm-Gg: ASbGncu6d/hBB5zzlDr48+ZflVWl3ysV/OygloEt0iYWDSEdM9qNlJheqp92nSb7Jq9
	yifR7Fau8rdTgIYz5P7woANnme+hEbGcM1zZbuvIPsG6xviHPu0gaNMQYv/WuqvVumSz2x099+D
	dQXsajme2w7y3cmhG8SZp0tpH8LqpKabw5Xt7x7kVUze3CrBOkDw+Pd3Wtn170rIX4xoJpGqIBF
	LaFY8Tg6pqp8AR70ag584ZeeOBXnORV7/UIzBH1oIlxMxI+o8+txFu60YKNLcr4ce8RzVc0ZTrd
	4OpuBAyoUq7eniREBbDQzOwwuqyZAae6MqaXIo58imMcBt8XzNGUndIE1zuAGXmL+/Fc9H+FObu
	yLljCMdTXExWV/uZYyl9zRBa5N9E=
X-Google-Smtp-Source: AGHT+IESaK84+Qbh2oexCcTZyKswpuURDPkkYWkvE7C1Z1VgwlbYMMcTEbeuIN+y6lVq8A9WR1nQXA==
X-Received: by 2002:a05:600c:a06:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-45a2186d9d2mr115197275e9.30.1755529238740;
        Mon, 18 Aug 2025 08:00:38 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b42a8f972sm3653855e9.20.2025.08.18.08.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 08:00:38 -0700 (PDT)
Message-ID: <c33c549d-71fb-4778-a1bf-454aab1dcd8e@linaro.org>
Date: Mon, 18 Aug 2025 16:00:37 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] dt-bindings: lpspi: Document support for S32G
To: Frank Li <Frank.li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Clark Wang <xiaoning.wang@nxp.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Larisa Grigore <larisa.grigore@oss.nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Ciprianmarian Costea <ciprianmarian.costea@nxp.com>, s32@nxp.com,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
 <20250814-james-nxp-lpspi-v1-13-9586d7815d14@linaro.org>
 <aJ4psW2Qul4x2bQ4@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aJ4psW2Qul4x2bQ4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/08/2025 7:23 pm, Frank Li wrote:
> On Thu, Aug 14, 2025 at 05:06:53PM +0100, James Clark wrote:
>> From: Larisa Grigore <larisa.grigore@nxp.com>
>>
>> S32G2 and S32G3 are currently treated the same way in the driver, so
>> require that S32G3 is always paired with the S32G2 compatible string
>> until there is divergence in the future.
> 
> Add compatible string 'nxp,s32g2-lpspi' and 'nxp,s32g3-lpspi' for S32G2
> and S32G3. Allow nxp,s32g3-lpspi fallback to nxp,s32g2-lpspi since back
> compatibity.

Ack

> 
> This is independent part with other patches, you can send seperately.
> 

Replied on other threads about this.

> Frank
>>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
>> index 3f8833911807..9fc98b0f3428 100644
>> --- a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
>> @@ -20,6 +20,7 @@ properties:
>>         - enum:
>>             - fsl,imx7ulp-spi
>>             - fsl,imx8qxp-spi
>> +          - nxp,s32g2-lpspi
>>         - items:
>>             - enum:
>>                 - fsl,imx8ulp-spi
>> @@ -27,6 +28,10 @@ properties:
>>                 - fsl,imx94-spi
>>                 - fsl,imx95-spi
>>             - const: fsl,imx7ulp-spi
>> +      - items:
>> +          - const: nxp,s32g3-lpspi
>> +          - const: nxp,s32g2-lpspi
>> +
>>     reg:
>>       maxItems: 1
>>
>>
>> --
>> 2.34.1
>>

