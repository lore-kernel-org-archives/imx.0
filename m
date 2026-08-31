Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F7D3AB5B2
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 06:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158048; cv=none; b=MAGXZtVptFj8cyfWBhfcxKSPYozePwLwyH431UN/iPwFOlnLXI5BE9MiihGfT6z7jtjI1m0Ef1yg3X8fj5W1bjDN+HkKLqi3MdDlMHzGK/kSlS3iD75AYmjc1ecx6YYWHG2EkoNNsfUPZpJzPCggqA8fpkC17wQxUq4vttK79aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158048; c=relaxed/simple;
	bh=/lmQshMnH697F9QSeSeHWD2u64V+LTtfoazb/YyBF9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ET1zO+IGnXtUV22aXfDXaWqFFoBVn6kgpIsZo1OauRZnJvJVoSBVSgfjS2Oxu+HCtk73mdvo4LAzPKlPHloHG3ZCyJx0CblIGmrG+hgiAnBFGPCRkdkgVuABc5McgjY2b0/ZBuSlPegW4JSvpS4jWXB7x4kqqDuMSJHhO8Ih+jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nG+K5122; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nG+K5122"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3513081a91.0
        for <imx@lists.linux.dev>; Sun, 30 Aug 2026 23:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788158046; x=1788762846; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ptsOsHU/6/aB7s/AaOx0+tOkggKvvNrqLs8HPEye82U=;
        b=nG+K5122wW0ZJT7qpWWYyEtft7ITMy9LJqvLvmhQQC2p2nxQJiLLmL8RwoQ6FAqnyI
         ZFyBgnXkE/JO1G53yVdsU0pFDLo0SUeJ4FqUpOjMwXRkw/BEvIOtowllsjVFv2fIKuzt
         pobzj7u6DuMjVnJXEdswsXihH13d3Q952pp2WFffusDTJn6jXXv5rqfJuaWF5ujoTA54
         zf+jY+DXLQvFpMBIYf6NkUz6Un4OWO6fYnpKFzgh8B1R0kEmY49vQiiMxLRdSywfqzMA
         O0kXFIXNC/3nsMmeqpG97FVQI4UoFkS1T/knKTFikiR0HemsoPIPak17iEART7J3dLN6
         wJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788158046; x=1788762846;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ptsOsHU/6/aB7s/AaOx0+tOkggKvvNrqLs8HPEye82U=;
        b=HvcMOi4Rs81G//namv8RTYo4BCN5gk60028IuT706gPxuDde3FDgIgBS0VwVbMGubQ
         ijSxpp1Zl1kFV0WCB3ezdbtA1m1rTkLDAJW8hRJ3pVd2YGCErYmeoh4blR39f/HRXYLY
         RsuS0Gu4M3W7zRyCMOZyEXSCdohshetaOja31kyizddse1ZGSjvvAXffp9FP/AdVICnr
         vmAbjxBGI9A7O5okLLhGQ0IAKbeewqnFo594f7b63QqzoEbQ5vMrOHsBIDeJ0YPNsqJk
         HJUDrHr4y9J8GdLvJCfhpN0+W8gvq0iE4+qmPHFHKe7f11i+im4ZnRrAQjBGJkN8BVfw
         mJaA==
X-Forwarded-Encrypted: i=1; AKwUvBwcCUSiZnK0Or4hZXNZrUKwR+IIlWEhtGCDIVt/0tUfF9gQK3mIfvpLdC8Ynd6SfyA2gOk=@lists.linux.dev
X-Gm-Message-State: AFuF++kfIAV7PkLwyaUUF17/aJMKCvr47zbdlmSVNia5cJQrPlbdYYyw
	Yn+PFDtw/eG8OaZ07+Nrk9VIhZ+D19w2MyiLz5Mgbrn8f044xObYaxnS
X-Gm-Gg: AYBFou3N1OnYNN3El6CMrMGnruOZZlRSda6AKE9EQTlCvUEz3LPIE87wcybx5pg5eMQ
	jwftM0qcycoip5yGahJx9AXaM9Ivuzwcx7Q2FJgW7m/oHUNPMp+H//wI/IPyqKPPJUPxpRq5KfV
	QDuEklpe9cVESB2zd7Fg14zBSA2WSd5kK6WpVx887mbvulOFyh3FsuTAodoY8b4+IHwMLo/EOrG
	GPi3AlSgbUw2n0idOazRM5RHq7wDZp/b7SCNUzAgj0k4c7T3kQQ36ihoWce1/C7rxlrkmwWrUPM
	zthEXSj3Wc/usptZzTLJXsZZ/876okboHCjqGyjmoZhEWei+sOf3M9Yz3hlT0gqc7v1HKqwg8ps
	sK0jZ7pC23zEbZirSwFflD+GUhEmtcHzLw5uH3gh0nH4rH5gzROax2+mkEN7+mCGbRUeTkDqIXx
	lLqzq14fMOkSk+DmV4K1m79tJaiAggkr5L4sDsj9aioEHox9tYLQ5/oTeO5BCqNVKJpX9OhVAxi
	pWgb2nXw/qityM=
X-Received: by 2002:a17:90b:4b92:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-398f8203c37mr1788304a91.3.1788158046328;
        Sun, 30 Aug 2026 23:34:06 -0700 (PDT)
Received: from [10.25.162.18] ([165.85.1.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d18eaasm27743090c88.1.2026.08.30.23.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 23:34:05 -0700 (PDT)
Message-ID: <4dafc090-4e2d-4f05-85ce-cba993e93575@gmail.com>
Date: Mon, 31 Aug 2026 14:33:57 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI
 master assignment
To: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Yannic Moog <y.moog@phytec.de>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20260831051222.3298730-1-primoz.fiser@norik.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260831051222.3298730-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> The dailink_master label was placed on the codec sub-node instead of
> the CPU sub-node, configuring the codec as I2S bitclock/frame master
> with SAI2 as slave. On this board, BCLK and LRCLK are wired the other
> way around: SAI2 must be bus master, with the codec as I2S slave.
> 
> Move dailink_master to the CPU sub-node so SAI2 drives BCLK and LRCLK,
> fixing broken audio on the PHYTEC phyBOARD-Pollux-i.MX8MP board with
> PEB-AV-10 Audio/Video expansion board. Also remove the spurious clocks
> property from the codec sub-node, which had no effect in this topology.
> 
> Fixes: 7012f551081f ("arm64: dts: imx8mp pollux: add expansion board overlay")
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

> ---
> Changes in v2:
> - reword commit message to avoid topology confusion
> 
> Link to v1: https://lore.kernel.org/all/20260827065556.2326079-1-primoz.fiser@norik.com/
> 
>  .../boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
> index bb740f845855..8957b24a7ad2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
> @@ -77,13 +77,12 @@ sound {
>  			"MIC3R", "Microphone Jack",
>  			"Microphone Jack", "Mic Bias";
>  
> -		simple-audio-card,cpu {
> +		dailink_master: simple-audio-card,cpu {
>  			sound-dai = <&sai2>;
>  		};
>  
> -		dailink_master: simple-audio-card,codec {
> +		simple-audio-card,codec {
>  			sound-dai = <&codec>;
> -			clocks = <&clk IMX8MP_CLK_SAI2>;
>  		};
>  	};
>  };
