Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCB91A840D;
	Wed, 11 Dec 2024 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733910556; cv=none; b=KuQlCVcfmzb8E+49wS8iMXeebc2Q+xS1vZaZADkfqwzMQLy/jthXxiwBNIDzSjSnjTKjvigj2o8T33LrlHPjJDopjoadGUA+cwpbzLZJJBcSwiLy0tLRCBldIIleLNaOW8TxE5K4/cJZ2YBwH9LjzpLCAPSTjqfgLZN8/CnASsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733910556; c=relaxed/simple;
	bh=ZUQ2IJvBnojUTDcKcS+ybMxTwUjg3Lso5sEdHoLrj/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+ZcvRgVfARhyO77wygLUQasQ844jtSULWIH7tBHGFLuEMtaqgCQCmIIFD2Pz/zgP65sw/t47pSWwvXXI3z23qiQBetBeAP10mzfqXIr9vfyFey7H9CBg8HrS9I4tlciR047FWITxcr8ZiANt/KvpkZOH3LM82XeehldJhxwcaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-300392cc4caso43217941fa.3;
        Wed, 11 Dec 2024 01:49:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733910549; x=1734515349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hPj/BPEUjCTbTNbQyMrIM316Wmjv6S1W3Jo0zGaEmZ4=;
        b=Xj4aBXjESYoKF/tyYh9Ep2Ur0kAlVk86h3qT5PC/Cqb1TBxwABPDMsCGNfGpBMXFha
         82ANkcqXJvOgttgIXsIJ9HkQZ21S/45dvRBU+k3gQVWhxhFJe+dcsAPJbXRajFcVUeSD
         8T85wTcGLNAL82AkkotM0dpnqEH4bQJesuFcPBTmoqe0JE9lQDU1d9BxCZIvaIkYMj3g
         VClutkg4G/t2mDrWtI51nOhkua3g4K6gweY9Uo236Bdc0tijEnAzXQWI+XZbo6raSdEg
         SetRddA8dg2+OokmlHgi52LCD2EBVhD1+TBx5DYuaHnKnXg5FCKYfYStksq1LXTKdV/m
         c3+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxDCdVnW52jFKwcUUVAq6Y7OyIHd+HCvv6h7T9OlSRNfZsQmh+puBVEpgmNQCvqJjqzaYlN0CRf+smvG8=@lists.linux.dev, AJvYcCXlYnPl2tuD+4KNW2PpQmK5kLntloav3tWu7LJFpdxh3PPpl+Svstf8Zc4Ch3ZLrFGaM9Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5+H4gwtzh00jgxwgbXLLrADfv/n/WRpciwXmGNxWBOlvDZCBY
	MTvSjrdfy+txz5lmDlOlBnrMtBut6e5AKiTCsOKI6dq+/gj0mw+TrEdGobFQ
X-Gm-Gg: ASbGncsXnG9vFAnC3pl5vTvViahg8sHySwbd7hFv+iGf1JamyaVw0ENdEA2hDKcuL9T
	mLluQ2SjAcfz75ZqeXe6U37E5Y0DcZvEHNaTbju/ewb4j9T+miphIn7tbGjrA3SD3z4T6GCrar3
	8Q+4WxSHQmy41m9T4LJWt9vyel6RCfaoj4BiOwyJZOKeTRWWR2rpUfttBVat+UhwhHB9orYSDqP
	XpWCt2jJzUzpWcwQCObYE+PEqoBAeDr1f7/Yzv1n376TC3kADA+NAsqzbZueJcw9cvl8toaO4Lf
	yIgbq65JZ10=
X-Google-Smtp-Source: AGHT+IF8TtzZxR/0otGjtXIgNoxebnVdF+TN8b+nAtf2Y6wiq2xBKdgGwirRNrtMOr3nNU7MeuMUIQ==
X-Received: by 2002:a2e:a9a3:0:b0:302:34d6:eeea with SMTP id 38308e7fff4ca-30240ca0c86mr7644771fa.3.1733910549082;
        Wed, 11 Dec 2024 01:49:09 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3003d71105bsm14221751fa.39.2024.12.11.01.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 01:49:07 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-300392cc4caso43217341fa.3;
        Wed, 11 Dec 2024 01:49:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXp4ehnxTDiKqWUIMSZZ6rFqOYB39rK+Y/ihZhVrwyUXqEq/I+izDvO8ujB8imUfuZ8t0=@lists.linux.dev, AJvYcCWhdVk8t4Zc6mgruAkqBX0e94KwGJVJy8Wnl2dR+IXhWmVNMyTVaSUWSCWmum5Esvm0gD51/Hr2Gy/gnYI=@lists.linux.dev
