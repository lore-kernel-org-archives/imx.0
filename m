Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3C52F8C4B
	for <imx@lists.linux.dev>; Thu, 17 Jul 2025 16:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752768452; cv=none; b=Kabh4+ARctEC9Wr1xqv5Dlctgogm6ZcJTtClmor05g+u4xZKFJstMeg1Mbgdc9gD3BfeaMwaMUR3AQpKWNlBa+eygc4Uja8E16fKZYdCLwV6qSF8G6f/zZ6s1NAUn7XQ6SydPHGXHew2d246x/TkA+aadbEkhcVlOFaRZ/PUZo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752768452; c=relaxed/simple;
	bh=HuMkvESuXq2jYyN9U/v45ZQ3yZUvaYoaX0ldJ5jJ7sU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0ad2Qrbvt/tbUsatMi4nFGPejJyEfsRCTvlaRLAe/tGO+HLjm2zalwbmIKdClbW8d/MpidH4vCU80pa7a25kTybQaxSwWBsL4/vP+uzxhJ2VjoEyzyvO9UUiU2AKuMiVUlPnI+SO7R82vCIN4piYBVFUdZPBtnVr6G6gZSw5VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KasLIS51; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KasLIS51"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45634205adaso5973975e9.2
        for <imx@lists.linux.dev>; Thu, 17 Jul 2025 09:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752768449; x=1753373249; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=82OHoUr0Z9aQ08e56ySzE42nN8RW+aLi/MMtZyEhPrU=;
        b=KasLIS51jDpKQPQRaGm9hc72Tm1WnUd+B8VwHU6/ayAyo2beyy7TsNsLbYGh1OY54O
         8SdAC2zUl+oCwhc5AXTiK8PyBo9Ho4AxSEQviHulCM/qXAha7QXs+6QgTwNq3w2fp3Fj
         yTzXgdGYEEPUHRC5GaeKYZMIjz1jgFdIM7axqKuheuiCoe89Lo6dYjs9+I3ag7rbRQW0
         WF3UhLEYORegj54IH4kxCisSWo0QEie1+Kl1iDDmNonwvC7KNe6d/PJoosie0KHwfWm7
         RvS2Ud/McXjLRZNXRPHSfuEeUZ9QYOuhR3McWxlSSs/drsguqu70Yzfdx+mfsmBq6hzV
         G/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752768449; x=1753373249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82OHoUr0Z9aQ08e56ySzE42nN8RW+aLi/MMtZyEhPrU=;
        b=alHwWDwNrUlwe9dLEls+qDY9ME7lrNGeN/02CoqSCnVJuI1h2thLMJj9FnKPP6CNPA
         SMy9xzr+r61sgTHHujuAzeii3LdXR5wLkmS0W37BDR9Wdz1i21mzRiFbth2JsrR03uBO
         tUhKRUEPsRyop5GX5YubL68knm9yhecrcEMvAsla3jDhKiHJiArWDWbnSOhxj5cAGXlE
         rtE0DuCfNbej94Pz/ZSIQmPcE7oYsAnq+SPNZPj4XsqPCEEdUP8F/QvL/3eVmrYgoeJp
         Oi5xYwZ0bOkgww9voTRkRBRRWkX7+DoDwXNFNThx8Id/IQL31cUw9Lrn1F5KIyEv7Woo
         E4SA==
X-Forwarded-Encrypted: i=1; AJvYcCUg6gFY2noqzP7xmPuuOcfBHxd96kOYA/neaOO8W6w/HSS/a0X6M6ltKWVov8HYAd3Ib0w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGtNUojXt9bXkSTRd9pqI6baAfSIV/n9vDSEo4+r8enR5jOHPC
	u12d6rH8B1TFzp3lONbHzYNbivckpHllrj5mcFdILFpuew5a0FF37d08roxBoEISRbY=
