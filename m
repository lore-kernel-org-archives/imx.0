Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F797C
	for <imx@lists.linux.dev>; Sat,  6 May 2023 10:29:15 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-50bc25f0c7dso5241337a12.3
        for <imx@lists.linux.dev>; Sat, 06 May 2023 03:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683368953; x=1685960953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q89WWNqgDfTX8XQe+iwDXWhftOpjNe+SVaLkM27Jjlk=;
        b=pmATmgnNBn1vaw2zFc9jefVTFkd0dnlE2vqaWyus03GIzYhi4HyzVnyelO40yuG4Nf
         FbsLdOYL+TPWBZlc0TzBjLv23EisWOaFqVtJ7I8hyRdQkIJyGxnKJWf8U+17lEnl87UF
         nk5FPFUIX9YjFAbDzbOwMQxx/W/figOX/gCjvtt/cHh4kuwHBv699IQhnIP1Th5OsiD4
         qSZ4Flnl9RaMHEnbxZyUcucZD7QgTsn44dLXogGymzjwvrMwJP1njxSDT/gl5FqAFwMA
         +xJPkkV4fuyksFjlazHpTM9bvRGVUs2rEmA75iCMNANIdV/MyaVhtx8GrJiSrrhlgeiN
         QHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683368953; x=1685960953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q89WWNqgDfTX8XQe+iwDXWhftOpjNe+SVaLkM27Jjlk=;
        b=ZgQB2RYUl+0SBow3qLRfegVdAHOfLMp3kIKiHACyPrELoCfgfyHUtdQu/YR4w+YKsO
         DM5Wv3plfqyNvCI+qcDVNF8zGCDykEpPLTPHtM9RxjZ7lA0KWdKkzw+Ad7sGkuf6TcCS
         YTXzg8IqBR7/fpqS3qsYRlgLLjOOvrbE+qaAurnO0SHAkUaEUtZ6Pe+N8c4OWZXXSC+7
         M3Ea0T8EesX4/fwO2BpHajgNYepVn5Ps0fgKwzOU/2ruTEVv8LwTDe7VRxO6husp36uT
         pJO+cAYq/n/HckUVlgJkJP51KMY24INI5Wp6k6mOpKVU+r1HjepByFUEOJEPstgSeiAA
         OFqw==
X-Gm-Message-State: AC+VfDwM7CG9ZSPN9VKR5ecWrGIyFW8lBeHjnOERka1EsD+YWtlOA2m0
	lHLmrMgmHWRx5gjONP4qPBWbsw==
X-Google-Smtp-Source: ACHHUZ6/wPqlS3DByla0DrxWiLfSctxz7UcT+4RZsEyKv1NRwAVpbGbddpmZMuF0gSHXShBQ1JQNRA==
X-Received: by 2002:a17:907:709:b0:961:69a2:c8d6 with SMTP id xb9-20020a170907070900b0096169a2c8d6mr3030336ejb.69.1683368953421;
        Sat, 06 May 2023 03:29:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:efe5:7c03:a10a:7a40? ([2a02:810d:15c0:828:efe5:7c03:a10a:7a40])
        by smtp.gmail.com with ESMTPSA id hx1-20020a170906846100b00965f1f4bac5sm1532711ejc.124.2023.05.06.03.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 May 2023 03:29:12 -0700 (PDT)
Message-ID: <2dd9f9bd-c55e-a887-2e9b-61b2b66512ef@linaro.org>
Date: Sat, 6 May 2023 12:29:11 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] phy: cadence: salvo: Add
 usb2-disconnect-threshold-microvolt property
To: Frank Li <Frank.Li@nxp.com>, vkoul@kernel.org, kishon@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, fushi.peng@nxp.com
References: <20230505185247.1854677-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230505185247.1854677-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/05/2023 20:52, Frank Li wrote:
> Add usb2-disconnect-threshold-microvolt property to address fake USB
> disconnection issue during enumeration or suspend state for difference
> platform.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8x-mek.dtsi |  1 +
>  drivers/phy/cadence/phy-cadence-salvo.c      | 30 +++++++++++++++++++-

DTS and drivers are always separate.

Best regards,
Krzysztof

