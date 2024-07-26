Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735A528DCC
	for <imx@lists.linux.dev>; Fri, 26 Jul 2024 16:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722012844; cv=none; b=lS7enQ+kAg0NC88WtDEOLp2nbg1my1eM3fjLgKuNee1RoGJbUYW2trfq+YjDG4Qz6o5kI0P+c5rHTCSrRX5qDTpb4z8C2HphzHSsGHBHnEbWjKOsNpACtWD+tctcV0NIa2QnLCZ6vAZwZLFUTKynlyTsEJc8LRB6IMQButmyzG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722012844; c=relaxed/simple;
	bh=dmddLWBN/JJSgxlPY/uX+nnH5tiexKBnmTEPaTfOGJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KoP6aJaXkRrlCjpZG3Ji+IAsCdlkZG4tFHuK2c0DHjSkHFS5rrh1nMeidYer9Yp7zrPbbkGxNfvWP/EKV3nMRNzwyuESakJW7V+nmFmcD0Vr8sc9uaogWFie33dZaUeU0JsVq9ANbU5cj+FRzLdV2sDKRM//hCXrZuWvnohWMLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K1Eo2vss; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K1Eo2vss"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42808071810so14790625e9.1
        for <imx@lists.linux.dev>; Fri, 26 Jul 2024 09:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722012840; x=1722617640; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lyBUB0VjQodyh7/g5kyro/B0sHtxliR680HpWSHx5x4=;
        b=K1Eo2vssnwQSRH2DWh7IzqVXDemhgbQ0VZx8xWxmfX5oDGmrqX15ccmLY4GICnMUlc
         uhQBonwNMG297mwyEflLMGVO7E2uTe25/84hhMmc/e7R6GeEizCH/Tiew+DkrwMYg3SE
         yp9qfBkdoo7lvk980V7V+JfDqNjiI92Xd+RvfUjWot8kLuKXd/CLCyF0mo9JNCt9FqKW
         bRFJUWLV0JbqPHit0/MNMVFJgR0Pee18wOw84GEwCpkyKHODsHVs9KcBcZ+p6ziZCpii
         77WZQkSsick80HqYcnZ0I8IKv/ZXWfg+QavQITfDmwLymND2ZBNFnMNU1hdhzYVprF55
         iOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722012840; x=1722617640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyBUB0VjQodyh7/g5kyro/B0sHtxliR680HpWSHx5x4=;
        b=O9vSJlNQ1yegEJkEWKStEXlTLVKwcxvP7M0vK2UK/2i+54PtBS7h8QinzIzP7ArCfn
         dTT/shMCjXYIjP5ulaUZidxuJedj1EcmyUSN783RUq1qEDv0MmBj/UaLBVNtoAsW3yZG
         +1XS3ZuqJ8BFdc5j9Uz87QW1SwB1oH4LMiCbhBAA0ojKHWsdaK7TB8Q0CxYFM6rf6hWM
         jGjjabpT9PP/4wWyYBZ5vauV/aF29VOLJosNoac9lsOLp+AcTdFzDtHg6vJp03xRBVrm
         NSYlkXVBGOoFadkJe4MG3gN2cWqUIkUYw8Mc8F/wJG+PkPAv34pEfjTMgEJrDtLpX2DD
         X4cg==
X-Forwarded-Encrypted: i=1; AJvYcCVCyZJeI+EI+6Whp+wF38PDKBO+i58TpF76qj5KyDKSgKn7EkObxB2TSKjW0wDiySC5mOXphQgfdjvfgzG5QR+MANL/
X-Gm-Message-State: AOJu0Ywr7cpxR+fNr6QVE7fns0BheEFGXf/0ncgnvqlhYp8fKWiO6Uz/
	h5zoagYpsSK8g2BoyOtztzgbdEu99RDychG5/GzXr9/po3S6SFNiuaMQPTQV8WA=
X-Google-Smtp-Source: AGHT+IGpGw0WiufgY26+n/F7oToSP+bfbqFIHW3rW6u4ArhcoqZorHULtO/EvyMqvgVFTdS12d7ILA==
X-Received: by 2002:a05:600c:6c4c:b0:426:5f06:5462 with SMTP id 5b1f17b1804b1-42811e422e4mr1002575e9.37.1722012839726;
        Fri, 26 Jul 2024 09:53:59 -0700 (PDT)
