Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B6B3176F8
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 09:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295102; cv=none; b=a7qV3jtpazrnJtr9ydbRHTWsKJXlRq2DjeRjgibW40VQ6DDej1eESmRZPKKTN3FVcdlbdWuQ+kHkau6xflFcljOSXNMrj2BFahMJJeoS5YINPQO3s/YMAa7XQfi6kMBesTmI8aJ+26s08Sm63k+ktf09OumTGL+LzlrcToz5qsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295102; c=relaxed/simple;
	bh=7UftW7AxgAgJS4Mb3DiWtQZF+1LauWyB2nHqcsVo2YI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rM2wpl7sh1dxn+D2bzKZBV9XwGzs8b/JTxdphhVkk2VNMHt/qNAqTGXAtPZS/eKxh13wlnzVyQkE1G6RyC0YbzUaCu1h7Rf3ovqos0EA/jDVdCjHgdCus7yitAAP5d5Nl09cJdulTbkYmyE+zZDXlvtQXFG44I7Ri0yetu1SxS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+PUApdH; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+PUApdH"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12332910300so127704c88.0
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 01:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768295099; x=1768899899; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TF3eFYrkHc1cOZLA7Pry0zv5VjtfYubZccA+TeijqI4=;
        b=F+PUApdHyScMoeRhOeco7CD1ECxGIqhylOvnqj+fSGnkhFnrnPMlm2tqo/sTNzoppK
         AiAh6ggSLp8N2Uxz4WB4Q3s5PUSunllX71VUHAX1In7ezUjr386tlrQ/sdKyIXTDu3gU
         e5P9M1Jqzi5/fS5DrHRg8Xlz52BIp+dlAUbtQaOmuXWFT37I6HDK4sstquV+o7hPzPDW
         Gh/1hWZujQ7dhusczCaYQxIzL62xpXj2MEKGZfYv/I4dpm9LV0Zd7DR+upB+ZMPYCTRc
         94CW3XB/B45ZPuE1xNei5Co2Y5oiVbi0lzQCxxtINh0ENqbgfbTzwv+BF3yconX6M9Wv
         vMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295099; x=1768899899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TF3eFYrkHc1cOZLA7Pry0zv5VjtfYubZccA+TeijqI4=;
        b=W1QK2krL0kcPMT5dTIDsuffFafcOdHPN2xzRO1Gy7mG5sFwaPu9kh111MPfbijX7mt
         DwBJk7Rn6QaFWwkKBH4xkggK61TQdm6ndhNEmO5V++Pot2ikD4UUKM2/9pndqs8I1BPl
         Ko3wyhw+6kADKYDWLXgkQXD7YdqD42/vTmQabq5dYtCzmoniTlw8fSi9sZxJLj/hbBy4
         piaDbgG3rfbfKyTw4bxbNlTHlipc7iEwNSjW9nPcEXkqWH/WJvCUUl1ErsIuCKL+AfIq
         kviuKdDJhRzc6n3JPcsrFUig9VHPVEfpOeNJTnuHkCrKWtqGVqn9pgyy0O4Suio4apc5
         QhjA==
X-Forwarded-Encrypted: i=1; AJvYcCWL0VBv9eCcSO2gpFnKgT+pn6HzmuPhuVqiBcTM47tO3UGvvyEUk671tRbnPQ9ov8H7UJY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9WeEenc3EiBPlBePxrmIaQt7KRbOJaZkAFjaqbM89ylBVDsk8
	M3q3mNx31EeHkFldTbkRRAqATM6iDJ4GGkpi4p4ip8lbrsRkfR2/CFKU5+coZTnR9PMXMgVs7Xa
	+PbFa4B0QqSn7cg7y/xfaX0bb7+pRpQk=
X-Gm-Gg: AY/fxX6klvqdNyfRjU9XYc+OCe+znHmuQisPw+iFqsYT+sPXPi6mF5o4JYj06U1xKwi
	4Zy8beJiF5u/ROo5SW6Ss3JdUjnhHFJk4CA4+1Mst1eB7Ou49uTan+Y7DZOU1KUr+Yea4z99anY
	zb5CSzTqAZ3s+ix3b4hLNS+V6yrqOScSpA35TfCI9K9jac560klO3rEurDkiz+u5P76RXTrI904
	/vM2qyxaJj5Z/EiyH3aZMbucfWWVwbjUrjZhaIdSOl+wpcbzuCmF6kOA3ExSBzQ8JiRv5+CRkYd
	DPdYi/OE+zJpfwGGlP/azuq3lasL6nvX5kuIpQ/3UHxatQO0i4BH4skaocUXHbxMX4oC8e9huum
	M1g5gE6gRdw==
X-Google-Smtp-Source: AGHT+IH1J0toJnhizL3PbL7ktkyTfdnjpbyE1HhT2awO0xq5WfFz2zWAUDP63sX81eGbqeQTkeo9sdBX4290VLvm5yw=
X-Received: by 2002:a05:7022:248e:b0:122:33e:7545 with SMTP id
 a92af1059eb24-122033e7683mr17502402c88.6.1768295098705; Tue, 13 Jan 2026
 01:04:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com> <20260111-imx952-dts-v2-v2-9-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-9-5773fa57e89e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 11:07:28 +0200
X-Gm-Features: AZwV_Qi865ruliWjfUeM4dFbMw-2xdIzSGSLpHt9sdtKpygo1iYWiegXtWJvoTs
Message-ID: <CAEnQRZBpD67MWk7T4j6RTymGiFJNW5kAs2TMS=BxVTVs7qjUAQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] arm64: dts: imx952-evk: Add flexcan support
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 11, 2026 at 2:46=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> Add flexcan support, since flexcan1 share pins with PDM,
> default disable flexcan1.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx952-evk.dts | 45 ++++++++++++++++++++++=
++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx952-evk.dts
> index 21b951a2156414819dfb589e5e7e736e7b1fe48a..bae7b88f8229babc42952b7ab=
beb912cbefc10fd 100644
> --- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
> @@ -64,6 +64,22 @@ linux_cma: linux,cma {
>                 };
>         };
>
> +       flexcan1_phy: can-phy0 {
> +               compatible =3D "nxp,tjr1443";
> +               #phy-cells =3D <0>;
> +               max-bitrate =3D <8000000>;
> +               enable-gpios =3D <&pcal6416 6 GPIO_ACTIVE_HIGH>;
> +               standby-gpios =3D <&pcal6416 5 GPIO_ACTIVE_LOW>;
> +       };
> +
> +       flexcan2_phy: can-phy1 {
> +               compatible =3D "nxp,tjr1443";
> +               #phy-cells =3D <0>;
> +               max-bitrate =3D <8000000>;
> +               enable-gpios =3D <&i2c4_pcal6408 4 GPIO_ACTIVE_HIGH>;
> +               standby-gpios =3D <&i2c4_pcal6408 3 GPIO_ACTIVE_LOW>;
> +       };
> +
>         reg_3p3v: regulator-3p3v {
>                 compatible =3D "regulator-fixed";
>                 regulator-max-microvolt =3D <3300000>;
> @@ -108,6 +124,21 @@ reg_usb_vbus: regulator-vbus {
>
>  };
>
> +/* pin conflict with PDM */
> +&flexcan1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_flexcan1>;
> +       phys =3D <&flexcan1_phy>;
> +       status =3D "disabled";
> +};

So we add this here just for simplicity right? And then enable
flexcan1 in a separate dts?

With this,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
