Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D280E1E47CA
	for <imx@lists.linux.dev>; Tue, 14 Oct 2025 21:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476234; cv=none; b=dfONJDwUYPy+45WS3pQD0Rper45fzeBQq/oo6CVfG8n+wxEVYTUgUNZlKaVe53l1HU+tWaM1ty7na+wDLgmAPhAPLB154qYsMLzp/XDXr41ad+8N8kKayH++S5CkmW5i0C5ZHbBGb8f8UvD+KSmSMns96WwwarxgsvX+OH9aJkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476234; c=relaxed/simple;
	bh=EDvODqamZOphTpcYh9B/CCtQYxjXGLO+jG1P52nUNI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mgJC7CsFiHEUOBiaDKSB26+XcgCvPYJ2DqFQYG8MR69TfMgeHjm7SIjO5h2+YHmno2d0m/si8iqxZS9FHzw0ZDWMhs6k7C6DLKCmHtrEG8BK13PPylrJumBJT7whxVJDZb9aKo5pM1TQjcQpfXQZsIl+TVrWpzUanJFTumvSy5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J70lo/sm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J70lo/sm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so62584265e9.0
        for <imx@lists.linux.dev>; Tue, 14 Oct 2025 14:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760476230; x=1761081030; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oIqDBu+bnb+H785D5/vHRnkCuDzXg4G0wmJXPEv+JqU=;
        b=J70lo/smYWFSLwe2KscyILVF+mIXmdhni86jvOCwdVOEnD7MUq9ZMzhx+nhA+l+p6n
         wWfI4uL2PHvK2UrbyLoakH5jsrJVZS3lIVS8CX0ZcAoPJ8Lhy99jsZfpQREetcvNDha8
         keDrBBFMJtvzaVNMgd8voTe5exR5ROxBQvrP+oQooq5+Uf3nzhaCFaynrcXeX3i0paSK
         mw0zTPHYKIfWIZrWHWVbNrzAoXhZiiSgcEQzwrVjzjno9KJXAClFKqEtlY1Kc7f/j6Of
         rfxzNwA7G6zsoZVDsRsM6sM3jBn9j7ixebmKysas4NL369uDvmF+k0JKiGVpWNQl1rTI
         wWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476230; x=1761081030;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oIqDBu+bnb+H785D5/vHRnkCuDzXg4G0wmJXPEv+JqU=;
        b=G9ajRpNlrfU7VQSgYIir2u9XiYbQnbDMorCxUVWS5rShn6rdwzGen4RIwU5jeRV4VL
         tHIClZ/GizKB1mNdUVEEzyubaFSSkggvsArwEsdE06AHmnvPdKjAZZKpkWwOsc6bM3/d
         4tHY+7hlBf3VVqXRltDSrnwaJn2nfNKrNrDgKJQAQS2WwMSCbMBMcDdlhCFaZRXntf/o
         WYkAVyqmrqY9g3IyJyWU/OO5FbwUZ9RTi/gnLce6qoZI+Wj/nQ27kcx0auUZTBTGiXD/
         JJFmv5bhRE8p8VYWOv+Q50aI7wNihhnKk/NoaJxlNYS+UQeu8NAn+3gWoAP1UgzGEhBX
         jseg==
X-Forwarded-Encrypted: i=1; AJvYcCXfu/CKtKFrbIqpN0f4Lc9zgRxZv6PVpYeMay+gPvAmlvmR/xZUsGmrrv04LFWOUcj4FEg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxV6iXtcz9lT+AKrct7sRE7rXSPhHGd37bsowhUasgX7P1TICpf
	CBVkbw9iM3mxDhVye/rLcZqLsJ4hz6GbkW5AmsMQXqnUiAmz6sxWyxVMK71BDJTXDSE=
X-Gm-Gg: ASbGncsJEKVkOk5KKi+7uiZJU6QYMSjqFjoW2tzzas852i633lBWT+ajqKMpmTyKiOd
	Afrfyh5DOutStlHbgoo3lNP4XARswI7asb0TiBgrDJN/VLqXJN2V3CEVQXWZD81Ud7mt7TP5sA0
	ibJLLTfJNunC6UoAQUGCYxSPlT3W5QhlJ3kyq2LDvXe9CCkbVQDmbB6yjaOEo+7wt4igsEw2Cjz
	TIWiL3c2wJ65tXxOaJ9OmvhSQgkEBjK8dK1691iaNp0iCAnFzqYznd04MJLPp9AYiE6NxPSCL2y
	llH2/5G2YYiA9PYOg35xkVR2Pfafa71DKbNiVoPOm0yBgMrJs1SKrf9K2wj69g11dbIeEfFrO2n
	yB3x71G/q1qeo2XPeNZpexy00xbbpWy/Tm/5NyoJP23UIb/yqeXCWuYfm7ZXeYXd/rdxhXgDOY4
	DtcyJGGlXkoXI=
X-Google-Smtp-Source: AGHT+IEbhID2cy30VH28xdYyFKoHwK5zb9GEgSYaTfKLNAL9ivTZVl5Wqfb64+N4E6V8zmftUTcSQw==
X-Received: by 2002:a05:600c:502c:b0:46e:45d3:82fa with SMTP id 5b1f17b1804b1-46fa9aa0eacmr170991135e9.10.1760476230196;
        Tue, 14 Oct 2025 14:10:30 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cfe74sm25122327f8f.35.2025.10.14.14.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:10:29 -0700 (PDT)
Message-ID: <269f3575-b315-4855-a2f8-243a91cd62f4@linaro.org>
Date: Tue, 14 Oct 2025 22:10:27 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/32] media: i2c: ov5675: Use %pe format specifier
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
 <mtwaxgCCtRmzwKQWossgjGCuiRpYsskzaiJXACP41oCx5DY1kIZtPt-agjTCBTTa_kRJb5g4XI-AoGUeIQ8nmQ==@protonmail.internalid>
 <20251013-ptr_err-v1-16-2c5efbd82952@chromium.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251013-ptr_err-v1-16-2c5efbd82952@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2025 15:14, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
> 
> This patch fixes this cocci report:
> ./i2c/ov5675.c:1188:9-16: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/i2c/ov5675.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index 30e27d39ee445c2603b8fecf7a1107969eb97df3..ea26df328189eef449ce121c0f62a4ef02631830 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -1184,8 +1184,8 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
>   	ov5675->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
>   	if (IS_ERR(ov5675->xvclk))
>   		return dev_err_probe(dev, PTR_ERR(ov5675->xvclk),
> -				     "failed to get xvclk: %ld\n",
> -				     PTR_ERR(ov5675->xvclk));
> +				     "failed to get xvclk: %pe\n",
> +				     ov5675->xvclk);
> 
>   	xvclk_rate = clk_get_rate(ov5675->xvclk);
>   	if (xvclk_rate != OV5675_XVCLK_19_2) {
> 
> --
> 2.51.0.760.g7b8bcc2412-goog
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
