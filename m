Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217461FA6
	for <imx@lists.linux.dev>; Thu, 15 Jun 2023 10:52:22 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-982b1a18daeso49293266b.2
        for <imx@lists.linux.dev>; Thu, 15 Jun 2023 03:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686826341; x=1689418341;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=utjDDOKSdywXvqy83VTqNIGTgbsgC3M+2PZw+Kce6sM=;
        b=jMxmfFyWyjWPG1BBJFqu7ITbVdSbOJc+kZnPxcrFjMnrqW8CgSpUNKKRq3Lh6lYBDC
         wfLpqvqyxwHwoRJnmanXLhx7/widM7u7ZK3BKxD585LF/e1rgRj6Xwpi0/bPvj16Iyk7
         erZDOdKqgdkP7RtKevIGVqVn+/fCntNyDzKi265xL+yZzYybJvuuttWdWdkHiGH5NDmr
         4cuY/Iag1OgJ6uY7Gspjh7hoI76PzCkh0ftku3A81zogEi06szELcSSdacIGCNE420JL
         /Wh9OakOZG3sWBhKKKEYDAx/PHxNQvcSU7tYzEj9EOv651PmEsv86w0WoRn6VW71DUXp
         ZmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686826341; x=1689418341;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utjDDOKSdywXvqy83VTqNIGTgbsgC3M+2PZw+Kce6sM=;
        b=DhzmUxaRW6dwqu28OR2/XQ0eeWiz4WHMfsZfJ1nIuW2vxZtxuU/3MByrsn9wd6lyw9
         fNIIEnqD+oqewIj3S/mZqV+3sjkrLU6hMmKCxV14SzUJCyltpNB14t6e461cMpX1zmWE
         /mUfiXNgAZ58cqt6GzGfhRYf1W9V6WlhzvWQ5kDt+4rAZJlCuKv278wazX9KYV7Hf+Sr
         cwfWFcmxaJDUBjPwKa3TK4hmvwI2nkDmMzTIyGM77hM5CV4lRC10Uu9584WP2Z7Hq/u9
         /N7kBopRddjs7/ojXGJD7TPOWLJcY9RQ65wu/TX3BXqsUu43gn3QXklmv4MviBIaP3hO
         q+JA==
X-Gm-Message-State: AC+VfDx03EbGbtX8bJ1CNR/5dyZysW2+4SricbaFgdhQoI1U248eYi6U
	oBDh8gT4YZPxfEMEZj7XWrCdXA==
X-Google-Smtp-Source: ACHHUZ4Zd7QenZN7bznsbb9rzk810MzuMCf4/T0SCZwLsNuT+24Ngk0O8vLf6fuM3CBh7UAmyym6KQ==
X-Received: by 2002:a17:906:d54b:b0:978:94b1:25ac with SMTP id cr11-20020a170906d54b00b0097894b125acmr21518784ejc.40.1686826341146;
        Thu, 15 Jun 2023 03:52:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id jt18-20020a170906ca1200b009823e0bfb05sm3396417ejb.162.2023.06.15.03.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 03:52:20 -0700 (PDT)
Message-ID: <0cddd5e8-3de1-1b6a-b4b8-6304e4c674cf@linaro.org>
Date: Thu, 15 Jun 2023 12:52:18 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 12/12] dt-bindings: fsl-dma: fsl-edma: add edma3
 compatible string
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, vkoul@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, peng.fan@nxp.com,
 joy.zou@nxp.com, shenwei.wang@nxp.com, imx@lists.linux.dev
References: <20230614193544.2114603-1-Frank.Li@nxp.com>
 <20230614193544.2114603-13-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230614193544.2114603-13-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/06/2023 21:35, Frank Li wrote:
> Extend Freescale eDMA driver bindings to support eDMA3 IP blocks in
> i.MX8QM and i.MX8QXP SoCs. In i.MX93, both eDMA3 and eDMA4 are now.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/dma/fsl,edma.yaml     | 99 +++++++++++++++++--
>  1 file changed, 92 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> index 5fd8fc604261..de8c44bd8a89 100644
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
> @@ -65,6 +74,38 @@ required:
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

clocks:
  maxItems: 1

You do not allow more than one clock, right?

> +          const: dma
> +    else:

You already have two ifs, so you should not have else here, but rather
make each if clause proper for your setup.

BTW, the amount of differences point to very complicated schema, so you
should think whether it makes sense to keep binding growing in the first
place.

> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 3
> +        interrupts:
> +          minItems: 2
> +          maxItems: 17

missing clocks restriction to minItems: 2


> +        "#dma-cells":
> +          const: 2
> +        dma-channels:
> +          const: 32
> +



Best regards,
Krzysztof

