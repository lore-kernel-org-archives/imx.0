Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674090;
	b=jGi/K4XWlM92k0C/f6E4xsJJNAbj3cBGWe0cGr2pa2wF/gTQVt3F+fsu1glbgmf9IG6O
	 8k/1Ip+zjMUBcTXUzGLrQOwtiHRbiiHnSra1Q8pR59D/zRjMHmii+FAEp1l9jtLmRaZsK
	 Z0eJ2ROxg22O0g822ccd2L2PL1lMlYdLf5mvgLqjvEvrUDHQOeP3bXURL7ToVK1lhrPf9
	 THw9YX+P9wy+Ip5z4TwFpmH43fj1sGWUlW3ZrIbHiipBg3PKH/1NI6/j3u326m6DsuWeV
	 fDYxl7nphf8+YVl01AsteOMTAPkbvDDXgEVFYXUdDD3MDCJw/ZFbCcNVGBeF9Bhybbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8aJ+ZgjrOzJ2MQ0XsYDbjZR4GMqieJUK4jmHnZipazA=;
	b=RZllp3GMpPtu+faTrCDca2idx2fdKP7B3IfzJiCPtzg2Un/wuCh9ufNcIsMO/XHAI8Ol
	 KI+dGt+sU2eAYwPUTVkmC1P7/93IVjDWi5jCvJ5WF/X+dTNizPrnnkDZMISFucO376Ego
	 S0lxtr6Peiav/k0geIvewc7EOzon57dyoqPCkznNX2IxV9PQsYlUUJLu616+q//XIBKr0
	 MOHLwP7T++4m3oB6U4WutUQ4BcwjyzTygw9tUrJh4W2L1co/VyFWvN+tWs0Yp8I0Nl4yH
	 gRbaYNHsHOEnN+ni2sQnkg8FuvSMGZRDmY85UYF6U3jtlGGmSc3xD79sP0Y9S0ZKxPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m2QgZocI;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D920F606A31E
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 13:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D920F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m2QgZocI
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so5749795e9.2
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 06:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792674088; x=1793278888; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8aJ+ZgjrOzJ2MQ0XsYDbjZR4GMqieJUK4jmHnZipazA=;
        b=m2QgZocIj+y7MXxLUncJJ/rGb9Z2AlYzh2SLiBBOk2IZrM9++fYl00mUjjAItR8kEf
         jEzPbWNJEjZSAd30scwJRl47V5CBo45wYTlsfzY/IfrcM7o90fth31E8+9SkVgmZSczo
         uQJ0OBNWp875dBvgy0f5nUlMyMzp4NxJUIHVFF+AE0IKjvkWmVqzXgOBgAYAVHUYQC7A
         TlOFG+Jqa7ke4V7Sh6Udg/VZNT3voS2cqatHvMrDMGWzixxp7hHgkuXKSXtUMsGVkTN7
         laC9y7hlFLP3huUzjXLLMfEAn4dkyFb7/E9vIj8vYhnMUQqAXjcQEhYu7NoGo1pChKdw
         iYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792674088; x=1793278888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aJ+ZgjrOzJ2MQ0XsYDbjZR4GMqieJUK4jmHnZipazA=;
        b=tFfWCm6LmFzKiz2SmWd02lSCl//FNEUTdKeD9FqbDvJ3LHCt2gg1RJeeOTjd9zxX+j
         RdegsgWG2MLY3+zQqahchC7SyZ0YrggGGK1z7AL+oqcII/kkeOok9bfKie2b8zkSWsAU
         mAxKycwCwq9yzto50hcu2TBtvhbQojoWtzSXAbV4oaYg7rt5Nj82892WjexE33IxlJtR
         1ki1txfOtY5kzJC/7QbsRXnHf0Uv8dAeMtIaWsd+yXlF0ICLzspDBYoc8RZKZOJvuzrB
         +/Cvc73KbAeRxeNT4zfMG22HetjIVg38NALOvYsIkNMfhrDVLQ1rekG9PKEyotMDskoy
         ce1Q==
X-Gm-Message-State: AFq9FYKN1HmwldeSpYOXEXyp9u0iCc0tEwEwUmfhgD6+H5JxWBoCaUsK
	qjrIz57vhOJd7A7/3cDW/hHmFrZgxMboLEdb7oFg/ErsBuoLZ3LhW7u6
