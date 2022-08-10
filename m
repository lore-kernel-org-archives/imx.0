Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5655CB1
	for <imx@lists.linux.dev>; Wed, 10 Aug 2022 14:46:25 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id t1so21560975lft.8
        for <imx@lists.linux.dev>; Wed, 10 Aug 2022 07:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=1vigc/s4YfDj/ooJiN5THmcp5/HApro9MC2TGzeGn+E=;
        b=l57E6NKmXHlM4aUQ7FGA8/Y/QyaX3WmDuqINA3dE8lt6G/sYNCr+cwrZla7AUCeBMW
         ZyDDBgE3SCGylJBHCZZFJ+/YVFQ/q6cVpX5ifRyvUQR3cVGkEjIWzQF50GWOsstaj6Vf
         /oIc4VB5swBCuk01aItKRiLSYBFIrKvcvJDdqGLHGycgMwinPQWM7ptvHFvwL1kTRxxG
         YZKQXcz4aRfaXD98cPnY/P68xstD10wCcgvRWhwwJ+tYcVBx5hzP6Txuui8CsMZyP71e
         n75lVzP+1zm0qUHpd3jm+CpmF4A8USKVOkH6Gq2R4Q80gM6tbGj74a5nn6GLV1PHTOrj
         6LAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=1vigc/s4YfDj/ooJiN5THmcp5/HApro9MC2TGzeGn+E=;
        b=K1F5BtYzToqPtxBRr5JptAZWGCfICet6qqnPiFHkq4dgkv0WwOCZ/wCwkrOJXvWLxX
         zd1HpAqDA1pMHXWRQfSj5kF7sCkTJyzk5Fxstt78MSuFmidGRZNohLcSqdP6JY5/hlpx
         NVIQRFmqwRjJXB9oZpkEhx2qt/cz04lOnqW8rbNcc2fLUF2HQBuOQj66bsidipr2FeWh
         GUAL5U8YDD5N2l8ezhLPNovR/5cJAxFhRceGqmEKbzcnkCqa8uctsnFOz1d0Aak2OHWf
         z8eESfYqKibFIsxaKevWjHo+5HebWje4LcglGjMydsOrPi/5cfnoQvNc9bkqO81VhHLA
         ERTg==
X-Gm-Message-State: ACgBeo0GJp8mZV2jCOx5i0U9Iq6aojfrT7JsV/mYUEHbEyppAIe1QmSL
	ZHCHO/c+pwXYSdIhc0ux4BdDrw==
X-Google-Smtp-Source: AA6agR6LYCcCivkpQBtG3mxaAFGMdHK3AIxWo3GuoswWqe5xC8JKwFW+OOjOpEb+qX/xVEjYpB/c7Q==
X-Received: by 2002:a05:6512:3d20:b0:48b:9e72:fb42 with SMTP id d32-20020a0565123d2000b0048b9e72fb42mr7308138lfv.299.1660142783294;
        Wed, 10 Aug 2022 07:46:23 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id e2-20020ac25462000000b00489d1896c06sm365688lfn.125.2022.08.10.07.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 07:46:22 -0700 (PDT)
Message-ID: <ec6fd9eb-f46d-afa9-b08b-15e202b3a624@linaro.org>
Date: Wed, 10 Aug 2022 17:46:21 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/3] dt-bindings: gpio: Add imx scu gpio driver
 bindings
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
References: <20220810133005.74653-1-shenwei.wang@nxp.com>
 <20220810133005.74653-2-shenwei.wang@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220810133005.74653-2-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/08/2022 16:30, Shenwei Wang wrote:
> Add binding document for the imx scu gpio driver.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../bindings/gpio/fsl,imx-sc-gpio.yaml        | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml
> new file mode 100644
> index 000000000000..66abff316c0c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml
> @@ -0,0 +1,40 @@
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
> +      - fsl,imx-scu-gpio


This is too generic compatible and it even conflicts with the above...
Your driver binds to both without driver data which is even more
confusing. Make the compatible specific for one, given SoC.


Best regards,
Krzysztof
