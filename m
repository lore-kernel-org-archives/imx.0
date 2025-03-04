Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C7426656B;
	Tue,  4 Mar 2025 14:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741100058; cv=none; b=dJyiBBV6LMHXC1ZLMZv88oTIjiR3beGbT0KKq38WX02g41AYPkLHXLKEmqzcZgOPxhJZW9mbr1C06M5tz4psBnovOha/exPtWk3W8R4qxI/VwP0qjJjXNFuEC6lod7gOCpe27Jn9YzMYAxtLklpC7sj59HWLK1tdRMELNsij+Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741100058; c=relaxed/simple;
	bh=1UpOOfRz3bQJCHN0CM1PhgLYuR/m+/e8m5cpvhZg+Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFMWSfZNIYJK+p19SBCJIQljTSeh91V6Kv4EdxxM5SRORS1S4LHU53zk2PlOKhv5K+IZie0NkW8J+6xWef4Rhhuv2ui14L4iOmxgcM1h2Fv1q36z4N/x5GN2oxjDyC3wHBFEzNeDKcYjZo2hGb4Mfg74QXBXKNpg2SCzURWT70Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJwvRMwp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJwvRMwp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A00C4CEE7;
	Tue,  4 Mar 2025 14:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741100057;
	bh=1UpOOfRz3bQJCHN0CM1PhgLYuR/m+/e8m5cpvhZg+Js=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MJwvRMwpHaS2DCt7ZSeeIRQtCnx1GCZzx41vay0BzuYEYFjR+cp0l15kPkr4Ew7FD
	 jh64P4nAyhYNNrh2AyB497qmB1tHol5TJpm+MWgV0M2p81xSHwSGvQjKhKlOtI6FQ4
	 cg3dB3nHT++XJVbzFq4xWYhdueZgtw02e9jjdo72ulUlHgjtsfRI+vL/WwP3Xg68gH
	 KBmmnF+FtSgQLYCdn+zrwNfmOzoXPWINSqH0woSM6OGmQgoJr1Dl2Pe06DwtcKPkIt
	 c4ydGR+FRl7/jqcKaGREn1tszGl5wEJxNZpeKEApHsj9H2AEoHqSynF72iIQehfUrt
	 c+J9P3ZaH7d7w==
Message-ID: <9581e376-19b2-4d4e-ad81-cc24e39e9d33@kernel.org>
Date: Tue, 4 Mar 2025 15:54:10 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: freescale: Add basic dtsi for imx943
To: Jacky Bai <ping.bai@nxp.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 aisheng.dong@nxp.com, peng.fan@nxp.com, frank.li@nxp.com
References: <20250304093127.1954549-1-ping.bai@nxp.com>
 <20250304093127.1954549-4-ping.bai@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250304093127.1954549-4-ping.bai@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/03/2025 10:31, Jacky Bai wrote:
> Add the minimal dtsi support for i.MX943. i.MX943 is the
> first SoC of i.MX94 Family, create a common dtsi for the
> whole i.MX94 family, and the specific dtsi part for i.MX943.
> 
> The clock, power domain and perf index need to be used by
> the device nodes for resource reference, add them along
> with the dtsi support.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  - v2 changes:
>   - remove the unnecessary macro define in clock header as suggested by Krzysztof
>   - split the dtsi into imx94.dtsi and imx943.dtsi
>   - use low case in the pinfunc header as Frank suggested
>   - reorder the device nodes and properties
>   - resolve Krzysztof's other comments

Which ones? Be specific.

Based on last issue, I don't think you implemented comments.


> +
> +			a55_irqsteer: interrupt-controller@446a0000 {
> +				compatible = "fsl,imx-irqsteer";
> +				reg = <0x446a0000 0x1000>;
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +				interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSAON>;
> +				clock-names = "ipg";
> +				fsl,channel = <0>;
> +				fsl,num-irqs = <960>;
> +			};
> +		};
> +
> +		aips4: bus@49000000 {
> +			compatible = "fsl,aips-bus", "simple-bus";
> +			reg = <0x0 0x49000000 0x0 0x800000>;
> +			ranges = <0x49000000 0x0 0x49000000 0x800000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			wdog3: watchdog@49220000 {
> +				compatible = "fsl,imx93-wdt";

imx93 or imx95, like in other places? And the commit msg says imx943.

I already asked for that.

> +				reg = <0x49220000 0x10000>;
> +				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				timeout-sec = <40>;
> +				fsl,ext-reset-output;
> +				status = "disabled";
> +			};
> +		};
Best regards,
Krzysztof
