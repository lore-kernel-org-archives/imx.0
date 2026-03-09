Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2445F2D6401
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773045573; cv=pass; b=ZfmLEF2ry8ivXQo+txRlLm2oQReuTEyUnz4EhndSlO4ZI1hQbdQ47EpYxPTOhPYgeOk4Irx1RI2BPr/F2y/aJXo/Ys1IhyBcBuFXDTN7TrpYGzZCuwKKaA4isjsXQQ0f9XOrmaJ1hC0bcPcPc/G8lOOiYiLqc5kYANxtcXvAqSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773045573; c=relaxed/simple;
	bh=pzNX+cWDDQA86LAQdSxpqzsIgb54XY76hGtWsx5y8tU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIpCy/18mXsSamm/1XIglQWGWxZor9TIv/c+/PvY6i1llJRXL8J2TQtOLMNCSAZ7xui+KVmqZvAo64oJEUWxqJP2AISLP32jDJquGrsZWytYfGQei2Y6kx+2Ktrp60fYewrgOaHHnj1mANsnIbDU55fe1p79OCiEGA1H2fiWaeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekcly3Va; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekcly3Va"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-661f8ea8a2bso2760055a12.0
        for <imx@lists.linux.dev>; Mon, 09 Mar 2026 01:39:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773045569; cv=none;
        d=google.com; s=arc-20240605;
        b=CUGLMz1bMaVc7pAtJEvJcD4j7cMcvR9Y8A1KB9HS8wZLWSX2wkcE+H8o41YgKWx0Jt
         3S8+hMqxYrHVSWk9ekM4hp+9N75ezoh7GD7K9RelcfDPRXUSzl5GR3+zYbhFQN0ErxLQ
         KU/q4PNTy7J+DjnJHUQpOixjXKGjTU4kJcVL+O72ARAnCi0ra73/k5cMsH4Dzv7fhKZ9
         RcpJ9Yr4zyUpZYZHC1+4DXzI4J9mIQCe11UB6Fzhy4ZmZEYlgEzAz9yo25IzNoFx3H6H
         4N+uUIcxEPzlbWnG6PRmN9U6IGl2/ixAQifh8yy73R4bmb8lFY8765pn3kPdZQW2/2XW
         QocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i2ApLkjRL2QedGmp1n+UDf2va/yjoghU9uSXBLC6UBk=;
        fh=4m0LDMQwuFFIIo9KbmTiPanh9khAMC9OzxO1kXh28ew=;
        b=V/Qi4wouNQGZbsKd0ysx9TCSj92Lem0JWM9maKOZNgzBy7l/AMYZ7Yolc9IKlM8IA0
         IXWUeiVbA8v3/UnLhwAjojE4a9vyS7q+R/l62OtlyRJiM99UBp74c5T8HxtzIZH+YhCL
         RwcFhk7eY4K/pp1+i26AdS5Alto4NITa1XacvRGy1FgF3Yw4K54YloUuMsmDo39akcbd
         x978zQVDR/VHDEYXoGvh9ecTcwTmkzC3fq85rwZJG3dttw6N6UR0nE5YwefNDmZ3d68e
         zoAGpO0bkWiN1eWp4P0cA1ay8s64jL+ntacyQuAAPPZnzvc0mV51/gbrPXVr2tDlRERf
         DI6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773045569; x=1773650369; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i2ApLkjRL2QedGmp1n+UDf2va/yjoghU9uSXBLC6UBk=;
        b=ekcly3VaLbhyL363jobYCi0q7lWskQoajCt0iQ1Fy4bG4bP9m03zo7gi8ConxPFko3
         aAjexIQTuMscAi4iC+Lw05oRDSis5bZK6hDNbF45+DX8MNAoqvZVeEeq7oiMn1NMf38f
         zCRZBmJLOIpNv6f1nBHTnFyluIGfGvrtJ1/94JrH4WXZxxqtv2J3/LbeInyMcVJbC5zx
         pGq2VXuJjaIKd79pufPoWH6TwB2vXws/gwf56GSBiuon6X9qMYPdmWaEsylnxF9/hKIb
         6LvbCtEjLhi2c7XWZtPYp0p+4NyMryRbMDVoT02iMJvtNJbWhxpMFvQPAY6wAsDeOWT3
         R1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773045569; x=1773650369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2ApLkjRL2QedGmp1n+UDf2va/yjoghU9uSXBLC6UBk=;
        b=Xl4B1Tp349TM/+by0UTD2vRQm4rSWhsvCcGqC7ZmnZIQVbth4POG43bMLFnFJVA18o
         ZaYOG1YbfhN8t+6Krh7lQGhYvzRGIDuDN4P0+rt5ZHtMp7ShMmS+C16knO4WjkQe/Mwi
         RjQYzwzxn2jLo3cbhoiI+qjbRIomHHxc0OluE6qVezzPnGGIVP56ONDWyRIqPbhX/x6s
         adbqO3qqzCF/iAfmqwUWTsjrNv3ltC3gTfcWwIkYGVbaue8QylV/G6x6u2htY4EO+VJF
         bO5y7+ytQXVRnnM7lNuBNcUl7ta+CPG37WkLrhVPXZ8fX5EBQBIM+SvmlypEGPN694ly
         bzeA==
