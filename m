Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF4F2D0635
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 11:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767093208; cv=none; b=bNItmaJawFA4ILHd6Uwxz0tMkRD0werU98a3rN1ELrTteUEU8CfNKFAg1C9iGZ1wDSCclPoO8DKJEZrF//zOv/PO4f5Q1KCFTf1QTse+WQYWRErpK0Hrt5cIcVcZHRKVJktiS+Y9lEnsnhYyK5D1PvneZUNCeKljVJGhxBTA9sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767093208; c=relaxed/simple;
	bh=Mou9GuRir7LDbJR0BMVejC7OoEPX0gIL3s17cmVn5IM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CXxLIJki3P2RoUeu+LTZaTsSkqSwE7+yrEQQuTipKKwvZgeWQSwLcfbTylKpwYckI0+ObXO5uL8LjXQM1Drc2zu2UTpnmrlxDjXYI+fi3l3Ei4oBngaOyieoDbYpv4AldqGPEkNbpd3+QzjoG4jOQMwK3cTPzG3YWPQQdLY4Mg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTg7mBrt; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTg7mBrt"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59b30275e69so4886950e87.1
        for <imx@lists.linux.dev>; Tue, 30 Dec 2025 03:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767093205; x=1767698005; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DhaHJWr2nWv1al9K6mLQLe34skpWhfOOb6P3+q+LeM=;
        b=CTg7mBrtIMip3iAjDgNGvgHaM+rvhSHrlsnudbFW/gCQhxl/AdlCHVDhxH0Qfuj5Z9
         jCS5w+f6/P0D7feS9Mv34nxziav7+ynvpdbDgDiN3xxno2n+2LqHz1pzS0zMBZQ8VId7
         u/dnu5PAj7MAG97zRkjM35WvHJ07mu5iA//dFnFYlVSwj/0rSlXemr8mC76HFCB+1FeG
         siTSkd6grpZ6skJsIn8cKZMMIWloV2R/g/xNVRS0+5Myh9Hk/Hdq+R0OozK/YorwsI5e
         NnLBRSUBbyiNVh0WaTUub5XRLYCTeuIw8RcvQtBJAEBx/pkBzksI2w9s6NDnFI9NpaKs
         5ehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767093205; x=1767698005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0DhaHJWr2nWv1al9K6mLQLe34skpWhfOOb6P3+q+LeM=;
        b=eKVU4lqLVa9AXjlRgMrdSR6zCv5fjytI4x4/hYxakP5KC2F3taCIIOHrlQUE8HRSSR
         7B/ltRiJqei7LRQyZy34VxQq3++u2MHPuNlxL0a83tk4u2W61P0kldW5dfrG2/OdmqqZ
         /WGyYisCtvXEnub26PPqLD8PUdj7RNO3Oykr6LX4MU/9cFsPeTyRgaVBVZY90K1Sfdue
         ApI1+swT5BFEEkYjj42AkudXGS90J/sLinSJTwd/CSMxCgryPS/qJkP0RcSpUAxDwOW5
         WCstIZge0KyOtoLbInP3siaPRLiZZhoMMpVHQPtZerTy9C9lc+oMtMPT66ennXhjAEw8
         ZMOg==
X-Forwarded-Encrypted: i=1; AJvYcCW4doZWGbp8Nsk1QL49gt+RrMM8rddn8oRLS3VcA+Q9gEp1RqEZ7ra2lz6uo+Cr1oddA2E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoZKi35Nty//1kE3Tb99xmB9HY9wpwxekaGBaHQkygWhmoR3LJ
	ljOTVKdAIydP7SIoUkq5CV3s1kj0eSJo0TKhpgEWIthNPaBQwDc7wf2YmvyS/B2n8ZZsBciH1pL
	Rd8gtCOcWWSgLx8ujaoCk2n/BcLEV/W0=
X-Gm-Gg: AY/fxX6Rbwm0mvQo1hW1TGi54yHMfFF785GZsNVoIRIHb3JHBKkAkBSaMJuPWV/hIjO
	jkiO6NLQdxcxLc4kHD2jFxAEQoQ5SmCXwRChSsIirQIq8EHhGp47g7+8FaMyD8onI4TGNnfykcX
	Y4FbPho1RnnvU38iLsBvx2awG1L9ooogRvLq5pdqKXlfZSKzTaTUrBCElju28s5WbDZf4b7Bo53
	BoNvRbT232S6A59jsUjztVN8YvzvTOFDQQwey2evkW/2830WGy84cG/6SybNx1mJeuhJUf+uzbS
	Vd56JQxybuvIl+5mF8w/FfnFnYc=
X-Google-Smtp-Source: AGHT+IFq8iKQHu6vpcCYiWXyzz3tsn0MBXJbshrFfK/UlMVKowVKSf2tIcJTFEyHx5cpFKKTRtj3dLTLa2JxOdsPHZc=
X-Received: by 2002:a05:6512:3e06:b0:59a:107a:4593 with SMTP id
 2adb3069b0e04-59a17d722admr11700584e87.4.1767093204378; Tue, 30 Dec 2025
 03:13:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251229213726.79374-1-stefano.r@variscite.com> <20251229213726.79374-3-stefano.r@variscite.com>
In-Reply-To: <20251229213726.79374-3-stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 30 Dec 2025 08:13:13 -0300
X-Gm-Features: AQt7F2omZLLu61VmQRr9xvfISMKNSHVaUEafxRkAtNsj_CTzmp5R38uxHvlk4qA
Message-ID: <CAOMZO5CsN-DMKoJ2Fz063tVKVqsr6Y1dq7B1Mg=Krz+_g1tQcg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite DART-MX95
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Yannic Moog <y.moog@phytec.de>, 
	Primoz Fiser <primoz.fiser@norik.com>, Markus Niebel <Markus.Niebel@tq-group.com>, 
	Josua Mayer <josua@solid-run.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 6:37=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> +       reg_audio: regulator-audio-vdd {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "wm8904_supply";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-always-on;

Please drop 'regulator-always-on'. reg_audio is consumed by the audio codec=
.

> +&lpi2c8 {
> +       clock-frequency =3D <400000>;
> +       pinctrl-names =3D "default","gpio","sleep";
> +       pinctrl-0 =3D <&pinctrl_lpi2c8>;
> +       pinctrl-1 =3D <&pinctrl_lpi2c8_gpio>;
> +       pinctrl-2 =3D <&pinctrl_lpi2c8_gpio>;
> +       scl-gpios =3D <&gpio2 10 GPIO_ACTIVE_HIGH>;
> +       sda-gpios =3D <&gpio2 11 GPIO_ACTIVE_HIGH>;
> +       status =3D "okay";
> +
> +       wm8904: codec@1a {

audio-codec@1a
