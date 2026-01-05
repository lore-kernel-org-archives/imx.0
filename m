Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5183335083
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 13:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767618628; cv=none; b=awFu57Yx3Q79x3LWLpUj5KCXGjYZXffmy3EbKFp4Sx+cJvgXVgLXiFOgYVEvF7sXDpPbV0k42qJZrxCImMI9WFZMIvZG6YFpm+AJOCqGIBtZo8iyB61Fjmgp02eTgX/hSvvZROxvmXvYl5miWIytS7+zysXTfIbbZiqBSLxJ7lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767618628; c=relaxed/simple;
	bh=Ww8aJuE+Meg0CK7fuK02354Llc9h7VxBm7pH74kj4e0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Db/LTLb1zvTO7f89JV8BMpBhj2pwGLPVOHB8CHk/zCfzPDMyrht0xR64CJbbBWqi53NkegmoJidLhikcqu3mTLe1VK1TG4mcfASraB889KBMDXzxHdOLKbWl9ChtGIni3e1YvNlS6qQhfcWbKUcMV0ACJDfcQIRTrv5vEGZshjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLgZpTMY; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLgZpTMY"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37a415a22ecso6899201fa.0
        for <imx@lists.linux.dev>; Mon, 05 Jan 2026 05:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767618625; x=1768223425; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1tgMknXPTxfI4cve9UkbbLLP6ccgRH1mmQbBmeIuqA=;
        b=RLgZpTMYMu6lM/IzaXtf07Uk9I5C9pXCok3Itwp9Ky37gv2hnNxYoJ43C+F+1h/HL9
         bPiuVsG9ua2BS/QlMJR4OpgoAUn2gFYT4K825HF+/uCHDRCWYkyRbdmOGzwmaASH8A6f
         5KOSofUZ3iwkj8T+Jm+FQTigElDmhIA4sFBGLnvEy374yqX3GBOYAoyl7fAooV0kYw42
         i3ZnHv9MeasQ1IQpKzlrCLKu/VctMIrChtsK7GOER1/zVMtBESXi/phNdNLut6V0NRyv
         Vql0TKJxNNHlA2P09hKT2vRo0jsI3kUD8czaoqnr2aeBPofZMIvp11G1d2XIK4OzXFeo
         eT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767618625; x=1768223425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x1tgMknXPTxfI4cve9UkbbLLP6ccgRH1mmQbBmeIuqA=;
        b=V90nAoiOh8zb/Iqc0GwQKlOoC/MZwbjPRwEqhc0vs4nkJwRMivE7U89JLyv3Y80blp
         RJQFsHEBjN1/psY57qc1V+awIpu2QhnbRZZi3T89QYdt7Ms357sxwO84mVJvliYN/LHu
         +X4y0kNS+iacKHU22ifcOZhOwmA405sljEVAkdfjuKYB8s6QZVLWoLsUeVOJsRrMxGJF
         NEXIdizx/HIEs1GXYVCIXVh/dpBP3b3xWBVWUpsQCEO0RrOVvMYs/a2/EJ890lZw1pSB
         BInOKjNbG7LApNBSoCFTuMqHm3AWWvfNLF05zCvwPhME1P1SGoPa4Jz03USJWD8XHXyg
         sW1A==
X-Forwarded-Encrypted: i=1; AJvYcCV8V96nSlfXK3mwCchIBUwGHhyQg3SqIKNgQ0v2in1FORViVty9Nxan6WzEfiwbVB7r0iU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywfe1SoQofz5F13icbB1TT9qkSL53M2H2W+rDO28XonD0jgNIPS
	zu3aKeMn8xNq1+zjKK0FuU804wRKC2t/mycn0mGIofwv35oBN6Tj1cNCKDVA8mBQu6ArKTVw5U8
	Rt/BL52luIWeLsokO9NtKvYxAOIHFpuM=
X-Gm-Gg: AY/fxX5Ax8N+tiFYDmiP5lIo8zP6ZXoISjtWBWdgL4KMbtElFVvTXYT/dprvK1IihIB
	5pWz24ilqVenkAyr/opX6j142B/8pjQQXAyWkDPIB6j5t5pPMWeCYFjcbqFSH9cx7IaQekY9lF5
	1ai5cxCO3arSbsRdxeYg/zwQ0vHGWpbkq6JRz3ctOOA4PCQq9g2meIGXVlL7GADQKKsnW9kDyv2
	VWBcn++RWvjg1k1G435rgENmuVBZJfjhYwasDONNZwBPmZ7fGxnq5oo2mvk1m8bADIRSAMxvFLD
	rNhueHOKTFnX1o87gygVUqgLiEI=
X-Google-Smtp-Source: AGHT+IEUbLTrvsXoZiZcdhNSheDt5P3vxL7cNjh4Y4VVYLNVJEjIjtJ0okeQhPegnghE+HXm7rcA9IcQ+NuYNy7f2J8=
X-Received: by 2002:a05:651c:994:b0:37e:5208:e2d7 with SMTP id
 38308e7fff4ca-382c519671bmr30052071fa.19.1767618624495; Mon, 05 Jan 2026
 05:10:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260105102412.6674-1-stefano.r@variscite.com> <20260105102412.6674-3-stefano.r@variscite.com>
In-Reply-To: <20260105102412.6674-3-stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 5 Jan 2026 10:10:13 -0300
X-Gm-Features: AQt7F2rgkl7-0dzR76DPCZQr4IVNxzzcw_bfa9sfWvzvQGQMX6LP6vhLo4zS6yY
Message-ID: <CAOMZO5BSoqQ70K+ihJEn2q6qh2AFKJAsgqufvW3o_fTxsfC=NA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: freescale: Add support for Variscite DART-MX95
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Markus Niebel <Markus.Niebel@tq-group.com>, Primoz Fiser <primoz.fiser@norik.com>, 
	Yannic Moog <y.moog@phytec.de>, Josua Mayer <josua@solid-run.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 7:24=E2=80=AFAM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> +&scmi_iomuxc {
> +       pinctrl_bt: btgrp {
> +               fsl,pins =3D <
> +                       IMX95_PAD_CCM_CLKO3__GPIO4_IO_BIT28              =
               0x31e
> +               >;
> +       };
> +
> +       pinctrl_emdio: emdiogrp{

Please add a space before {.

> +               fsl,pins =3D <
> +                       IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC        =
               0x57e
> +                       IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO      =
               0x97e
> +               >;
> +       };
> +
> +       pinctrl_phy0res: phy0resgrp{

Ditto.