X-Forwarded-Encrypted: i=1; AJvYcCXXj/SQClR8wOmcdhbPs7pgBrRf8OaF2B/hkhiq0B8W6U9NQGLwv4jUb7y+Cz4HSWKgvpI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGygcVNht64lmDImvjwVPyOUyTMvfzKV0jN6Pu2Wx/1/qahyKm
	ekQyJQAJXRmzcHVhB9wVGxG8H9APfSMD6ZKNTmmQa3gxGlOxIwUvt2gzv2X8NwVOackn5XNv05U
	h82seWXorDpC224Yj5RP87qlIo6cdCVU=
X-Gm-Gg: ATEYQzyq6hXsT/4ef0uBVPef81ZAWiLm9bfbiSwWNooD2+c1BmL9tKtt1dCiKHlyzy4
	7alv12xKxBPZIqlvBIGS7QSX/YJaxjYcsCLkrBoY9qfvgAboLhHrC48VMEiD8B5Qtxt3syTjTHI
	HI/1BgJRxUoMTJKDztI1lWKJcyvJxMbJvVNCu27hgGbq9TdCbmkfnM4lZk6VR8aE4y/70njJKYK
	4EXlmDVeZoi9at9nTaPHeMJT0m1PfUnw8ZGbfJyu9N6g/hVoidbYhRLqrU5Lrxvr7NlTZcy4CsQ
	lEu55VHFF0Y7+lTB6oEBXZTAib2xwusNkYcl2vX0VzJm6uZDg7OgLePSCtuZcPqIhBUd0VfaUpU
	FOLieNTILOQJh28Dm2lTRgqhOODevP3Fc6vEQFt4feIY6k4bM
X-Received: by 2002:a05:6402:1452:b0:660:b590:f4c7 with SMTP id
 4fb4d7f45d1cf-6619d45653dmr5529486a12.4.1773045569245; Mon, 09 Mar 2026
 01:39:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260306203103.3119790-1-robh@kernel.org>
In-Reply-To: <20260306203103.3119790-1-robh@kernel.org>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Mon, 9 Mar 2026 08:39:17 +0000
X-Gm-Features: AaiRm50fyrrjHlS8KQdRyNVWL8F5ziJnajJaVmMSS-XtEGWkK0fYH3J1bfJuGuM
Message-ID: <CALeDE9PuXTiyxkgB3OTUS1d6bJ_LSCjOSztUBFmNPuTQg-oR_Q@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: freescale: imx93: Add Ethos-U65 NPU and
 SRAM nodes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Forrest Shi <xuelin.shi@nxp.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Mar 2026 at 20:31, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> i.MX93 contains an Arm Ethos-U65 NPU. The NPU uses the internal SRAM for
> temporary buffers. The SRAM is larger than 96KB, but that is all that is
> available to non-secure world.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Peter Robinson <pbrobinson@gmail.com>
Tested-by: Peter Robinson <pbrobinson@gmail.com> # Tested on a NXP
i.MX93 11X11 FRDM board

> ---
> v2:
>  - Increase the APB freq to 133MHz
> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> index 7b27012dfcb5..95cc60158349 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -43,6 +43,29 @@ map0 {
>                         };
>                 };
>         };
> +
> +       sram: sram@20480000 {
> +               compatible = "mmio-sram";
> +               reg = <0x0 0x20480000 0x0 0x18000>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x0 0x20480000 0x18000>;
> +       };
> +
> +       soc@0 {
> +               npu@4a900000 {
> +                       compatible = "fsl,imx93-npu", "arm,ethos-u65";
> +                       reg = <0x4a900000 0x1000>;
> +                       interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
> +                       power-domains = <&mlmix>;
> +                       clocks = <&clk IMX93_CLK_ML>, <&clk IMX93_CLK_ML_APB>;
> +                       clock-names = "core", "apb";
> +                       sram = <&sram>;
> +                       assigned-clocks = <&clk IMX93_CLK_ML>, <&clk IMX93_CLK_ML_APB>;
> +                       assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>, <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
> +                       assigned-clock-rates = <800000000>, <133000000>;
> +               };
> +       };
>  };
>
>  &aips1 {
> --
> 2.51.0
>
