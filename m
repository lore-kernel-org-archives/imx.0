Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9028288C
	for <imx@lists.linux.dev>; Thu,  5 Sep 2024 18:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725562616; cv=none; b=nxKjq5VPv6JTTwgNUjYmH2/Red5MH+dI+KMFQ+PLiIuRQJ5dU6akDdem7p5p9/gnLJhBdW0E7Pj3sHlBoTB5OSVyrxD5JTJ6DZchW5TL/90sKhkGrrDSecUEatr61YhMi2o1JyZwEXmaw3ATiTCp9in2/owSvIhL1BCYUTl4DFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725562616; c=relaxed/simple;
	bh=5Kl2tZr706GSf18Hbk3w3yTELR9WRKf0WWMV0a8g2Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPVVgyFRNsbdyVWptpwZbhiYqlka+qD3nhUeB56H6Gd7i5yUt5aTtNvMYG/FehyRdHSLwYG15zJC6ViXBhnpZZ/pRgJAnHD84fCWA8+jNv8QQ6h6TS1pylU4jDzir2K+J8pJy3SxmaaiAIfN7neVFs+MH80MmMtLW5zycJpEG28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=aRa3ZyFI; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="aRa3ZyFI"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so1522686a12.0
        for <imx@lists.linux.dev>; Thu, 05 Sep 2024 11:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1725562613; x=1726167413; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AimnlZvO4vX1o0LABlUFzAbcpYQGtu+zhlXenwh5uE=;
        b=aRa3ZyFI8AbWBQeHTTyxP1XxmY0jeC7qWPfDDH/g3k0BSIUB/ZDM/00YURDzYr6UUn
         YECPWUssGITogwqGf7AAgQU6Zru+1o6DgMjUUZPJ6vIycTE9PszSuDDIasWWvpLxOSlq
         MwI8qU/mmt0hqagVu/AGMYHUJTsxe824JA30w57wfrqa9p0LxVQT0hFKfPUfaqCrky2L
         7puPjTqWCG4DxYQNaiHcTS23ChIi9UTX8cYYO5nbri+TO81/GuuExEq2Y89+HvaI5LbT
         B/l8TuW00qt9s7Pj0IfCd/2i4wj45DmDQ69Y7rRzjkLvIgXO2HC63bHwZwC8h/zzUD1o
         bKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725562613; x=1726167413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AimnlZvO4vX1o0LABlUFzAbcpYQGtu+zhlXenwh5uE=;
        b=AHFsoVDfZ5NsQIrLC4KF2A72LsRW8kqpuepd1vxYqlrVjqlE8vJHusQ7/YC0JO/AV8
         PuccAE9s6guEfZBGgnX39eh6WEysji+y9R+zcZTXxKNi9ANgtc6Zf8QGt6hwktfOGn/p
         ukDxSws8atPPVNL1LkOSTMlgWVyjQ4EwYYcAtURJ/Ir/sCS8jkDaFExmAVVNlSWgSMj3
         ZRrp5v0plcjDA/0Psdq6Fl7xXB4sv5dOjAgQB7lvtq0tiHJmunzwgxIvzbxEzcdcC7W9
         DaFgvJaQGbT1oQT7C84kdEel0cXQTopp92xOip3+nM/bpF9vmN7Y91Oth0/a/hDKPUyz
         1HfA==
X-Forwarded-Encrypted: i=1; AJvYcCUWqkkrnspfN+RixjUfxJNWsE9Js5gZi4gHuoqR70qXz0FT4gGRwjGz7Oa+OZFJpvyPElk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOFdDT/VyZG3GpkoVB+iBsxgU72p7qTKdF9rlXISCWBAvexkRp
	1zWunkrLIxcRjOje5oBCJS91iMhuw5GgJJNVCOBETxzqtFlBWgzVBz7v0dpL2PaP4BY5G/Len8l
	L/Q6wpOvbZjOJ/hYOa93skCANM7LbfVDfZAv8zw==
X-Google-Smtp-Source: AGHT+IGdoYNXI+zkFvkIv/Pf0iKRQ0TdFYopTZLghqtcSzK7K7EJ5wlRtOTdvPGPRBWz6UTGgTXgE416ziaIjjvKK9Y=
X-Received: by 2002:a17:907:2da5:b0:a86:9cff:6798 with SMTP id
 a640c23a62f3a-a8a32ed4b43mr754624966b.30.1725562612865; Thu, 05 Sep 2024
 11:56:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240807-fsl_dts_warning-v2-0-89e08c38831a@nxp.com> <20240807-fsl_dts_warning-v2-3-89e08c38831a@nxp.com>
In-Reply-To: <20240807-fsl_dts_warning-v2-3-89e08c38831a@nxp.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 5 Sep 2024 11:56:41 -0700
Message-ID: <CAJ+vNU3ZsJG-eoqf3JcHTyDwjp4uOW1XiEhnOfWZ1FJ-q1Y9Hw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: imx8mm-venice-gw7901: add
 #address(size)-cells for gsc@20
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 7:54=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> Add #address-cells and #size-cells for gsc@20 to fix below warning:
> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: gsc@20: '#address=
-cells' is a required propert
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts b/arc=
h/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
> index 136cb30df03a6..35ae0faa815bc 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
> @@ -364,6 +364,8 @@ gsc: gsc@20 {
>                 interrupts =3D <16 IRQ_TYPE_EDGE_FALLING>;
>                 interrupt-controller;
>                 #interrupt-cells =3D <1>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
>
>                 adc {
>                         compatible =3D "gw,gsc-adc";
>
> --
> 2.34.1
>
>

Hi Frank,

I just noticed this patch (along with a few others to
imx8m*venice*dts* which undoes what was done in commit 3343ab4cc698
"arm64: dts: freescale: imx8m*-venice-*: fix gw,gsc dt-schema
warnings" which my commit message states: Fix the dt-schema warnings
due to #address-cells/#size-cells being unnecessary when there are no
children with reg cells.

With your patch applied I now see warnings again:
$ touch arch/arm64/boot/dts/freescale/imx8m*venice*.dts*; make dtbs W=3D1
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb
arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts:361.14-467.4:
Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@3
0a20000/gsc@20: unnecessary #address-cells/#size-cells without
"ranges", "dma-ranges" or child "reg" property
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb
arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts:311.14-418.4:
Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@3
0a20000/gsc@20: unnecessary #address-cells/#size-cells without
"ranges", "dma-ranges" or child "reg" property
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb
arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts:277.14-364.4:
Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@3
0a20000/gsc@20: unnecessary #address-cells/#size-cells without
"ranges", "dma-ranges" or child "reg" property
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb
arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts:330.14-411.4:
Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@3
0a20000/gsc@20: unnecessary #address-cells/#size-cells without
"ranges", "dma-ranges" or child "reg" property
  DTC     arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts:309.14-416.4:
Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@3
0a20000/gsc@20: unnecessary #address-cells/#size-cells without
"ranges", "dma-ranges" or child "reg" property
arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning
(graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: grap
h node has single child node 'port@0', #address-cells/#size-cells are
not necessary
  DTC     arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtbo
  DTOVL   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtbo
  DTOVL   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.d=
tbo
  DTOVL   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.d=
tb
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtbo
  DTOVL   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtbo
  DTOVL   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtbo
  DTOVL   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtbo
  DTOVL   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.d=
tbo
  DTOVL   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.d=
tb
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtbo
  DTOVL   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtbo
  DTOVL   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtbo
  DTOVL   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtbo
  DTOVL   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb

Is this some case of dueling dt-schema checks for dtb checks?

Best Regards,

Tim
