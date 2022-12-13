Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D006679C9
	for <imx@lists.linux.dev>; Tue, 13 Dec 2022 18:54:25 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id v11so4280699ljk.12
        for <imx@lists.linux.dev>; Tue, 13 Dec 2022 10:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HIPMQhD3+psITxKXESoElrmEMixNnFBn4GX76EyPXww=;
        b=thPT9NHQRmNNvE6uZeB9lnXFyKpwPIjWuyeDZ6fQ6lVHeVkpgPAsu4ejh7ASpjwJgw
         puxo4E3U3wH+SK1e+0U4xxm1ArJnyAs7Wj2ZkqMgtblj0Vifu2W14qjvgnI93r/jWS9b
         qXzQpQN1QJHA5nMSXECiQVpGVN/jvBDsPrFCl5jHrLvm08PF1BKU8ZvjTC4MwklHq7tR
         eqy0u9Yi2GL4HLVly8xClK2LoNPGf1hu3DC7/i5YOoHtTp/drS1cEfjo+e4KkCIgjxVO
         W8tIoTEoTvOOnV0+of4njCLTBKyZ/hkenluqL1ZViXHMmLQ0wSj4PHNPno14BHPn4FmH
         kzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HIPMQhD3+psITxKXESoElrmEMixNnFBn4GX76EyPXww=;
        b=aJhpav+9/j2Lz4n62DNZvWVrZaQcwP3omICRn6EMVbfLEEGdZNmNZwccnopuPqwVvk
         QYlCZwaFmunpy3X9VUr6n6/XSHjrIpxf7tV3+DDQJPskAkHIpcCSic9+gmt7XLTa6S9d
         2VkDu8nZW/OGkibos2QsGHwlv9wg0f0IVJ93JWek7sx/tfFzr0KLU1sHBzr0lT1G4BYg
         WPLcn51Rsej8biW3QBZhimn8Xbm2OVG4NnwbcRKL7gT3kQwlKrB23hfx3ffyKBxbJp3Z
         Hm5hyk8uBzg1PKkG6Ldqv4dmB8mMBtP6tbtQ+ZCggy70R+8RbgImbJmza6W3HyteoA3W
         +a0Q==
X-Gm-Message-State: ANoB5plUChCqq/CVcE1/NH/x6+Ln03D2oG9ZK28YAgajhxMwLKga9tEU
	9yMpvsbtLCwBdKKrxSvinSzfCg==
X-Google-Smtp-Source: AA0mqf6qBN7nANaIrqMA455WhZcMcAiYFohX6+DXjFTkG/RaYdkRR9JGA3xhKnG9w2ocYukjJ5KNug==
X-Received: by 2002:a2e:be1f:0:b0:26f:db35:7e42 with SMTP id z31-20020a2ebe1f000000b0026fdb357e42mr6893538ljq.17.1670957663947;
        Tue, 13 Dec 2022 10:54:23 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p13-20020a2eb98d000000b0027a02d2d4ecsm368642ljp.24.2022.12.13.10.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 10:54:23 -0800 (PST)
Message-ID: <f47c1135-9c72-d21e-327e-511f7bf71a23@linaro.org>
Date: Tue, 13 Dec 2022 19:54:21 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 3/4] dt-bindings: iio: accel: fxls8962af: add new
 compatible string
Content-Language: en-US
To: Han Xu <han.xu@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Sean Nyekjaer <sean@geanix.com>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Clark Wang
 <xiaoning.wang@nxp.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20221213171536.1880089-1-han.xu@nxp.com>
 <20221213171536.1880089-5-han.xu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213171536.1880089-5-han.xu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/12/2022 18:15, Han Xu wrote:
> Add new compatible string for the NXP FXLS8967AF accelerometer sensor.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>
> 
> ---
> changes in v3
> - Start commit message in capital
> - Describe all these chips are compatible
> ---
>  .../devicetree/bindings/iio/accel/nxp,fxls8962af.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml b/Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml
> index 65ce8ea14b52..8f07ade21abb 100644
> --- a/Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml
> @@ -14,12 +14,16 @@ description: |
>    SPI and I2C interface.
>      https://www.nxp.com/docs/en/data-sheet/FXLS8962AF.pdf
>      https://www.nxp.com/docs/en/data-sheet/FXLS8964AF.pdf
> +    https://www.nxp.com/docs/en/data-sheet/FXLS8967AF.pdf
>  
>  properties:
>    compatible:
> +    description:
> +      These chips are compatible with each other, just have different IDs.

That's not what I meant.

Compatibility is expressed (check DT spec) by following specific
compatible with a more generic one (fallback), so in DTS:

	compatible = "nxp,fxls8967af", "nxp,fxls8964af";

Your driver changes partially suggested that (and driver changes should
be probably skipped in such case), but now I wonder how it is in reality....

Best regards,
Krzysztof

