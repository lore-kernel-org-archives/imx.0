Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136AE3E9F73
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 12:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912186; cv=none; b=K1yFh9bJWgPCLGsY7a0ssb6TB7jZCYKKw/qSYEXciDkwYxXFeo0cqjl1qljRUY4KM7Ihy7ZOqVaaHK7WAhMvUXcDmOMPvnsqy6xCG8AUNNdpQ69k1/LewjwQwy11lG7Lz0OVHp0Nuv3CAz7MlZmvp+sueaP49kWHGl3VrsGPd3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912186; c=relaxed/simple;
	bh=ch1EDL45KQ1Bli8m3y9dlCGuNaDcJnG1aw6Tw3Tgbh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CcOpWArTI2qacIPFIa7anMORg9eReGmzmXZ8yZvt5uqaOePBl7sxlGbNbjlS0G56R/ETwQ2flzakvwTkfdQ3IDIHTyna3L/h2iVrLxymAu/PNETfL3NyeM6db0aTIxCRUfUtMt/GjV3iYqzmK5Ac4zbjFxCwqxXrDko9sBb6BMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHAlgHGZ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHAlgHGZ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so8898693a12.1
        for <imx@lists.linux.dev>; Tue, 20 Jan 2026 04:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768912182; x=1769516982; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0YG28pJwuFWWWbmb7kZFD7xrZgouesVy9V7x/n/G6Y=;
        b=ZHAlgHGZ/W25EryZPwgRumDFV2NY960dHALRCD+u3RqLpLkKBEkUDGahzYWKThqRQt
         dP4rwC1/BAX8Adt2NmV1nd4syg7HOCKMrvl07i4CxqxnnP/TTpWe4AVFsxre5l+BzzQ3
         lZQED721kCR2npHhwd+dHNzJkkpsJnPMdzQP5kULuE2WNMjPCoBbP3Hno+YiyogRNvcO
         tKVZMghWW9w8X3qJH0fL22GzUv22VHc0uS40KwEmV2cn70uNRwAeC0jq8z2B7JzIU4s+
         0ZpqMGPfZ+Vg5kdYEq9LOlZgfSZcUtXPz8O7IrJgKzVQVN/yRwRHcY2pjujFLAXHSu1X
         C7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768912182; x=1769516982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0YG28pJwuFWWWbmb7kZFD7xrZgouesVy9V7x/n/G6Y=;
        b=hyAohectKVNNHJC3sYHiiTMmS0Z8x4Z0oL10NgrKX5Vll/HwBx64z2IC4uZd619k6G
         ExxoWI5PMItWNylznf14NrccPPw8JNk611d7mwMDpdLuKRgXgDjhTgkJpjFb/zXyhKNu
         d2SNxfGM6luIia6kpbZatwn5NKOrBidP/6xltWb3ixKVYt1xDgELliKt5K/xiS8RRzOG
         res+htVI8TDk8XkeeEfSSan7fw+4KAt2dCQPDBN+YNc5nvnhsp8FLcetH7CgD9pfuBY/
         FETdONKAhMjFIAWXust3MRkzEA89Isidx/lFK1SBVArwY8dQi0fiuN6w35dYS7nZ4u7W
         rRRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWenKlOmzXdlIxro//HIh/cVNbXtlbBtWhCN8lvqhXkHzA0aKiMiMIohda2937fIlLnpDE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3QcPNAixFuOJpuHGD0ofABr+uVty4fGnQj+INO8wcu2DsKc/5
	mcmqmg/FSCaEt3Mu9MEZtxp/acVgZMLw6OzA0DHk03voqEgkHBRImdDK
X-Gm-Gg: AZuq6aKVTaCuuKp0Mo8crg/vVnYrPzCntJisCzbf8H5ZK34xwGYzk9NSfJtmkWOSb0p
	Q1TxXSueVOHvR8kg+l0Qr6G4DtifHim/090ikBD5vr1Yk1Xqsu5UeJO+qFC4dGwzdeepqMGvXVu
	V8vgPLnqAKh4yFgd/RRzGPyxm8EZRdRYqVYauQDkbLC+Jq9Qc6VbPz3RGXgSMIwux85ZIYvj8Yu
	dn+D3xTmZWHSB8Lq9DNDygPcLNjoTx0tzxA+NXFcpj4i71FVlHMVIAxj66c1wUzoaQwZ4UJ2kmN
	xbATMWcBBnbecO2dJjIuVWGIKYejFGGCj+inOfaohVu6MSj7eS6zhh5bMG7j7CF/fsOkPiNJuam
	1cXmUPLczGgW15JrPCCNs1rKWDICeJnTwA4LlOym4CqvlRTEZ00yh8+15OxBurg5/eGSOe0g3SE
	jQ7siCkDSKCvLgA+nMqImvWCuh28PtJQU3hco2XqDkww==
X-Received: by 2002:a17:906:c153:b0:b87:3280:6003 with SMTP id a640c23a62f3a-b8792fc4229mr1369007366b.49.1768912182084;
        Tue, 20 Jan 2026 04:29:42 -0800 (PST)
Received: from [10.25.220.41] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a0880dsm1368115166b.57.2026.01.20.04.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:29:41 -0800 (PST)
Message-ID: <993363fb-8ce4-4a89-b6c4-8fbf181ad410@gmail.com>
Date: Tue, 20 Jan 2026 04:30:32 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx95: Reserve eDMA channels 0-1 for V2X
To: Joy Zou <joy.zou@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260120-b4-imx95-v2x-v1-1-52b2025b27a0@nxp.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260120-b4-imx95-v2x-v1-1-52b2025b27a0@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 1/20/2026 12:35 AM, Joy Zou wrote:
> Reserve eDMA channels 0 and 1 on the AXI eDMA controller for exclusive
> use by V2X (Vehicle-to-Everything) fast hash operations.
>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 55e2da094c889fc7c1096d0e36f31ae118d2a982..24d02aa18b2f480bbffdc30bc41c658fb3aaf67a 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -631,6 +631,7 @@ edma2: dma-controller@42000000 {
>  				reg = <0x42000000 0x210000>;
>  				#dma-cells = <3>;
>  				dma-channels = <64>;
> +				dma-channel-mask = <0x3>;
>  				interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
>  					     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
>  					     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
>
> ---
> base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
> change-id: 20260120-b4-imx95-v2x-3e01c7bc6881
>
> Best regards,


Thanks, this fixes the kernel panics on MX95-15x15-FRDM and MX95-19x19-EVK after

AP access is removed from said channels via SM.


Just one thing: can you do this change for imx95-19x19-evk-sof.dts as well?

If not, I'll just send a patch for that later on.


Either way:

Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Tested-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com> # MX95-15x15-FRDM, MX95-19x19-EVK

