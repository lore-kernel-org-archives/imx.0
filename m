Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069977;
	b=Nx1rrpSV2dnsr1uw2gJ7EmbDCtUZQhibQaV89/E377KLuKHCEZA7tLDQU9V+3+Ch31Pp
	 xuDJNmoh6XO86CbpB/eEWFS98EKzLZYsFHVSdomLY48CKiCb+x1NabpZvbqPL4LvipzmX
	 AbPRkgOUzq+Y8lxWBeP95XSw7CnNmsZ1nEpqbXpzxVuoJtfdEmv61lcqS8pb1aNI65Mig
	 +ibin87Czj76T2180S8LX4FROOp3pHh9YdLYkaF424qFfDjJbH+qnXKoCoWQUNzOI4ctF
	 c7K8WNLUXU+QcqJjqCzZdczufQVeb8i0XG4oOgKnbGrWLUhHdY/Wm1/GU8AWQJ6pB1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hSnvvzDhM2uKqCBxyLgpEZ66FQuzFPilOEd8OHc2tQE=;
	b=5UwHYyFpisBwC8yx6Jn5B4dmj2bBWllutQUhoSI+IqCpIbnvhpoBDt+ToKRYAZCaQLw+
	 qQThCfugumH8lgugd9s/oJAcD0Of0bXECAWOBNGz6wlkXL+B5rvwLERdmgXcScH+DY9bE
	 QoUD4P1vzNA2F1iNiBPfn4KmgS4phsZjsm/knGTgqIC2OVQ/ukZNOutwrl1R8E3LOsW91
	 1chLWtc0Q0ung4SVUH9XivkQeZ5DXH8m5GaWBSrJNOulH9pmdkfftfecy2qmG+i5sq+vG
	 nuB8mNgiK3yoKagFz4IqJi3Hf0A33dOod8VLQAZIfs1vZDhJ0C1p5NhnexHNFLxvnuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QOtRVSSM;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0011606A31B
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 02:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0011606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QOtRVSSM
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e987a2ba0cso23088235ad.3
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 19:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793069976; x=1793674776; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSnvvzDhM2uKqCBxyLgpEZ66FQuzFPilOEd8OHc2tQE=;
        b=QOtRVSSM/gf/ilBHJxnUx5ombvbPppknAMGL7nKpUZioIJwf3Bc2bTweGifxWyZjOu
         BfFtC8cftb6c5N/hEJ8TEjuua89hHBubnoUecD0l7dzqO+AgauTZn/B7t85PiHnmoHXc
         pUbOjI2raGSSJyEYiLlGuHtiBzEwD0UzR+M+VBoRpGaCJiPLqZRx5dvqSubVIWOS0taV
         gfGOz2xosTFy5voPBTVVvHxtTU2r6rJ+fpFdf9U6L2/Fh8vPFVuRD7j7jcOCLT0YMxSN
         gMLCi5eNAeIMxtiZic9ylyor3e8BfFrt3X8QWGWpbSS9TkukiiMGUwvX+GNgkGKtK+Ic
         J1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069976; x=1793674776;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSnvvzDhM2uKqCBxyLgpEZ66FQuzFPilOEd8OHc2tQE=;
        b=RYe9NCA2FDYNwGjAN09vHEnid/gC2/31M8/xPrqripY8rZ7QLYKnjzcwC7BXQbtOpE
         Dt3iMVyj3ITZgZLMo35tc8TKmd9ReW6SVVx3BRyDAZ2/qrOQfvXOSObZyww6Eo3JFZGr
         3xTZ3aogbxEJwHspYQCkaC2/bxWR3aMIuI3COSStppnxetaNyVTvDg/oYcQAtcksZuHe
         pE2xDJoXgnzgoBysauAFf6C2uSwn5Y5vipMBDuAwzDQuSAh1F2urtH2fiqDjxnalnrER
         HhqIiw4H3i2qzaTVKjLFNnOFIfAkEhlGJhAk+NwQcASLJnKtM6/2bz7kssfHnSE/0eFO
         koyQ==
