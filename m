Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA85529AAE9
	for <imx@lists.linux.dev>; Fri, 23 May 2025 19:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027202; cv=none; b=opi8RIzLWcLzc0trqMst2bMapdovLPEQk8lr9eRwS9JtDhLgg/7ykPYUhPyvtz4HMb5bI5LPrZ0UUfqcZLD85f4Aw1l/yfKWTIgHw9Oga0kHyKWoAd8NWEt/hwry8Or3/DmSfDoX0G2mHmIa+ybLmtuirMBZJ1bhiTyAEJQpK2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027202; c=relaxed/simple;
	bh=XbQh1rno9v252j+9q8IevNN++8cYBYE8SzPCIaQepM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U7qB+Uo9VBfvm18D6Kowav57V9BC56e037xpWZlAYBxDYMDJvv6QTJ3K65KpyxfCtwoOa4s8AUm+1tjKOwswtVfZBMLHxM5fPdYgqkgnXEKYblTmm0mLnLn5aDBxwo6rPhy7RUiCJLaB71ztLljBF9RQdvkv95as30BFOuXzw4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPOSr8sc; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPOSr8sc"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54d6f933152so281077e87.1
        for <imx@lists.linux.dev>; Fri, 23 May 2025 12:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748027198; x=1748631998; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VS0A7f4cZPS7BRx076fCSjrBX3EzmckOUBCVUWvGfQY=;
        b=YPOSr8sc24yZnW5wpamOQnS/44JXcGtwQqcrR+mbCLaA7TjLmmfa+AxtpzSU/r6xTs
         8O2SwfYFYhaY/4P+AZGmPFw167gQw7qQ8xx8ZweLx7jZXEZv/mpFNeM6fsquJ2luADBU
         6AcwJ8yQ51rtlBEEaw/7RN+99pZFfCo3gcW35rBuL2VQqu7eQxXJBahoik5mjeEveDLM
         8J4lwTQDVUTjEakVzsApGsFSxgSSiYUf6bAJsZHlTeP32SVdAwJYaXvydarcoWY33Qco
         yJUyML3ExRumyDZZRcPGuCyvgU/pQaJo99EJzOyx7LZ3x2QVLqoeWPxDr9ZtFimTJy4S
         x8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748027198; x=1748631998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VS0A7f4cZPS7BRx076fCSjrBX3EzmckOUBCVUWvGfQY=;
        b=UZE0k32OkDiXlHGV4qL9eQnowtsg57Pw6AaJIkYx1gWh4h3QkLnDMNLolfp73uHrxh
         M9eI4QjzSRV2EJPkzgDJN4USSD6vclRKXDrqewtdZ8iSAcfv+7fgUXZIPVt2yICKNXsI
         1fYN+DttYA8lasfMAf61GCaHQXSfWJxAXVW/ZqoiAqScLEkzX7mmS1ssbDgAqvnXmk4a
         NuSstlkwPsx0sPy6YXZjVJ6zthSWs+Rm+PhpB1DZXK9A2VK+g3791djOprseIsbXmQB4
         WZ9+DHr/n9REKLQG1dT9z5gCN2ZGpfKad1qFJ3QiyJmur0BkP9cdu4+75hiRybytKGjQ
         GG4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoiRfJNrgyBSNmC6N8oXhuwfX6DyqjllyGo2a9bi0gufhga+6PnCiZaoVi/2Kl6chjOus=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywxx5wB9OBIQPgrSx96t/63s/QrRayokYoYkO0Slqg7uP56DLDN
	IGb5Yg4j8+QIHPnQmfEMsZ6qIxI70pBSL3Ui+EPSz8AoO7/5rUYIrZ3rBSYjPQgR9TFSBk39m/c
	QBHMrNaiMMmLlXaOY7JMNwz+VIpVfH9Y=
X-Gm-Gg: ASbGncuQ8618vLtePVUebHHqd7+zBobCUrvjHZncA7dgm1IIeNKhdmG5Jcnu5206a1X
	rtt/yhgKg92soPUWmKDqs7TSIrkVNFjD26KKRBEvVyk3kBpu82SkFdZ1JeK+6Hdh9qzTTOdgOA4
	dxtlfdfYvgBGtPIxo/lkWLZSiNZlWhAtcVMbx8/DHxNSzI8mv7OAqguX8gFwdkJcUraSeha3POF
	F0=
X-Google-Smtp-Source: AGHT+IETmeJkocuRxzffEQVOPnq+Mvm4DCm90i9IzQsKc/gpILBub7RZRta81dz6khIpq2Bq9LX8qd/CQIQnEMrf0do=
X-Received: by 2002:a05:6512:3e07:b0:552:1c32:9ce7 with SMTP id
 2adb3069b0e04-5521cba96f8mr174230e87.35.1748027197619; Fri, 23 May 2025
 12:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250523-fpg-nxp-imx93-frdm-v1-0-546b2d342855@pengutronix.de> <20250523-fpg-nxp-imx93-frdm-v1-1-546b2d342855@pengutronix.de>
In-Reply-To: <20250523-fpg-nxp-imx93-frdm-v1-1-546b2d342855@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 23 May 2025 16:06:24 -0300
X-Gm-Features: AX0GCFsnj4NlCC9trwiG2lT4T5M7HQnFlcG-GgfTv8N9bFCYaGXgR6BHfTt3N-k
Message-ID: <CAOMZO5AP_ySh70S6sAKwKAqPypT07AdJdnkCZ55xPPRwY9nY-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: freescale: add support for NXP i.MX93 FRDM
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabian,

For arm64 dts files, the Subject should have the following format:

arm64: dts: xxxxx

On Fri, May 23, 2025 at 3:17=E2=80=AFPM Fabian Pflug <f.pflug@pengutronix.d=
e> wrote:

> +       reg_vdd_12v: regulator-vdd-12v {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "reg_vdd_12v";
> +               regulator-min-microvolt =3D <12000000>;
> +               regulator-max-microvolt =3D <12000000>;
> +               gpio =3D <&pcal6524 14 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;

There is no consumer of this regulator.

> +
> +                       buck4: BUCK4{

Missing space before {

> +                       buck5: BUCK5{

Ditto.

> +&usdhc2 {
> +       pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sle=
ep";
> +       pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +       pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +       pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +       pinctrl-3 =3D <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_slee=
p>;
> +       cd-gpios =3D <&gpio3 00 GPIO_ACTIVE_LOW>;
> +       vmmc-supply =3D <&reg_usdhc2_vmmc>;
> +       bus-width =3D <4>;
> +       status =3D "okay";
> +       no-sdio;
> +       no-mmc;

What do you think about adding aliases for the usdhc and rtc nodes?
