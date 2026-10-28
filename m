Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793216667;
	b=bMRZ8QQq1CR14AeqwkopEeckhH5yxtbfYLY/ngLHMYgCnis3OZPdHzXpP07pP64aFZyr
	 eB9eJwhdKCyJbaGPjXzZpuYoJIcjx9K9yzzsvoE9ZgUChgdMvTT7Ryizpgj381/+yHVSo
	 4mM686uDlJACMtFkUC1tOrzZv43wlxsDXnM8iMwREBR/3aXdkU55GTjpokBA04KpRAwY2
	 V7JezxFe6aSr4B/4sgxiYHsY5IrqV0In5yPSPw7ON1HAg30n/N/02ReBF79HgVeWLsE1/
	 lrIRwqGf7VBfdgY6+4jVs/KYNE2B0Y5K+0wxlK1j+m62DQChX+OMc//b0PqCgW1kfFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793216667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AWPweQHpDk6gsD/jh1PHflXPo0KH1KSnlzsF/PJ0brU=;
	b=hvU9MbuCkEcLzCJDfujmBRHsDF4ZqZZxB88nS+/LUskyZAJNRI/7jYSM+b03iP2gx+zQ
	 H8Ha+YQvjXAuJzOeJ5hktyDoT87/azNg3nzVok++hh33sFj/hD3552c0/0YL8z7YvVkVB
	 oW0uvVLlZmyU+lkYBeSZr2gC8azhm85JFwKEpSpS0aRSk7dSBd9WP6zFoDdZ7hulx1OTe
	 oZH+InqjYI52htuLv5pIDxZ3n2C2JFzm2xqExBHwkTT7Q1hjJ5xMj/TBgHKm6LwrrL31G
	 0/G3TOwqps5drSj6A7P7xOyU5dYG6/jx9j+XZyjBPhMZAEttYl7OaDu5ChJ4iT+ZKPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDZ5onn5;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243D0606A320
	for <imx@lists.linux.dev>; Wed, 28 Oct 2026 19:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 243D0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDZ5onn5
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afbd2c386so866731f8f.3
        for <imx@lists.linux.dev>; Wed, 28 Oct 2026 12:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793216665; x=1793821465; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWPweQHpDk6gsD/jh1PHflXPo0KH1KSnlzsF/PJ0brU=;
        b=lDZ5onn5MCcfq3rtJpm6BjA2C3bofiqR5Trd9CBt56o98C/p6xY7uytmYMl8fDfOpT
         0vcpf2XM9IsDmz/E4zig9QUtCNYIwaKlHywkBWNSZKz6mgpoNvC5Ubg1D76NQ+/H3mzT
         NnN80vgr6FyjqxHmMPYHONMnilSuNgy/epCMdrcThjhckAG/YI9rwzHIYb1mDXbHK/ko
         xkJrm+G5hAvR9JEItILFx7EHo+60MKz41UKx42BLuRgyugrgZft+XkFI+3snOdeXARvJ
         qJxfdWm8So3USH+LLtAlROil4mvlcLRnX1sk698GOSWy2ApHdiZ5xu8gN/kVBd2wqC1+
         Efpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793216665; x=1793821465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWPweQHpDk6gsD/jh1PHflXPo0KH1KSnlzsF/PJ0brU=;
        b=0bNxnvUBQiJg0nOoYDA7yH50cujZSAi8MC0tg0E/Q0G0cT2i0cjdegrbdviA5t5l8C
         KJTu/jjo2Mg9mGDpbu/HMHxDdLUT+JKNh27WK6VL5uwYGejL8TV0kgCpLML2c/rXJ0NQ
         N/0HCbt/PjCCi5h3MluJGbr3t+L0jiIdU0ROFhIlKNhzWqyn06ROg1Ea5kPvJS5fKPNp
         9RT5A9i7p47zCCyvoKDhXrOBfzb3lhgU5dx/8Z6wz4XSmMTWqfBABR1GD+f7+7aCB/nh
         vsrnErvG5wT6pmsFd1IjYBiSKyud2gfPFnfjGPrL+7Y/BzUGYoC/gtRN4VFbKaZ4o3Ea
         iA5w==
