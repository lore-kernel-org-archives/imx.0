Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41A134320C;
	Fri,  5 Sep 2025 14:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082699; cv=none; b=QGBPbx47wt1i/ZQX2T5bfhb74WYJ/5INdd0N/ZQRXnaX78C5am5Xj84Q3aG35WFKrXFhN0FgCW7Lc5Ac96yN7iJC8AsIAbSJBjPZVWmO9y+TugIGL70plTdIyLQifvnbP/Qu7Q88Iv42p9xGXF5+BoCLel376Bq093IISLGKqgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082699; c=relaxed/simple;
	bh=+1nDfrVt0ppud9zgCkTbqp/0YBEdQzK1oYTnBYlqZPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nS2B06upocQT2lin0blkIzco1eRsMJ2ndLbVJtqkm+d47N+1adyTXVZ1BO2zNoO3Hv+gG6ln9s7T5jtJPrut1L+wVxWTYfzvceVYfXEJomm7OWHrof1PmP/4yOOcp1BuF1KGNCInDtZP7vz2O1Iiin1ACtnlpO0/XEohgWt0zqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4uhbHv3; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4uhbHv3"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-32b02d88d80so1951720a91.0;
        Fri, 05 Sep 2025 07:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757082697; x=1757687497; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3vIXH9G8eZJ7ix/XNHz4bvSACtWtZGWHKqaN5lng6nE=;
        b=d4uhbHv3fkjzDar2Ls6kJkrLZ/PB2EhttgAo5yYv1ldJB1bRscosNNMaDyED9R5pJA
         WSDTS/m59sgaaCbeeH/0hH3TXjKVajgK/PS70SuAp2Lh8TmdbywkRdYicw6GWbK4gZQo
         kIWTjPxpFMwe8lPygBJGYBCJ/9RCIdM0EoWoQMCyJC4ErGo6WgXqAdWh2ADb3v/1oJ0V
         O3G0TsNOYQvgxhnabFjpEvnTgF/cRUHtGJEoYDd9cjLgPVRd4XsPRprAITWAngOSRCbE
         z0q8B2A5zHAsX3ZF/cZShFThsUxa/MkZ6wBsC+yN5sD++Icnk6A0/A5eW36pOgWsdATT
         3adw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082697; x=1757687497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vIXH9G8eZJ7ix/XNHz4bvSACtWtZGWHKqaN5lng6nE=;
        b=K2HWfeaAyZpPV0TxxILLnz1uYlnh31+NAcorPVUm28q1yKaypDXEeKPzb83U3+N4tu
         U+BymesAsrCN7Bw6aV6/5mOWrhUBGmsXf9Ux5nfsJ4CmMkzXmRIs4dXOmWJwBGHHrqLJ
         uUb1ksWnMdzTlAojpZjdRu1tf8ZZ35dwbndyUlDgh8bDkKIX4adEWtBoqAi+HHKhxBHA
         dgKVqm3qDIQrX6t3qA5B1lWSrw9/+wOBzl1idBhiLs/lYC0oHRBCVDe7THVVH7CArlet
         SyfqirK28i7nWCnZXlDWaMLo7yOS9i8umPn/bcLBorMMzECL9aTxOPawlutkcBro/n9U
         ZSMg==
X-Forwarded-Encrypted: i=1; AJvYcCV8ifd1O+J7/M6DHMAPGTRHJxl7qP00NKUNUtv0MLpb1ReWSEgY7n552h+/lorGv6dgiKI=@lists.linux.dev, AJvYcCVpWeyOUrTPBkKfJpnkBiqPpqObpwksvTPZzEwFgNRydAALkQQNRcMAnf6IAwtdFNQJBZslBFIq5Lfjz4c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzkb7m+Z9pRrjU9bFFPayohCMyHUnEnysDzYNJd2xP3giGaSlx/
	9bWvlUJyXNRPpXcTHrQ5F+7DX6PinOtdD4LO3JI9tOpx1NM12PqG1zWi
X-Gm-Gg: ASbGncvRWoI7oVrVWKyq6SSvsZv0sFg/MfEbBTl3eeojtW8Qra/nwn9K7npOccjrmM7
	ZNByEiY45xE24V8KKEJYfOBdGVq8lXz5Oa0GHFZlo+YSvw/1LGQmZGHFwBVoUSipz3o50HYBE7g
	sdBgQrDul3c4XeLnOU1DOV8h0IyXu3LrFbqKhQ/OqJzphjaQNIi3cQ3Nd/WXxOKs1dCI1k3JsXk
	cUyIeOrZe8TA9ZrvfQFHCXHRP/89CITxvY3BzDAqdgr8ylXfRTZmaRr6BHUYD/ah9hcFJi9BEWY
	YR0IxfOtzi7O6ZpvijiUpWoT6LpeIJ5VcUs5OSpduUrJl9yk7oyTJddowyImxWCw10auAIAZg8F
	36ztuJUbJAoXoH1JnNrdlTaZaN+gRO5vp4Z9MasAFzEET2MfLPNAMJjw8ifHZqNOSI2a2XdScBl
	lW/qpKlQ==
X-Google-Smtp-Source: AGHT+IGsUGu45MQwt+NZPV5mLr8VYLLqfRHTzbjIcd42cuNIOrbj6li3sVxyZFvsqM7RMTuhEoyH4A==
X-Received: by 2002:a17:90b:4c4b:b0:32b:94a2:b0d6 with SMTP id 98e67ed59e1d1-32b94a2b221mr8959418a91.3.1757082696826;
        Fri, 05 Sep 2025 07:31:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77267a225e6sm12382015b3a.94.2025.09.05.07.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 07:31:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c00a3d00-d5d5-4f2b-8799-d1b8b22f85cb@roeck-us.net>
Date: Fri, 5 Sep 2025 07:31:31 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] hwmon: Remove redundant error log prints
To: Xichao Zhao <zhao.xichao@vivo.com>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Guillaume La Roque
 <glaroque@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Markus Mayer <mmayer@broadcom.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, zhanghongchen
 <zhanghongchen@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Talel Shenhar <talel@amazon.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
 "open list:RENESAS R-CAR THERMAL DRIVERS"
 <linux-renesas-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>
References: <20250905072423.368123-1-zhao.xichao@vivo.com>
 <20250905072423.368123-3-zhao.xichao@vivo.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250905072423.368123-3-zhao.xichao@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/5/25 00:23, Xichao Zhao wrote:
> devm_thermal_of_zone_register() prints error log messages when
> it fails, so there is no need to print error log messages again.
> 
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> ---
>   drivers/hwmon/hwmon.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 1688c210888a..0514e4bc5e71 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -239,8 +239,7 @@ static int hwmon_thermal_add_sensor(struct device *dev, int index)
>   	if (IS_ERR(tzd)) {
>   		if (PTR_ERR(tzd) != -ENODEV)
>   			return PTR_ERR(tzd);
> -		dev_info(dev, "temp%d_input not attached to any thermal zone\n",
> -			 index + 1);
> +

This series moves the message from an informational message here to an error message
in the thermal core, even though it is (for hwmon) not an error. I personally
think this is a bad idea. Can we get another API that lets me suppress that error
message ?

Guenter

>   		devm_kfree(dev, tdata);
>   		return 0;
>   	}