X-Gm-Gg: ASbGncvTzd2ZIDY9zi572k7CFo9KbYknr/rdrIQ0lhEsVb8TA7Hpfkc4S9B5QM3eHoa
	Oteq4Qz+ykw7bNjY8/6MA9+saSQ7nDno/clnq6zLiodKd4u94b2T8l6BYDEDthyD1x3HnuiMuA1
	G8pfZf4NCFXU0LMWCYmRnoNueVcAwWd3R91QotC8pXii5YiF6oVZk8AREirzaYyZJvvi5NVZZDA
	pKVMNTxKi8D65/rkD/sAK5AAC5g2zCijx0Uhttu+0AyBbaawSoRbvZq7/WbRptEaN3sg+CMqVEV
	XNlI0culLqCRQe6ZG2wteSBesKYXedX+lEOyzE8XaIiowvrAWNi5bovmHdWLEePNZxu2jgEO9Mv
	hxSnzFvbfBZv+29lA2pTT7tM=
X-Google-Smtp-Source: AGHT+IHzm2I/lhPKbGUV5CyURK1Tn69rc/pQKbI+7FTppM+fvafp7RbqiJF9UaoOuE40qre4CBuyNw==
X-Received: by 2002:a05:600c:4f4f:b0:456:2cd9:fc41 with SMTP id 5b1f17b1804b1-4562e3b9937mr64319855e9.20.1752768448653;
        Thu, 17 Jul 2025 09:07:28 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634f4c34dsm26799925e9.6.2025.07.17.09.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 09:07:28 -0700 (PDT)
Message-ID: <27025862-dc2c-438d-8413-d61ddff01a44@suse.com>
Date: Thu, 17 Jul 2025 18:07:26 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: s32g3: Fix whitespace issue in device
 tree
To: Dan Carpenter <dan.carpenter@linaro.org>, Xu Yang <xu.yang_2@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1752703107.git.dan.carpenter@linaro.org>
 <52960eb1-4432-436b-89aa-d50fc7da2c3a@sabinyo.mountain>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <52960eb1-4432-436b-89aa-d50fc7da2c3a@sabinyo.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/07/2025 00:46, Dan Carpenter wrote:
> Checkpatch points out that this should use spaces instead of tabs.
> "ERROR: code indent should use tabs where possible".
> 
> Reported-by: Xu Yang <xu.yang_2@nxp.com>
> Closes: https://lore.kernel.org/all/u7glt7mn33lbdeskbr4ily6tjjifvffy64llwpi5b2rrhx5tnv@y2h2y3oz3xc4/
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 32 ++++++++++++------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index 68c11ebd405f..e80144e33efb 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -489,22 +489,22 @@ usbmisc: usbmisc@44064200 {
>   			reg = <0x44064200 0x200>;
>   		};
>   
> -                usbotg: usb@44064000 {
> -                        compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
> -                        reg = <0x44064000 0x200>;
> -                        interrupt-parent = <&gic>;
> -                        interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
> -                                     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
> -                        clocks = <&clks 94>, <&clks 95>;
> -                        fsl,usbmisc = <&usbmisc 0>;
> -                        ahb-burst-config = <0x3>;
> -                        tx-burst-size-dword = <0x10>;
> -                        rx-burst-size-dword = <0x10>;
> -                        phy_type = "ulpi";
> -                        dr_mode = "host";
> -                        maximum-speed = "high-speed";
> -                        status = "disabled";
> -                };
> +		usbotg: usb@44064000 {
> +			compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
> +			reg = <0x44064000 0x200>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
> +				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
> +			clocks = <&clks 94>, <&clks 95>;
> +			fsl,usbmisc = <&usbmisc 0>;
> +			ahb-burst-config = <0x3>;
> +			tx-burst-size-dword = <0x10>;
> +			rx-burst-size-dword = <0x10>;
> +			phy_type = "ulpi";
> +			dr_mode = "host";
> +			maximum-speed = "high-speed";
> +			status = "disabled";
> +		};
>   
>   		i2c0: i2c@401e4000 {
>   			compatible = "nxp,s32g3-i2c",

