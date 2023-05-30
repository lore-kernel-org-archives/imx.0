Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FCD1DDD9
	for <imx@lists.linux.dev>; Tue, 30 May 2023 13:08:52 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-514ab6cb529so2464798a12.1
        for <imx@lists.linux.dev>; Tue, 30 May 2023 06:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685452130; x=1688044130;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jZXIY4rtAXwpW+oWkjV46RQdYU5hKm1yGrqNPmpHKfU=;
        b=wEi+COhB4saE6t3QX0aBzZRVTpQ7odjIOZ2E4o7tTiZl8AnovhqRf7Bodd0DYdqUIw
         3dbjTQa6AJYb8q6GdY7xBc4lmTXn9ivsYko6Z48h96ql6mvKhHdDuExxPgKJ/D9g9xw4
         uxr+SinEI0jqUKRfePH5ukhM/HkBzMk6BfN2S4rtvBv4Pvp7bXxqx+WgBlKTU8ZU8V9g
         5SsksCPlm6QBoyHDHok8s/Occz5ETdfedATS1HqQIHw4M5QgjmL3RGk6CtzENlKtAc7A
         z55iGBXDsKcrzb5QbuAlCN89iZDnLPTdi/PUgvEQhUGH7OXFKR4ImPvovl9fVz3h+sFe
         XHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685452130; x=1688044130;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jZXIY4rtAXwpW+oWkjV46RQdYU5hKm1yGrqNPmpHKfU=;
        b=bsyZQzvxsk+Fi8xDvzHJKYcZn6K26B5PofJv13dno30O4RL5BwXEEg1N7080qqbTKx
         StgrIFrIkyt/k/GFB2ryt1xQbnG4tp65LixjcvnkfOMD8ed9mJKsK3d7wsqKzNu/FveK
         +YYYrMrFW1bM3f1dvDSkL1shNHqg2vXRTPHL2qlNS1WdhUVkF+vglwQ5yu+NmyUcrzb/
         oRsBEBTK/p3CfWWjdwfUO2RvAsyk9h2Nfg4zDnCtiobaA9//yvrJhWFo2GXRPZvvFTNp
         j0ZvZCojt750ztKK5Pn3Re/YjkjIPycVErBolZgO3vCPotOpk84uoAnX1LYg9d7vA/fC
         Vmzw==
X-Gm-Message-State: AC+VfDzurMyqzNQdxnZa9YoY5SN5H880Njc5IJo6QzJoyr15bAn1TlgJ
	YGERjL9tAuIDUJFvASjiTrThvA==
X-Google-Smtp-Source: ACHHUZ4RM/uBVqPWi+sisdgqZOaN+mYhKX2B80COqCOcYP5pLPymJxYK4pUbM9xiPei6arPXAmPDqA==
X-Received: by 2002:a17:907:7da0:b0:96f:b40a:c85f with SMTP id oz32-20020a1709077da000b0096fb40ac85fmr10368239ejc.23.1685452130647;
        Tue, 30 May 2023 06:08:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id oy11-20020a170907104b00b0096f7e6d0063sm7309682ejb.75.2023.05.30.06.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 06:08:50 -0700 (PDT)
Message-ID: <65e7b6df-b83b-2d7c-5093-f5822050827a@linaro.org>
Date: Tue, 30 May 2023 15:08:48 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 12/12] dt-bindings: fsl-dma: fsl-edma: add edma3
 compatible string
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, krzysztof.kozlowski+dt@linaro.org,
 peng.fan@nxp.com, vkoul@kernel.org
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 imx@lists.linux.dev, joy.zou@nxp.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, shenwei.wang@nxp.com
References: <20230529200453.1423796-1-Frank.Li@nxp.com>
 <20230529200453.1423796-13-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230529200453.1423796-13-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/05/2023 22:04, Frank Li wrote:
> Extend Freescale eDMA driver bindings to support eDMA3 IP blocks in
> i.MX8QM and i.MX8QXP SoCs. In i.MX93, both eDMA3 and eDMA4 are now.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/dma/fsl,edma.yaml     | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> index 5fd8fc604261..eed12687b0c9 100644
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

What are these last two? What is "3" and "4"?

>        - items:
>            - const: fsl,ls1028a-edma
>            - const: fsl,vf610-edma
> @@ -101,6 +105,22 @@ allOf:
>          reg:
>            maxItems: 2
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:
> +              - const: fsl,imx8qm-edma
> +              - const: fsl,imx8qm-adma
> +              - const: fsl,imx93-edma3
> +              - const: fsl,imx93-edma4
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        interrupts:
> +          maxItems: 64

That's odd. What about the names? What about minItems? Anyway, this
wasn't tested - you will have failures with dtbs_check.



Best regards,
Krzysztof

