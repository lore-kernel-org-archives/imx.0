Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5428F25F797
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 23:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763075536; cv=none; b=K6urLAY8hqQhWEv7ViZs1n0j013cd4GlyeMxlBsRZbTgh4DRQgdu4FZdJ5/ooJ4e66B9uJPybbYBcEtKJ7oZNYsbVuMZ87XmOAqEHJ/mUqiDI8NyB1IryP2YOsFVSNDX4nwF23fJkKho7lsuN5lC3xbu5j9cvUWMxqXz8N9NOSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763075536; c=relaxed/simple;
	bh=jV02dvH7PGRfj3dv0eO+zo8+Pltk+c3ID5KIvj7kvVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PjM3+gejjGmreDwqs8/Ny4ESsyICsZiN+/a+Qn4ENXlrztv+A1vPab1v1MIublzFbB1eQ9HW2bjwrmxi6qDZdoEIo0kL8ySwSfnrewJXN3hnbFrU3n5mke0xkPSV5hxWoYkivkPwaCjCs00rjSYfDUxUrDcfFB2SnE+36LnDekY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=kj7sZTu2; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=kj7sZTu2; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="kj7sZTu2";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="kj7sZTu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763075526; bh=jV02dvH7PGRfj3dv0eO+zo8+Pltk+c3ID5KIvj7kvVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kj7sZTu2CJsolMx/CDX3WbEw5a3347+CnSgZdN84wmJdfWajcHMZHmzuF6sHUKDrq
	 EQqqf2yV/x4Q5MiwqPNOquhoQQAWpQWwPg8O69fvJLj5xL2Oa1nHxDLl14UE5G+P2j
	 fVk4TSXeHX1JGhPCuMtDsW8In2W+dqj2JA9wFFUD7SXrzRS2VXITQIl7DQUyt4lHVy
	 U44I1Ahuai2UJCiosKRKfmGJpVbYh9gIZhxA0X0gy7ykvXpfUUahbZSFgcQMhKqfhk
	 DruMGIIDE/frB1oDdU1gxNLPCrprC5t3Fhb/aGbcijI1Y7bMOUD8u0c3KTIFDvmFi2
	 Eh0lMyyZFHReA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id AB41B3E101C;
	Thu, 13 Nov 2025 23:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763075526; bh=jV02dvH7PGRfj3dv0eO+zo8+Pltk+c3ID5KIvj7kvVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kj7sZTu2CJsolMx/CDX3WbEw5a3347+CnSgZdN84wmJdfWajcHMZHmzuF6sHUKDrq
	 EQqqf2yV/x4Q5MiwqPNOquhoQQAWpQWwPg8O69fvJLj5xL2Oa1nHxDLl14UE5G+P2j
	 fVk4TSXeHX1JGhPCuMtDsW8In2W+dqj2JA9wFFUD7SXrzRS2VXITQIl7DQUyt4lHVy
	 U44I1Ahuai2UJCiosKRKfmGJpVbYh9gIZhxA0X0gy7ykvXpfUUahbZSFgcQMhKqfhk
	 DruMGIIDE/frB1oDdU1gxNLPCrprC5t3Fhb/aGbcijI1Y7bMOUD8u0c3KTIFDvmFi2
	 Eh0lMyyZFHReA==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 25AC53E0FFD;
	Thu, 13 Nov 2025 23:12:06 +0000 (UTC)
Message-ID: <6f50997d-5a46-4d89-b011-cbc89785e05f@mleia.com>
Date: Fri, 14 Nov 2025 01:12:05 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ARM: dts: lpc32xx: add sspclk clock for SPI[0,1]
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20251029202801.3963952-1-Frank.Li@nxp.com>
 <20251029202801.3963952-2-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251029202801.3963952-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251113_231206_717425_E24E1B83 
X-CRM114-Status: GOOD (  15.37  )

Hi Frank.

On 10/29/25 22:27, Frank Li wrote:
> add sspclk clock for SPI[0,1] to fix below CHECK_DTB warning:
>    arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: spi@2008c000 (arm,pl022): clock-names:0: 'sspclk' was expected
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> index 9790b0a1d6537..77f210a2152dc 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> @@ -179,8 +179,8 @@ ssp0: spi@20084000 {
>   				compatible = "arm,pl022", "arm,primecell";
>   				reg = <0x20084000 0x1000>;
>   				interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&clk LPC32XX_CLK_SSP0>;
> -				clock-names = "apb_pclk";
> +				clocks =<&clk LPC32XX_CLK_SSP0>, <&clk LPC32XX_CLK_SSP0>;
> +				clock-names = "sspclk", "apb_pclk";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   				status = "disabled";
> @@ -203,8 +203,8 @@ ssp1: spi@2008c000 {
>   				compatible = "arm,pl022", "arm,primecell";
>   				reg = <0x2008c000 0x1000>;
>   				interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&clk LPC32XX_CLK_SSP1>;
> -				clock-names = "apb_pclk";
> +				clocks = <&clk LPC32XX_CLK_SSP1>, <&clk LPC32XX_CLK_SSP1>;
> +				clock-names = "sspclk", "apb_pclk";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   				status = "disabled";

This one I won't apply now, since there is another much earlier sent
and discussed change:

https://lore.kernel.org/all/20220311093800.18778-4-singh.kuldeep87k@gmail.com/

The thing is formally it's a DT ABI change. I'm pro to apply the change, but
let me say I need to get a bit more of courage to resend it and to push it
through as an incredibly unlikely but still potentially harmful change to
some unknown user.

-- 
Best wishes,
Vladimir
