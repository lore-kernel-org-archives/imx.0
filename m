Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C23288EB
	for <imx@lists.linux.dev>; Thu, 24 Aug 2023 16:42:42 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-52a23227567so159150a12.0
        for <imx@lists.linux.dev>; Thu, 24 Aug 2023 09:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692895360; x=1693500160;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FRVTXGz++H59+3nilaNeFjWdjJ3kSI1rYdkOaYMbR6Q=;
        b=OWz1mxqSKTG4Ws2n2ob+Ev6MkMfo5kvPd3Rs+GO1KhxPkDJOulx9VXNWBvJLPLkCsU
         vf1r9HBJ5D759cqH5P8/XIaC5Zi3iLuWfNwj/3paWaicMP2kH6PMY7W67o6LOtJqnrq3
         fjYrHJ1/LnQveippW69F7alZZqB/5sBGxBtgV8NPsMGumtmU1IDbT1TPwfeLmfYBAZdg
         YVpbR9YS0hP4SwlX/ygDqBrEJCOEfBy3pqdNdEZXaTVVX/BH5ZLvxHqwSItHJF4Dy1KD
         0xNjyXq7JDoPFVnY10J1oUSTaZlPfFTn399TpLVCBNwssIRB5a2zX78ZRbjmRPz/EEWD
         qy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692895360; x=1693500160;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRVTXGz++H59+3nilaNeFjWdjJ3kSI1rYdkOaYMbR6Q=;
        b=WPt5jvHt0JImNN41mYeFm12xPoa6F4HCjE0g8BNUENyv6UivAI9fmR+wGAxSD7VNmq
         O1HUD4HAQYL5LZ0nl227AtsSUvSbOBrfmUOQAwUzZTtyysk80UcdOanYazmryi8r31C6
         JBsOCtf32j14ipnUwHS1hgx+pxHDfBFcDpKrWSRv5vvtznDll4gFlvgBWGa9NcGDToXT
         s/qp8q1nc04zYHo2hgCjsGjTNJzQBkJDA5c9vLVT5+1FYmLr/tHMGGWmg0Gmhe5iVjUJ
         +OLU+Dkh4optiABcQYyyg2ov31eH8T9lyrNAvDYsdcXflZurqt/bKI1Eyc+rBrI6d0Yf
         q7FA==
X-Gm-Message-State: AOJu0YwHBk5DEkXjjNVYccG/poj8N55g7dw+cJQI6WlHeSx3HtX77mpM
	gaVKOkCWDuQ6/3LRe9jdkBt+kQ==
X-Google-Smtp-Source: AGHT+IF6dqWQ4k0Xod7n5CRdbTReJzNMx54la11pA1FVG0NFk2R7/E+0l/ShfQPPpCjJ/TVSTT1tSw==
X-Received: by 2002:a17:907:77c4:b0:993:d536:3cb7 with SMTP id kz4-20020a17090777c400b00993d5363cb7mr12802741ejc.11.1692895360669;
        Thu, 24 Aug 2023 09:42:40 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id o15-20020a1709061b0f00b00985ed2f1584sm11172780ejg.187.2023.08.24.09.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 09:42:40 -0700 (PDT)
Message-ID: <78007d9e-99ef-0922-2198-83e8c674b82c@linaro.org>
Date: Thu, 24 Aug 2023 18:42:38 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/3] arm64: dts: imx93: add dma support for
 lpuart[1..9]
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, festevam@gmail.com
Cc: clin@suse.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 eagle.zhou@nxp.com, imx@lists.linux.dev, joy.zou@nxp.com,
 kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org,
 leoyang.li@nxp.com, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 linux-kernel@vger.kernel.org, pierre.gondois@arm.com, robh+dt@kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org, shenwei.wang@nxp.com,
 sherry.sun@nxp.com
References: <20230824163922.2952403-1-Frank.Li@nxp.com>
 <20230824163922.2952403-5-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230824163922.2952403-5-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/08/2023 18:39, Frank Li wrote:
> Add dma support for lpuart[1..9].
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> index acdca18673b7..849543d35ed7 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -336,6 +336,8 @@ lpuart1: serial@44380000 {
>  				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clk IMX93_CLK_LPUART1_GATE>;
>  				clock-names = "ipg";
> +				dmas = <&edma1 16 0 0>, <&edma1 17 0 1>;
> +				dma-names = "tx", "rx";
>  				status = "disabled";
>  			};
>  
> @@ -345,6 +347,8 @@ lpuart2: serial@44390000 {
>  				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clk IMX93_CLK_LPUART2_GATE>;
>  				clock-names = "ipg";
> +				dmas = <&edma1 18 0 0>, <&edma1 19 0 1>;
> +				dma-names = "tx", "rx";
>  				status = "disabled";
>  			};
>  
> @@ -666,6 +670,8 @@ lpuart3: serial@42570000 {
>  				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clk IMX93_CLK_LPUART3_GATE>;
>  				clock-names = "ipg";
> +				dmas = <&edma2 17 0 0>, <&edma2 18 0 1>;
> +				dma-names = "tx","rx";

Missing space after ,

Best regards,
Krzysztof

