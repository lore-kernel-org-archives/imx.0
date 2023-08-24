Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0255288EB
	for <imx@lists.linux.dev>; Thu, 24 Aug 2023 16:43:22 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2bcbfb3705dso67895251fa.1
        for <imx@lists.linux.dev>; Thu, 24 Aug 2023 09:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692895400; x=1693500200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MhNikzhh9eyMrDoIEuRkwpx1JH9DFmpQLb9Zaw13Qy0=;
        b=PDjoFLERmxIiohisUaSL6+3gzt3DAVcvCSfU+4Kk+INBbN1VhCkpmAgGL3i4tr/sTe
         0T9p+F3BFITd33UsV+z2Su7H0N4dpwumQXIiGRhl7BRgVbLiJpKv7roXVYzwuVxn8+AF
         T1yP1U6JwXwk3tkvvQV/+1PRoQTk5eC4aNyg1oCM+v7xvICYl9uCD/pleJVojDKM2dUD
         u46d0HSd78nc1KTR6AwfEuI83txDBhELpYo1Jv4wXdrlGyzDwBd06UHR7YITsw6HNTBQ
         yqSOO2BNTuU9z6bYXzl/Tnsx5p/sUe+4SBaUtTUFPIp3mD3NWxKm2C7/Thy2vVEkhjK0
         TRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692895400; x=1693500200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MhNikzhh9eyMrDoIEuRkwpx1JH9DFmpQLb9Zaw13Qy0=;
        b=fEJhNAxebhckNEVLU4PM+EKEehBjkAVuiAOAmG57BM4e26L2dq0G3Cb7y94EagMQkF
         IrKC+r4/me5U06xV1pkMFb+DCLfA+ilIfO23co+eXwm3xqElJhSL0Mr0TH8xF7ztfTeJ
         y3NhZicaTuqQoWjdFSfhDWaJMVlsaW11Wdgi6J4ZlXUNm48kHHpIwE29aZDtV5ELuqWP
         BsyCRdkb5c4erWNPOK1CCqoh9uFRFrezarxxHBReYsFbYTTUlh04PHRtZWI1FihbFIZ8
         loMGWQ8FnP4AUBWtnH25XuwRPnhbE+tGDPrW5Gzif/wPNJF5qC/R+8jr5t6VLq/l8J3+
         zZoQ==
X-Gm-Message-State: AOJu0YxS7GlKQ8+CNToOnyLs0cEz8hEwYjStPyrEggAsWZC29dvsYWeo
	4gF4YsMRyS/NjXLAJ3rQAzGmlA==
X-Google-Smtp-Source: AGHT+IEUCWFeSlki8RwvSQkR7uTgoukotEH1DBXjt3MQ0tdHbYwZNDakkUYgqZ8EKbxOphgoG97j2Q==
X-Received: by 2002:a05:6512:3e9:b0:4fb:8de9:ac0e with SMTP id n9-20020a05651203e900b004fb8de9ac0emr9588579lfq.1.1692895400332;
        Thu, 24 Aug 2023 09:43:20 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id o15-20020aa7dd4f000000b0051dd19d6d6esm10781906edw.73.2023.08.24.09.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 09:43:19 -0700 (PDT)
Message-ID: <c9ede9cd-282a-37b9-4fbb-5b27fb276247@linaro.org>
Date: Thu, 24 Aug 2023 18:43:18 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/3] arm64: dts: imx93: add edma1 and edma2
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
 <20230824163922.2952403-2-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230824163922.2952403-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/08/2023 18:39, Frank Li wrote:
> Add edma<n> nodes.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 116 +++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> index 6f85a05ee7e1..acdca18673b7 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -185,6 +185,46 @@ aips1: bus@44000000 {
>  			#size-cells = <1>;
>  			ranges;
>  
> +			edma1: dma-controller@44000000{

Missing space. In other places as well.

> +				compatible = "fsl,imx93-edma3";
> +				reg = <0x44000000 0x200000>;
> +				#dma-cells = <3>;
> +				dma-channels = <31>;


...

> +				clocks = <&clk IMX93_CLK_EDMA2_GATE>;
> +				clock-names = "dma";
> +				fsl,edma-axi;
> +				status = "okay";

Drop.

> +			};
> +
>  			wakeupmix_gpr: syscon@42420000 {
>  				compatible = "fsl,imx93-wakeupmix-syscfg", "syscon";
>  				reg = <0x42420000 0x1000>;

Best regards,
Krzysztof

