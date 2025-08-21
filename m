Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DD41EA7D2
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 07:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760184; cv=none; b=Yscxc8n8kCs3Vprli3OLNqLCcTcKrTX7JLtijursgngw3FmcscP9dN9fT/qQG+EnD/69bTOImrbvIzPg32BRGtlhid3JQX0VyQrNa+FSCMPNdbL+Iak+ypa7YDwoy/uVkXDzBJZ9RRCp4VQyuOLl3qqSqwKKW7KiIaf9lAAfMSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760184; c=relaxed/simple;
	bh=TzFoYkNr5uKeSEk4nj8rTmur2plu1IDT7LnjbDvYEWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6bl2zMtTQ5yblVzaGBksRQxv7v3J+Rrmrijek/lA7qCKZQsQuqQzL4SxOJZZmdJ7+5PXdA+H0AP59Xso9oYVqecB7G1W5Ec+F9+8t+Kd/Njm14gcL/ubKoz7OsqYLd49Tr0aUlzJPJkIav4cxSPFYQ0s+bVuF7zyFx3c37s8lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=B4Ps3rxA; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="B4Ps3rxA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=RfPOWbVRUC2ftEQ8/ZhtZEj1I9GSOS1lR3GmPpWbzms=;
	b=B4Ps3rxA5lTLKOMX9qz4KLmfQrRInSuwWyASzKpE8BzdORqUVxYMRs7LRTHMd7
	SAziTySrOi108CliGQfaDT4Jng65U7PMGDioaXIl/eTKtTdsMJYgjIf4kMP7bXMD
	JW8f3za/C4lYET9Jp2+PH+kM1G2bjYBqw+5h88X9xYpJY=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHe3sUxqZoZKcNAw--.5607S3;
	Thu, 21 Aug 2025 15:09:10 +0800 (CST)
Date: Thu, 21 Aug 2025 15:09:08 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Martin Kepplinger <martink@posteo.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8mp: add idle cooling devices to cpu
 core
Message-ID: <aKbGFMnmM4OHiimg@dragon>
References: <20250715055903.1806961-1-martink@posteo.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715055903.1806961-1-martink@posteo.de>
X-CM-TRANSID:Mc8vCgAHe3sUxqZoZKcNAw--.5607S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF13XF18WFy8Xw1Uuw48JFb_yoW8ZrWUpr
	48uwn5W3Wvgr47C3yaqwnYkrnY9ws5tFW5Wr12gryfK345Zr90gayYyF13Wr18Xw18ua1f
	ZF4avryI9r4DJaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UyCJQUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNhZ632imxhaGowAA3+

On Tue, Jul 15, 2025 at 05:59:22AM +0000, Martin Kepplinger wrote:
> The thermal framework can use the cpu-idle-states as
> described for imx8mp as an alternative or in parallel to
> cpufreq.
> 
> Add the DT node to the cpu so the cooling devices will be present
> and the thermal zone descriptions can use them.
> 
> Signed-off-by: Martin Kepplinger <martink@posteo.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index bb24dba7338ea..66e1a27d6eed9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -80,6 +80,11 @@ A53_0: cpu@0 {
>  			operating-points-v2 = <&a53_opp_table>;
>  			#cooling-cells = <2>;
>  			cpu-idle-states = <&cpu_pd_wait>;
> +			cpu0_therm: thermal-idle {

Have a newline between properties and child node.

Shawn

> +				#cooling-cells = <2>;
> +				duration-us = <10000>;
> +				exit-latency-us = <700>;
> +			};
>  		};
>  
>  		A53_1: cpu@1 {
> @@ -98,6 +103,11 @@ A53_1: cpu@1 {
>  			operating-points-v2 = <&a53_opp_table>;
>  			#cooling-cells = <2>;
>  			cpu-idle-states = <&cpu_pd_wait>;
> +			cpu1_therm: thermal-idle {
> +				#cooling-cells = <2>;
> +				duration-us = <10000>;
> +				exit-latency-us = <700>;
> +			};
>  		};
>  
>  		A53_2: cpu@2 {
> @@ -116,6 +126,11 @@ A53_2: cpu@2 {
>  			operating-points-v2 = <&a53_opp_table>;
>  			#cooling-cells = <2>;
>  			cpu-idle-states = <&cpu_pd_wait>;
> +			cpu2_therm: thermal-idle {
> +				#cooling-cells = <2>;
> +				duration-us = <10000>;
> +				exit-latency-us = <700>;
> +			};
>  		};
>  
>  		A53_3: cpu@3 {
> @@ -134,6 +149,11 @@ A53_3: cpu@3 {
>  			operating-points-v2 = <&a53_opp_table>;
>  			#cooling-cells = <2>;
>  			cpu-idle-states = <&cpu_pd_wait>;
> +			cpu3_therm: thermal-idle {
> +				#cooling-cells = <2>;
> +				duration-us = <10000>;
> +				exit-latency-us = <700>;
> +			};
>  		};
>  
>  		A53_L2: l2-cache0 {
> -- 
> 2.39.5
> 