X-Received: by 2002:a05:651c:556:b0:300:3a15:8f1f with SMTP id
 38308e7fff4ca-30240d5d82amr7824591fa.32.1733910547069; Wed, 11 Dec 2024
 01:49:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241211092509.34342-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241211092509.34342-1-krzysztof.kozlowski@linaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 11 Dec 2024 17:48:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v64bGgum7L2Fcg=FBru7ousCJgSyew7kr7VvYhM+ok_dKA@mail.gmail.com>
Message-ID: <CAGb2v64bGgum7L2Fcg=FBru7ousCJgSyew7kr7VvYhM+ok_dKA@mail.gmail.com>
Subject: Re: [RESEND PATCH] media: dt-bindings: trivial white-space and
 example cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ming Qian <ming.qian@nxp.com>, 
	Zhou Peng <eagle.zhou@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>, Shijie Qin <shijie.qin@nxp.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Emil Velikov <emil.velikov@collabora.com>, 
	Del Regno <angelogioacchino.delregno@somainline.org>, 
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 5:25=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Minor cleanups without funcitonal impact:
>  - There should not be an empty blank line after SPDX tag,
>  - Convention is to indent DTS examples in coding style with 2- or
>    4-space indentation (4 is preferred),
>  - Drop unused labels in DTS examples.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Resending second time, because I missed previous Rob's review.
>
> I added now also Bryan's and Heiko's reviews from last resend.
> ---
>  .../media/allwinner,sun50i-h6-vpu-g2.yaml     |  1 -

FWIW,

Acked-by: Chen-Yu Tsai <wens@csie.org>

>  .../bindings/media/amlogic,meson-ir-tx.yaml   |  1 -
>  .../bindings/media/amphion,vpu.yaml           |  1 -
>  .../bindings/media/fsl,imx6ull-pxp.yaml       |  1 -
>  .../media/mediatek,vcodec-decoder.yaml        |  1 -
>  .../media/mediatek,vcodec-encoder.yaml        |  1 -
>  .../media/mediatek,vcodec-subdev-decoder.yaml |  1 -
>  .../media/microchip,sama5d4-vdec.yaml         | 17 ++++----
>  .../bindings/media/nxp,imx8mq-vpu.yaml        | 41 +++++++++----------
>  .../bindings/media/qcom,msm8916-camss.yaml    |  1 -
>  .../bindings/media/qcom,msm8996-camss.yaml    |  1 -
>  .../bindings/media/qcom,sdm660-camss.yaml     |  1 -
>  .../bindings/media/qcom,sdm845-camss.yaml     |  1 -
>  .../bindings/media/qcom,sm8250-camss.yaml     |  1 -
>  .../bindings/media/rockchip,rk3568-vepu.yaml  |  1 -
>  .../bindings/media/rockchip-vpu.yaml          | 29 +++++++------
>  16 files changed, 42 insertions(+), 58 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-=
vpu-g2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-v=
pu-g2.yaml
> index a4f06bbdfe49..8ba5177ac631 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.=
yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.=
yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/allwinner,sun50i-h6-vpu-g2.yaml=
#
> diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.=
yaml b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
> index 377acce93423..6da8a6aded23 100644
> --- a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
> +++ b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/amlogic,meson-ir-tx.yaml#
> diff --git a/Documentation/devicetree/bindings/media/amphion,vpu.yaml b/D=
ocumentation/devicetree/bindings/media/amphion,vpu.yaml
> index 9801de3ed84e..5a920d9e78c7 100644
> --- a/Documentation/devicetree/bindings/media/amphion,vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/amphion,vpu.yaml#
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml=
 b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> index 84a5e894ace4..3f47744459aa 100644
