Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D2A1D3652
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 15:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725638038; cv=none; b=iv958VC0NVPqlfoDgDPL0rDApqUgaNGdc8Y65hbJPJNbs2cbonQAh5jrRwhDc6GKE3PAvPe/1CvuQOMbp7oD5Y5W/ZJ9GkCmPA/icY5eX0tOjhTtCZgnBBv7p0j14siIEyRE1suOwDQavIzTY9ur5rIfGndmWU4/jse2eACHyPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725638038; c=relaxed/simple;
	bh=o0MznKshQJgBs5nWI2XoOX4AsBYGuttamKL1DUIopyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gX6RrAG0ca+Yt3c8sonXb1tJEli5ktLO/MpzkJ2am+juDYgvJo1ZFOOwiq/dLH0aRk/NOt1HkcMgs48/FlCpY5ci50bF52D2Z6IPm/y98YUcIMe2d7puRJjxqiCUKG+aom9KRAhIeDdBB8Jewk3t+kANYMcUHO5D8yWTJmEnVIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ceCcHvxX; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ceCcHvxX"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3787f30d892so1238978f8f.0
        for <imx@lists.linux.dev>; Fri, 06 Sep 2024 08:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725638034; x=1726242834; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NC6Cf1A5zM/7S1X0dCOTWrmEp/YKRHomNRr1wAJwj6w=;
        b=ceCcHvxXOZg5A0MN2Q3qN38WEOUbOVd4BaluQfRHEbbFkYkMfZ7wQRB85sVpeNME3Q
         gYbysicARUitPKMKnG6Z4WxCvmrzwSHPHUl/8AbWkwmtWarH3RYGOLiPiEb74bEFKsBW
         G2tBx7NfKaSuj5Eu29eeG86BwDVQ8NUIS1UF6XxfmcsDZKtqFMMUTqNy9c1DcV+WDxvj
         mezVDqxmx77pSeEOy3BIEl9vAZ5hPHRt1xiC1DrWL7ncJo3TQSfpjLp/472FrQDQiRL8
         W1MyBPkMqzhQoAbbFh+4gM5q/X4dtYv0dxrpq0/r1ZKgxavBBRc9e97PsdcgP7UdmN1l
         ze8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725638034; x=1726242834;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NC6Cf1A5zM/7S1X0dCOTWrmEp/YKRHomNRr1wAJwj6w=;
        b=tM3bLe3HoPWUPrYdbRku6XdAseehScEzvXPYcBGVExuHj323SZyM1Em7xUkKWnfWUP
         h2dYU22Cu43oz12YqHyT3CthIcFpQiYt63H+FBknZp/f6pq9aeINjdZ7JWaufEC97j5Y
         hGTw2bTTyTgxzzhoj77hlVqgvoIkLlfGHFOhsRORGJIJYPNVOLJ8fxTGcVLMCCjC7Awu
         qFTrZNWznGrHkx95U8ZIznvnAOWhSuXpGhsufTmxX1oEU0TYVaC/4SzHXV48MdzKOOFs
         HpKNx4O+MHMKv6c+ZwnCkq0wHtz9itxCHNwpNrZHnNZq90zdROGhA+EmqHLq2jq/HpUu
         kzzA==
X-Forwarded-Encrypted: i=1; AJvYcCUqjbxjvyMxXhWbr3OlqYbrtD2Hd14seOYYnRglUfS33pgnu5+S9mAglTWx3WaHOHA7nTY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqCTUxJjzzuUZvwQEC66PbT4jFF4yjzUeSL3ww8S9PGutzGa3o
	jNcAGSLjiQrXin9U/lO1en8g9xg4ngbBLz75TWKsx/PITQ8cnlPWjgoWDKFNX5M=
X-Google-Smtp-Source: AGHT+IHaSnady74DJ1oEcQaHcxLA4uOPiZb6C4vhozW1nZbyNOH4GbF0OP/WL2CRSWsgv9G05aJ9MA==
X-Received: by 2002:a5d:4388:0:b0:368:334d:aad4 with SMTP id ffacd0b85a97d-378895b7bdbmr2264093f8f.4.1725638033585;
        Fri, 06 Sep 2024 08:53:53 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca06005bbsm24296915e9.30.2024.09.06.08.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 08:53:53 -0700 (PDT)
Message-ID: <e295e004-891d-4865-b1c4-3cef93976245@suse.com>
Date: Fri, 6 Sep 2024 17:53:52 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: s32g2: Disable support for SD/eMMC UHS
 mode
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux Team <s32@nxp.com>
References: <20240830113347.4048370-1-ciprianmarian.costea@oss.nxp.com>
 <20240830113347.4048370-3-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20240830113347.4048370-3-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/08/2024 13:33, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Disable SD/eMMC UHS modes for NXP boards which do not set VCCQ voltage
> supply to 1.8V by default, such as S32G274A-EVB and S32G274A-RDB2.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/freescale/s32g274a-evb.dts  | 1 +
>   arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 9 +++++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> index 7ab917f547ef..b9a119eea2b7 100644
> --- a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> @@ -39,5 +39,6 @@ &usdhc0 {
>   	pinctrl-1 = <&pinctrl_usdhc0_100mhz>;
>   	pinctrl-2 = <&pinctrl_usdhc0_200mhz>;
>   	disable-wp;
> +	no-1-8-v;
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> index 8739f63771bc..aaa61a8ad0da 100644
> --- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> @@ -45,5 +45,14 @@ &usdhc0 {
>   	pinctrl-1 = <&pinctrl_usdhc0_100mhz>;
>   	pinctrl-2 = <&pinctrl_usdhc0_200mhz>;
>   	disable-wp;
> +	/* Remove no-1-8-v to enable higher speed modes for SD card.
> +	 * However, this is not enough to enable HS400 or HS200 modes for eMMC.
> +	 * In this case, the position of the resistor R797 must be changed
> +	 * from A to B before removing the property.
> +	 * If the property is removed without changing the resistor position,
> +	 * HS*00 may be enabled, but the interface might be unstable because of
> +	 * the wrong VCCQ voltage applied to the eMMC.
> +	 */
> +	no-1-8-v;
>   	status = "okay";
>   };
