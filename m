Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604559;
	b=xVeRod52VysetSlF/9oLXe6dZXliEBoH7YsX830WUGR/s3yGu/1taPdJMxhPiz1q+Yy/
	 qs6iTGJMJ+5BTA1vP3UmClUp2fle09KmoZw0qf+gzOUWn/Jxj4p2iK33hcLB/zzPm529W
	 8nwFUBFHEeruca7KReqeqCPdBhn1oh6YADc0gXG/8UWY0aiVHCWgP3qwf+5lGlsY7Dgyc
	 s3+IUIWAGRI3BysctIecNriDW9qxX/dUVALrOUkasdtD9d3E6uepPvcyZqNCxD1Gmtmme
	 4uK+ey84uKfOmnmycjTDyVdxof32/eYZSXuoVxIgCNaQPGZPcxOPOkkPVjee2mqEf9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604559;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wrYyDNg3E6ceVKYkD4AhtLlI1IklZP6+JsR2AFJMEr8=;
	b=SVJCnc4LfEapdcFEw84fxBb5A6ARK/X63G4sfGvqQDkryUw6qc+PLC/OJPDGJQ22kZht
	 6l/FEzdtv9f4oWJXX/i4G+6oWaODvE0xH7qYk0MyGRTqaJX4+qqaz8YGJFiv+PNIqOkMP
	 4hq0R2sqsZHa86M2iX055EXJ0mhhRv6kI9BbM0UKy1mtrVF0HXtQv2Vw3gaBfzKocYMzx
	 lK/CI3KW/W1ad3IrHMQUI11bks76SY1zzTyB6vjN+ptozRg332SAvFREa9ZXT7TAWz7PX
	 i7pJzGi4y05S/EizYMnxNNHwD7l1b5qiGAqrojrkWAhIYE9JS+/YOKvl3BWFX0zHfCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hIaaFuO7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175D8606A324;
	Mon,  2 Nov 2026 07:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hIaaFuO7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4ACF1F000C1;
	Mon,  2 Nov 2026 07:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793604558;
	bh=wrYyDNg3E6ceVKYkD4AhtLlI1IklZP6+JsR2AFJMEr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hIaaFuO7adR0AWoNO71qfdzfsgx90ShkTX/sGRTZvh+YTn8vu/bKl9BHEcCfZT0l4
	 Rw/1iHKB9XZcAyHvA+xdRLCGcYADQ4CkxW5iK3W9tgvawMCDaMp6Sq3k0ZVGGdSS8H
	 x9mttXzfVVEkY4nZJooZ/ndae42RrMgwURdraKuVSPDQ4tqhwtvuExJ/AMXIAl6GK3
	 5DPXQtk738sGqZZynqkBN+3FQ/PwCwbD19w422aNAFhweajqiu633a/3gpGoLTcb/q
	 rVpQxpEF6nFl5hC3Dd+10zVnljGsDxYO8N8+JBLghZdzDIcH0vqdMphpQLBiz7XM5u
	 +yf6mTbtluYVw==
Date: Mon, 2 Nov 2026 08:29:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, 
	Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: imx91_93_common: Enable BBNSM NVMEM
Message-ID: <20261102-nimble-amber-rat-4f8cff@quoll>
References: <20261101200140.141642-1-wahrenst@gmx.net>
 <20261101200140.141642-4-wahrenst@gmx.net>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261101200140.141642-4-wahrenst@gmx.net>

On Sun, Nov 01, 2026 at 09:01:40PM +0100, Stefan Wahren wrote:
> Enable the BBNSM NVMEM for all i.MX91/93 boards.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> index a68ffd04ee08..c8bbf6f1bcf9 100644
> --- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> @@ -363,6 +363,12 @@ bbnsm: bbnsm@44440000 {
>  				compatible = "nxp,imx93-bbnsm", "syscon", "simple-mfd";
>  				reg = <0x44440000 0x10000>;
>  
> +				bbnsm_nvmem: nvmem {
> +					compatible = "nxp,imx93-bbnsm-nvmem";
> +					#address-cells = <1>;
> +					#size-cells = <1>;

Pointless/redunadnt address/size cells. You have here DTC warnings.

Best regards,
Krzysztof

