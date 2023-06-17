Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7533D7FA
	for <imx@lists.linux.dev>; Sat, 17 Jun 2023 08:57:48 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-977e0fbd742so218341066b.2
        for <imx@lists.linux.dev>; Sat, 17 Jun 2023 01:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686992266; x=1689584266;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgysnMUWPxrDeN0B1Faf6Ufq3sMPZzJpEejdj3yiLTo=;
        b=Ep4rhGij69HlZdJB6dvhGBslIi5J1X0YN5FQ+uVyl9cBUJW4BfzzKi92yLruwMKJNR
         x2v9cMCpTHOjdh3EcfEZ3ifxfGvgbxbZUCxDLXg4p/19hlPTRfpC5tBklY13lNSTpCPb
         TR8Iw4gbKvN2ZSdKBNjvB+zyxe/7LRkOvAlGH50xTHBrn39SakHg6Q57hNlzZsg8R0oG
         ZcpVtJJg1TTlp33Vx3YoVregwSDu/gJ/5ne2m0Go8KJJZx7lJdGiYMKzXC1K8IqQpWqu
         g/R6Db3wS5nims712daAO7jHshKPIQ07PCu436EEUmojpzn1i6xX30JJvbK2zMYMhQ11
         l4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686992266; x=1689584266;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pgysnMUWPxrDeN0B1Faf6Ufq3sMPZzJpEejdj3yiLTo=;
        b=NrKdJAghEfmYZO1HV48Z8EcF4NJcMMD8m2XuMZUqF+xQ7sRVL5IetSeVKfoeEx+t+4
         LUpz73sXAk7LVrjfqsg4L5awoJKtYN8R3lddy7WIy7emNjGgTbuD7LcPFAbbs2WEMqYA
         JayYViPJIA+luUcfK8Mc6CS/RTMxQajGKNtdqadWLg0J/PBFLn0p7YMjz1tPl3czWz2e
         EZMWFhu/57cOaTLJEDe90X7UJ3xX6T/YA0JMnLD+ibyPhIKNBS6PPgMPU//V4l5WMDDV
         mT7CVV0bllgiU4pDBSdoZtHEVUBTJKR1+InHXR9iwCYjow5e7q6uQ1N1YlHlmUiZNbpZ
         jEyg==
X-Gm-Message-State: AC+VfDwqv8/2RgZSdQyGZpNyULm59C+shH03HyIZqj6L/xdzhDwMd9xs
	/m4ISS2/dby8eyJI/CAvio+Q1Q==
X-Google-Smtp-Source: ACHHUZ61jEiVOPgq3xLBlRirBwI281rOwqromd11/oVJ0r1/1HEzj6D02KClx0KTTDExEFXIXQMDAA==
X-Received: by 2002:a17:907:7290:b0:96b:48d2:1997 with SMTP id dt16-20020a170907729000b0096b48d21997mr4283094ejc.65.1686992266535;
        Sat, 17 Jun 2023 01:57:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id g26-20020a1709064e5a00b00987ac9cfb8esm368474ejw.67.2023.06.17.01.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 01:57:45 -0700 (PDT)
Message-ID: <ad189220-424b-89bb-a187-60b0294ae1a7@linaro.org>
Date: Sat, 17 Jun 2023 10:57:44 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 12/12] dt-bindings: fsl-dma: fsl-edma: add edma3
 compatible string
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, vkoul@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, peng.fan@nxp.com,
 joy.zou@nxp.com, shenwei.wang@nxp.com, imx@lists.linux.dev
References: <20230616153438.2299922-1-Frank.Li@nxp.com>
 <20230616153438.2299922-13-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230616153438.2299922-13-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2023 17:34, Frank Li wrote:
> Extend Freescale eDMA driver bindings to support eDMA3 IP blocks in
> i.MX8QM and i.MX8QXP SoCs. In i.MX93, both eDMA3 and eDMA4 are now.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/dma/fsl,edma.yaml     | 103 ++++++++++++++++--
>  1 file changed, 96 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> index 5fd8fc604261..2363c10e0d1c 100644
> --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> @@ -21,32 +21,41 @@ properties:
>        - enum:
>            - fsl,vf610-edma
>            - fsl,imx7ulp-edma
> +          - fsl,imx8qm-adma
> +          - fsl,imx8qm-edma
> +          - fsl,imx93-edma3
> +          - fsl,imx93-edma4
>        - items:
>            - const: fsl,ls1028a-edma
>            - const: fsl,vf610-edma
>  
>    reg:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 3
>  
>    interrupts:
> -    minItems: 2
> -    maxItems: 17
> +    minItems: 1
> +    maxItems: 64
>  
>    interrupt-names:
> -    minItems: 2
> -    maxItems: 17
> +    minItems: 1
> +    maxItems: 64
>  
>    "#dma-cells":
> -    const: 2
> +    enum:
> +      - 2
> +      - 3
>  
>    dma-channels:
> -    const: 32
> +    minItems: 1
> +    maxItems: 64
>  
>    clocks:
> +    minItems: 1
>      maxItems: 2
>  
>    clock-names:
> +    minItems: 1
>      maxItems: 2
>  
>    big-endian:
> @@ -65,6 +74,26 @@ required:
>  
>  allOf:
>    - $ref: dma-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8qm-adma
> +              - fsl,imx8qm-edma
> +              - fsl,imx93-edma3
> +              - fsl,imx93-edma4
> +    then:
> +      properties:
> +        "#dma-cells":
> +          const: 3
> +        # It is not necessary to write the interrupt name for each channel.
> +        # instead, you can simply maintain the sequential IRQ numbers as
> +        # defined for the DMA channels.
> +        interrupt-names: false
> +        clock-names:

items:
  - const: dma

missing clocks...

oh wait, I already said this. Let's use reviewers time for doing the
same review, why not. They work for free.

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

