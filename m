Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDFC20103A
	for <imx@lists.linux.dev>; Wed, 12 Feb 2025 20:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739390887; cv=none; b=qlplw9Hkb1kX8KA+0vXUEIl+Xyx9w2Y+jFj6el+VNRXwxgYu9w1kk1gYCB9LSsuy/ef0Sj7tfFGT1pcLcMDtA8CUMzaJQDT6faCU791lYZfkVtv6PvC1PiIQO7out9pwmB2uqG2fw+xMoaIs+jrk+uqYcvAIeWqo2RS3PpSfJYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739390887; c=relaxed/simple;
	bh=khSDGr/HZLTO+nneeIVjM+UO5LunJkeAXO6VcsfdNmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cxysd9qZyyFn8WxpVbvAKHwmZ0cVvBXnfFGo1i0VXjwhFVoX1+QKmjb+K6FFXe01U1uKPDli2ip3bQ4EvGku+15+u7ZEA+nMJ5qWL6VqseE+yNb24MCdj+3G73JmWztjz0Ze+Xqk8O+gLg/I097z/7jcT4QwLcGi0L4gqiJpZtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ze7X0S39; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ze7X0S39"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab7ee6f5535so3071566b.1
        for <imx@lists.linux.dev>; Wed, 12 Feb 2025 12:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739390882; x=1739995682; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iu/7BkGsGBE91wCLd243z0DyD6Dxurxs3l5CaDlz+Xg=;
        b=Ze7X0S396BCTGp2RgwoIM535k8iGUJkedJLisPl+FTpeMZGGNP4I/GAVWNn7WqyhCw
         koXQmwV4xOit50AodQwynSY514+5WHXesMWPxuYdE1MCmAhOmTQBz35rsZmnBFOuDj6b
         UwUeks7qPDoDgNaxy4CyMqGpyMKisBN/Mc+d45ESnyui6Da/ueCi5SmX8CAP+pW9kHPs
         fROHXsm/zRki3Cm/OLcRvb9sBYpuXawHSQaAnBu8Lu2ru8/VWMZblBOOo1RAtDP3B68b
         lPZGmM7Vr7iqFiQVmC1BpX7qXIey0NYGIKMLnRLWBmEEBama8iKjWYBo0nPbCwa2raMj
         xkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739390882; x=1739995682;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu/7BkGsGBE91wCLd243z0DyD6Dxurxs3l5CaDlz+Xg=;
        b=qDkxOiMtWwwmrIJMqRgZ+LQGQjiNYgYblb0UG9y+GhzpEjoQzm8NVwZgUqB+EU8sA9
         GG/67GZY/El4Qa6B+uYyZkPkNvMD6r+XQK0wnTdfvpnKrZdJpkxrZMXVkgGhwa2KagW4
         mOTBkrSBZ3Y0hp+A0JucDiTlxzRZCdX9nrce8s/HqgLh4n/3WO1JOQRs1FhoB3Wcz3Fq
         C+Nl06QxSbcwBpVxNSDv4v149LL6ep+oFXQF6hcmuLpE/tslvrGwNrPAppkVpeBhE3Q3
         VuaVhQO8kyMuUhhMqsxLeWWgUHsf31J7CuUi8dYyX65naAd/lq5esxNQwuS9WrKd7x4L
         Y2Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWF7LQJjjaU97m7OSCvirC9fyzyYmIfAJ7ZMW1mcLzMVILqvBCBHpb2TZdsEgrQzTm9kAo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCuuvnntiYypG7xbrH9Fba5iRHserfT5Mawk97FTzfLIm9twmT
	PubO/8Bga+QbWfU6kUB756vjR3tFj+/qJZHLN82SFz5CEDnIZJFZe8+jNQ99UEY=