> --- a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> +++ b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/fsl,imx6ull-pxp.yaml#
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-deco=
der.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.=
yaml
> index b401c67e3ba0..d726d141a434 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yam=
l
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yam=
l
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-enco=
der.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.=
yaml
> index b45743d0a9ec..110e8f5f1f9e 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yam=
l
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yam=
l
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subd=
ev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-s=
ubdev-decoder.yaml
> index a500a585c692..5865e6f0be89 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.=
yaml#
> diff --git a/Documentation/devicetree/bindings/media/microchip,sama5d4-vd=
ec.yaml b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.ya=
ml
> index 59b805ca47c5..ede086d55add 100644
> --- a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/microchip,sama5d4-vdec.yaml#
> @@ -36,12 +35,12 @@ additionalProperties: false
>
>  examples:
>    - |
> -        #include <dt-bindings/clock/at91.h>
> -        #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
>
> -        vdec0: vdec@300000 {
> -                compatible =3D "microchip,sama5d4-vdec";
> -                reg =3D <0x00300000 0x100000>;
> -                interrupts =3D <19 IRQ_TYPE_LEVEL_HIGH 4>;
> -                clocks =3D <&pmc PMC_TYPE_PERIPHERAL 19>;
> -        };
> +    vdec@300000 {
> +        compatible =3D "microchip,sama5d4-vdec";
> +        reg =3D <0x00300000 0x100000>;
> +        interrupts =3D <19 IRQ_TYPE_LEVEL_HIGH 4>;
> +        clocks =3D <&pmc PMC_TYPE_PERIPHERAL 19>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml =
b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> index 3d58f02b0c5d..19528262810a 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/nxp,imx8mq-vpu.yaml#
> @@ -44,26 +43,26 @@ additionalProperties: false
>
>  examples:
>    - |
> -        #include <dt-bindings/clock/imx8mq-clock.h>
> -        #include <dt-bindings/power/imx8mq-power.h>
> -        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/power/imx8mq-power.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>
> -        vpu_g1: video-codec@38300000 {
> -                compatible =3D "nxp,imx8mq-vpu-g1";
> -                reg =3D <0x38300000 0x10000>;
> -                interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> -                clocks =3D <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
> -                power-domains =3D <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
> -        };
> +    video-codec@38300000 {
> +        compatible =3D "nxp,imx8mq-vpu-g1";
> +        reg =3D <0x38300000 0x10000>;
> +        interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
> +        power-domains =3D <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
> +    };
>    - |
> -        #include <dt-bindings/clock/imx8mq-clock.h>
> -        #include <dt-bindings/power/imx8mq-power.h>
> -        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/power/imx8mq-power.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>
> -        vpu_g2: video-codec@38300000 {
> -                compatible =3D "nxp,imx8mq-vpu-g2";
> -                reg =3D <0x38310000 0x10000>;
> -                interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> -                clocks =3D <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
> -                power-domains =3D <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
> -        };
> +    video-codec@38300000 {
> +        compatible =3D "nxp,imx8mq-vpu-g2";
> +        reg =3D <0x38310000 0x10000>;
> +        interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
> +        power-domains =3D <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.y=
aml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> index 9cc0a968a401..3469a43f00d4 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/qcom,msm8916-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.y=
aml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> index 5cb0e337ea6e..644646de338a 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/qcom,msm8996-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> index 584106e275f6..68d8670557f5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/qcom,sdm660-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> index d32daaef1b50..289494f561e5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/qcom,sdm845-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index 06db2c1e6079..a372d991e652 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu=
.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
> index 947ad699cc5e..d246f5d38427 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/rockchip,rk3568-vepu.yaml#
> diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/=
Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> index 719aeb2dc593..8c2501634080 100644
> --- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
> @@ -92,18 +91,18 @@ additionalProperties: false
>
>  examples:
>    - |
> -        #include <dt-bindings/clock/rk3288-cru.h>
> -        #include <dt-bindings/interrupt-controller/arm-gic.h>
> -        #include <dt-bindings/power/rk3288-power.h>
> +    #include <dt-bindings/clock/rk3288-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/rk3288-power.h>
>
> -        vpu: video-codec@ff9a0000 {
> -                compatible =3D "rockchip,rk3288-vpu";
> -                reg =3D <0xff9a0000 0x800>;
> -                interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> -                             <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> -                interrupt-names =3D "vepu", "vdpu";
> -                clocks =3D <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
> -                clock-names =3D "aclk", "hclk";
> -                power-domains =3D <&power RK3288_PD_VIDEO>;
> -                iommus =3D <&vpu_mmu>;
> -        };
> +    video-codec@ff9a0000 {
> +        compatible =3D "rockchip,rk3288-vpu";
> +        reg =3D <0xff9a0000 0x800>;
> +        interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names =3D "vepu", "vdpu";
> +        clocks =3D <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
> +        clock-names =3D "aclk", "hclk";
> +        power-domains =3D <&power RK3288_PD_VIDEO>;
> +        iommus =3D <&vpu_mmu>;
> +    };
> --
> 2.43.0
>
>
