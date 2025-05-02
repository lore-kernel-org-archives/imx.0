Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D158A25F7B2
	for <imx@lists.linux.dev>; Fri,  2 May 2025 16:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746203443; cv=none; b=U5rPH69MW0EMxcEe/eVuEY5PQiO3E+fEn8YxPHKzvYjeVte8wCEiPj5BqSg91wTlq1MoX36NuMvZL3wZEA6O419UdWBG3HP/tS0TEQPs7sLD8wTgGsvtEG9t9TT1MfWQV+AKo/LOiCsPIH4w6WfzKSCGyBfZOl2ey3h2gFT35CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746203443; c=relaxed/simple;
	bh=GGGJaQnxnZ+/Qywxhcm3pMs8DHoqSjZXKNpRXJXqxNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Khpspj3vDYJi8YvPEeOrr8mNT6WE1F7QD73nVnnBO7ZT9gBMBGecA9vlyn9yt3k3Fo+uTMatMjUidaO+ufSQHAc2xgJvTYaddQ6NBXvI9BpA+AjRHOxYSa5SmouHnMysK6MIoy6opPW9A8fTufoPR2rvJj47A8sCd6RdXtPxLxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U69n/reg; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U69n/reg"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30a5094df42so1140046a91.0
        for <imx@lists.linux.dev>; Fri, 02 May 2025 09:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746203441; x=1746808241; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLgGDAzhbzi8zBfreiBGkw9+hq2PN6Kh7ZFPU4njLno=;
        b=U69n/regB7yK0rOi2vac0/BJZ5wlJiyKdFw7YpAP7+irGc2oUCB9GI6QkCW3mOgSVz
         cm8UUDt98PJGlZZHmzYTTm5ldf4xqQmv98iAfm0E4VY2ykRKslNEZqE15WFqAYa0S/af
         6zqcByiXLKBvZyIFmlSJIADIYSQjqhCpIDVFbd2/mYevD2qz3S/fnDM646QCkD+zWzno
         oGSYgeUyIvlcwD9oll4fMBsCusuwtKlZQFA1z1t72iw6OGKU9oeDhSgJ5nc5lBeujl0W
         a9bRhqpbY4rm4uqJHRKO0EkBCkdqv0wokqJoDPDYckZ6GEBuIs1sLMPiTeIZe9yODLn2
         8dAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746203441; x=1746808241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLgGDAzhbzi8zBfreiBGkw9+hq2PN6Kh7ZFPU4njLno=;
        b=lIsLStkUdD5VJTi3IknNdwvoa8RNMXsbdAXu2rg/O14Q08MQVh/4fCGbD0fesD4Txm
         a+qFdpKYLYmYht1eQKo4fttgxr5+27wKjLf6u/er9NIps/Lz6beqcY6qqVXyzqfLwrAN
         VuOlNE9H3j0QtDQIFyOc20PP1TLuG++5qZ9I35J3yfL84XDRb+xJqZR9bQE8yMu/EH5L
         mdtzyv8NoPTrYJfbxCeYyvacuf29MV7OUitzQRXG18QSiMo/q58ZDXaL7ZXdTBBrryjP
         YhvNTmKKWtTcQyQ6yjPXukfIFWv8+55zauvRepVrfr1bzyBGhCmOG9l2SDGpOuWbpKjC
         FJRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO4QyU0frEVp1UODVq4I3z9wfgGUxJ+mfrznZmq48OcQqYGENP9jsD0BTwxmYq6xyF/bc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXNNsyoeZcz/ojRW13W4mLXXI5pioaD4E5PE9smmKVruegIoMY
	MMzE1wUejWHmexHrK87nOxo4v1TfLoGN3XDNkqQQ+DMqbNQ55a+WWbhI2H4/Ghp8EPSeBK957wd
	IjPVYLsYPUVbLqQ4pAUTxRRH9F+Q=
X-Gm-Gg: ASbGncsxaJUKadoGEASuzjIdaOXlNO3cRhQMQXpc2NgrXcfXyZSiih25pgpM4Ey6ZtN
	AvUufB3vMN7uUuQ2oPQTFEqq18JG82ejzmVzM107nIFb6W9XOU17DHmKxh76lKXJYI5hqktK+Tw
	3/U+mfeGS0wSiGALndUwPjRQ==
X-Google-Smtp-Source: AGHT+IFD83mVdOJy5lpNuPlZVPmLooAoJbMjhC2ix2c3XVL7B+J+mwkKq3CJH7cJU97BTv0F3P0V/yqYXOccmyxktrA=
X-Received: by 2002:a17:90b:582e:b0:2ff:6608:78cd with SMTP id
 98e67ed59e1d1-30a4e5a5e10mr6554332a91.9.1746203440962; Fri, 02 May 2025
 09:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502150513.4169098-1-m.felsch@pengutronix.de> <20250502150513.4169098-6-m.felsch@pengutronix.de>
In-Reply-To: <20250502150513.4169098-6-m.felsch@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 2 May 2025 11:30:29 -0500
X-Gm-Features: ATxdqUGSLq9P6-CspNr6ECgbQeHdf383py-pp3cQ3WrpLLPzF-nJ74mtxVZrvag
Message-ID: <CAHCN7xJ5p+dwJD7i7caqwhmrz8+gZDVeqfdWA_=He-H+aTJgRg@mail.gmail.com>
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
It was my understanding that having this dependency ensures the order
of the bring-up, but maybe I am wrong.  Do you know if the 8MP
suspend-resume works properly?


Should this get a fixes tag?

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
