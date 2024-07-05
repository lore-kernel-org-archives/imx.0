Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AE61494C8
	for <imx@lists.linux.dev>; Fri,  5 Jul 2024 11:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720178314; cv=none; b=GTB7h/sUhNiyYL9SI2ti6o07b1Z75sY9hywwih+U9g6Gx/RUdVe2DqNCCSa1APLCz0cTxvf+KndWMBvzQTAx7D9nzRpo+mDRmeMm9+V66SdKL+EBeOqtZMnTHNKRxlywI9x1769vf94lv9s/eiAJVprS3tEyRjkoe/cCK4qELiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720178314; c=relaxed/simple;
	bh=COzKA0BcrGQn+MbmWfktjVwdYe3fKKtWtwipRxZp4bM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UjpxxyUwXWN186Ib/hNEFADpm1hG9u3rZ+IlRseQzgoflGSwju9YKCwKLSZnW+hvj58mdAXHQLEXO/dYa+XoXRNdZr61soXS1qM/I1AhPKz6+msInFJrQPqyO9iXhwIGe3yiZ3r/h1JSmM/2EKSglQmI27JnW+K4FYu8M3lHlSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MgH450kr; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MgH450kr"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ee910d6aaeso15095621fa.1
        for <imx@lists.linux.dev>; Fri, 05 Jul 2024 04:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720178309; x=1720783109; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OgGdrMJAOOlmaDA5n6UZ/NcHyTcSq/fRMMLBh3RpPPA=;
        b=MgH450krBYanpbebPWDm3fyQ/bYR/i8Z+6gBhj9yQwCKT5W7RdPyhxNC61gSDIuXj7
         3E4dcLjaNsQPXeueVkTWcj5WA95Tn17gtS9O1lkktgOhvX/OthWCog2U1ND3R8CWNVgu
         WJUylZOcMsGMaXQfBwgX8spnmWTUgTCjsK5W2I/5TgWlmJXEsF75rLPz+R3W6nLNK48I
         AjRgx9rOOZCcht3bNhrlOI+xPP7Ws8UYtkJ/uHULtux2NGUmNkiNtPpOrF8GwvaE8Qak
         alc3bVCBNeLlWvdUuIE7hz6q1CQ6oH927SmShoziiLQ2nX0ojrSOjT31zs0c1fBqrXGG
         3P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720178309; x=1720783109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OgGdrMJAOOlmaDA5n6UZ/NcHyTcSq/fRMMLBh3RpPPA=;
        b=iJWqgKTt6ndgbkcTVP9vhq09bvVJrxzrGdvWtiVOEA5D5yPuLzyhLoejWPMjw0y1D9
         Psz8v6cMoomgLJh1gSZT37yFptmk2hwK+4/spvABsW2zwinMvWXrhRxUWHab6S8AwRKI
         fuS0trhhoLiPd3r3mijy/DLYV894ETzcCcj4pcFAUB3EttzMcDkg1PAk7iPWHSfI+4wu
         H3D8Lp1Yry+nQZHss1tY3rU5B7WDxo3UsSnLJRYtnw9RMDZiwSt9/GMDwcbhKveHJTUm
         VR/ZX0ccj7W47fVfubSD2+x8VC+C/TgjQj/rEySN37BZfMqMgOwYgKaJAeOrp/S96D5s
         +ypw==
X-Forwarded-Encrypted: i=1; AJvYcCVCL4mnQJvYMwVmt9OjiBBT6rDNDbFQ621VPDCAZBKBlwKfLWfpp7LNlPJSrIph/oHdAGnrWXSOn1eJqNgaHNeANWJ5
X-Gm-Message-State: AOJu0YyqcDwRYNsIeedxX2Suz9ElrxbV21413ygrG3KP767bvHAo1zUg
	QZC3LFKr7nNCaC0Xu9G4CI9tMTGa1EqzF3vh9j4jfapgieEVThzY8EDVYW28wy4=
X-Google-Smtp-Source: AGHT+IHyMkgn3/gFNE4gv4OJO59bQCoHWgHlPXJAezaplNmRkJ1y1keb/pz2mmb4jwElkz5448BGKA==
X-Received: by 2002:a2e:2e06:0:b0:2ee:8815:8b28 with SMTP id 38308e7fff4ca-2ee8edd3ec5mr24871001fa.33.1720178308668;
        Fri, 05 Jul 2024 04:18:28 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3678fe13ef4sm7369352f8f.117.2024.07.05.04.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 04:18:28 -0700 (PDT)
Message-ID: <2aa71d0f-6e4a-4056-9deb-a46526b423a9@linaro.org>
Date: Fri, 5 Jul 2024 13:18:27 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 00/22] dt-bindings: thermal: few cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2024 11:51, Krzysztof Kozlowski wrote:
> Hi,
> 
> Resending (with added tags) because patchset was still not applied.
> Daniel, can you pick it up?

