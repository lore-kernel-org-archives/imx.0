Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FAA1A4E85
	for <imx@lists.linux.dev>; Thu, 12 Sep 2024 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726145907; cv=none; b=syQBQKp5sebZ8AyiJwGMmXMmoQ2W+oW2TJGaSEI1b4OiuwUCqTYFv6A/x7sc9EGDeqTcdL71pexlzyV41ukQK1LI6A4XwAwCaHUBmbUpB4bON4dZnLG/d0Gje0f/NiPtQ3/1DhmFj7/pFFeI98mvygvq8uyYOhjpXhs8d7mppok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726145907; c=relaxed/simple;
	bh=Zf2NtJUpwYD5snIo/AsUgPKDi8M6UMCbldAg5SjOo64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IioYufLJu0ncroADKCxeA0dGoNKTLNBbs0nXiGcb//Taxqy9uwG/a7/goM5FJ0/SZ2WgPCNU2IZpEyV5rbzNjsBDoSWuy63bsbj9Nk/sqlqk46tc60AH3WJAoE+OcHm4jca6MsmzuwG9bnHwm3A5sHSqSWJ69s9r/M8f19Qjl5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqlYXr/z; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqlYXr/z"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f75428b9f8so15103871fa.3
        for <imx@lists.linux.dev>; Thu, 12 Sep 2024 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726145904; x=1726750704; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIbsyuY+/Fd64nE73gFcftmzYbv2YfAEW+UcUNjAW2w=;
        b=mqlYXr/zdzfptat/xD16Y7haQs0cWyeG4gvydfXbubrE1G2h/PSeSr13zz07Ca3PHz
         Y+lpoiDjwXDwKnVKbyJqJhqBfw9TB94JrQwDCpxbqini1sCJIxtQNSxBUZS2AILLpuUA
         wZsbhXCkwTHwki/b0grAJj6ji0FikzDdI5wz4LXuEH2chmikwMewSHjyRVfmHmbfUtqC
         hpYMRD9JM5UULvOoNp4DJ0bWOH2ZB0zq7P0+GnscIVcoqMTOBKfYBow6A8dPHgHuX71Q
         0flsbLcSa/+HEXel6WvaXnNiU501EDpLpGaFeUzlcr54L7RP3ot50D6YR63jm67kitP9
         5jZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726145904; x=1726750704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIbsyuY+/Fd64nE73gFcftmzYbv2YfAEW+UcUNjAW2w=;
        b=JDsaROthKudjTV9+vxXlpuXlixguxMhF0Q1GU3xJMLcAeNiDiy+r9FiWIyUAu48Or3
         NVC3iMKH2Jz8KBCKFjcwAhQ/mgejQ8Y36VYu913v3vZGHjG+gxMaQ1lScgk99uOXpdqQ
         P5NETHNJS4SUj/IdeZZSQFtepCx/1Yo8dGC/ngnvrDuvzSpmypiECa58ENO0xClSjlx8
         sDFFU+pJj/6msswpOwacwGxEkD8gvtVgwbm7sEAtn2dFzunEYdHIWpDbWSb70Avjo6ux
         0V7DIXIBD2O5I/Khb9zjDFAFcEBfL3LxQ4yEKuQvupUqAXv7j2u1gCFTqgT8Pp28KMM5
         gn3w==
X-Forwarded-Encrypted: i=1; AJvYcCU5NqXN+0VJOnmwUBvuRfE0r3fzlusOMkANvjMuL5XWMS0MQhykRAx1QJmO3QOF6WB2Jxs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9A4vY57fiJcYDSj5YjQkhqX7NVT49wvIzdGQcRksCGxfgbC9U
	L/4YaxwayUpCDIsVxUz5wmpENJ8yHlr37OE0ZGPHe+flznWdzGGZB5AoTXrNfVG4/KPJsiutG+2
	+BkmcsLHULhiWKBLRgxWgiXyhp5Y=
X-Google-Smtp-Source: AGHT+IFM68wbcXf2X68m3LTOeOkZlYjRUvKjNWgDRGS8XBSP46AciYHZtXzlDzAEs025X65hBSTsFXnA04ltuxdk104=
X-Received: by 2002:a2e:b8c6:0:b0:2f7:4e61:38b4 with SMTP id
 38308e7fff4ca-2f787daf861mr23555431fa.5.1726145903455; Thu, 12 Sep 2024
 05:58:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240912124825.2528984-1-lukma@denx.de> <20240912124825.2528984-2-lukma@denx.de>
In-Reply-To: <20240912124825.2528984-2-lukma@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 12 Sep 2024 09:58:12 -0300
Message-ID: <CAOMZO5DJ4=ARZEcq+vbisA4kJBg+WFkH3G8-hYDkL82GQBEPBw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] dts: nxp: mxs: Add descriptions for imx287 based
 btt3-[012] devices
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Thu, Sep 12, 2024 at 9:48=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:

> +&lcdif {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&lcdif_24bit_pins_a>, <&lcdif_sync_pins_bttc>,
> +                   <&lcdif_reset_pins_bttc>;
> +       lcd-supply =3D <&reg_3v3>;
> +       display =3D <&display0>;
> +       status =3D "okay";
> +       display0: display0 {
> +               bits-per-pixel =3D <32>;
> +               bus-width =3D <24>;
> +               display-timings {
> +                       native-mode =3D <&timing0>;
> +                       timing0: timing0 {
> +                               clock-frequency =3D <6500000>;
> +                               hactive =3D <320>;
> +                               vactive =3D <240>;
> +                               hfront-porch =3D <20>;
> +                               hback-porch =3D <38>;
> +                               hsync-len =3D <30>;
> +                               vfront-porch =3D <4>;
> +                               vback-porch =3D <14>;
> +                               vsync-len =3D <4>;
> +                               hsync-active =3D <0>;
> +                               vsync-active =3D <0>;
> +                               de-active =3D <0>;
> +                               pixelclk-active =3D <1>;

According to fsl,lcdif.yaml, a remote-endpoint to the display is needed.

See imx28-evk.dts for an example.
