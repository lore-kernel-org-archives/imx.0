Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCB71B250A
	for <imx@lists.linux.dev>; Wed, 21 Aug 2024 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724250259; cv=none; b=mqfjM1iRjDdGctO5UmKclxSk/Od/s1Fjt/8wyeG0/7Euv08NPocSaAPWZhdYhoC2bqx18GHjGoRJARmCAapa7MrSxSwDzwPoSnPglQ3tLCxrqO8er46eGmU5A2VKgr9TEuUxbE+3EjNU+70GGfpLbC1mJ7yExJrIrbZLhrrJ+Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724250259; c=relaxed/simple;
	bh=LQi6n4yMSVAfqtfuPS2JswfGIu0Wscw3/kexTT4Dk+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRVjf6vztxDW+rzsGWZVB+jGdMlppPnWnSzl7LYrg65x9RgDF3ryD45HgMpvRXdXLA0SvbWHkh6B6ap6BbtjQ33jzr13DMBZ5ahO4sKAAZ/7pkE+rUmwU+EUb0Vb4B8id8qKfKGj2W7eSE4R+lyZtCys5dxkiI/I2yh1hXkv8ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niGszNcQ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niGszNcQ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53345dcd377so2276464e87.2
        for <imx@lists.linux.dev>; Wed, 21 Aug 2024 07:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724250256; x=1724855056; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlbE1ZVUp8r5d/u+xc6LD6T9os/TKYS6UASL1EJLs8Q=;
        b=niGszNcQ1Zqe75Wj9WdcrYQdEY0n2jVEKhREnZBepo6vKPgR37sd5CQLy0wL8PAfyQ
         UCFXMkRpDAtm/tOMKXgKGWatwX57xChbWbVWU2NVruXSmP8rXaNUMuNmguTrY4zc42qL
         OrRsrenE9Dhb2+eRohAg5OPc8eSV+4rWlY+yPH5eAhVSJ99t5nWe4F/X4y0wLJhakO/1
         uKoM4OYNhCKkbZqu4BF/DfP5ZwvZ6bSEVofAGgQRmR8iP8qAZgb/RjKyG6JtoVCGxQoQ
         b8CieYSFqOu9XiPoXevTY2QaNdaLZi6wsUNY8u+SgWasNKY9jF07+RTZNfbCI0ke4Hnt
         vhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724250256; x=1724855056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LlbE1ZVUp8r5d/u+xc6LD6T9os/TKYS6UASL1EJLs8Q=;
        b=iyD+FJGzecZQzbx3MWB/IircnhC2NLg0+beJoTJAsR0yqvVgEEeyeS+B3j0GsY7LW2
         7xBPB1O+0usBgwKFsg+oncj5PCBfOLdwOQi9n6jRGrw4Fu2n4HeNKqWZjKHhnpyCXqQP
         WCwdjbL8BvCQPImpyrfKlZ5994WIQlMsPCkhhuhf+4+nSZ5CjB/YDrdMjQmra9HGSiGx
         RjbwA1lDRy7vAGW9atcDXov72jQ3RyCsrUfnCjZChfhAiN3WzQ8gwMmj4hVmRkrkGn0W
         EezIqnRSk4EbDFQ7ltLUFyHizFOQ5BCquB9JPqpIcbstd0l0ZmB763A3kCqGjunNi5/g
         sZbA==
X-Forwarded-Encrypted: i=1; AJvYcCVImWL10nX7pGkPXbLTvlRGqucVBLs1rA6WjXmBpcHVzvJCVxiyTmZ67o0YgUels7Cqn8g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7eHNEeqc3NIgYKBfHNzGEAM+Ur4mgE/a17ycXdD4wAdpAxnJ9
	1zDID3SU2AO+ACwmLHJwQSzVfMU+y54NUgvfp+aoXeaikF/c+MkWf7eNK1NRCt9SNu+eE/7uZ/v
	yhg3JvgB6GrteAlffbH2oppbT6hQ=
X-Google-Smtp-Source: AGHT+IEo2C4tLGErKbN36oFT83s+fOENUqZMA6ZnvUMnZOe6yCITNZ+3R77DMVBR+1CUyo7ZuXGHZL17izwR69jEvVo=
X-Received: by 2002:a05:6512:1103:b0:533:47ca:9773 with SMTP id
 2adb3069b0e04-533485fe302mr1783670e87.57.1724250255178; Wed, 21 Aug 2024
 07:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240821135817.56393-1-tarang.raval@siliconsignals.io>
In-Reply-To: <20240821135817.56393-1-tarang.raval@siliconsignals.io>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Aug 2024 11:24:03 -0300
Message-ID: <CAOMZO5BJQ4RVRqvpcdAdXqhcfP6b7NbN-0VQZB7sBfYGKr8phw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mm-emtop-baseboard: Add Peripherals Support
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: krzk+dt@kernel.org, shawnguo@kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tarang,

On Wed, Aug 21, 2024 at 10:58=E2=80=AFAM Tarang Raval
<tarang.raval@siliconsignals.io> wrote:

> +       can-control {
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pinctrl_cancontrol>;
> +               reset-gpios =3D <&gpio1 15 GPIO_ACTIVE_HIGH>;
> +       };

This does not have any compatible string, so this can-control block
should be removed.

> +        can: can@0 {
> +                compatible =3D "microchip,mcp2515";
> +                pinctrl-names =3D "default";
> +                pinctrl-0 =3D <&pinctrl_canbus>;
> +                reg =3D <0>;

reg should come right after compatible.

> +       rtc@32 {
> +               compatible =3D "rx8025";

This gives a warning as rx8025 does not exist.

It should be "epson,rx8025" instead.

> +/* Wifi */
> +&usdhc1 {
> +       pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +       pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> +       pinctrl-1 =3D <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
> +       pinctrl-2 =3D <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;

pinctrl_usdhc1_gpio is not being used as you only pass pinctrl-names =3D
"default". Remove pinctrl_usdhc1_gpio.

> +/* SD-card */
> +&usdhc2 {
> +        pinctrl-names =3D "default";
> +        pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +        pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +        pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;

pinctrl_usdhc2_gpio is not being used as you only pass pinctrl-names =3D
"default". Remove pinctrl_usdhc2_gpio.

> +        cd-gpios =3D <&gpio2 12 GPIO_ACTIVE_LOW>;
> +        bus-width =3D <4>;
> +        status =3D "okay";
> +};
> +
>  &iomuxc {
> +
> +       pinctrl_canbus: canbusgrp {
> +               fsl,pins =3D <
> +                       MX8MM_IOMUXC_GPIO1_IO14_GPIO1_IO14              0=
x14
> +               >;
> +       };

Please add blank lines to separate the pinctrl groups.

> +       pinctrl_cancontrol: cancontrolgrp {
