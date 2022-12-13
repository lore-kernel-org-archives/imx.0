Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEA833D4
	for <imx@lists.linux.dev>; Tue, 13 Dec 2022 13:20:10 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id cf42so4878358lfb.1
        for <imx@lists.linux.dev>; Tue, 13 Dec 2022 05:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eHTfHjvJCeAfYwsNKCuYtmfXn7FoJBs8BtExGL5vLPE=;
        b=hIOKKKQuEHUpmFAgcOUceta27QDdh5hPJp+W39bOv+ckN2c+q/x632X6YMgL+6euNy
         yecM2wsji/kqaBH0iEKTDWZH4CpkuVVLcFx8qAeIiNGRyiCMQwDLdso+8x2HZ8uvodma
         8kV7iXeXo3wiXaXchxqDQGToLLyJj2Hx3uUT6iEUDCJ16eSBKBMFUbBCBRTGzLNc1f2+
         /+Cy3kSwUHh1ifrO1DPv+C4yfA4f1MOYHHz3TmXlXHwmTGUtD3EKSskMvUzAJW32olpM
         3en0BlKvNVX4KdFJ3TZeYXEG6LkTv+cU9n9YOVPDgcrBTNDyE/AqOWTt+EifZ2qielt3
         dC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHTfHjvJCeAfYwsNKCuYtmfXn7FoJBs8BtExGL5vLPE=;
        b=24TmQeLZx4/2wP3Ptey5XqKPpcxRlXvjhmb7LXSc2eM2f8GxZPtUfdKy8JISlArPPs
         D0X2pwqt/qd3dq6CDvFleV4jBGLMCKuM+B8rxEs2LOxo0WW7a7hfor/LdioqxriCh6L6
         4n9csvLzrogrtGvBRl/8LL0+Tk5ZiFP3ZQpicMk/Y3CAjKCD+AVlTuSo+cg02CVg9cvD
         EMlORx+U1j8w6EOaWZba9RIr9mqqjEd7tENPmhCdtzORbZ5fcZHJseE7uCn3DZPW47Qe
         aUPJvHGT7+ljfdZ6Zym+8vK/yCXh/xDpIx4cqRU8NUacJuHfrHLuIA5nXphdbvgGYkEz
         xUuQ==
X-Gm-Message-State: ANoB5pmYuxw+KHdTeKYB1JqJyEn63IxZm6K/7eJnrIlENOC8R1b5/3Dl
	XVo9uvLNo8er+w+64AZd57grTg==
X-Google-Smtp-Source: AA0mqf4JoMBcFBCwMxYKEsdegjcV4U7LcoqRUr1o/cVIols41CuYYG+ho27bKHeu0T2hXokMT4Wt4Q==
X-Received: by 2002:a05:6512:2c85:b0:4a4:68b8:f4d9 with SMTP id dw5-20020a0565122c8500b004a468b8f4d9mr5456750lfb.31.1670937609042;
        Tue, 13 Dec 2022 05:20:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id l11-20020ac24a8b000000b004b55e16931fsm361341lfp.259.2022.12.13.05.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 05:20:08 -0800 (PST)
Message-ID: <d493876d-6902-1196-4eee-400a7e4088d9@linaro.org>
Date: Tue, 13 Dec 2022 14:20:07 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 3/4] dt-bindings: iio: accel: fxls8962af: add new
 compatible string
Content-Language: en-US
To: Han Xu <han.xu@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Sean Nyekjaer <sean@geanix.com>,
 Haibo Chen <haibo.chen@nxp.com>, Matti Vaittinen <mazziesaccount@gmail.com>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Clark Wang
 <xiaoning.wang@nxp.com>, imx@lists.linux.dev
References: <20221212220716.1829183-1-han.xu@nxp.com>
 <20221212220716.1829183-4-han.xu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221212220716.1829183-4-han.xu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/12/2022 23:07, Han Xu wrote:
> add new compatible string for the NXP FXLS8967AF accelerometer sensor.

Start with capital letter.

> 
> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
>  Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml b/Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml
> index 65ce8ea14b52..400eff3ff315 100644
> --- a/Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml
> @@ -14,12 +14,14 @@ description: |
>    SPI and I2C interface.
>      https://www.nxp.com/docs/en/data-sheet/FXLS8962AF.pdf
>      https://www.nxp.com/docs/en/data-sheet/FXLS8964AF.pdf
> +    https://www.nxp.com/docs/en/data-sheet/FXLS8967AF.pdf
>  
>  properties:
>    compatible:
>      enum:
>        - nxp,fxls8962af
>        - nxp,fxls8964af
> +      - nxp,fxls8967af

They are all compatible with each other, right? Looks like, so these
should be expressed in the bindings.

Best regards,
Krzysztof