X-Forwarded-Encrypted: i=1; AKwUvBynMvPYzfztH+z4N+XDXTOD1ih+zvxsAJCZtZMvD1QN227kthHUYcPnKM2FjA9mtfyCisw=@lists.linux.dev
X-Gm-Message-State: AFq9FYIwxRNLWvnyJYdrslfIMAoDR9c8D1baD1WwoMIVGgylaDs2c8a5
	5j1QOskfvMHFabWnsZ4wF+UUbPa7JyzNDUVpIhf17GooEyvAO/hHzm/m
X-Gm-Gg: AYBFou1EqpBEZ3tZ6UDOjulRhqIz8Lm7I59Yh3gGjIoDjS/28hPWlNjZpxS8+YvivV9
	5U6LkUEmB4Om8fNGo22t/CNeuAFwVynHPTtnRyhyDf2GS3EiTbbR2PtPpazX3/jCRzimZYTo3dP
	MoFoTRu6hnofvO56LrVWfaE0lsFIIN6RLstCi5IAiiqGJbE9ScBktFLhViCyNtXCkYWQPlprBCM
	BdhAyulgorGH7uAQ7/dCR/A5R0EYg6IBUkv1sfbSKxjTlSM391f741d//+SiIiMc6wkNtnk0wY8
	qk/5pYwWuE0uKtJmyoJLZF0YXpJwhbWLpWDY5uEn09NDYnChycyYQxrdZMRQQUgvJBS6Q3zAusa
	wI27jzD0M78VTNMSetBRyG5RpYoSoOeuGaYTPrOXNiGc8jkgQYsOmepHRiL/d/WjxNfdoi0nKup
	6TJvo7aeeuTBHsl5U9KtsVexCliPEDcw6KTUfNlgqV9wV85nYMRgFmEapx+JxNshqBBoPGgALAy
	m5XUBX+1fl2/2LD/ZngC0kHq4ynFwOFXWzAkQYPD7PBUgG9Wv8NXUSK8249gmvRPyIxr/nCCmCL
	DLwZP7oLyeobY0sWm85/
X-Received: by 2002:a17:902:d48e:b0:2e9:5d1f:dffe with SMTP id d9443c01a7336-2ea9c9875fbmr71515405ad.57.1793069975922;
        Mon, 26 Oct 2026 19:59:35 -0700 (PDT)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c912f9sm2255465ad.60.2026.10.26.19.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:59:35 -0700 (PDT)
Message-ID: <9b6c85f4-5881-46d8-b247-ae6bbfef8f91@gmail.com>
Date: Tue, 27 Oct 2026 10:59:28 +0800
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
Subject: Re: [PATCH] arm64: dts: imx952-frdm: support AONMIX MQS
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261026085352.4009534-1-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261026085352.4009534-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Add support for AONMIX MQS (i.e. MQS1).
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../arm64/boot/dts/freescale/imx952-frdm.dtsi | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> index 7785eb1a68fc..750046e1a5c4 100644
> --- a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> @@ -222,6 +222,12 @@ cpu {
>  		};
>  	};
>  
> +	sound-mqs {
> +		compatible = "audio-graph-card2";
> +		label = "mqs-audio";
> +		links = <&sai1_port1>;
> +	};
> +
>  	usdhc3_pwrseq: usdhc3-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&pcal6416 8 GPIO_ACTIVE_LOW>;
> @@ -390,6 +396,70 @@ &micfil {
>  	status = "okay";
>  };
>  
> +&mqs1 {
> +	clocks = <&scmi_clk IMX952_CLK_SAI1>;
> +	clock-names = "mclk";
> +	#sound-dai-cells = <0>;

Above 3 properties have been defined in dtsi node. No need to add again.

Regards,
Chancel Liu

