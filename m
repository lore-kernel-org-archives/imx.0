Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009FB30BBBF
	for <imx@lists.linux.dev>; Tue, 14 Oct 2025 21:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476254; cv=none; b=KHOrBwO1eNDhGeuGogwnRIUfGU+udDrR34t23Mmg/XqnllVr6QzYy+Zdi8VFz6HHR+f9Bl7FCTbis4EIaIwlrtDgNe1JqxQV9MMbTAfs84n8wA+rwr4g0bJBzqg5ov4O0kL15s2/6ofjAmmSWBZcTw8D+CjcxRgA54/zSVAI2xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476254; c=relaxed/simple;
	bh=BQJLULTT/Wn1VgzHKtiLeywejDNqOrYVAnsXBZ3US70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lxKhr1Ej14E91j/PuaOK3ovaxCILNnTZ93Pz7jO0Tyed7cnzfQnP+H6BVf2CyDUiDKkRv1BfwLDzzJ7FcHJ8nS+yYf9PjIAG9f88Wbxw6Koq+sPYerp9C1Patc/1RwEu/8gJ+nH5rJLADlTJkctQquV3H0O3F4KtK8UD/otE7RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gecsiyRt; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gecsiyRt"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-421851bcb25so2722617f8f.2
        for <imx@lists.linux.dev>; Tue, 14 Oct 2025 14:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760476250; x=1761081050; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OU1/mxCO0gs9pfD0TKLeg6fFAQ0zkZSd+iwsC02HbYM=;
        b=gecsiyRtzffnjqmjyVY7Dtw6k0WxV3JwgY6i66xARNNHJXd2DnDNtDqu7izpu/smV3
         z84PS4BopXF39NFkOqGksdE5Gc9ypQYsSu8O8Yv0fulX1TM5OqQUczc7DYvwesSHCAiA
         fFTmQNEf/VtT+nY4cVxTJqBwTpGj4JbZ4AMgfCxaii+t7htWpdxDwUP3kHXJOsqyVAmh
         4yHHrBVcvVX5seTmKomlSDmV/zTwBlDir7cCl/fjAsOjeH0bXOZCvGQVqKcf5lZcFdcW
         dxxhEoYd6+kxGOkD7O4WiZEnqNegjwAHiUjWBvipDqQydyzM+I4muY4wZmBCCENpvU3K
         8JcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476250; x=1761081050;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OU1/mxCO0gs9pfD0TKLeg6fFAQ0zkZSd+iwsC02HbYM=;
        b=iH2koV9cENX6o1mnfSjjdrahJO6i8047EuUpoa/K9HDdeW6y/R5dUJLFzgPoq9uiQG
         wtJDKktB1uEc0KqCxnsa+hIDxlCP5KATT35OSEbnKvLEDwWAK06nWdn8R015imNNY7t2
         j58AXZdB6Zp2BfpNQMfrWOR+EKajE9/bRvXZiTlMHBNp0qgFmDvfwB6TgWH8O3R1Ss/g
         qzLRAoCU8iRzhbIbHZHktdrDaY+WUGBx7lPu1iM5ZqauwVwM6yKDyssbBTDR+qg0MVTq
         oXW5LC5kpYZhOJUpGW9DnP9g7A5V+KQ80r6ZP4TzOc7qSPZ95vyvFFGaptBoTy0oA9ad
         HEbg==
X-Forwarded-Encrypted: i=1; AJvYcCVkny2W2e0pZaDStunVgPpXBtEFBWfW0b65wzhvw7/uXiy4VmQ9Ojwac+XuBeBdcW/tCtU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbZBxYvg9dzUgupnxBHpyYYN3Fy+oOcEezrYqgMA5ScP86eFpH
	TZikv649eexhkphDc9UQl9MeuB1WFgvXwBXQy7BGvH5WLGcj2fymptpqOX/L7VbW7wQ=
X-Gm-Gg: ASbGnctwLXKWaYIhRxKpW2AtdyX6LGzpo5yL4PHlE7WzYyf9UiYX8kCwKIGK6CQCeXW
	ZKkbzTDFpmdBK8SvjHmG0KP6HNfq0ivVKWLBJQxYWRrFOb39NQMV+BqBIdeJZVlu8RyrmXq0ntK
	+qiUNvhbdRII8NOVGqsl/OA3sLpezw1LAMJL8axWgdxcy2n5PayHTWI63o1yTZjpPvweYxFRCL5
	Hu8Tw17LZfirk0OhS8nD+yIOk6hBHGALrzwErUm3J9Baheyl/8NsJhvtYsQNcVFuIydiHc1DsRw
	tztYPv/45FHbn3vu/n13UQCx5JkXCOmka3FyDhkB1V0RLV7yGW/3JeE7y0MX60imZlOvh2MO+vg
	LXqg2OHasMIA7iYSPoAXp3Fs6Rep8A0DzOAhhy9LL69PPy3WzlA5ifwL5/dad2wEmd7bmYOHejW
	O4tD3W3CeDrwD0DJXaSWpIuw==
X-Google-Smtp-Source: AGHT+IG4aszTNfWkZ+8pnaYDUBRKBttfxEAtdOpVVT5WH4tPRBG36HzZa82lsANKG9dSujuWlON6Tg==
X-Received: by 2002:a5d:64e8:0:b0:426:d71c:9a34 with SMTP id ffacd0b85a97d-426d71ca0b4mr7446024f8f.51.1760476250194;
        Tue, 14 Oct 2025 14:10:50 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d3desm25578034f8f.7.2025.10.14.14.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:10:49 -0700 (PDT)
Message-ID: <8b64ff99-d3c3-4d5d-ad7e-1d11d0a8fcb4@linaro.org>
Date: Tue, 14 Oct 2025 22:10:46 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/32] media: i2c: ov9282: Use %pe format specifier
To: Ricardo Ribalda <ribalda@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Leon Luo <leonl@leopardimaging.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>, Jacopo Mondi
 <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi
 <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <MY_AlfixYZV-8oPbVR2rAt2c2MXqa44vOl4wBVxfvw8IARVU6fXVfIgMIEjDtagmcTUarlGkxLViwG6BYfcSUA==@protonmail.internalid>
 <20251013-ptr_err-v1-18-2c5efbd82952@chromium.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251013-ptr_err-v1-18-2c5efbd82952@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2025 15:14, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
> 
> This patch fixes this cocci report:
> ./i2c/ov9282.c:1133:3-10: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/i2c/ov9282.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index a9f6176e9729d500a40004de92c35b9abf89b08c..3e24d88f603c1432865b4d880670e4b67f1b5cec 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1129,8 +1129,8 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>   	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
>   						     GPIOD_OUT_LOW);
>   	if (IS_ERR(ov9282->reset_gpio)) {
> -		dev_err(ov9282->dev, "failed to get reset gpio %ld",
> -			PTR_ERR(ov9282->reset_gpio));
> +		dev_err(ov9282->dev, "failed to get reset gpio %pe",
> +			ov9282->reset_gpio);
>   		return PTR_ERR(ov9282->reset_gpio);
>   	}
> 
> 
> --
> 2.51.0.760.g7b8bcc2412-goog
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
