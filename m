Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A529711CBE
	for <imx@lists.linux.dev>; Sun,  7 Jan 2024 05:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yhDGqTHS"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2046b2cd2d3so931455fac.0
        for <imx@lists.linux.dev>; Sat, 06 Jan 2024 21:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704605712; x=1705210512; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QAQHK5ll+I9fqZVygsC2SG0aCFgjVutNBXAQTzwAdEM=;
        b=yhDGqTHS++J8Dqwg41xROID6E/xwWwecL9P5iQubXlmysg2QzaZBuUzrjNp9kyVFBE
         4/ReQcfxNpSaHYz45S+xQoPF1T2woErvzJErrl2HxMzYjY4ht1Mb1G8VNRvZbBK5FCMy
         af8wH1OpNU70Ip32dyfBYCG1CiBbmODex3RIFbHYTsKxEQbaCk7rx8wFCxDThkvFLTbm
         c0Jls1r6pawiC+nxHMvTReHvheJKcRmc4J0lrwNmbW0JBQm8TvBr3kKXQ+XMttF9E8bX
         uflIgj4HDevni5Iwxtah83rjoCnzL8Ovq6zW18pBMH6taQtsqEBrFrpNTDfq91/vg6OV
         PSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704605712; x=1705210512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAQHK5ll+I9fqZVygsC2SG0aCFgjVutNBXAQTzwAdEM=;
        b=h9F8GN8OGy+n8R61mzhlqoDOh9eK/+/4bMDXSblzBccBJgYaPWqcHd69haw037xXcS
         ZlFI273nBkvH31M+LqyikfSUy9MH6DWhMpH8zOQqbTr9wWN+pdG2tZC//bOw19nrTI3N
         GoxtQ3etucG+6QTHjYO39Kyh6QBe4BK0n7Qhp6SW5nugZE1HqRTfSIVmuUxLwTDg90UE
         7sXuuGdZIC7Ofqgw2PeJDAe4fWOueItR5oxoAsp4NltmYmB2ew6k7dNTayognRkewOEv
         JPWjg2rt4KHeJKreJsqYkMds9Q5+pQ4N9tsUlsqta6VONhMKx8tg70N89aUe6LSTrQRY
         UAVg==
X-Gm-Message-State: AOJu0YxOKnP7AciS4yaNy18EJF9DtAEh4oEvlTsiktrPjf0H/O4/fBCM
	rRTRYdysf51VA6/rdAGi8ZjFH2tojGdw
X-Google-Smtp-Source: AGHT+IHFYUUCHFOG1zw6MP5ODbboKC5GLnr9M5Rq8WdYlLjMIPfuPqb7MhRt2tmk/+KAt8X2v5uycA==
X-Received: by 2002:a05:6870:2247:b0:204:3d7e:791 with SMTP id j7-20020a056870224700b002043d7e0791mr2796524oaf.17.1704605712652;
        Sat, 06 Jan 2024 21:35:12 -0800 (PST)
Received: from thinkpad ([103.197.115.97])
        by smtp.gmail.com with ESMTPSA id fb32-20020a056a002da000b006d9a48882f7sm3803258pfb.118.2024.01.06.21.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jan 2024 21:35:12 -0800 (PST)
Date: Sun, 7 Jan 2024 11:05:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: krzysztof.kozlowski@linaro.org, bhelgaas@google.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
	helgaas@kernel.org, hongxing.zhu@nxp.com, imx@lists.linux.dev,
	kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org,
	kw@linux.com, l.stach@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	lpieralisi@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
	shawnguo@kernel.org
Subject: Re: [PATCH v7 10/16] dt-bindings: imx6q-pcie: restruct reg and
 reg-name
Message-ID: <20240107053505.GJ3416@thinkpad>
References: <20231227182727.1747435-1-Frank.Li@nxp.com>
 <20231227182727.1747435-11-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227182727.1747435-11-Frank.Li@nxp.com>

On Wed, Dec 27, 2023 at 01:27:21PM -0500, Frank Li wrote:
> snps,dw-pcie.yaml already have reg and reg-name information. Needn't
> duplciate here.
> 
> Add 'if' check for existed compatible string to restrict reg and reg-names.
> This prepare to add new compatible string with difference reg-names sets.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> 
> Notes:
>     Change from v6 to v7
>     - add Krzysztof's review tag
>     Change from v5 to v6
>     - Add if check for existed compatible string
>     Change from v4 to v5
>     - add Rob's Acked
>     Change from v1 to v4:
>     - new patch at v4
> 
>  .../bindings/pci/fsl,imx6q-pcie.yaml          | 30 ++++++++++++-------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> index 81bbb8728f0f9..eeca6b7b540f9 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> @@ -30,16 +30,6 @@ properties:
>        - fsl,imx8mm-pcie
>        - fsl,imx8mp-pcie
>  
> -  reg:
> -    items:
> -      - description: Data Bus Interface (DBI) registers.
> -      - description: PCIe configuration space region.
> -
> -  reg-names:
> -    items:
> -      - const: dbi
> -      - const: config
> -
>    clocks:
>      minItems: 3
>      items:
> @@ -90,6 +80,26 @@ required:
>  allOf:
>    - $ref: /schemas/pci/snps,dw-pcie.yaml#
>    - $ref: /schemas/pci/fsl,imx6q-pcie-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - fsl,imx6q-pcie
> +            - fsl,imx6sx-pcie
> +            - fsl,imx6qp-pcie
> +            - fsl,imx7d-pcie
> +            - fsl,imx8mq-pcie
> +            - fsl,imx8mm-pcie
> +            - fsl,imx8mp-pcie
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 2
> +        reg-names:
> +          items:
> +            - const: dbi
> +            - const: config
> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
