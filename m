Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634D9168B6
	for <imx@lists.linux.dev>; Fri,  2 Jun 2023 08:30:33 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-96f7bf3cf9eso274172066b.0
        for <imx@lists.linux.dev>; Fri, 02 Jun 2023 01:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685694631; x=1688286631;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VQvGXlwYNpxP39XECJwe50ki1FF0UNPSrkXWOJanzg8=;
        b=BUnvkl3KlatnpU1gmpZ3HNiuhKYdSs+i3mQbPebe6QLJ/z7MTmpoiFIjDcBlPJXW4a
         y0FS0rseiOdMQG+INQOrBnmuyZ0sVw9t48m8r+gyBoiC0nNLfRP8ki9r6k53gWSWSAOU
         prfoYKiITXP/BaAaQw6vGm+m2730Aueg9EQV/7UrT4Xdo7DlJYJOyAhn8Wp6+Yeq+xFV
         cqkqnkbF6IBz8oRw7NLESinrxI4Y2JxkLKALvQM0LQ7/MQ1r50x2oF1yKC2uHKrxZd9j
         syExMZXuvjPAzw8O9UJSyhjCmR7OVgQCTxPnYBrppBy03s+3084YHcN4gqbcC6/YBNsY
         4qfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685694631; x=1688286631;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQvGXlwYNpxP39XECJwe50ki1FF0UNPSrkXWOJanzg8=;
        b=NK2P8yA+icLKOX0saX7patdugKKTf26SfryM+mHK/3RGTLJKB7tHklaNQyy18rY07t
         uZMUiDrDhAopBf1/+WAMrBVKvUB2/JBnNeXxH8T7EymD6GNSGieXEsTdR/FTDRze5A2E
         qMiQ/2hon9sp4bbOUGZIEzN63wGMenOFBr/1/NwJUDi+sWw+lFRR9u0h2ECNH6QmfZXu
         Q858ulPFJS2+03/AoOnsHUNrvKcJp5mDTbDjAWfCy6Q0Y9gONysIADYXaEfP4/WNlkHM
         iy7YibqoQQhWWuLsVj1QGsNVyfXjQL+rUUfmYJ7Q3OZmmXYoFw5Z7dx4Vdn6imcMj88X
         jaKQ==
X-Gm-Message-State: AC+VfDzVSdhIYrYoUBsh+9FJUHIpi93ab2FrYu8SnQl4xkKBNrFa5Idl
	JVP2h5+9SL++GPWn8UVcIj6asA==
X-Google-Smtp-Source: ACHHUZ7G8yszVNtZpSBhnnN/hj7bHiQZkmDIzbik6j2BM2kED4cdcCCx3gP0fzidUz7EKpGwUrviEw==
X-Received: by 2002:a17:907:9628:b0:973:ad8f:ef9b with SMTP id gb40-20020a170907962800b00973ad8fef9bmr11796271ejc.5.1685694631401;
        Fri, 02 Jun 2023 01:30:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id b27-20020a1709062b5b00b0097381fe7aaasm466761ejg.180.2023.06.02.01.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 01:30:30 -0700 (PDT)
Message-ID: <9c7b30d7-c9b5-3006-5e1a-fa05ebbd7df9@linaro.org>
Date: Fri, 2 Jun 2023 10:30:28 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 12/12] dt-bindings: fsl-dma: fsl-edma: add edma3
 compatible string
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, vkoul@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, peng.fan@nxp.com,
 joy.zou@nxp.com, shenwei.wang@nxp.com, imx@lists.linux.dev
References: <20230601144107.1636833-1-Frank.Li@nxp.com>
 <20230601144107.1636833-13-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601144107.1636833-13-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/06/2023 16:41, Frank Li wrote:
> Extend Freescale eDMA driver bindings to support eDMA3 IP blocks in
> i.MX8QM and i.MX8QXP SoCs. In i.MX93, both eDMA3 and eDMA4 are now.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/dma/fsl,edma.yaml     | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> index 5fd8fc604261..ec0fe8735ec7 100644
> --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> @@ -21,6 +21,10 @@ properties:
>        - enum:
>            - fsl,vf610-edma
>            - fsl,imx7ulp-edma
> +          - fsl,imx8qm-edma
> +          - fsl,imx8qm-adma
> +          - fsl,imx93-edma3
> +          - fsl,imx93-edma4
>        - items:
>            - const: fsl,ls1028a-edma
>            - const: fsl,vf610-edma
> @@ -49,6 +53,10 @@ properties:
>    clock-names:
>      maxItems: 2
>  
> +  fsl,channel-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    description: A bitmask lets you skip certain channel.

There is already a property for this - included in your binding:
dma-channel-mask. Use this one.

Best regards,
Krzysztof

