Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEC9282ED
	for <imx@lists.linux.dev>; Fri, 20 Jun 2025 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750426313; cv=none; b=ZGopM8N9gAah5SkNY6Wzbr90CSjqXi8w9UH+eoY7n5UNlvaTezwXTWhr80+K2003d/y8ysrXciWCcXtiCL0a0ypyNZ7Rq/GysfyLlHRYQWO4BmqPtodqdW39DIKQIgL8LeibHyzyl7igjztEsLJZHUqbEgnXIJKRD7jRWcRvBPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750426313; c=relaxed/simple;
	bh=IJ5pc1pZdgjJrzmGFIWQmgiUZu+S4mq8wHYkZQZYEp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SDg0FrdT7gfP12Ly039kFYXcgxXNCXwDQ8lQ/hzIWL/xrtlhOClgYJh32eTVG/9MglHLcfOxn10ySGaxMMRYwK/yTwU5qyX6z6LkkWyKSFNtUVwCXeJoGYRRL6k/T5JyIF1X59mduN5mL077lQDUDHQvEZOne0U7HYX4LPz0TJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGP3f7eS; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGP3f7eS"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-313b6625cf1so1282870a91.0
        for <imx@lists.linux.dev>; Fri, 20 Jun 2025 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750426311; x=1751031111; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eD67VGoIFc7viTaixF6jhGk+Vu3kiN+A3PvW7sAsva4=;
        b=QGP3f7eSsu+uEZK0ypdLRXWfegCdvgTY+YyfGNKgk7d8e5TIzfRiP/CUWF1h2Udsuu
         PyVWE97rBHOkO/JulrSI9kVTIz331VXZPslOyA5S9JJFysznNNUxxqeBMe8+/V1zx2Yu
         zEdKmiuE73vzWEAPkquf3X2BM+qqhjmE6j5QUG0P1elCeGvTOqtECjj4B95CkQoAdf/r
         c6MphdnFzVEjyQWUfqb4Bsrm1rWwlyTsxtcrN1AfPXXQQQmUvLVSJ70hkov8pQwuZzmH
         nOERIGvVt3ildugyW2cE49gjlBZtSZF17WnlH0pDQI1xdrzZHGJI4LXPKVe//cCMNNRK
         VTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750426311; x=1751031111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eD67VGoIFc7viTaixF6jhGk+Vu3kiN+A3PvW7sAsva4=;
        b=tmzpPmV4ggWJZASSr7JVvrpqHFBRX/1FmU/vm9U4PDI61+XIN2+gYFHP5zb8WFh00u
         4im7tCVKVA/cYFwL2AqRv3/wz+w+0zfT3WDYNzwYX3n9LYaoPfjnJRHZZG1Nty2P4Z/J
         kEGok/TdEHijbREZT841xGmO6urGN/NNreTK8nzb2tQOCLkkxLo4/yOei/6+najqKR0j
         yaYPeNT9fIXxSy+yueltka5AYAYSjetOG2om/hRDIYcgYGAlPXwViHTUOZJ12ChYauM4
         Svg+SKnKhpQ9Gbc7SvszeN3cvva/m8xKq9kvLvTFClYzTqQ9oPOyZNxE+bPvSAIeZqnw
         P1Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWCzYpXnd+k6Pmrz6Iu7xSbkflDu94s/KhAuPVr8HCrw/reemHZHqzm1tIPwk44PW2mvYM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0NSwUO0J/tgPd/Rtjm2P8fk+2MxEJ7kBJ8ku/Qoo8umy34osn
	4wrzdAwFa7QeMpGCPFiC5J6gYItkIQUuy9ccYH8y5p6Vv3Pr6NtwILGPHPi2yDzKPd64z6ZLpbD
	1dKq1f+sBRa42EqooM2xJkTPZ/PmYmxo=
X-Gm-Gg: ASbGncufs+dNbo2a51WIbzHdmQONr1deYkX1Zuzyz0rAAX69BqJzruJ68E04TKoZ5wu
	fejy9XUJ995sXyI330CG5PLSmRyNYc/8ZEUp3UoxTcJM/4rfwE7u0YzPgTgpyRjI5xsm0cm+hGS
	EP3A/o3qaFhQyNy4VYX7Xv0/yJIWFXmpQOurA4DjpJ
X-Google-Smtp-Source: AGHT+IH3fQ614Vx5GzkzKNEt57w45C62O8m4Fe+y3Z88xij0+BBvMKQejo4mfuZeKaeYz95v1iqBe0ZzmZyXbsNGhCo=
X-Received: by 2002:a17:90b:2dcb:b0:2ff:4a8d:74f9 with SMTP id
 98e67ed59e1d1-3159f503784mr3641263a91.10.1750426310887; Fri, 20 Jun 2025
 06:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com> <20250610160152.1113930-6-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250610160152.1113930-6-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 20 Jun 2025 16:33:50 +0300
X-Gm-Features: AX0GCFuHG9nwEDIse9o6OGABxZ9DBwglQi1amT5GMFegc87DEv-xylKcvAMSJZE
Message-ID: <CAEnQRZD0RYeOsy-0cK4CDzroKySoOoKu=nJD4GT+Tyiii9x43A@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] arm64: dts: imx8mp: add aipstz-related definitions
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 7:04=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add header file with AIPSTZ-related definitions: consumer types,
> master/peripheral configuration bits, and master ID definitions.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/b=
oot/dts/freescale/imx8mp-aipstz.h
> new file mode 100644
> index 000000000000..6481c484ca37
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef __IMX8MP_AIPSTZ_H
> +#define __IMX8MP_AIPSTZ_H
> +
> +/* consumer type - master or peripheral */
> +#define IMX8MP_AIPSTZ_MASTER           0x0
> +#define IMX8MP_AIPSTZ_PERIPH           0x1
> +
> +/* master configuration options */
> +#define IMX8MP_AIPSTZ_MPL              (1 << 0)
> +#define IMX8MP_AIPSTZ_MTW              (1 << 1)
> +#define IMX8MP_AIPSTZ_MTR              (1 << 2)
> +#define IMX8MP_AIPSTZ_MBW              (1 << 3)
> +
> +/* peripheral configuration options */
> +#define IMX8MP_AIPSTZ_TP               (1 << 0)
> +#define IMX8MP_AIPSTZ_WP               (1 << 1)
> +#define IMX8MP_AIPSTZ_SP               (1 << 2)
> +#define IMX8MP_AIPSTZ_BW               (1 << 3)
> +
> +/* master ID definitions */
> +#define IMX8MP_AIPSTZ_EDMA             0 /* AUDIOMIX EDMA */
> +#define IMX8MP_AIPSTZ_CA53             1 /* Cortex-A53 cluster */
> +#define IMX8MP_AIPSTZ_SDMA2            3 /* AUDIOMIX SDMA2 */
> +#define IMX8MP_AIPSTZ_SDMA3            3 /* AUDIOMIX SDMA3 */
> +#define IMX8MP_AIPSTZ_HIFI4            5 /* HIFI4 DSP */
> +#define IMX8MP_AIPSTZ_CM7              6 /* Cortex-M7 */
> +
> +#endif /* __IMX8MP_AIPSTZ_H */
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 307e1671eccf..9b550f225856 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/thermal/thermal.h>
>
> +#include "imx8mp-aipstz.h"
>  #include "imx8mp-pinfunc.h"
>
>  / {
> --
> 2.34.1
>
>