X-Gm-Gg: ASbGnct0HTg8uIHTCFNZatRqmVIS1sjOIu6LWadtw+fO1uc+FKAwIaRNKt2O/v1ajZj
	4sSrLgZ4n6+k2BeG0zD+74itgTJ7TLk0YVeU5STGWWXGxEiIB+4dRjQKWy9wI7SlSY3A/hFNg6b
	iJLOX5bwXinUfyGof27cMxR9HPJkRidA4nd7qIalYrv5p8GMHF9+nV+yoZVXRcS68/qKMzR97mG
	v75PvUHUfM9Q8zfcDIpRvPC9mSLN1LffpHHJ7gWirjecThQ5hJfVqRwugVQ4eCZxgPT/mjYoSZn
	eRZZAfTe/2oUkwrqmwvq6n+D2dMQeD1V4hA=
X-Google-Smtp-Source: AGHT+IGJXdMoTs2hWEXInTR+ltJbHmJj8H/ju9vPMe3A99qcrdj0eyslJQbPiSzl9wG+clAd5ieZpw==
X-Received: by 2002:a17:907:3da5:b0:aae:b259:ef5c with SMTP id a640c23a62f3a-ab7f31906bdmr184163766b.0.1739390880917;
        Wed, 12 Feb 2025 12:08:00 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cf46bf57sm539299666b.165.2025.02.12.12.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 12:08:00 -0800 (PST)
Message-ID: <ab2394be-fe1c-46c1-9940-53b4ee1afc5b@linaro.org>
Date: Wed, 12 Feb 2025 21:07:57 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: dt-bindings: Add Sony IMX728
To: Sebastian LaVine <slavine@d3embedded.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Abel Vesa <abel.vesa@linaro.org>, Achath Vaishnav <vaishnav.a@ti.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Javier Carrasco <javier.carrasco@wolfvision.net>, Jianzhong Xu <xuj@ti.com>,
 Julien Massot <julien.massot@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mikhail Rudenko <mike.rudenko@gmail.com>, Nishanth Menon <nm@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stuart Burtner <sburtner@d3embedded.com>, Tero Kristo <kristo@kernel.org>,
 Thakkar Devarsh <devarsht@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Will Deacon <will@kernel.org>,
 Zhi Mao <zhi.mao@mediatek.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-2-slavine@d3embedded.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250212195656.69528-2-slavine@d3embedded.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2025 20:56, Sebastian LaVine wrote:
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the XCLR (System Reset) pin.

s/Specifier for the GPIO connected to the//
But you could say that it is active low, for example.

> +
> +  error0-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the XWRN pin.

The same.

> +
> +  error1-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the XERR pin.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: ../video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        clock-frequency = <400000>;

Drop, not really relevant.

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@1a {
> +            compatible = "sony,imx728";
> +            reg = <0x1a>;
> +
> +            clocks = <&fixed_clock>;
> +            clock-names = "inck";
> +
> +            reset-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
> +            error0-gpios = <&sens_exp 1 GPIO_ACTIVE_HIGH>;
> +            error1-gpios = <&sens_exp 2 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                camera1: endpoint {
> +                    remote-endpoint = <&vin1a_ep>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 575f0e6f0532..50bff3558d7d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21885,6 +21885,12 @@ T:     git git://linuxtv.org/media.git
>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>  F:     drivers/media/i2c/imx415.c
> 
> +SONY IMX728 SENSOR DRIVER
> +M:     Stuart Burtner <sburtner@d3embedded.com>
> +L:     linux-media@vger.kernel.org
> +S:     Odd Fixes


Hm, why only odd fixes? If you don't care about driver, we also kind of
might not care and remove it soon.


> +F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:     Maxim Levitsky <maximlevitsky@gmail.com>
>  M:     Alex Dubov <oakad@yahoo.com>
> --
> 2.34.1
> 
> Please be aware that this email includes email addresses outside of the organization.


Obviously. Please drop it. You can use b4 relay if you need to escape
corporate junk.

Best regards,
Krzysztof
