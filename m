Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EE13C25
	for <imx@lists.linux.dev>; Tue, 13 Jun 2023 11:19:29 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-977d7bdde43so1100806266b.0
        for <imx@lists.linux.dev>; Tue, 13 Jun 2023 04:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686655167; x=1689247167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dtzyg81yCu4VXwW413lxgy6B2wG9SaGkM8lh+1KCu1g=;
        b=LYbOWDJUSS7DIRw9J0C8Id2sSIgH9M1zm2KSPI7CbOTgx2VSIGhUWnN0rZbuVXiGc3
         Rbxy7IGgE36jaklExufVW9DNVTJrSbUiNWgBeAZ/hmIhLrPCV1FbyNZo4BwdRlo73CL9
         qPd+b4nA7Uqp4mNrk5ttZ9ZIy9VtvsKdcnpUrF8BrJ+ior9hzUADrMi/khEzwfNJgBBB
         3J3aCRqAmCfHJEUQTgo35GLSrY2DAVgxAkIBeSLAyhb1JMDKYQtJkHNSTPnerU0/5Ut0
         15Y3W9kYyyBmpkkigX9U2BqLDgVW7ZQtql+TjHZKmKVe5WZNSgoS6jFsrAavv1NznRie
         Fb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686655167; x=1689247167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dtzyg81yCu4VXwW413lxgy6B2wG9SaGkM8lh+1KCu1g=;
        b=bn4Ne/RPNQn0ScDZoSbd9nRGshw6UanZiy79vjJudpcftE3O7Yq5Pn3eeg/bxnQ+dw
         omsfMN7WR8S3ev32r3/GCnPt8azjtThn//uViyszN9tISiQEvfQHSx7Zv69zNAs2qyMQ
         3GXdCVXaUFRLNfWI7aCxYybD1gQT0DZpjb2fZ5viyBvNXRQ0jIeGUinpOfVzjqAWEYmG
         Zt/KLxWXoh8/cFuTgeN+2l9xIhYbLo/+Bq9Lw3ZZBMw7NU9cqnMqN+WkSldUD0sXF2sX
         n6sYS6ZyffwG+XrVJm/rqZ6vjVHyiaItEWLhdwqeP3vQ7K+bH5RqoNcR519ym3+M/wc6
         l9/Q==
X-Gm-Message-State: AC+VfDxqqBE/Us542uof4DhfCTG2HLG0/HpcGY9LWFBF1EZTzzN6ozMU
	Oj8L6BwOcnXOcXXGPGLButLAPw==
X-Google-Smtp-Source: ACHHUZ7V9uuUJDuQkeE0U0VIpQbamKxyYvpkZgeq1/iDcr16b5+vIJ7b1fWzeTaXfAfKzGUoiNz/fw==
X-Received: by 2002:a17:906:5d09:b0:978:af9d:c004 with SMTP id g9-20020a1709065d0900b00978af9dc004mr11055545ejt.4.1686655167482;
        Tue, 13 Jun 2023 04:19:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id f13-20020a170906494d00b0097461fecc91sm6493922ejt.81.2023.06.13.04.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 04:19:27 -0700 (PDT)
Message-ID: <7574a6fe-ddf1-1500-ba04-5a1df6845b6a@linaro.org>
Date: Tue, 13 Jun 2023 13:19:24 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 12/12] dt-bindings: fsl-dma: fsl-edma: add edma3
 compatible string
To: Frank Li <Frank.Li@nxp.com>, vkoul@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, peng.fan@nxp.com,
 joy.zou@nxp.com, shenwei.wang@nxp.com, imx@lists.linux.dev
References: <20230612203418.2017769-1-Frank.Li@nxp.com>
 <20230612203418.2017769-13-Frank.Li@nxp.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230612203418.2017769-13-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/06/2023 22:34, Frank Li wrote:
> Extend Freescale eDMA driver bindings to support eDMA3 IP blocks in
> i.MX8QM and i.MX8QXP SoCs. In i.MX93, both eDMA3 and eDMA4 are now.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/dma/fsl,edma.yaml     | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> index 5fd8fc604261..14cea8a3f442 100644
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
> @@ -101,6 +105,26 @@ allOf:
>          reg:
>            maxItems: 2
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:

This is just enum.

> +              - const: fsl,imx8qm-edma
> +              - const: fsl,imx8qm-adma

Keep entries ordered alphabetically. In compatible list as well.

> +              - const: fsl,imx93-edma3
> +              - const: fsl,imx93-edma4
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        interrupts:
> +          minItems: 1
> +          maxItems: 64
> +        interrupt-names:
> +          minItems: 1
> +          maxItems: 64

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

interrupts can be max 17, so just test it and you will see errors.

Why names are not listed? If you accept names like "candy" or
"elephant", then why having the names in the first place?

And what about clocks?

Best regards,
Krzysztof

