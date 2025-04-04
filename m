Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BA71C862D
	for <imx@lists.linux.dev>; Fri,  4 Apr 2025 10:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762711; cv=none; b=gn1Im9uyUoH6LkN2YDyvI1fdqhwD/bF/pqDBFkMV1wqc5zyUXR+816Nz/xSHv43bbRFEcI8ZNMD2PmAuGdrwNtSmD/b+APFMkkb2tjQ2DBGgRLzjCuf97KTkYwYmlvXy0BIVEGljptBl9Ul+8uvKQ3Ac5DIubI4811LnKNyfWrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762711; c=relaxed/simple;
	bh=puo0zeWGfg/XrDDKhEtVrd4WcWPM6KhzepuNu4U2cy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fNNTpXPGz6m5g9o8YgD0PZr99VGjjEIm9nhI18U2cPgCo5oW5U5oAYOKD6P4gUIRCaWIkNwqJBZZoOBf9wW766s2/3l4GLXu5qbtW4xcrymOz9J4RVadD6nRVPkWArmPVuWKieLQ2X1B1Fr5A4UuK2/zFvyTyn9N59Y22CKfKBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jprKjSxJ; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jprKjSxJ"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ff1e375a47so19347277b3.1
        for <imx@lists.linux.dev>; Fri, 04 Apr 2025 03:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743762707; x=1744367507; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p2d7X4LZ95qskY0j6wRpuQmYie6Gy7m1icDTnjrkreI=;
        b=jprKjSxJvmRDoEWVXr8SUISCqLiVdYfdsllLEvfthnVrFz3DJBwsnhj8DhUxrRs/VL
         61Lt1t/aWKGVCG2H6xxAqw7dCOFwTTyvs5TxrF+r0bV79UaH9nOpwI12Ebi0zOj7Eqaw
         QwKGeo9nRG5e2yvnLeF/nqAZ0TcneExQwEBlJ9Fn84t22XrF6s38VQ5j2hbiOTKIzYhx
         y1YWAFYzBeCuonQPoUSSN3Klt49mxUWiZrLzOLHkFdX8t3zHxtxJZ3yP084z8VVElpxH
         QrqLBg3LTOoSbtYiWKsEfm54EpSB3CGiruV6mZ41rZ9IQPtEKVHE/+m7Z+uuvgGoTUkT
         H3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743762707; x=1744367507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2d7X4LZ95qskY0j6wRpuQmYie6Gy7m1icDTnjrkreI=;
        b=gj9TLXPwHUUqzizd06GLiS9C+dghW3al48Y7DFR9t35WZaR0FiDoZKKbZyX6gAzQAM
         RkdL5+7ccgOxMS1hjzZMaxWT7hhP9EvMPDwyrc/MZlGyjpXrIj7v9JloH2meXeKvwAZl
         shmcOVlgyxAibmBvABNgeJICMmJo31n2RrKBC2jBK6DJ5YE2Rka4hmu9s2DpDgTflG5c
         LYVhnQk0yvDwfowmyIcuSzC2AtnLS/QQ163st0G31juiuUpsNwuB5VC/WYuva/LmGaca
         Jm77RUIHskPELzznBVHSnwYMlRmqvq0RSvxkjt0QI97nofXmRYqZcjBwL8QKKdfF+TU0
         9FhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIZUc1hjfEtZoduK7Olh0KFHFAnnjzL+y4MzEPMiBy3w5jaf1a/SLdk1hF2Zc6/5A33ZQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3dJuaL8GWvx6vAsVq29j9TLXT/AflQfjtUigGldO0lo2CwRhH
	QKhwxoo3BA2r5vmWmhNtr1heWW5n3o9wPr52xfg/0irS0x0J9SZ6t1Tsv3/bV1kjWefH60TUrCu
	vPTWfISkTGUbV7EOhKbK1EZM8nv9J8u56U6n+3g==
X-Gm-Gg: ASbGnctzj1lwwvxg5DbbOfNZS4dTujJWckho4mgfpD629/XaYRGGyyiPQrDW/nPnePA
	vvkzIhhDYFOqAjvHjR5sBnj/c9Ggg6IO04QQ1oToYZo26QV4oEmBGHj6UIAkIUJSzDQRwmnwRO1
	ZQBZVqeZ9AnZTrH7FRCIyOt9VNIFOnSkJltf7IRw==
X-Google-Smtp-Source: AGHT+IHL6tNiMt83fP/8QoVhxPRtZTRBqTJ/Cw9tCME3kjDGJ0WhVAtLf3L7QrkxkDkyR8ahdAf3HNvn/ambJdKtSJE=
X-Received: by 2002:a05:690c:9a0d:b0:702:d85:5347 with SMTP id
 00721157ae682-703e16473e9mr44558927b3.36.1743762706998; Fri, 04 Apr 2025
 03:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org> <20250403-dt-cpu-schema-v1-9-076be7171a85@kernel.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-9-076be7171a85@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 4 Apr 2025 12:30:59 +0200
X-Gm-Features: AQ5f1JoO4h1zt0Jv8N6Q3VB80QU6oNypKSnO1edlCmwT1znvOfAf3BOWzm_IC6U
Message-ID: <CAPDyKFoEEp8AZ7aJ8-wwp8=n+T4gbij15oYaCNhF1Bd-E1nMbg@mail.gmail.com>
Subject: Re: [PATCH 09/19] arm: dts: qcom: sdx55/sdx65: Fix CPU power-domain-names
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Apr 2025 at 05:02, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> "rpmhpd" is not documented nor used anywhere. As the enable-method is
> "psci" use "psci" for the power-domain name.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-sdx55.dtsi | 2 +-
>  arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
> index 39530eb580ea..64d9858b4248 100644
> --- a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
> @@ -57,7 +57,7 @@ cpu0: cpu@0 {
>                         enable-method = "psci";
>                         clocks = <&apcs>;
>                         power-domains = <&rpmhpd SDX55_CX>;
> -                       power-domain-names = "rpmhpd";
> +                       power-domain-names = "psci";

As I understand it, this isn't for cpu-power-mgmt but for
cpu-performance-scaling.

I have been thinking of adding a common power-domain-name for this,
but never reached to do it. I think the last one we added was the
Airoha SoC [1] which uses "perf", which seems to be the most common
one. Still I don't see that being documented.

>                         operating-points-v2 = <&cpu_opp_table>;
>                 };
>         };
> diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
> index 6b23ee676c9e..bfd04e53c5a8 100644
> --- a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
> @@ -58,7 +58,7 @@ cpu0: cpu@0 {
>                         enable-method = "psci";
>                         clocks = <&apcs>;
>                         power-domains = <&rpmhpd SDX65_CX_AO>;
> -                       power-domain-names = "rpmhpd";
> +                       power-domain-names = "psci";

Ditto.

>                         operating-points-v2 = <&cpu_opp_table>;
>                 };
>         };
>
> --
> 2.47.2
>
>

Kind regards
Uffe

[1]
drivers/cpufreq/airoha-cpufreq.c
Documentation/devicetree/bindings/cpufreq/airoha,en7581-cpufreq.yaml
drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
