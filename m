Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EB728A41B
	for <imx@lists.linux.dev>; Thu, 15 May 2025 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300781; cv=none; b=aKYIzX2TByev9wwUFRyNnQNX6/asSwCOAYgliqDHFH7kVbl2FAEC0l721k2a+3JsMuO47PAkAjOY5pqvyUFVhTGEzhmOsXFgkCRgyR0NAPwUX8sCLNEEPvihTQmobXyKV75fZB6QY2zzmjdK/Pa7OieYaUz2zkquZ1iEKTHr0DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300781; c=relaxed/simple;
	bh=f/hB+uXDPj6LiR+Uzv74ybboCFBBl/dQRkcdkfTtDF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iy/7WqY8wP15dCy/2/A0eyAJr81oj6qNkI80CL+6bP+4kUCluwGt2I9ULydf9DY+eifvn5bSJy70EQzJb73/V9jp2MQFDYcGv4MBHucuBZXZotUTl9ZhsVdNb6UGhUCw1fCUJ6WP2O+wnKIcEsOGVdGFUeIhsE8pTInfpfUYw8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbUd04x0; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbUd04x0"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-550d6e7c563so791370e87.3
        for <imx@lists.linux.dev>; Thu, 15 May 2025 02:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747300778; x=1747905578; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tAVVRaIfque3EwxDjB599VKRD3lH9ncgbq2DZrrZMJ0=;
        b=YbUd04x0HrfRxdWG1GQrg27n7PqesmOl44enV23maQkmlSbITk9ycL2Ama031NPzft
         Go/494rc4neNMIXFKVUl2oYzwx8Uydb2sNA6k6H+B84jjRL3qRc3bq4JNIXwYKzSQ3E/
         3aFp09lVg8qiK6y2iDywgajd3ueSdPvW3fuldTsrhKl4JSfBF0xHKEojq5Pj9+IRCoBr
         pvIIupjlKcOGLGC8CoC+3lO8J1hbmope2CL2GpeSQvUozDDHhRQtR35ykqySCfzWAgeW
         gP+s9xWlcfWiKVUkK3br/GHeJAkawlF328jFsZCaRiGCzCkl9kfsWOweCOtaNJGaEdPX
         jS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300778; x=1747905578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAVVRaIfque3EwxDjB599VKRD3lH9ncgbq2DZrrZMJ0=;
        b=l9wwp6dyUk4GN10sEYjfkeV2/Or4seeHWqizji+SQCrRlx7FoFJBPATst7Vc0FJjXa
         ft8Gdb1+0c0T3zUkDYei/d16ehufzs4IKRiV5AUBlCTbqrD52Dm84LqneUeeIQeosnCq
         EH3cvdr9e7/+02XWwvDtvZmYfqgn1HG2zGnU+t3JEPDxP4FKU5Qq10uM18lYxWRz3q4k
         zqiSaFQKMNHxu6ZQZ9yrAZJs9iOEQw60WmwxorjTanUPLUB52rWEDARBI/zlAWDgMc6L
         1PAQuKYyxI9jh+hz6kjTxc8u5h2Cn+aqv1MTH/rpTIf5fej5VkEi49JoSRhyi24tu5Jf
         n9kg==
X-Forwarded-Encrypted: i=1; AJvYcCVtO/D4w9gy5JrpCrIvLBAkmtCekLWNB8iNI9buqJkO2swWlwxO/cmsQuHtLXhfluj0v7E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+62y0IeYtNX22dCTLs8Amm6luVr81X15oKnwfmn2pUfvWmgTC
	8ddCslOJ2uopPToDKHnvns6gAD0jNxODLpca/wmbyGkLu0D80RZd
X-Gm-Gg: ASbGncuOVZv2m495jbSGjBYe/y4exbQi4laJ4PCbneiDU9RVWjklSNEhjRA+Sv089PQ
	pJWgHRXg/Xg2J599Owrtn/Nxwo/9lEtLvEZsapzSGPsO8C/40bHsV5e0WBlKDnrF2jBupKYrdho
	FVFKmfCegJHK2n+20GKnG9E8j7VBE6rvydtWzt6od9Z697fsnSkY/O2pezIm05RfIBV3txRNRY+
	0+c62XG22GQwZm2SduFdTUHt/GPPvd9kNib7D55ezQmMYaz0n/ZQvSwaLv3pTghKPwMhsmJVHOo
	7Aq5YAf4YU3lxeiae7WEwQ3cDXvj4T9nD0IS5G+J/vsBpY0GsQR4Tcei4g3C5EvB20bFwMxujB4
	ZuNjNBeiZDuIRH1XOytDtY3v6Oy7Voj/f
X-Google-Smtp-Source: AGHT+IFBcq4DqfKlxPbw1MrLx0fBSBJx/jI1yd+Z2wbPyp9w0D8IUldy1X/cWkz4tAEtuvuqupGZyw==
X-Received: by 2002:a05:6512:228c:b0:545:f4b:ed58 with SMTP id 2adb3069b0e04-550d5f94684mr2399058e87.18.1747300777581;
        Thu, 15 May 2025 02:19:37 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645cee9sm2562141e87.75.2025.05.15.02.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 02:19:36 -0700 (PDT)
Message-ID: <7b23de30-06e3-4f02-a8a5-90791628ceed@gmail.com>
Date: Thu, 15 May 2025 12:19:35 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum
 value for VDD_DRAM_VPU_GPU
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
 Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Wolfgang Birkner <wolfgang.birkner@bshg.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
 <20250514082507.1983849-7-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250514082507.1983849-7-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 11:25, Dario Binacchi wrote:
> From: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> 
> Buck3 is called Buck5 in the BD71847 datasheet. This buck supports
> 0.55...1.35V. Set the minimum allowed value.

Setting this to PMIC's minimum value has little benefits because the 
voltage can't be set lower than it anyways.

AFICS, the idea of the regulator-min-microvolt and the 
regulator-max-microvolt is to protect a system which can't tolerate 
lower/higher than NNN voltage. So, basically, these properties are 
meaningful when PMIC can go higher / lower than the system design 
tolerates. In these cases the constrains set in device tree should be 
strictier than the PMIC's range.

The existing regulator-min-microvolt = <700000>; could have resulted 
from the knowledge that the minimum voltage devices connected to the 
BUCK3 (5 in data-sheet) can survive is 700 mV. Dropping this to 500mV 
just because PMIC can go there might be plain wrong, and in some case 
get the device(s) connected to BUCK3/5 upset..

So, please provide better (more) rationale for this change.

> 
> Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> index fd12b97525d1..81fa0a8767e2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> @@ -135,7 +135,7 @@ buck2_reg: BUCK2 {
>   			buck3_reg: BUCK3 {
>   				/* PMIC_BUCK5 - VDD_DRAM_VPU_GPU */
>   				regulator-name = "buck3";
> -				regulator-min-microvolt = <700000>;
> +				regulator-min-microvolt = <550000>;
>   				regulator-max-microvolt = <1350000>;
>   				regulator-boot-on;
>   				regulator-always-on;

Yours,
	-- Matti

