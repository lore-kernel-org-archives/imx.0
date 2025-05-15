Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9096295DB8
	for <imx@lists.linux.dev>; Thu, 15 May 2025 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300834; cv=none; b=JiF9NpOAbNvSuyONR1sRs8weDd9S/jsRWEgRLp+8S1vscfJ9xDwH+JW9UEIlGVg4lhJYE8uqMomJGwmboCv6fJKdYRyQuzrJY+rY9/QdrTFL4E+uz32eBhUeAScUBP+7r3YAjIcCYgN/jfFZuMx4I3/Vg71JzPBoItGg78JSrtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300834; c=relaxed/simple;
	bh=T0xIs53YyMGsPIFPEWuTJKQwtqyUkFoPGQIbHPbvpOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e0cJIIgt9SnaPiknhbNppDyTYMCVwIaUse+P5URRnlmt4bupP7Z6f8QCGCKLs2tiGYg8mqEn7eziGzorBExRa3hlAEp/S6FYTzHUt9cW8u5P1XCZNmokFoykMRLTbCLXakw2wydQfPodCplMzA0uuyuQcxebN6xFuyF0Pmbm1XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqzjOV88; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqzjOV88"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-549b116321aso722870e87.3
        for <imx@lists.linux.dev>; Thu, 15 May 2025 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747300831; x=1747905631; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gr8YDjeShMs5Dbf0Xg1ibXjoeWLBh6KvIWOpPkgrAjM=;
        b=iqzjOV88itqtyu7LeMnCX9/z1PMnoLRtJBpBbXlQKbvWt4xTBeawfsSG3G+8E+wy08
         UcfcQ4LYbaank5MBVGgo7z9r/GRuruPLOc2qbPWYaEGD8b6vkgXB5mw9LOU0hFOqPM3P
         Uyo+H5YufXd3lwCJndBjOhVe4hTuZTKk+zMtT9ED6cviSn4EfEzUINZEf9ZEwoy5pUlC
         VPt399I4AKBpSczsh0aIQr0SN2yqvN9zUguEukN29FfVCDxBQLcObph0E3S+GgxLyJNF
         BA+Jv0rYC56bXt2eq4F94Q1m1UoqaZ81t3CHVjZG1pn54J2+1bkCDoUIH3qzRH0bLIJd
         ttpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300831; x=1747905631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gr8YDjeShMs5Dbf0Xg1ibXjoeWLBh6KvIWOpPkgrAjM=;
        b=jnPJwpQTtklohJrbRZFBIwAx9Ts/GsBRvI07jD87rVr96MvxyJZHCHULv78y6l0i/r
         GgSBvQSusiRSMsc2Lf9Ush/HXEvfdn8/sAG4KyDZ1vPLOOaVCMBvMOHeXLlCUsj+jXUw
         HwYOhVr5ow3Eqo6MOGnBd5Nu/Hs5Ln68Kg4/6+6kgKsZ/D1+3J31hHoY6b06klICTWsh
         QYokE0FDncjxy/lRgqFvy6Bww7hrdkflkdLtFDM7yrHUFuON2JnvMRAlMNBSp/92IAxt
         yNNpqHgpTUqH1g0sJzFyK5f60pa4S1r2aQGwVZQPC17ec2o+rwcPQDKs/7bZhtFWbhhe
         16Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXhPYReKYbIoH3WWG2+q/501swoCb81oRFzwdT9mTfkaJOpPijYpFIdXAHc4o4IRXWBfug=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNiYBH34ZrxJc2RNw68DfGs8UlC5MgzyO9HRyZaJPiQzJl9oP2
	j8fZr6v7XVQsPm+htZ4zxWFmRYU5WS9CaAv5af6jMFMeZ39ZcoqO
X-Gm-Gg: ASbGncvC59+n07DmWZ34joQg5QSEq9wsjasMiq+nCnZkaPIJRDZVLuGvLGxGxGZVcfU
	obXkpsF1yy2k3I1syCEu63ZC+R9tgAqtr7v5w1svLLBqKWG4GzAH5hotaB3EonaqtqlGVreamJL
	s3OdEnZPF5wF+VxzqWMVlaSlczx73lt50t3VdaCuFUPJPiBxrPcUigfD3ALQ1kPn7B6OADW5quv
	usxyo0cv0pd7FXpm6QXjsnlb9KX4T6sxOSUyRL+xZwtMThIua/PqeLRbACKpb2XaVM+BWEcZ+3Z
	8lRw8z+kAdTUPfKOWYuQibVZp2rsrrWIHswLi32EXB7pjZyoCJTW8UnHuxBmoK2mW2Ep32M0gfN
	2As6A1R1ocwqoIcnPg6wkcsSD+e4oFI/z5uruaoVSaHA=
X-Google-Smtp-Source: AGHT+IF1K2xmstWUKqRXQKvNfbx1fHA8kSSO7L0hXYxzd9u70VeGhf6RRP23AYcOT1vimL6BWWt6aw==
X-Received: by 2002:a05:6512:2392:b0:545:944:aae1 with SMTP id 2adb3069b0e04-550dcffc298mr627839e87.12.1747300830765;
        Thu, 15 May 2025 02:20:30 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645d082sm2579696e87.76.2025.05.15.02.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 02:20:30 -0700 (PDT)
Message-ID: <a44cad65-1f23-43cd-83b7-bc128e9f858f@gmail.com>
Date: Thu, 15 May 2025 12:20:29 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum
 value for VDD_3V3
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
 <20250514082507.1983849-8-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250514082507.1983849-8-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 11:25, Dario Binacchi wrote:
> From: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> 
> Buck4 is called Buck6 in the BD71847 datasheet. This buck supports
> 2.6...3.3V. Set the minimum allowed value.

Same comment as for 6/9. Please provide better rationale than the PMIC's 
limits.

> 
> Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> index 81fa0a8767e2..04112a83b1d3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> @@ -144,7 +144,7 @@ buck3_reg: BUCK3 {
>   			buck4_reg: BUCK4 {
>   				/* PMIC_BUCK6 - VDD_3V3 */
>   				regulator-name = "buck4";
> -				regulator-min-microvolt = <3000000>;
> +				regulator-min-microvolt = <2600000>;
>   				regulator-max-microvolt = <3300000>;
>   				regulator-boot-on;
>   				regulator-always-on;

Yours,
	-- Matti
