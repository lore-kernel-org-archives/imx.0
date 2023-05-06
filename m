Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3742223A7
	for <imx@lists.linux.dev>; Sat,  6 May 2023 10:30:43 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-965cc5170bdso342473466b.2
        for <imx@lists.linux.dev>; Sat, 06 May 2023 03:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683369041; x=1685961041;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=om5rBZjpQmGylRwHMCWGL04Qa98XCtT0ijIQXJtCbpg=;
        b=Uof1PVeZ2PigSWjj/RuJh5B4jduLV1JTD2KLBJycgqsGK7m73CXn7eW88cHN4mC4Cr
         dM4fQk0G5Ec0ZCl0qChvoy9Ai19Cm1VOFCegoZJK+wMQH2kQWdKNc6Bnb+r/KKDehW6t
         qjRQfr3KSEzSZTExdnDOw9rRBTNb2OM6di47nseWiQMNk/tobd7o6VupZpsJmHLYPGZH
         2qKRbnuxnkdgdDu3bu/svnaDlpe9jmOUeoXvEORdl9DayjnLdl/x5AeTZj915Svij+f6
         rlVCVKnhXxZCzpK16zdCCsxGeNOWyrn1hNK+H1SVTLKOXbUlvPu0tzQAThDmY23Td5sc
         ZT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683369041; x=1685961041;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=om5rBZjpQmGylRwHMCWGL04Qa98XCtT0ijIQXJtCbpg=;
        b=HgXErHt7RiZLoriDfu1xWsmBU+CZpr0EQ0kp09cZ4082YNfyuwdZLRcYLtgl+SqB56
         9rNQHTra8A6dVtSekLVtycaXkM4P5IbIqMMLM5D4f8B93KozBtbdCzuM5E64rOxxDH3k
         wbQEmm2/otYmWTtnZ6JORHftmnMlNLJ1wU1u8J9+12cASHfKsMrw2XuNiAI4CwTJWoRZ
         AdrEwCJDlV4G91tQ1QHiBl4nNZiODMFhl1Ek3EMQvzBB9f2dFemHj0yzAQUkDDfCgPw8
         edA4uSkT00Ueewm7+8oA1fuxJKRGoD1Mxqqm1J7IKqL67cZBeVfq2cAKl0EP5fMwtXXk
         g9Lg==
X-Gm-Message-State: AC+VfDzAd8dWAYQoruL6cK+5pPG0ZsX51LMb+mSkZdhWx3kvUlRyvqiH
	FXn/2ThsUR1KoeHV9+gGjbcXgA==
X-Google-Smtp-Source: ACHHUZ4as+xxLviDsQOX+GTc5E7TjPcuUmqsob35yRWQz41AIc++JNtv+eFKhD3MleB3Q6677/6v3w==
X-Received: by 2002:a17:907:2d88:b0:878:711d:9310 with SMTP id gt8-20020a1709072d8800b00878711d9310mr4364603ejc.1.1683369041240;
        Sat, 06 May 2023 03:30:41 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:efe5:7c03:a10a:7a40? ([2a02:810d:15c0:828:efe5:7c03:a10a:7a40])
        by smtp.gmail.com with ESMTPSA id jz4-20020a170906bb0400b0094bb4c75695sm2123565ejb.194.2023.05.06.03.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 May 2023 03:30:40 -0700 (PDT)
Message-ID: <0503436c-e3ea-7c28-e6d5-39fcd8c53d4d@linaro.org>
Date: Sat, 6 May 2023 12:30:39 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] doc: dt-binding: cdns-salvo-phy: add property
 usb2-disconnect-threshold-microvolt
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, vkoul@kernel.org, kishon@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, fushi.peng@nxp.com
References: <20230505185247.1854677-1-Frank.Li@nxp.com>
 <20230505185247.1854677-2-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230505185247.1854677-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/05/2023 20:52, Frank Li wrote:
> Add usb2-disconnect-threshold-microvolt property to address fake USB
> disconnection issue during enumeration or suspend state for difference
> platform.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching). Two prefixes got wrong... It's not doc but it
is dt-bindings.

> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> index 3a07285b5470..3c7f5b3f9211 100644
> --- a/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> @@ -31,6 +31,13 @@ properties:
>    "#phy-cells":
>      const: 0
>  
> +  usb2-disconnect-threshold-microvolt:
> +    description: The microvolt threshold value utilized for detecting
> +      USB disconnection event.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

Drop ref. Add vendor prefix.

> +    enum: [575, 610, 645]
> +    default: 575
> +
>  required:
>    - compatible
>    - reg

Best regards,
Krzysztof

