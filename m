Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F55D17FE
	for <imx@lists.linux.dev>; Thu, 11 Aug 2022 14:35:39 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id o2so18487274lfb.1
        for <imx@lists.linux.dev>; Thu, 11 Aug 2022 07:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=HWMkKiacAbXjZCW+QJBi//SaWZp5PUOfX91uKaY6Quw=;
        b=i08qZIzkDjlyMcEr83N9FdfpC7GXHP6+EAQH9CtohrVz0PE4/DYz+HbJF6+LZ3OQIV
         MvSB2dyiTOB38WYENrugl//eOxaesLxw10GSd0Rzkyud9fZGIvTGxlI4j/0ARTg35+CF
         nRhGxbVs0Utcs5+ly4R5O0+DmJqex9tBlT1mlNKP/5KmIFb+0Ta0Y5+4/hHIaiChMOcn
         /JZHk5KN32SFnEPaQyeEMwVbh2n+jd4C841xw9CJkMGAw5fkK6n0rr5UNVig++coSbzM
         jOUP7k5TMRyYH6wDC/ndyXyaZzFBINGZYyHtNJW9gBcvcqCVmOMmpWtrGb2O0zlCkgpI
         pEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=HWMkKiacAbXjZCW+QJBi//SaWZp5PUOfX91uKaY6Quw=;
        b=0lrpDD1Rqck5kYT8h1l0H2O8VPiH8uviBaOYFvECooV29ynbP7615yWJhfT32c08SU
         J3lcSeTGkkMDuP+9IwHwXX9QHOr7hxh0pxOHDgSFFAt+V2970NR6aF9TrIGAWIPwUVB2
         8cBqGlEdfXCuOBFuIaY2K/ZPXor0a09s821DqcogHr0IqSdHbZaiQzjzzzKHz2rpL3h0
         zE9eY86LEUAcXz1qqt+aEdezPULL9DUCUJ7CZFwQxI/DPTToO0h4zX0KhdGdbLaNnUti
         wPVNGnw6RCantMh1nHA0HE9pk8i+ieqXpdwuYb6TDCSB4PmOmI4sw56xM3ZVOURu/1LH
         ZLCg==
X-Gm-Message-State: ACgBeo27bxaK0YFj4MlZgdUhuJotYdZSqcSuLh3BSdrclJ2wVejS5oJD
	F3aOAS3IhdpFnXIKjOUKnzNcRg==
X-Google-Smtp-Source: AA6agR6ax8Cjk2ujPg8qHxbuGs/UavTCyEJl64W43pl6T6CSD61e92QRzGzWgHg0T6+nr2YLakjgxQ==
X-Received: by 2002:a05:6512:3048:b0:48b:745:621c with SMTP id b8-20020a056512304800b0048b0745621cmr10507626lfb.620.1660228537208;
        Thu, 11 Aug 2022 07:35:37 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id x6-20020a2e8806000000b0025e6fbf4a07sm857710ljh.7.2022.08.11.07.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 07:35:36 -0700 (PDT)
Message-ID: <db3020ef-7321-e171-b5bc-9c1795c2cced@linaro.org>
Date: Thu, 11 Aug 2022 17:35:35 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 1/3] dt-bindings: gpio: Add imx scu gpio driver
 bindings
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
References: <20220811124135.95299-1-shenwei.wang@nxp.com>
 <20220811124135.95299-2-shenwei.wang@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220811124135.95299-2-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/08/2022 15:41, Shenwei Wang wrote:
> Add binding document for the imx scu gpio driver.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../bindings/gpio/fsl,imx-sc-gpio.yaml        | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml
> new file mode 100644
> index 000000000000..a1b024cddc97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/fsl,imx-sc-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO driver over IMX SCU firmware API
> +
> +maintainers:
> +  - Shenwei Wang <shenwei.wang@nxp.com>
> +
> +description: |
> +  This module provides the standard interface to control the
> +  resource pins in SCU domain on i.MX8 platforms.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qxp-sc-gpio

Now the filename does not match compatible. Use the same compatible as
filename.

Best regards,
Krzysztof