Yes

> Few cleanups witout practical impact, except maybe the Amlogic schema
> (bringing required cells).
> 
> Link to v1: https://lore.kernel.org/r/20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (22):
>        dt-bindings: thermal: samsung,exynos: specify cells
>        dt-bindings: thermal: amlogic: reference thermal-sensor schema
>        dt-bindings: thermal: allwinner,sun8i-a83t-ths: reference thermal-sensor schema
>        dt-bindings: thermal: brcm,avs-ro: reference thermal-sensor schema
>        dt-bindings: thermal: generic-adc: reference thermal-sensor schema
>        dt-bindings: thermal: imx8mm: reference thermal-sensor schema
>        dt-bindings: thermal: nvidia,tegra186-bpmp: reference thermal-sensor schema
>        dt-bindings: thermal: nvidia,tegra30-tsensor: reference thermal-sensor schema
>        dt-bindings: thermal: qcom-spmi-adc-tm-hc: reference thermal-sensor schema
>        dt-bindings: thermal: qcom-spmi-adc-tm5: reference thermal-sensor schema
>        dt-bindings: thermal: qcom-tsens: reference thermal-sensor schema
>        dt-bindings: thermal: qoriq: reference thermal-sensor schema
>        dt-bindings: thermal: rcar-gen3: reference thermal-sensor schema
>        dt-bindings: thermal: rockchip: reference thermal-sensor schema
>        dt-bindings: thermal: rzg2l: reference thermal-sensor schema
>        dt-bindings: thermal: socionext,uniphier: reference thermal-sensor schema
>        dt-bindings: thermal: sprd: reference thermal-sensor schema
>        dt-bindings: thermal: st,stm32: reference thermal-sensor schema
>        dt-bindings: thermal: ti,am654: reference thermal-sensor schema
>        dt-bindings: thermal: ti,j72xx: reference thermal-sensor schema
>        dt-bindings: thermal: simplify few bindings
>        dt-bindings: thermal: cleanup examples indentation
> 
>   .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml |  6 +-
>   .../bindings/thermal/amlogic,thermal.yaml          | 22 ++---
>   .../bindings/thermal/brcm,avs-ro-thermal.yaml      | 22 ++---
>   .../devicetree/bindings/thermal/brcm,avs-tmon.yaml | 17 ++--
>   .../bindings/thermal/brcm,bcm2835-thermal.yaml     |  1 -
>   .../bindings/thermal/fsl,scu-thermal.yaml          |  1 -
>   .../bindings/thermal/generic-adc-thermal.yaml      |  5 +-
>   .../bindings/thermal/imx8mm-thermal.yaml           |  5 +-
>   .../bindings/thermal/loongson,ls2k-thermal.yaml    |  1 -
>   .../bindings/thermal/mediatek,lvts-thermal.yaml    |  1 -
>   .../bindings/thermal/nvidia,tegra124-soctherm.yaml |  1 -
>   .../thermal/nvidia,tegra186-bpmp-thermal.yaml      | 12 +--
>   .../bindings/thermal/nvidia,tegra30-tsensor.yaml   |  9 +-
>   .../bindings/thermal/qcom,spmi-temp-alarm.yaml     |  1 -
>   .../bindings/thermal/qcom-spmi-adc-tm-hc.yaml      |  8 +-
>   .../bindings/thermal/qcom-spmi-adc-tm5.yaml        |  8 +-
>   .../devicetree/bindings/thermal/qcom-tsens.yaml    | 96 ++++++++++------------
>   .../devicetree/bindings/thermal/qoriq-thermal.yaml |  5 +-
>   .../bindings/thermal/rcar-gen3-thermal.yaml        | 69 ++++++++--------
>   .../devicetree/bindings/thermal/rcar-thermal.yaml  | 60 +++++++-------
>   .../bindings/thermal/rockchip-thermal.yaml         |  5 +-
>   .../devicetree/bindings/thermal/rzg2l-thermal.yaml | 41 ++++-----
>   .../bindings/thermal/samsung,exynos-thermal.yaml   |  3 +-
>   .../thermal/socionext,uniphier-thermal.yaml        |  5 +-
>   .../devicetree/bindings/thermal/sprd-thermal.yaml  | 47 +++++------
>   .../bindings/thermal/st,stm32-thermal.yaml         |  5 +-
>   .../bindings/thermal/ti,am654-thermal.yaml         | 15 ++--
>   .../bindings/thermal/ti,j72xx-thermal.yaml         |  5 +-
>   28 files changed, 230 insertions(+), 246 deletions(-)
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
> change-id: 20240614-dt-bindings-thermal-allof-401c50e61ef2
> 
> Best regards,

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