X-Forwarded-Encrypted: i=1; AKwUvBwWPf3Egv91aIE3S/OTeiePaU0m5lqOvku3muQjZ6SbJTIcHNGgbd1ivhj/YVuV/Q3oC9w=@lists.linux.dev
X-Gm-Message-State: AFq9FYJY0o3Q9/0mG1rq2xxoMeypMAyAkUARttpeqZ1g2kRPmSDWH82q
	CFudLThwJF3D0u+Cirrkfd14WJApiBIEo1+jSqvqMFAYRC7+n7fyQvCf
X-Gm-Gg: AYBFou0jBqS/C83rU2PixrhJpcJflALRTIr9fM15FdzgjZFR8eaOP5W5l3GTzA+RAly
	SXzVsCXrXO9q8ZGfsWHHxDVCrVVKg+he+ctGnxTPafye3Gv3E9XVRQRI4vjs1BRbvZJpzwhLRRB
	4U498oNFxKn3oE1tAJlKyyj8u/vM800xFbPYrhFChSCZAv1HkjcuEM2CDCkcZHg+klOBDbNKu/w
	/fr+T6z0UxrbjftZypsyJswSrzdZ1T2ExurUJaYn/alZtseoAT51tcd0FdqY0mr+r4zKo6yyove
	0AjOCo9Euf0XZyTj+ko+qYfvf/gtPJpTEX/rKueWFLW3vfsqqYycKRGRrS+GECtJKt3fYTiQyxH
	vtMV+5E1rAPPoZCfz6/bG1mqF9uhy+p7nfwJVfjPe+GS2UhjWeAHhxFgszsB1mlly/OiscDQSsl
	WTe7mQ+M/RbK0Az3m3iTxzhll1Z2Ocn4GE8JLDTF5C9dwWuhJAoXJxz9FDcJOxiJJaiXs6fwFSl
	fS6TJjIJ2t3Rs5kEKCgkcRZ3nd0kYU6G8K9+bxFOqRmip+KJo+gtO6P2Kz+7DTkCqW/rRr0tTEF
	Is5OY16oi7JAJgJJbuMs7sCY7UeT5Wl/Ik5y1Qw9bHtf17bHgsCSHpetVKwoJJbZS8yj4wVKuua
	5h7HhJ6PW40iPmSESG8NjLNyB0RUQp5c=
X-Received: by 2002:adf:fc8b:0:b0:48d:ca32:e90f with SMTP id ffacd0b85a97d-48e5d5e0167mr6431684f8f.55.1793216665283;
        Wed, 28 Oct 2026 12:44:25 -0700 (PDT)
Received: from [192.168.68.70] (host-87-10-175-32.retail.telecomitalia.it. [87.10.175.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm27766389f8f.3.2026.10.28.12.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 12:44:24 -0700 (PDT)
Message-ID: <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
Date: Wed, 28 Oct 2026 20:44:21 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
To: Frank.Li@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/20/26 23:10, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add usbotg3 iommu information.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> index ccf9f510e0f88..1370a571153a5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> @@ -32,3 +32,7 @@ &usdhc3 {
>  	compatible = "fsl,imx8qm-usdhc", "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
>  	iommus = <&smmu 0x11 0x7f80>;
>  };
> +
> +&usbotg3_cdns3 {
> +	iommus = <&smmu 0x4 0x7f80>;
> +};
> 

Hello Frank,

this patch, now in mainline as 73c3b40e536d, breaks USB 3.0 on Apalis iMX8QM
(both on Ixora and on the Apalis Evaluation Board). Right after xHCI starts:

  xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
  xhci-hcd xhci-hcd.1.auto: WARNING: Host System Error
  ...
  xhci-hcd xhci-hcd.1.auto: xHCI host controller not responding, assume dead
  xhci-hcd xhci-hcd.1.auto: HC died; cleaning up

SuperSpeed devices no longer enumerate, and no SMMU fault is reported.
Reverting only this commit on top of current master fixes it. The other commit
seems fine.

Adding the same property to the parent as well, like the NXP downstream tree
does, also fixes it:

&usbotg3 {
	iommus = <&smmu 0x4 0x7f80>;
};

With that, SuperSpeed devices enumerate again.

Could you please take care of a fix? Otherwise I think we should revert this
patch.

#regzbot introduced: 73c3b40e536d

Thanks,
Emanuele
