Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC7017BB13
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 17:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724088250; cv=none; b=KKm15AvcVGJonFfs49u6RIANfuZIa4RD8aPkekNCMrdYVzQ7tL2wmjaIsBu31kejk6b0VmsGXPerjSfwnVvrEcAy/Axvx+mbhgm/EONAk+wGDaoqesKkihUkCwIAeT6nlgeJM8kopdC44QB5SVoiyAS0MM/4D4fAHhPvwz6h7VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724088250; c=relaxed/simple;
	bh=h5Ik+4GPsKEsUFyv/+ngVFo1vuM4D3ux3Z41/ZHTSlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlvISNw1CUIgRkLCxjOS9jk91OC6faeZJO7Hq1hhW+vuTuGe+pmeLh4zs0tEx1WHOKpMrJUPe7RzaL1xqYtTLCrOq03SoxiUPB/mquIxonLnVWMiw+f7KTxIT88A3TsLOpIL2DJurVGY3GK3NCm7tqGIW2FJjTmedl2VBiHAKxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HryeAPqM; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HryeAPqM"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f3abc11aebso5080081fa.2
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 10:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724088247; x=1724693047; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tA3DbE0eIgB/krXWiVQLA/SM1DVu9kNL0tSxYAoSxNc=;
        b=HryeAPqMmObu+LqXq27OtllR5W2Y8OY2C0SIYDAGz2hKIJ746+N7lDC27/Yfw7XCbc
         GCFYJs54Es5Q7gm0XwgQrbXpS5aFSVhADmQ1YtXkS7Foe5TGdWIMiOWaMr4+qZa4+PGy
         nXhVzp5xl0+u75cSKULwJDMaJQXz5N4e+mdLcxNW2B3sfyC5FBuvIuhGw3WlB1UsPR+2
         iH4F5O0b/eGmSZnYz8OatLAKsK9R/S9gWxSGYJ+z4jSlB2Jd6YVWzijTfNXpHFw72KlZ
         X0fc8xPzOzxpWY6SwByS04OhGdhtr3yXp15GpyUg8o893k35SaHIfDpn9Ejt+T9EcfBi
         xdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724088247; x=1724693047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tA3DbE0eIgB/krXWiVQLA/SM1DVu9kNL0tSxYAoSxNc=;
        b=FVnyzDqRNeYrMIiNY6y9NTa9SA/mGOD+tpp5yGeeFYr/e+EZm8qvrTxbGb60+x1tk+
         W2vv3n6p9XsGaUzcCa00YLO5AU8G6tujU7e7zDk1ctWnEA2gpgUjZJ6lOnCPGfqI0B9H
         VgYBHq2j3r49narJQsAUIzTH00Wvvz0LFZJv1InpsOSMB28LWPVT2EBhYkWA3ScR29Sh
         nCxvgTw2tT8ePafRNKQMLZFgLqSCzPbUlaeZ7RGxMDRiAPLKZ2u73DEpZB+sMdgVV0DO
         dGXb0IOSzoF8hQ5JkNse8dHYp2SFVfoK+ur1wnpw6fmsIPPvlij4DOlnG0zvb0JxDCRt
         CS0w==
X-Forwarded-Encrypted: i=1; AJvYcCX8hOjoojVSuGdwNzQ37E8Qs4cyd14pCuTUEHpg4jF3DmsNvlwOwWc0YvXzKBIfwzUq/lCDS+sVmV3DWUxVDI47uadt
X-Gm-Message-State: AOJu0YyVd4oCRXGUIftV8uZON5MiSPW9ihS9hSh/3PA4HKyYhuKe6W3z
	PPvrbrL99fYavKXyXCnXfQYkLUIVzFlewwwdAr/HmDSCCKZLfAgyIOA48eR5Epid/amMdqh3KXf
	tcAyF0XwUwMutnvBrbMu4YTN3GEk=
