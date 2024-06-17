Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666B1176AD3;
	Mon, 17 Jun 2024 02:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718591796; cv=none; b=sDW3dl1wnXI6CVA24EhKu1Gfqq0DHGwbcLtYAKciaCrqgogBugENfI/Gt73wkNnUb+lYSIzP/EpBxCSddDhnI3UGLlNJ1qnldN6u34BQahnxLI2GpcvhWXv2NnRxEqpB3M8YM0xezFH1A3RG8dTea6WNPtTFSOKefRiINqoYppk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718591796; c=relaxed/simple;
	bh=lczObmd9t5CNOLsW1w8BAFRVJ0CtUEDoyScV7EOYG6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kDvdOEQgCSp2S1RGhfRLVVNms+kfnku7e01XNzbvX6oi1SyTBMM2mAO45qh0BRGHPPApa23z6MbRq06n2gjE0XCqQ1v0O2bcvc9UBaFhpxARUbzTlnAfZgmnF46YCXOas1YWMilPAnZztJP2sWeQy/r+sBfwdXwCC2jrEeIf5Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlZmhXu/; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlZmhXu/"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-250aa23752dso416610fac.3;
        Sun, 16 Jun 2024 19:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718591794; x=1719196594; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3S2YurUrl5MC+fkMuKFY0ClzSCLEfz1Oc40ER8vtAUk=;
        b=MlZmhXu/3EWsZwlv+ZFUw3yCe3GOHdiDzt4rELnxT/T4Z5+lhZHF+TnOmIyFWCIJ51
         WTWs96iD7WMfoPcOkbWXoKBXLwib1DoP3NWRKWjBfO/P6EfzGm4kWXWYFQr9XZllCoyD
         A2tvGLAmT9vsy8GfoaKxFxL8f1Lb8q64MInhRivMM/mkOTygIdejXtGLo1bKaicO7+ax
         jHbLVheHV/6/BHvqpv02nqa6k6rtKcTivJ84X0FFxOpyKS/N9mRoJT/HpPF+SHvuQs/4
         I2W9NUp2fuhnVW0Ae5L0zrT5mfMKsq2MQ5sOYE3W9o+kyq2Cgi3g5NQ9IiA3w6Wg37BF
         4N/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718591794; x=1719196594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3S2YurUrl5MC+fkMuKFY0ClzSCLEfz1Oc40ER8vtAUk=;
        b=meG4gk4ovmROauLINmNPaI+xz8gvYjg8Aa2I9lCQVSDFwHHO1hzGVKruZAByUCrbDk
         xsdTq1n1fSbdIYyR+j1eG1JuC7XiS5JodXlZEe0byUGHsLvDgYt50OVOqYULCJqR9aru
         +bjtNqhBrDkWTD0xBRZf719E8sCckNaj2kvuJJddxOiEafwk7i0wP7QCDBXOuTFaO3hr
         fonzxlho0043bteUcmC6wNP1ey+TelE8bvqmdFGgQGmosRQImfXx0oM1pUOfTQtMRtJy
         J9jJEWTSq+tEfkoc/jPfTHjvvfahGmw2KwdlxSvah7XzACbTz59dR2jE7NBuA6rSp1hQ
         CYOA==
X-Forwarded-Encrypted: i=1; AJvYcCUokHERd8XpvQjcXPJftRQfl5VV1qdJLJdThs4jN+hVuNK/Rn2eYlvr9yahACztozlH1ACsJgIPgJjKfR1t8M+DKnmEOE5QGfbDIJ7uau/6tn2z3+ATd+eB1ytAtRMf6Vs=
X-Gm-Message-State: AOJu0Yy9Obbakosbe9X37keLfbJdEw0pNcyG/PpUD3l7P2ZQwwRMR6My
	e0CL3cgJTJt8AWqiLrzJdr/inegn+GhiS+pvYqxVCyMw01oH76GSKvbe8jdQbv8eVuElIadI18T
	sgB837TuQ783KulPAXv6jRII6cik=
X-Google-Smtp-Source: AGHT+IGltFa0bQ5GCz9R8Qfp8q4AWMyO+O31iG05ayKCR1g5p5BB0jiP/wIlvjmzI8GEc+sBuDPZkWfe/0K++X8dom4=
X-Received: by 2002:a05:6870:469f:b0:254:d417:351f with SMTP id
 586e51a60fabf-258429511admr9266807fac.1.1718591794255; Sun, 16 Jun 2024
 19:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org> <20240614-dt-bindings-thermal-allof-v1-3-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-3-30b25a6ae24e@linaro.org>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sun, 16 Jun 2024 19:36:08 -0700
Message-ID: <CA+E=qVdpw5dMSdZiBkX5i6y18vHzfG2JnBSmd2Rq=y4kkgZLQw@mail.gmail.com>
Subject: Re: [PATCH 03/22] dt-bindings: thermal: allwinner,sun8i-a83t-ths:
 reference thermal-sensor schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Guillaume La Roque <glaroque@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Anson Huang <Anson.Huang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	zhanghongchen <zhanghongchen@loongson.cn>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-rpi-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 2:46=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>

> ---
>  .../devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml       | 6 =
+++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a8=
3t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83=
t-ths.yaml
> index 6b3aea6d73b0..dad8de900495 100644
> --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.=
yaml
> +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.=
yaml
> @@ -10,6 +10,8 @@ maintainers:
>    - Vasily Khoruzhick <anarsoul@gmail.com>
>    - Yangtao Li <tiny.windzz@gmail.com>
>
> +$ref: thermal-sensor.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -55,7 +57,6 @@ properties:
>      maxItems: 1
>      description: phandle to device controlling temperate offset SYS_CFG =
register
>
> -  # See Documentation/devicetree/bindings/thermal/thermal-sensor.yaml fo=
r details
>    "#thermal-sensor-cells":
>      enum:
>        - 0
> @@ -135,9 +136,8 @@ required:
>    - compatible
>    - reg
>    - interrupts
> -  - '#thermal-sensor-cells'
>
> -additionalProperties: false
> +unevaluatedProperties: false
>
>  examples:
>    - |
>
> --
> 2.43.0
>
