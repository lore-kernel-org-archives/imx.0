Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C23322B
	for <imx@lists.linux.dev>; Wed, 28 May 2025 02:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748400041; cv=none; b=KKgV4jSoa16/hZlpt1rznljS4xQw6oWucAZRm7SxDXf+k3e+Y1mVlqDEKA8sJbRehhzurHk29hD+tg1JH1fc8ctSHIXfm64JACYHwHWoBVzbSruPqNwlHybzEdd/YPqbTNnfgbyIkzf5Rmdgf8JUJFiZohbz1QAyH6yqfRy4i98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748400041; c=relaxed/simple;
	bh=xeew4UJ9cUvyxRfAk3dWvxm1O9LehVnmfgtli5kLkLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJw5bChuwsmG2yiyWa/22OP48NfUp9qY1P8RY7VEPLU47W5iSHsyPNyNK1zWOpvej7L7T26573jcy8DphG6ZwWOAu1G5YRDxTStWivorqRaI3Gn0+9Mz5NxGA6sslXSdK6/3Z/pnuYid7ebsaYiTZBDiXakSCTLvYzqP++2FBbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiEsMW0A; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiEsMW0A"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso149090a91.0
        for <imx@lists.linux.dev>; Tue, 27 May 2025 19:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748400039; x=1749004839; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QVCrwFga7VCzG3Y0sAuFXlGZgCRKGevrmncrDPwjQQ=;
        b=PiEsMW0AXowkz9beKTjH3XLCSV5DzGY8sRjskiKCYYPbFlTU8HIvDrA+HDsqvG/Qki
         yyWhMRNY2MUEaJW897ZSiGqJpUgIa6Qup4+0pz9yHXGdAbXCt2ckF4Pk1XMKHr0RMM8s
         cvCLjrQCOQbXu7ZNFnDQlyYDpkU/RMg1lt3OZlR765mV6kIDtQn1yh004DwkxdFUKYF0
         U9vTmm2D2jZbHC+tZofBcLbH2BvyiAQwutzWu6riL3kJ3WUn/dNLPNo6CxzZL4jKpO5E
         LvTc1fz2An75Mqtzz7CWrcui+Om4+tTJbWaMg1tplp/xjUpncIjuKfAjU0piRhC9nDoL
         wC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748400039; x=1749004839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QVCrwFga7VCzG3Y0sAuFXlGZgCRKGevrmncrDPwjQQ=;
        b=n+b/V7x8LVgXUVWR95+wJkIVUkRUP5hsMN/nfhARjchCUFL2zlI8x0DXuEmwxi8nsr
         H/brg91j0nIxIjWJVeR+oEz/L4E8KM0qscidxW14uQqYPNBADLGbgOE28uxclHqbhqQa
         V+hRO7+9kSGGTlFiMSc3f5fVj1fkVQUMKcG+6R8mt0QOcO18C4U5+Ir96wQrheHbuxFM
         8k2htWiuoI3YJG0/Jm+4YVdOvQ7cWk3o4x1CspgzLXIdMSp4vbd3xXEpC6i2B28vUgnU
         zlLFFZmLh3UtrHkjWwc0s6qjUHrA6TqAAy5mA6CwnJhz+bZGf4sQtQxLxXsL8cZh3CEy
         jU/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnz8zj2awGJLI4B18Z+YSGsNjchMMfhmv6NGqsYc0paKZ2Q+WgD9cj1FMwc84FXPXoLxg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgFmCPtprcCr7Vb4p0629joC95BBIh72duFZfS2369PeNUYIU/
	QJbzwX6G6ujNEjAY4vexOYSPI7qAdmxMDmXH/QuSrB+2MPE0i4Fa67hhcVrcF5qv6+83H62qpcB
	9c0XuUib7Ljt8HW3ab2NawEKJEUEG6Nk=
