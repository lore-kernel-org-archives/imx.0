Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDB428A725
	for <imx@lists.linux.dev>; Wed,  2 Jul 2025 14:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466049; cv=none; b=goN+7Yg+b/DU16YREs6n87GnTY5BbSfkNJoXPUG8BxBDJs1H9Pqeesr0/V6rCeVcDeCuipOgGgzw2MIVz5DBthydeGq5da+R+OsBy1Xr+7m1AeApDVZEZ3LNYOLP0Dz3kj548ye1OCHxHtbSy5ICCXft50knqk2muV/nN8hLT8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466049; c=relaxed/simple;
	bh=Pip7qVEFQVYSY76zLUx9PHCExnbAXgnUt8LulPOmRNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbGzeo/X8B48c0mI4TircJwZk+lSylNNUJ3970gi3QYr5yaTOIrQE8aL8Vy/OeubVGG655DsGszMyzWER+e2EMSO40WjYAjaLWPxTTNBHEZ4tqDAta+RzLSwf9XBc04zRW420jEFOh2Qik6HiDUOhVP0bJ/cq08zD02bnZYlgbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKuefcir; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKuefcir"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b3226307787so3419705a12.1
        for <imx@lists.linux.dev>; Wed, 02 Jul 2025 07:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751466047; x=1752070847; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGQkzz5zRxRRS2uo+kWwt7fThwG7BuLxpPIngGvvrqc=;
        b=NKuefcirSJRQzPkj8e9geUEQ60sLDrvMB98PXIjC7dLtiJ00gq7KqtAAzqN8PsXYjg
         lxs1O78yXZOCLu9RHG2E/DpcfY/62xLwTZXTPO46PXdub1XLI9HivgW3sNe+KFohh4GS
         pZJTgHMIKcuylWF9PO03eyDiAvXv2g1sG4fsqE6Nx8HvnlhBCcqH5IlMlvidRMwVM/Is
         zxxzlKGz8XC7GtMI1rMuIsogpk8EVPLbk1Be3evuV14mEkUL0ae/BRD4D534ijpLhx54
         RyM6N3rq7S5lK9L1bCJfVpbd9fi9SQsiVizvUmmmkSOzhIuRH4A6Y+O1Yx9opjS+apCA
         uh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466047; x=1752070847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGQkzz5zRxRRS2uo+kWwt7fThwG7BuLxpPIngGvvrqc=;
        b=n2D0MdOo+qtfYrHX+MfqAY+i3UdzvWrxbALgTsfy9kBjvKaabcDMgft4vuCjb3r4D0
         o0pcuvjnf5FbTAD7rtztVJdj3P5Sp1Rv48UyJg633IpLJTYt3E1ow0m8u5z+O4git/gw
         SppqPhiUp5XJCFyyZxNVTtltetcSUjlt9u2Iiaai+9kUsV8muiB8+iQ8TMaixCoZSTh9
         f6Kic715unej5WOV5l6+MtHElJ0f4BPnwjiVfBIJBD70pjItR7nEKRLdgKRlZ+g6KxVM
         X/eZxoQDKPGC/PQ8sAw6Apuh/+1WPYuQ8cSThByUjU1tubESOSxq9jbtOVFdEGG160Ny
         mzuA==
X-Forwarded-Encrypted: i=1; AJvYcCUk3Kq5pEOSStOz2sjkur4a61oYmvGWTnYQzTJvmYQe0HFjaPqIeqN1CvDl4+H/Sb6tIcg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4B/Hss0J2TyZ+T9MHHHUcsKnV5OSPnSxJSX6nMvi1gsLI9jTu
	QFliwM/5X9l/Pfzp1XDTecHXGP71WrSowU28q7Rc8zuexvwrW2XI06uOH5IZg5O0oa3IAZGU/pF
	sCq2MN7R085Uu6IHhsUV1kEGptTnlDp7MCA==
X-Gm-Gg: ASbGncuLvxVE3TF10qIJYgGPVLvqVb+XXh/xcFw7lquzjER4Mx/xHUKhDvvt/4TpCvR
	7ktlrZFJExOWhcEO8iZDnYye6UdloNdRPIEB1YwyJkN4VCHWlqVDKDXdT1ojfe3MyMATZubU/PF
	AxojBO8s1/YLDbieivgzXXmPFT3+7F8J15Xe7YtkSHWf8BczfIf8PqHw==
X-Google-Smtp-Source: AGHT+IHXe/1zFmqCjXQ3C8alvXOHiCKHLQ3bJLFyVQ/G6RNjB0hyZ7QrXCV2jrtHiA4TmMP8JM9c+KanMU9aiN4g/Xk=
X-Received: by 2002:a17:90b:1c12:b0:31a:947d:6ca1 with SMTP id
 98e67ed59e1d1-31a947d71e7mr2657565a91.22.1751466046836; Wed, 02 Jul 2025
 07:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com>
In-Reply-To: <20250620213447.56392-1-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 2 Jul 2025 09:20:35 -0500
X-Gm-Features: Ac12FXzt0gezjSCPgKwgvm9n1EIPWkC5-wwtbhI6dVypdKni0yvTumI1x5nEKA8
Message-ID: <CAHCN7x+2A476SgUP3uWSLovpDU0qxxP=a+sXLbdE0UU6Bv+_YQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 4:34=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The reference manual for the i.MX8MM states the clock rate in
> MMC mode is 1/2 of the input clock, therefore to properly run
> at HS400 rates, the input clock must be 400MHz to operate at
> 200MHz.  Currently the clock is set to 200MHz which is half the
> rate it should be, so the throughput is half of what it should be
> for HS400 operation.
>

Shawn and/or Fabio,

Any chance this can get reviewed and possibly applied for the next kernel?

thank you,

adam

> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development=
 kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/=
arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> index 21bcd82fd092..8287a7f66ed3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> @@ -294,6 +294,8 @@ &usdhc3 {
>         pinctrl-0 =3D <&pinctrl_usdhc3>;
>         pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
>         pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> +       assigned-clocks =3D <&clk IMX8MM_CLK_USDHC3>;
> +       assigned-clock-rates =3D <400000000>;
>         bus-width =3D <8>;
>         non-removable;
>         status =3D "okay";
> --
> 2.48.1
>
