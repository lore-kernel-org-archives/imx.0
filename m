Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD45194A52
	for <imx@lists.linux.dev>; Fri, 14 Jun 2024 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718361340; cv=none; b=VQmWs7ZLo5LyqLZdCfCFqS6lk6J1i28EUol9GOd5Q0rOhGRR4icAeAvKCJs789pfoNjYfz+KckS02OArLkgKYpbHrA//1++/vkYT+tSgCtIGgfsc1JLj7Eo+DuVDDqXQJHbA4pT0dKXtEKwm7Y1Xm2fugQhWEA2upawWXWczGT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718361340; c=relaxed/simple;
	bh=EiAyf1ePwV9uZg8YD0veGEI6NqoYhzoV0Z0ltj6RhI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=np9x1dDyGtsoXmX/lI1gyqBSZ0qXE+zlLPc/6DK+O+wEKne2iaASWZl09fUbwS+PJXwmXO1kxNimXTont1mZmHy74TpvsrYFKNxrri4HlZ8y9eObTJE11gwFVThEHzj2aYud8s67iWM6SssU6ZRIY7PludAmqQMPXZgmh0WtMac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=luMZyLXb; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="luMZyLXb"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52caebc6137so225449e87.0
        for <imx@lists.linux.dev>; Fri, 14 Jun 2024 03:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718361335; x=1718966135; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aGAN2NxY+2dqaICcDThn1Gl9L9GbHbJmWxV3worL+eg=;
        b=luMZyLXbGA0V+aZz5Cfh3lXF6HyqajWNRGur5tJE1O6O5RAjTJSl8n/eXp5QpNY9qy
         HwbCkfIOUx5+YfltlKV6Qhxw6jhdz6pLhESKmi4ogENAk1sqZYEIrT5O9MvpNt8pW2ta
         ru1nebkGwQ7/dSclgjcvJuSOe9tGabr8LA1TpVXT1FiRXQY1dUivHSRsE2va3r2bfH/4
         fKLMiKha2IzJqPaDl/Mqkr0FNLbRID3fBF41INCTHBU+jdE7EO0Sq5irT4/rg3Z/pzl9
         rx4/FrzLXWsMDqc7ZHnJNx6vOl+nzk4QpMtagpP/dWBr5eGt7pzmpkzh8dMPhMuFquyp
         0b5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718361335; x=1718966135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGAN2NxY+2dqaICcDThn1Gl9L9GbHbJmWxV3worL+eg=;
        b=YOeIjJ/dh9ImvftLEEDKig21vIEWQGug2t4Y3o/jGWibnTVVnASqMPrnpwq1Vv2Uvn
         E/aKC2xy57p4u4gqbRLKleFKknuC50QBraOUtNJm/VJ84IbAS2DTVy5Dk2LGN114euRM
         xG7chxz6miV/DdKgcoMDQDlTZUYb1gpVvpd6ps1J3mPDbQPuY7jd+o0z1GTqi584+yGm
         7tZ7iMRX/7x2LtJyWTIqn20ruRRZXe+c8mIpmauYnDRpUYDLliSLlN/HR07ucCeDkRup
         ECkWSHFnC+OeQiQYJVT5DoOzM/BmDG+mUrn6Yyut58IDsRxKaYVUCAkLh+CtRKRIs/3A
         WEBw==
X-Forwarded-Encrypted: i=1; AJvYcCW9tGtoKzzjkmmWD7gs029oKiw8dLR/zbgyWWmuTVP3TtAD/C2Dtw3+MqgVrBS8wzoWWUSnQTvgCBIJcQS62t8IlqBN
X-Gm-Message-State: AOJu0YyDeGDbOP2WIie+XJVC4Jh3wMc+uw81Ujl+5QnYH2Mja4cAs52L
	vq+7Hi/TxH6CxON5B5H5/qHR5L2+VpRBcpp0qrGngYLDr96U3QCtm9tpsKg5zk0=
X-Google-Smtp-Source: AGHT+IG9296cngTsNvss2HWOM7KAlI/jj4Qy+Im6Q+mlyoACYXVlropKfCXjXHH3MK5suUqtTVw77g==
X-Received: by 2002:a19:f809:0:b0:52c:89ff:10bf with SMTP id 2adb3069b0e04-52ca6e999e7mr1289070e87.67.1718361335571;
        Fri, 14 Jun 2024 03:35:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2888363sm467688e87.278.2024.06.14.03.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 03:35:35 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:35:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Guillaume La Roque <glaroque@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Anson Huang <Anson.Huang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Amit Kucheria <amitk@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Heiko Stuebner <heiko@sntech.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Pascal Paillet <p.paillet@foss.st.com>, 
	Keerthy <j-keerthy@ti.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, zhanghongchen <zhanghongchen@loongson.cn>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 10/22] dt-bindings: thermal: qcom-spmi-adc-tm5: reference
 thermal-sensor schema
Message-ID: <os5vrqh7usscb2lmvwpzcea3uu2k2gbhhbfolwgoc7mc2tdjah@pt5ckx2gbfo7>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-10-30b25a6ae24e@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-10-30b25a6ae24e@linaro.org>

On Fri, Jun 14, 2024 at 11:46:09AM GMT, Krzysztof Kozlowski wrote:
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