X-Gm-Gg: ASbGnct8GiPhy9hvXeaTUIFvRIXu7duGSlKQnpjY+VHj0Z1iHB2InssfqopXGgRvAuK
	5bFUobLop7nitgr5E7cECpKQCaoPFJe8c/I7ESVfDLRm3Pb2ulyQyy8wCHsYlIHIDO75aHCcYA8
	ZLr4mBUM+6HoW9aIWIIuiLjV8472SnreWy
X-Google-Smtp-Source: AGHT+IHRMZo43pEeAtLI78ACPEQsq81r4IdJpe7xwrqhoPqeVeSetdh3kIm1Bu4kbG/AqnuQglUbFQNYsL16HqS/f2o=
X-Received: by 2002:a17:90b:350f:b0:311:b3e7:fb3c with SMTP id
 98e67ed59e1d1-311e7470ad2mr865718a91.31.1748400038884; Tue, 27 May 2025
 19:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502150513.4169098-1-m.felsch@pengutronix.de> <20250502150513.4169098-6-m.felsch@pengutronix.de>
In-Reply-To: <20250502150513.4169098-6-m.felsch@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 27 May 2025 21:40:27 -0500
X-Gm-Features: AX0GCFtDk6wBi6zhuoVYcuypl9PXHMAr0D_EC9JmX8PK8nOKUAJQE21kF0uG_U0
Message-ID: <CAHCN7x+KiZKwN6hHji38xqid8A-wLVSFgqrbx0jkj+KyjvuKhg@mail.gmail.com>
Subject: Re: [RFC PATCH 05/11] arm64: dts: imx8mp: drop gpcv2 vpu
 power-domains and clocks
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, paulk@sys-base.io, 
	hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	sebastian.fricke@collabora.com, ming.qian@nxp.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 10:10=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> The GPCv2 G1, G2 and VC8000E power-domain don't need to reference the
> VPUMIX power-domain nor their module clocks since the power and reset
> handling is done by the VPUMIX blkctrl driver.
>
Using fluster, I wanted to test this.  I didn't test fluster before this:

./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
Ran 57/61 tests successfully               in 7.059 secs

./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
Ran 129/135 tests successfully               in 45.741 secs

Both of these outperformed the tests I ran a while ago on the imx8mm
running at 600MHz.  I haven't updated my clocks to run at overdrive
rates yet, but if you want, I could help with that.  Either way, I
think you could push submit patch as a stand-alone or with some clock
updates even before the adding the encoder stuff.

Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit

> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index e0d3b8cba221..cf9b6c487bd5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -879,24 +879,17 @@ pgc_mediamix: power-domain@10 {
>
>                                         pgc_vpu_g1: power-domain@11 {
>                                                 #power-domain-cells =3D <=
0>;
> -                                               power-domains =3D <&pgc_v=
pumix>;
>                                                 reg =3D <IMX8MP_POWER_DOM=
AIN_VPU_G1>;
> -                                               clocks =3D <&clk IMX8MP_C=
LK_VPU_G1_ROOT>;
>                                         };
>
>                                         pgc_vpu_g2: power-domain@12 {
>                                                 #power-domain-cells =3D <=
0>;
> -                                               power-domains =3D <&pgc_v=
pumix>;
>                                                 reg =3D <IMX8MP_POWER_DOM=
AIN_VPU_G2>;
> -                                               clocks =3D <&clk IMX8MP_C=
LK_VPU_G2_ROOT>;
> -
>                                         };
>
>                                         pgc_vpu_vc8000e: power-domain@13 =
{
>                                                 #power-domain-cells =3D <=
0>;
> -                                               power-domains =3D <&pgc_v=
pumix>;
>                                                 reg =3D <IMX8MP_POWER_DOM=
AIN_VPU_VC8000E>;
> -                                               clocks =3D <&clk IMX8MP_C=
LK_VPU_VC8KE_ROOT>;
>                                         };
>
>                                         pgc_hdmimix: power-domain@14 {
> --
> 2.39.5
>
>