X-Gm-Gg: AYBFou2R/muD/zRftExHyqIKboSMMN9iASW/bg/ysM29OVeeZQLtdN9hbhHZVNlePJy
	K///qoVWZF4N2j19NwUM0O6Ep+bJyio5J4um/e8JTHoyFBEjHJ1IjYOuG104mdlso3ccyo1t1nE
	t3lrR3FP4+OgqjFh/YJy8IX+dfMX7O3AXwK9LMC29UK9PALFik0GzaIfLSyQYBR9qQIjc/6DOEj
	2l1FZLqTaS1SamcmBDp3AiQ80Zu4rsqKxc3P842nInhKY9aK6rtJI1QcK72pszUwhK25ZE+ZeD6
	EtBS3rlMdmaSzhd8iEsqlfrmnTUKczNVoFoHwHGyoBepBoa9lDZGXzRISaKPZSleDbPH6+rErrP
	o+yRvjGusjJndnkS8s4n6mXnROaUd+PFXeD2bfwr1IfXEY1ePoJaR0odCtGzm08O4Tn4dDPCRYn
	JT36d+EvmKpqekUiU5KdXWBUzn4c+YKRnzZCrLC8wA2SsPnQ1//Rk/NK2S7YxzRRJm5AndFDpQJ
	vjdR8VW6HW77ZeC8XJsK8Vrr3H0SAA9Nsl01t+CjuMyVcX2xCrC66oAmd5fxl7/SUZXU/mck2Bn
	TYCiWD2ZJEgq9Ga3GVMDUsWtDm9WFHQlUo4Br5F2+X1XNIuuTERtimg=
X-Received: by 2002:a05:600c:3548:b0:4a1:e774:370c with SMTP id 5b1f17b1804b1-4a1fdd145edmr104588835e9.30.1792674085847;
        Thu, 22 Oct 2026 06:01:25 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc1066cfsm116512435e9.1.2026.10.22.06.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:01:25 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:01:23 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 1/3] arm64: dts: freescale: imx8-apalis: Add NAU8822
 Bridge Tied Load
Message-ID: <3hd6y6f2lb73mrz2xi5pgsgzvahzmsmktfbyx7n7uewmobk22i@encqv6tasfzo>
References: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
 <20261001-v1-apalis-colibri-imx8-dtsos-v1-1-21881dc324c1@toradex.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-v1-apalis-colibri-imx8-dtsos-v1-1-21881dc324c1@toradex.com>

On Thu, Oct 01, 2026 at 10:43:10AM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> The NAU8822 on the Apalis Evaluation Board V1.2 can combine its two
> loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
> select this mode when using the board with the Apalis iMX8.
> 
> The overlay is also combined with the Apalis iMX8QM V1.1 on Evaluation
> Board V1.2 device tree to provide a ready-to-use DTB. The codec and its
> routing are already described by the carrier device tree.
> 
> The overlay supports both Apalis iMX8QP and iMX8QM modules.
> 
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile                    |  6 ++++++
>  .../dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso  | 15 +++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 9971b34f7301..2732b223eb3d 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -801,13 +801,19 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
>  imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33-dtbs += imx8mq-tqma8mq-mba8mx.dtb imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb
>  
> +dtb-$(CONFIG_ARCH_MXC) += imx8-apalis-eval-v1.2-nau8822-btl.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval-v1.2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-ixora-v1.1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
> +
> +imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl-dtbs := imx8qm-apalis-v1.1-eval-v1.2.dtb \
> +	imx8-apalis-eval-v1.2-nau8822-btl.dtbo
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-tqma8qm-mba8x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-var-som-symphony.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso
> new file mode 100644
> index 000000000000..b2f9c43d29cd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Enable Bridge Tied Load (BTL) speaker mode on the Apalis Evaluation
> + * Board V1.2, combining the two loudspeaker outputs for higher output
> + * power.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&nau8822_1a {
> +	nuvoton,spk-btl;
> +};
> 
> -- 
> 2.43.0
> 

Hi Frank,

Patch 1/3 (imx8-apalis: Add NAU8822 Bridge Tied Load) is superseded by
the shared NAU8822 BTL overlay series:
https://lore.kernel.org/all/20261022-imx-nau8822-btl-v2-3-b4221ed43650@toradex.com/

Patches 2/3 and 3/3 are unchanged and still apply to imx/dt64 without
patch 1.

Best regards,
Ernest

