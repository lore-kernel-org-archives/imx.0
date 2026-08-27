Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B1140B36D
	for <imx@lists.linux.dev>; Thu, 27 Aug 2026 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821016; cv=none; b=WcpiL5ubf7F/ZYEakqjzD7nKuil189mJvTEO3T/UEEl7AHwKdTKqaZY2m/hn0xXR48DxAI436dBXsHXBx3mhB+sGpE9DcFVZja7EtgdboGEIqwD4yrX8M+s3zhAeBn5ACqk266tqCRXKTrR7NeeVrJ4LdOCT6udjuWzG+uJ0zE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821016; c=relaxed/simple;
	bh=agVt9u5auVW/rGrjfz9BIea5qwFk+9eBDj75bT1gfLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QznaHMh57urhvupfl/Bdgq7EiAtdy56xDRoxBIUFP8DrmX8Mu4/AraOx3MkEV3MIwFW0RdKtukqYEyWiLFj2R0Ao37kzutT6fEDdxZ9jiNNMdLlAzD+Zx9BKPt0mz51rhx5+1LH16ojQIDZF3xkwv+Om3ZSZMRABgcJA2ZJArcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kts4XhsS; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kts4XhsS"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3964e480f76so2585708a91.1
        for <imx@lists.linux.dev>; Thu, 27 Aug 2026 01:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821012; x=1788425812; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zaEqDrC5jYAKebMDLgOTjAUIE2F2Prlvaylcbrjmns0=;
        b=kts4XhsSrJWKKbxXFgl7AQ2+JtgPvqbD/lFGwtP5DWyjCpFe0TLWLOH09VlIrmqFgO
         yc+RVQOGm5AsOfCwkwn/eds06slblMmdND9Pwj4g2SoJOAEDuupm7acvb4Vha4DkaAQc
         RboG6CSUq5iL8mEKNZirht4qHeSXs5CAI96s+QkkyAqrdHeIqkcxPCWTuKtH/DiRrDMr
         ZpDQku1VjWk77OJTgOKFUTEsULRNXEybIi1wkoQykN6aWJyN4bF0SfWi3hAGWp1H6PnV
         Kkeck7Ywf2qc5N1cAv4yzvdsHtkzqGvJbr8TmzUf30dHojwWLWIKIrsw08LwIzXJn4aD
         qnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821012; x=1788425812;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaEqDrC5jYAKebMDLgOTjAUIE2F2Prlvaylcbrjmns0=;
        b=qVjnvbHs97s1DVFgwFJBpM0G0MTVOtIzcHx1BJJVKUEKm4c+exAZAtQU/NYQUw1Wdd
         BX8FpD9zrts38RJm/qE0uNQzc5rFWu6+xYF4OFEgMNHBqYeXcd+V7F6H7mVAPI+YQdY3
         I556FnceenZHgsfi0kWyBWHkjehodFJD8rdW+sz8Ktx9jSzoWqEkNcyXQd/Z/FqioEtY
         Ezlvp9BW28TM6tgQrAdMfXWJPkAeh1IXVRArb1huiH0YOJPSMBcw5RlSrTKqUP3LNkxX
         ipSBeJX5fSUToImTshbywfGXMhMelLNrqQoBeA+d3y47a+yc5pAGe1xwsoUmF++MKe94
         nSwA==
X-Forwarded-Encrypted: i=1; AHgh+Rpcs12Iab5SyB+OiEHZ0DnAG4iNGXr2ukt9fpLDAIJWlXeRNRHBmNkHNyXv4uulyFX9h/c=@lists.linux.dev
X-Gm-Message-State: AFuF++nS9hLe/woItYbgskrxbRxtGf++etadoZLw3Zlbfy5y8fuGJblr
	6+4gIsthkbliny/RPgj7bTjYX9BuwjhfYERkR/aQydYh4fUa300Y8EvP
X-Gm-Gg: AR+sD13E9TDwLLtvPmTx2HeAnBqXeDYEKwLrkbZxXk4rfHUcLuEF1MwBHzznMZrQ+Ky
	i0MMi1m4Fz51yxUsjoT8P7+wzRauWXZXTR6FMoTUvWGhUnTyjW4Sk+REsz+Gy5J/ZCnMtBYdT/C
	nIvXxDSiEwmTKiM+sA8b9GYIo4RjivQLjF+49iPJobH7vDJyg7BLSxw5qKV9+ZaTS0R5rXX/QBD
	CX8Ao9OXe17btFhsJ8fWF7lqRuffY21KmaQ4aZlAfzbtHg8cPA1VmX0SKyOOfoyi5kWx8NjaQu+
	Sp4FWz3/37bPxytnBipd99NoukcOIMHmgdzzKM/+AkuxPRb1q4FsIC9NJgHOUNwuDZvUL6djFlR
	IWWqqWvdZxQ1+XUPP8RCWRQ3cBovtqaBmz1y3FqdpIm2N5n32SCpq72ciBR53Lr9+Hla9exoqrH
	EbrGqOXq1dMN8032f1Rs/ipIzEt/zGc6CziFiYZ6Csgh3TMnzpsAk780mK4vTMx97lgo0juglK7
	/tM
X-Received: by 2002:a17:90b:520f:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-3966d5f8f84mr28728747a91.9.1787821011778;
        Thu, 27 Aug 2026 01:56:51 -0700 (PDT)
Received: from [10.25.160.98] ([165.85.1.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3967582e855sm2085902a91.2.2026.08.27.01.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:56:51 -0700 (PDT)
Message-ID: <0ee330e3-8c6b-4162-81fe-d769982df5de@gmail.com>
Date: Thu, 27 Aug 2026 16:56:40 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI
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
References: <20260827065556.2326079-1-primoz.fiser@norik.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260827065556.2326079-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> The dailink_master label was incorrectly placed on the codec sub-node,
> causing simple-audio-card to configure TLV320AIC3007 as the I2S bitclock
> and frame master with SAI2 in consumer mode. This contradicts the SAI2
> node configuration (assigned-clock-parents, assigned-clock-rates,
> fsl,sai-mclk-direction-output) which requires provider/master mode.

Just a small question about the commit message. As far as I understand,
these SAI2 node configurations only describe SAI2 providing MCLK to the
codec. A topology where the SAI provides MCLK while the codec is the
bclk/fs provider is common. So the original configuration seems
self-consistent, not contradictory.

Regards,
Chancel Liu

> Restore dailink_master to the CPU sub-node so SAI2 drives BCLK and LRCLK
> with the codec operating as I2S slave. Also remove the spurious clocks
> property from the codec sub-node which had no effect in this topology.
> 
> This fixes the broken audio on PHYTEC phyBOARD-Pollux-i.MX8MP board with
> PEB-AV-10 Audio/Video expansion board.
> 
> Fixes: 7012f551081f ("arm64: dts: imx8mp pollux: add expansion board overlay")
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
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

