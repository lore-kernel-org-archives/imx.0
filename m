Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7FB15FA74
	for <imx@lists.linux.dev>; Sun,  1 Sep 2024 10:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725187790; cv=none; b=m8IcjJ5Q/xQGmutwCrCS6Rp/PJ4OpD1An1VTQmYkC9nakG+UqeSFWqwOfcgBZmu912UZ1hYZexT9Pt79SOTRgCcsBE2E9lAeqg42Gu8HuXuXNAjWLSs9hlYyZnzXvWasS/sRq8zQcnCsGn1256EquZlSu3dbpn9yBuRPyZuQ84I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725187790; c=relaxed/simple;
	bh=1SoUrcuwAezmoBbfSHXp5udejjTS9HsVQxmLO8RhqpI=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=in3vKtcNj4Rzh+7k8yIjQZyrjkehm7S6cusnYmNyLs7GjgwAMUIbtQTf7+PQXev2zgg46AOfMWk3RVQhotc7fKTYFckoEHmJEGlVy+D9qiu+4TOnY1aDbLPbCvLhdsEzBe2MS8j4uE7RaMFwFImAf+JCyw7/8sXuJNu3pVxw2PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=jib5dOBm; arc=none smtp.client-ip=44.202.169.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="jib5dOBm"
Received: from eig-obgw-6004a.ext.cloudfilter.net ([10.0.30.197])
	by cmsmtp with ESMTPS
	id kch2sZI9lg2lzki9OsL6DO; Sun, 01 Sep 2024 10:49:42 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id ki9IsKyvfks1Pki9JsCzM0; Sun, 01 Sep 2024 10:49:38 +0000
X-Authority-Analysis: v=2.4 cv=Ud+aS7SN c=1 sm=1 tr=0 ts=66d446c2
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=-pn6D5nKLtMA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=vU9dKmh3AAAA:8 a=DNHG93h_ET7fCttHZXgA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ywGVdaOBlZPdTax7+8AIJtGdavEx9jH0B5JlhRclrvs=; b=jib5dOBmkXongdaFb6+eNDbK5o
	jnSqgEzoUpxAB90W3aZjQLVvK28NhDRgji4ZP7rtMiWm1IApK1PVth707D1xd3aNWPSHTxB1M3Zri
	DE5Zwjl0w+NQ/NnEk0cu96YZ4VzU5JuFIdFi+c1NlkdCsAEUzdzd0UeNGoZneMClDdL0oI2F9YnbJ
	BS7nUBreTbw26dZ6sWt9dONlE6TUBPxUCb8QMas3OiM06uE1rQiA2qnJIYtAegC6aRnEynuMfcOKZ
	QoE1mk7vIb2krjM2jVhY8U6o4FhTkl/WxVbeH4J0sF2d3d4qf2X7zZBtg0PboJSMMNa1oziJt1wsR
	TC/a0KJg==;
Received: from [122.165.245.213] (port=54982 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1ski9D-003WMg-0I;
	Sun, 01 Sep 2024 16:19:31 +0530
Message-ID: <ae9c8916-27b4-4296-b827-92336a158294@linumiz.com>
Date: Sun, 1 Sep 2024 16:19:26 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: imx6ull-seeed-npi: fix fsl,pins property in
 tscgrp pinctrl
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240831101129.15640-1-krzysztof.kozlowski@linaro.org>
 <20240831101129.15640-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20240831101129.15640-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1ski9D-003WMg-0I
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:54982
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 4
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMxGN884jn1GEYCySEaTs9agF8P1iIYUb2pe0mg8UbYYVW40r0dvFzSgRn17QldplprYut7mikzbNleL3ckv7eQ3Y9JaGYimZg1Ovp9t7MOEC7NqEBnT
 g/t1m+IGddG4T+IzutTZgshItUyb5w8RV1NbgiPD4wE6xYJhYIFKjfLZjf3phuVIp0WmgC6PcNZ/av8MXi5XP5SyZFJ/TkI6nbM=

Thanks.

On 8/31/24 3:41 PM, Krzysztof Kozlowski wrote:
> The property is "fsl,pins", not "fsl,pin".  Wrong property means the pin
> configuration was not applied.  Fixes dtbs_check warnings:
> 
>   imx6ull-seeed-npi-dev-board-emmc.dtb: pinctrl@20e0000: uart1grp: 'fsl,pins' is a required property
>   imx6ull-seeed-npi-dev-board-emmc.dtb: pinctrl@20e0000: uart1grp: 'fsl,pin' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Cc: <stable@vger.kernel.org>
> Fixes: e3b5697195c8 ("ARM: dts: imx6ull: add seeed studio NPi dev board")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Parthiban Nallathambi <parthiban@linumiz.com>

Thanks,
Parthiban
> ---
>  .../dts/nxp/imx/imx6ull-seeed-npi-dev-board.dtsi     | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-seeed-npi-dev-board.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-seeed-npi-dev-board.dtsi
> index 6bb12e0bbc7e..50654dbf62e0 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-seeed-npi-dev-board.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-seeed-npi-dev-board.dtsi
> @@ -339,14 +339,14 @@ MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x120b0
>  	};
>  
>  	pinctrl_uart1: uart1grp {
> -		fsl,pin = <
> +		fsl,pins = <
>  			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
>  			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
>  		>;
>  	};
>  
>  	pinctrl_uart2: uart2grp {
> -		fsl,pin = <
> +		fsl,pins = <
>  			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
>  			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
>  			MX6UL_PAD_UART2_CTS_B__UART2_DCE_CTS	0x1b0b1
> @@ -355,7 +355,7 @@ MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
>  	};
>  
>  	pinctrl_uart3: uart3grp {
> -		fsl,pin = <
> +		fsl,pins = <
>  			MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b1
>  			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b0b1
>  			MX6UL_PAD_UART3_CTS_B__UART3_DCE_CTS	0x1b0b1
> @@ -364,21 +364,21 @@ MX6UL_PAD_UART3_RTS_B__UART3_DCE_RTS	0x1b0b1
>  	};
>  
>  	pinctrl_uart4: uart4grp {
> -		fsl,pin = <
> +		fsl,pins = <
>  			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
>  			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
>  		>;
>  	};
>  
>  	pinctrl_uart5: uart5grp {
> -		fsl,pin = <
> +		fsl,pins = <
>  			MX6UL_PAD_UART5_TX_DATA__UART5_DCE_TX	0x1b0b1
>  			MX6UL_PAD_UART5_RX_DATA__UART5_DCE_RX	0x1b0b1
>  		>;
>  	};
>  
>  	pinctrl_usb_otg1_id: usbotg1idgrp {
> -		fsl,pin = <
> +		fsl,pins = <
>  			MX6UL_PAD_GPIO1_IO00__ANATOP_OTG1_ID	0x17059
>  		>;
>  	};
