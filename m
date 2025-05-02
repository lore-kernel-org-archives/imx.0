Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BE4267733
	for <imx@lists.linux.dev>; Fri,  2 May 2025 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204790; cv=none; b=J9NnWpGYfFglNFWbSUH5mcbZaTLwwl17ZomWzN0EyoOlevX5erSAcrFwrRQsLRo0v/CchB6eOAoFsPujei73hig/jD90ygGlvBE5ViRIl+W+nO39MIORIGbEPOW3E6MlV8MoATdcCy+boEVz01VM9mV6rUr4NtljXwsja0FjbYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204790; c=relaxed/simple;
	bh=g4VUCjRthehjpe2xs+A0+SCTnyPwxFun1Jy7XN11WVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=moAHqRx8MvRt4KDg3RP2F/VXlHF368AOOVSibfXQg+SYQKZw9/ka3UCKSCAMBPlqHhO3n9tOVYd2pQeNlRv8ZQMSbzOI7f0xOUiHGWP4Ynvvm01pfptkVVg+6hflUdYtj9PZ7W+TIErTxdJrY3GrPtMCAuzFwbUL2no6uFWTWDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYpvmpNz; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYpvmpNz"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30863b48553so3404344a91.0
        for <imx@lists.linux.dev>; Fri, 02 May 2025 09:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746204787; x=1746809587; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7UI2Y6MBJpdKB31fdutcaWyVKKdFp08Cn0ReKUGIo8=;
        b=JYpvmpNznKvPy4gxwaO/KrTAnb8fF29aw645tar8ZwQ2ZKUyvSJs+3dUTmj2MD0q1Z
         hVaZE5zt9gjZ4XtqfG0NUn/TJM1wrjGUNEpr2ugiKFGxEN0BCNfieCe1P+zodyzJsj1J
         IeMSTs8LEXxh+fqDyVSYWRBaJqY0i0pt9P2ZhR8DCD1vXpg9aeaKQ7O6hy1rtEsregjM
         iPc1LE0EVYFSG7NStwjFJzWup0sKSIum128m+0TMdxVw0+7BSigNUa+nF+CvuBEcy4Jb
         eATQVpF6qgZrw5nfkIaplpqhrh9/x97cPB8NalZo7jfFFprvlVRfzuW5OWiKr/JPgV35
         tUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746204787; x=1746809587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7UI2Y6MBJpdKB31fdutcaWyVKKdFp08Cn0ReKUGIo8=;
        b=R6i+mSUmwOjUYWmUjy6ncQk/G6+5DlN1GI9nuuTHyv3qJLo1AFz2dDgFX40DMcBCyt
         AdqfNoiYwij7fBAKsFGpvfIOn0hWyUApwiC2E6PWQvLWxeuECw2Q3bzQ0+FXg6yY49bw
         Cn65BF3FDoLlLGCA5tISO0LHNODvdW2h0dQS6puxY6OvarUkKrgH4LAztMNUwRzlR75J
         UJp7164bbBlu/V2EBynqDxgpmJ4oUX5rU5yYWXh+B3fC+QmFmrVOyI4NvvTHwKkfX2zw
         hA3Vqf3hUrMEQ8iVXTqGZff8+mR1QaEARAg/w8sGApq+zhYNUMT3Lw25n9XTMRF0EnOp
         MIXA==
X-Forwarded-Encrypted: i=1; AJvYcCWB91rlRNkn1O1MgbUgzIzXbDijBsIIyvIB52P8OTPi1uUwUQUYzYGpdo2+hL3/W4IVf/M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkbA3W/mhIxyS/sqhINF1tiUWN6tml0+j8SkPh6Vd7FRztsI6D
	Ja31PiO0cUfidoZWdUqCsAf/zgmlyelC0quAXFDFIuFX632tIJKzRQUAQ0Ktp3wrb5KhV2bkgN0
	T31Z3i3L1AnkOUC+u062vUcqGxGw=
X-Gm-Gg: ASbGncs0xhaSOaZzVkN7dHZuSkcoI+LMOeNN87cPQd1JcZ13l22PKCJIWpMvroiEZxU
	qV6x+NrXM6G32odfxvvU0PvZdpLrMgUkzyJlrPt4FBWgT9D9AlGh0JyWbCQrHrI1jijT36mitv7
	8fo453jyVZYIPaO57XFo+6XQ==
X-Google-Smtp-Source: AGHT+IHGTYOtyWFxjXS9Ul06M6JVtewP0QqLDSWygChMn5nReUMS9WxVTU7k4hPxbBaUObqwnTWe5V/cpuVhKJnX2Y4=
X-Received: by 2002:a17:90b:254d:b0:302:fc48:4f0a with SMTP id
 98e67ed59e1d1-30a4e04c98dmr5766332a91.0.1746204787157; Fri, 02 May 2025
 09:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502150513.4169098-1-m.felsch@pengutronix.de> <20250502150513.4169098-8-m.felsch@pengutronix.de>
In-Reply-To: <20250502150513.4169098-8-m.felsch@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 2 May 2025 11:52:55 -0500
X-Gm-Features: ATxdqUE-GbFHdhVzbDY9mw-AkKfv1gk9sfEHekiKJv7IfKQ5yld-yg7UXiz-NTw
Message-ID: <CAHCN7x+Lu9momgX3Vwp+Yu+Tet5Q=k2vCL83SMLuad24SDchEg@mail.gmail.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: imx8mp: fix VPU_BUS clock setting
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
> The VPU_PLL clock must be set before the VPU_BUS clock which is derived
> from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MHz.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 97b09b647ec7..7f4bdefb3480 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2289,8 +2289,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
>                                  <&clk IMX8MP_CLK_VPU_G2_ROOT>,
>                                  <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
>                         clock-names =3D "g1", "g2", "vc8000e";
> -                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_BUS>, <&=
clk IMX8MP_VPU_PLL>;
> -                       assigned-clock-parents =3D <&clk IMX8MP_VPU_PLL_O=
UT>;
> +                       assigned-clocks =3D <&clk IMX8MP_VPU_PLL>, <&clk =
IMX8MP_CLK_VPU_BUS>;
> +                       assigned-clock-parents =3D <0>, <&clk IMX8MP_VPU_=
PLL_OUT>;
>                         assigned-clock-rates =3D <600000000>, <600000000>=
;

I think there was a move to make the default be overdrive [1]  and [2]
and use a 'nominal' device tree for those who are not in overdrive
mode.  According to the TRM, the VPU_BUS_CLK_ROOT, the nominal is
600MHz and the overdrive is 800MHz.  Based on that, I wonder if the
values here should be 800MHz and if we should add the nominal values
of 600MHz to the imx8m-nominal.dtsi file.

adam

>                         interconnects =3D <&noc IMX8MP_ICM_VPU_G1 &noc IM=
X8MP_ICN_VIDEO>,
>                                         <&noc IMX8MP_ICM_VPU_G2 &noc IMX8=
MP_ICN_VIDEO>,


[1] - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
ommit/arch/arm64/boot/dts/freescale/imx8mp.dtsi?h=3Dnext-20250502&id=3D9f75=
95b3e5ae0ead20a74a5f2a8f0434b3254ac5

[2] - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
ommit/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi?h=3Dnext-20250502&i=
d=3D4b98bf3bff7353d94824c4d874ff2d7f38acc49a

> --
> 2.39.5
>
>