Received: from [192.168.0.32] ([47.62.239.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f9372e99sm125436245e9.16.2024.07.26.09.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 09:53:59 -0700 (PDT)
Message-ID: <f135b3ef-a846-4166-93ae-d5c40eee59fb@suse.com>
Date: Fri, 26 Jul 2024 18:53:57 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: s32g: add the pinctrl node
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
 Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux Team <s32@nxp.com>
References: <20240724132415.1700386-1-andrei.stefanescu@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20240724132415.1700386-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/2024 15:24, Andrei Stefanescu wrote:
> Add the pinctrl node in the device tree in order to enable the
> S32G2/S32G3 pinctrl driver to probe.
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
> V2 -> V1: moved the pinctrl node before the uart1 one to sort based
> 	  on the reg value, removed the status property, renamed the
> 	  jtag_pins node and jtag_grp* subnodes
> 
>   arch/arm64/boot/dts/freescale/s32g2.dtsi | 50 +++++++++++++++++++++++
>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 52 +++++++++++++++++++++++-
>   2 files changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index fc19ae2e8d3b..fa054bfe7d5c 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -114,6 +114,56 @@ soc@0 {
>   		#size-cells = <1>;
>   		ranges = <0 0 0 0x80000000>;
>   
> +		pinctrl: pinctrl@4009c240 {
> +			compatible = "nxp,s32g2-siul2-pinctrl";
> +				/* MSCR0-MSCR101 registers on siul2_0 */
> +			reg = <0x4009c240 0x198>,
> +				/* MSCR112-MSCR122 registers on siul2_1 */
> +			      <0x44010400 0x2c>,
> +				/* MSCR144-MSCR190 registers on siul2_1 */
> +			      <0x44010480 0xbc>,
> +				/* IMCR0-IMCR83 registers on siul2_0 */
> +			      <0x4009ca40 0x150>,
> +				/* IMCR119-IMCR397 registers on siul2_1 */
> +			      <0x44010c1c 0x45c>,
> +				/* IMCR430-IMCR495 registers on siul2_1 */
> +			      <0x440110f8 0x108>;
> +
> +			jtag_pins: jtag-pins {
> +				jtag-grp0 {
> +					pinmux = <0x0>;
> +					input-enable;
> +					bias-pull-up;
> +					slew-rate = <166>;
> +				};
> +
> +				jtag-grp1 {
> +					pinmux = <0x11>;
> +					slew-rate = <166>;
> +				};
> +
> +				jtag-grp2 {
> +					pinmux = <0x40>;
> +					input-enable;
> +					bias-pull-down;
> +					slew-rate = <166>;
> +				};
> +
> +				jtag-grp3 {
> +					pinmux = <0x23c0>,
> +						 <0x23d0>,
> +						 <0x2320>;
> +				};
> +
> +				jtag-grp4 {
> +					pinmux = <0x51>;
> +					input-enable;
> +					bias-pull-up;
> +					slew-rate = <166>;
> +				};
> +			};
> +		};
> +
>   		uart0: serial@401c8000 {
>   			compatible = "nxp,s32g2-linflexuart",
>   				     "fsl,s32v234-linflexuart";
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index c1b08992754b..b4226a9143c8 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>   /*
> - * Copyright 2021-2023 NXP
> + * Copyright 2021-2024 NXP
>    *
>    * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>    *          Ciprian Costea <ciprianmarian.costea@nxp.com>
> @@ -171,6 +171,56 @@ soc@0 {
>   		#size-cells = <1>;
>   		ranges = <0 0 0 0x80000000>;
>   
> +		pinctrl: pinctrl@4009c240 {
> +			compatible = "nxp,s32g2-siul2-pinctrl";
> +				/* MSCR0-MSCR101 registers on siul2_0 */
> +			reg = <0x4009c240 0x198>,
> +				/* MSCR112-MSCR122 registers on siul2_1 */
> +			      <0x44010400 0x2c>,
> +				/* MSCR144-MSCR190 registers on siul2_1 */
> +			      <0x44010480 0xbc>,
> +				/* IMCR0-IMCR83 registers on siul2_0 */
> +			      <0x4009ca40 0x150>,
> +				/* IMCR119-IMCR397 registers on siul2_1 */
> +			      <0x44010c1c 0x45c>,
> +				/* IMCR430-IMCR495 registers on siul2_1 */
> +			      <0x440110f8 0x108>;
> +
> +			jtag_pins: jtag-pins {
> +				jtag-grp0 {
> +					pinmux = <0x0>;
> +					input-enable;
> +					bias-pull-up;
> +					slew-rate = <166>;
> +				};
> +
> +				jtag-grp1 {
> +					pinmux = <0x11>;
> +					slew-rate = <166>;
> +				};
> +
> +				jtag-grp2 {
> +					pinmux = <0x40>;
> +					input-enable;
> +					bias-pull-down;
> +					slew-rate = <166>;
> +				};
> +
> +				jtag-grp3 {
> +					pinmux = <0x23c0>,
> +						 <0x23d0>,
> +						 <0x2320>;
> +				};
> +
> +				jtag-grp4 {
> +					pinmux = <0x51>;
> +					input-enable;
> +					bias-pull-up;
> +					slew-rate = <166>;
> +				};
> +			};
> +		};
> +
>   		uart0: serial@401c8000 {
>   			compatible = "nxp,s32g3-linflexuart",
>   				     "fsl,s32v234-linflexuart";
