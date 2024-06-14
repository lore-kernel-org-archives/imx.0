Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6767819412C
	for <imx@lists.linux.dev>; Fri, 14 Jun 2024 10:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718361356; cv=none; b=gcTgCKKEUTTZfvyeNIoSjZCZUs4l5y8p67ZFxw2VNfD2FveypEKjm4EJeHUwxEdwxOfa2kZSRai8/G4UA6AwZXKxyKoAWWwlW55OYQYI7MFNr5OnV9908FfwieEnD21p0YEgR/19/HVse5GS04eqHrF2PmJmm5GMT3XdEXkzIv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718361356; c=relaxed/simple;
	bh=66n4QJTe2QoUaT86K35RhfAcMVqLfHGNaa6rF0sOxD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9dXPvVZCUEp7BodJA+7xvxrWw9SyP1DX7+WNzaAOk7WlkpN05IgASrk1rxPOquAuKcMY3V4lq1vmh+DTRrVbZGtOL8u9EqN9aAFJZ0o7cHeVDZRlXxv9ArlNGkbg2/DdSUbyw1IHxruQE/ov39MEbEQrWof3KJ/ik8fv6AG0fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ON+nHAPw; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ON+nHAPw"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebd95f136bso21619621fa.0
        for <imx@lists.linux.dev>; Fri, 14 Jun 2024 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718361352; x=1718966152; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6FMH9kgG6GLU9nGWzxsHP28rIR4BzbcGX6Cg1+tBHV0=;
        b=ON+nHAPwHyU364dTsci9WxfVji+hB/T+Ft3Q9PoMDbNvozWcoaT0SZnTvMzRx3tqON
         BmN2fkPsJ05Fs7b6l2tW953Rl2qgZAevn5KORd+hPV9seWD2JoQWh3qrVfSIHAIZwrHy
         zSgvwmn1Yl5twStF2e3k5kLPh875AaTtfqm3Tq0Lfcv2Osa8ZsODzOQb34Igkf6EFQPH
         IIix7lQRIRCD8J8mtSWTCM3l2e2OYVMWF0S8d5hNKkmZN+A4SPGV5QnTG7tu32yZfO1N
         k1XgbIXBVRBPKV2gFciq/jnDoqAgFAxThJayyBjh85kgr5OjbA8vyV6xuz4zkPc4XDt3
         ujQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718361352; x=1718966152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FMH9kgG6GLU9nGWzxsHP28rIR4BzbcGX6Cg1+tBHV0=;
        b=NKDZKO8g4PAATeW/8P2MwXDEfysSjDvyhlvFWjqbdAP94nPhxHe9affitxrzHvXtLC
         obgLgAKKYab5rz53gWq7PLNNO1OBan3VuSTmNgQgTCW5ncBe2YxA3E8LynA+zym6r68I
         kIzsce+aGJ8aLnllI6FbB5v7B751OM7/qwSPPuZcsxZM9z5W97vP52nuKnZcE4N6QYz5
         iSO6JQaMq1Q8MXlQFywXa4rgbJsSWxsnyP086QeRPC64Xs8bIiOza5Y8qLaRM/g1Rmg2
         gcGD6Mdah2lbViGyrSg6pR0FadsknKVUMLSLV4I0BxBsEWLAUzUURy/hLIzDizgCG9A4
         miAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF3VmaLEF73DKlytAcRHjyDY4cyt885hF9d2GQvz6I65xjgLe7wbg0n8gFhhCqIDFqeQdqhAxKR8ksEXfoQ/3ekUHO
X-Gm-Message-State: AOJu0Yy/KJOE2fGykuHwQ9blEa1coNKkxkAc3erJxRBy9snENRbrwZC0
	+JBoufbXoJJL39pOxtFcC1jlC3EVxcrySnNYo6jykepoLVr4fuc5v/F2TAHaaCI=
X-Google-Smtp-Source: AGHT+IEbw6LK2rPBbVuJQJBgxOhegr+TV/18ANijB4Rchh5JfiMQ1/qs7DuIZLwqd6QzWtrSJTx22Q==
X-Received: by 2002:a2e:8386:0:b0:2ea:e26d:c9ba with SMTP id 38308e7fff4ca-2ec0e5d0c09mr13495761fa.27.1718361351635;
        Fri, 14 Jun 2024 03:35:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05bf438fsm4969921fa.24.2024.06.14.03.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 03:35:51 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:35:49 +0300
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
Subject: Re: [PATCH 11/22] dt-bindings: thermal: qcom-tsens: reference
 thermal-sensor schema
Message-ID: <eesj54re2itzlcr3ctntqjued5mqucbfxuoiy64344qkzt5be7@2643dlhd4kpl>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-11-30b25a6ae24e@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-11-30b25a6ae24e@linaro.org>

On Fri, Jun 14, 2024 at 11:46:10AM GMT, Krzysztof Kozlowski wrote:
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