X-Google-Smtp-Source: AGHT+IGr/XQMgMzcp6jgW0glG/inQWx5ioDh8iHJ7/a0zz1Ff0cyAn5p6R1jdxyTyikNRSSeG19EhIpsXqgXc0tDdN8=
X-Received: by 2002:a05:651c:198e:b0:2ef:17df:62f9 with SMTP id
 38308e7fff4ca-2f3be608217mr49111421fa.7.1724088246308; Mon, 19 Aug 2024
 10:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819-imx_warning-v2-0-4c428bd11160@nxp.com> <20240819-imx_warning-v2-12-4c428bd11160@nxp.com>
In-Reply-To: <20240819-imx_warning-v2-12-4c428bd11160@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Aug 2024 14:23:55 -0300
Message-ID: <CAOMZO5C_uvmuf-+QGH4E2X=Jei81a--N5wC83V-URPkXj-q7hw@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] arm64: dts: imx8mm-beacon-kit: add DVDD-supply
 and DOVDD-supply
To: Frank Li <Frank.Li@nxp.com>, Adam Ford <aford173@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Gregor Herburger <gregor.herburger@ew.tq-group.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding Adam.

On Mon, Aug 19, 2024 at 2:03=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> According to binding doc, DVDD-supply and DOVDD-supply is required
> properties. Add these to fix below warning:
> arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: camera@10: 'DVDD-sup=
ply' is a required proper
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../boot/dts/freescale/imx8mm-beacon-baseboard.dtsi      | 16 ++++++++++=
++++++
>  .../boot/dts/freescale/imx8mn-beacon-baseboard.dtsi      | 16 ++++++++++=
++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi b=
/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> index 6086dae2e5fbe..ea1d5b9c6bae0 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> @@ -56,6 +56,20 @@ pcie0_refclk_gated:  pcie0-refclk-gated {
>                 enable-gpios =3D <&pca6416_1 2 GPIO_ACTIVE_LOW>;
>         };
>
> +       reg_1v5: regulator-1v5 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "1V5";
> +               regulator-min-microvolt =3D <1500000>;
> +               regulator-max-microvolt =3D <1500000>;
> +       };
> +
> +       reg_1v8: regulator-1v8 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "1V8";
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +       };
> +
>         reg_audio: regulator-audio {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "3v3_aud";
> @@ -187,6 +201,8 @@ camera@10 {
>                 assigned-clock-parents =3D <&clk IMX8MM_CLK_24M>;
>                 assigned-clock-rates =3D <24000000>;
>                 AVDD-supply =3D <&reg_camera>;  /* 2.8v */
> +               DVDD-supply =3D <&reg_1v5>;
> +               DOVDD-supply =3D <&reg_1v8>;
>                 powerdown-gpios =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;
>                 reset-gpios =3D <&gpio1 6 GPIO_ACTIVE_LOW>;
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-baseboard.dtsi b=
/arch/arm64/boot/dts/freescale/imx8mn-beacon-baseboard.dtsi
> index 20018ee2c803e..77d14ea459e57 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-baseboard.dtsi
> @@ -40,6 +40,20 @@ led-3 {
>                 };
>         };
>
> +       reg_1v5: regulator-1v5 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "1V5";
> +               regulator-min-microvolt =3D <1500000>;
> +               regulator-max-microvolt =3D <1500000>;
> +       };
> +
> +       reg_1v8: regulator-1v8 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "1V8";
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +       };
> +
>         reg_audio: regulator-audio {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "3v3_aud";
> @@ -158,6 +172,8 @@ camera@10 {
>                 assigned-clock-parents =3D <&clk IMX8MN_CLK_24M>;
>                 assigned-clock-rates =3D <24000000>;
>                 AVDD-supply =3D <&reg_camera>;  /* 2.8v */
> +               DVDD-supply =3D <&reg_1v5>;
> +               DOVDD-supply =3D <&reg_1v8>;
>                 powerdown-gpios =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;
>                 reset-gpios =3D <&gpio1 6 GPIO_ACTIVE_LOW>;
>
>
> --
> 2.34.1
>
