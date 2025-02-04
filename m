Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A7221ADBC
	for <imx@lists.linux.dev>; Tue,  4 Feb 2025 22:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738706484; cv=none; b=vABEGFnjnj2MlMW4KR5wer7/JaYd+zOPE3x/ucbqxCmGCS3bRWGJY/DFej4Xd59dmrkgn8t6kl9cZsNa17yVhNupc7FdSqoC/gcMbKr2etMf2cKGNA11X6LEXYB/f+eEczkHd5J30JV4WIM9OcozB2W+oyetnnAPDAlFmsdoI44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738706484; c=relaxed/simple;
	bh=QvU8klhcVAB4pIDF5hcsxZXINi7/FjW1XB9K3HLFZS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DWcKuXm9URFmGmWBOuW5qvsG985fJhoTSbxQE8JxWqIDrKfh96et+rVQu6o99ZVzrwYs5toowKYyEd81/XH5p7PAE9/53Ou3tzF/o0NL+bPSiXUtbiUtOOivxLgTs0tYyILzeqZMSPNQ0kipu7qVMUoFwtlEIwfAjRXgeYeVNd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cpLt/zxJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cpLt/zxJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so3239570f8f.2
        for <imx@lists.linux.dev>; Tue, 04 Feb 2025 14:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738706480; x=1739311280; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m0euMmWW3W4gbBbbGvtG/KEphctlcqiae/5nCmYv5wY=;
        b=cpLt/zxJl2VPe7ZXl8PHwwm+H/VRjCREGqQRK8wnBAEhyEqrBmYflYtSNVXlCDZVoR
         0ks9/O610lAKwDdLSL+w74IQ1qLKSmOZoSCthz1lNU+HgJ0+eg400+nJPNAQB6V32BUM
         oos6KM5/XzBf9z/KnMVbqQoE0PwO4SvDXMx8WK5piu83nyTkb1oH3mBBnZHz1jlq3uJJ
         pW0RSfvhGKT3WepWsxLGxcZ/MIMIFmdKCr/50gbdTj2nkSJNYSh66VElHjpR8C+UB6Nk
         hsBwmBurQX7hK3eqhYlNsq0nR2rl1eeSP0FmnxmH6eABfE0Qm1bRRUont2klrfCSQ7Cw
         +Dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738706480; x=1739311280;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0euMmWW3W4gbBbbGvtG/KEphctlcqiae/5nCmYv5wY=;
        b=UUNvAzmVhgVcg2FdG34F/B6WCz6akGVHfGVjz26wYHZ1zCnFsL12tBD1/ILCGKLiuT
         JpS9Ry34by/o5JytnN+PnYGbrMuNa4n8Cvxy1iUh0IoU4MK3nMokWrOtzSy4PgfiecJB
         S2oR85ItTrOQFVJckdiR6eF2BYwZLNYg24x9kgZhwBSL5HBM7MrkUu2QwyOH+VLcb7D9
         H7e+FvyZC81tAoyFXXK18YHOph9Hd3EbJPBXjz4h9LWXr2lSaM8ydnb9OnYF9C7FwyG3
         tbMGgBWXbyyu3We9T64aOrF6ZxjIRLH3cVGQre+F9GW5uxB5mIuXykftlWuAdXOKjz7I
         qZ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYwZFfqj3i4X1SXZt9f/cvMMM6pgideyHyEXb5qCx7dC/55/IRzq3qYvSklhRHqltknNw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxqKXKcwhWk67OYvVI0LbpFfrjkoDdt4HfBw82qMOU8cR/QJfOO
	3JXwHnn5KurCAFfnqO1WNrVbZqsde+Ew/r7K4E93jSbAvOtnhTgtYh68X509atY=
X-Gm-Gg: ASbGncvhWXj0s57KQyN+jVV6gR9ezEndbV34eRxak7VjdEcy9ULH5rw1C4JfEQWA0t4
	BeShgR7EonjAQ99dH2ryVH85BrW5Yrq5nWzjmpz1SJ+vbShaPDE9q5y7LG+G9l+FqXfOcqC+1jk
	1HD+2fsoMWdJMCXOqGGggIqXJ4EF/d73Z+2ipIUj3JTbyP6xkjPLg66qWtCCRSu6xaNuFdHVatk
	MjlDqo/hjYEAQEoDFk9ExB9lPnC1ctTmCRaC4SocsiqNRADAWkqr0RgiZ6u43fRMfg4OemqMFse
	nc1ZS7gQxok2
X-Google-Smtp-Source: AGHT+IHT6mDWYjThIgJPbxWuWwVfspo5pZ+HAD2rIjTlsbMjzXUQcvPr2K6h/1mHjtrkSJ+dLDi9aw==
X-Received: by 2002:a05:6000:144e:b0:38d:a696:6ef6 with SMTP id ffacd0b85a97d-38db490f01cmr271920f8f.45.1738706480503;
        Tue, 04 Feb 2025 14:01:20 -0800 (PST)
Received: from [192.168.2.177] ([81.0.8.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dab853236sm2956583f8f.54.2025.02.04.14.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 14:01:20 -0800 (PST)
Message-ID: <68153618-d54a-4465-9fb2-a1232a8291d9@suse.com>
Date: Tue, 4 Feb 2025 23:01:18 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] arm64: dts: s32g: add I2C[0..2] support for s32g2
 and s32g3
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>
References: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
 <20250113110512.506007-2-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20250113110512.506007-2-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/01/2025 12:05, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add I2C[0..2] for S32G2 and S32G3 SoCs.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/freescale/s32g2.dtsi | 55 ++++++++++++++++++++++
>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 60 ++++++++++++++++++++++++
>   2 files changed, 115 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index 7be430b78c83..beae4d5cf54e 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -333,6 +333,39 @@ uart1: serial@401cc000 {
>   			status = "disabled";
>   		};
>   
> +		i2c0: i2c@401e4000 {
> +			compatible = "nxp,s32g2-i2c";
> +			reg = <0x401e4000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@401e8000 {
> +			compatible = "nxp,s32g2-i2c";
> +			reg = <0x401e8000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@401ec000 {
> +			compatible = "nxp,s32g2-i2c";
> +			reg = <0x401ec000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
>   		uart2: serial@402bc000 {
>   			compatible = "nxp,s32g2-linflexuart",
>   				     "fsl,s32v234-linflexuart";
> @@ -341,6 +374,28 @@ uart2: serial@402bc000 {
>   			status = "disabled";
>   		};
>   
> +		i2c3: i2c@402d8000 {
> +			compatible = "nxp,s32g2-i2c";
> +			reg = <0x402d8000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@402dc000 {
> +			compatible = "nxp,s32g2-i2c";
> +			reg = <0x402dc000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
>   		usdhc0: mmc@402f0000 {
>   			compatible = "nxp,s32g2-usdhc";
>   			reg = <0x402f0000 0x1000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index 6c572ffe37ca..79b38cd8b142 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -390,6 +390,42 @@ uart1: serial@401cc000 {
>   			status = "disabled";
>   		};
>   
> +		i2c0: i2c@401e4000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			reg = <0x401e4000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@401e8000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			reg = <0x401e8000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@401ec000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			reg = <0x401ec000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
>   		uart2: serial@402bc000 {
>   			compatible = "nxp,s32g3-linflexuart",
>   				     "fsl,s32v234-linflexuart";
> @@ -398,6 +434,30 @@ uart2: serial@402bc000 {
>   			status = "disabled";
>   		};
>   
> +		i2c3: i2c@402d8000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			reg = <0x402d8000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@402dc000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			reg = <0x402dc000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
>   		usdhc0: mmc@402f0000 {
>   			compatible = "nxp,s32g3-usdhc",
>   				     "nxp,s32g2-usdhc";

