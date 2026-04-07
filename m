Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397AC33BBA2
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 16:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775578059; cv=none; b=hFwF3NfwUsQvQziTLa2MBkZz8YTk910CCcv/TKbp/dYfjmHAfIi09CuLTYhTyup3WhjR9u6d547E1KFzon+DwUb0HI6A/10oG37v3jpUPWkTyBa3REy9TheK257c9cAXeNFvk1SHT6kDQdqBCU/Mx/XLj0l1ZcLiixFdPR085gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775578059; c=relaxed/simple;
	bh=Sas0qFAzYzKIQIqhTxUtCs0Sf1ywrEvKGP51tLQ/h3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NwkNHvZEISZHJF3NB0LA9bInAOH4KuuwzGlXsYcA5QxDrVvaua8z7slJbYGVJ8+1+tHcTpNuUVrEnx7ciaT+zRzSIe4ctz3q+kPv5BuO9afeErTuegHWU1v+NQPfXjj074YJcC9/JULtS5rjozVK+dcNAsr0bzrzwAwrrR2IBuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=UDV9qEJX; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="UDV9qEJX"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED5BC11334C;
	Tue,  7 Apr 2026 18:07:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775578045;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=VQOEtqktX3I93eFAh5RlM4ZbAW6K3b/kpAkaRgEKJfw=;
	b=UDV9qEJX1Z8JurECjyExsJaF63ofjwkKZY/0pnQr5da8dnjR5/qjNhfYsyJ/z7fNePCWQD
	KcSiR/jdIsrNTS4MacFH/RjD7p99OXPK8V5y7j5x2zgEqncdGALG9Mp117g5xq85EFf6IU
	XYLaNlcX4ZtKGDHJJFksrKsLSGaZNg2O+EW5yCgPMc8XRc00TDlcZPN/uiQavhRGbrC0cr
	ToHoNLeic/G+yszJQCqWCmmj/8c1BWZHtCnwrKXcRP0fnU7ChVYGhwZkeJhmFGSS8JLJ3O
	5ajJxXmSnauGWL4sRQf/B70UfjyN/slsVtKy3AoUOXwVc7aQznUhdgISV67bcg==
Message-ID: <3539165f-88ff-41c5-8c01-b1f997a9201a@nabladev.com>
Date: Tue, 7 Apr 2026 18:07:24 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: imx8mm: imx8mp: Add DTOs for Data Modul
 i.MX8M Mini and Plus eDM SBC
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260406215959.184061-1-marex@nabladev.com>
 <adRhN_DDthCDHymn@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <adRhN_DDthCDHymn@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 4/7/26 3:58 AM, Frank Li wrote:
> On Mon, Apr 06, 2026 at 11:58:45PM +0200, Marek Vasut wrote:
>> Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1
>> providing additional UARTs, CAN, PWM Beeper, I2C, SPI and GPIO breakout.
>> This adapter can be optionally populated onto the eDM SBC.
>>
>> Add DT overlay for the DSI-to-HDMI adapter eDM-MOD-iMX8Mm-HDMI populated
>> with Lontium LT9611 bridge. This adapter can be optionally populated onto
>> the eDM SBC.
>>
>> Add DT overlay for the DSI-to-LVDS adapter eDM-MOD-iMX8Mm-LVDS populated
>> with Lontium LT9211 bridge. This adapter can be optionally populated onto
>> the eDM SBC. This adapter can be extended with multiple panels, currently
>> supported are the following:
> 
> At least you can split to 3 patches to add these.

I did now, will send V3 patchset as 6 patches, but it won't help much 
because most of the stuff is DSI-to-LVDS .

>> +#include "imx8mm-pinfunc.h"
>> +#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi"
>> +
>> +&can_fio {
>> +	interrupts-extended = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;
> 
> Now, I have not good ways to unify this information for difference boards
> yet. It is quite common user case, let me think more.

It is a different interrupt line on these two boards.

>> +};
>> +
>> +&iomuxc {
>> +	pinctrl_codec_mclk: codec-mclk_feature-grp {
>> +		fsl,pins = <
>> +			/* GPIO4_IO27 */
>> +			MX8MM_IOMUXC_SAI2_MCLK_SAI5_MCLK		0x2
>> +		>;
>> +	};
>> +
>> +	pinctrl_sai2: sai2_feature-grp {
>> +		fsl,pins = <
>> +			MX8MM_IOMUXC_SAI2_RXC_SAI2_RX_BCLK		0x90
>> +			MX8MM_IOMUXC_SAI2_TXD0_SAI2_TX_DATA0		0x96
>> +			MX8MM_IOMUXC_SAI2_RXD0_SAI2_RX_DATA0		0x90
>> +			MX8MM_IOMUXC_SAI2_TXFS_SAI2_TX_SYNC		0x96
>> +		>;
>> +	};
> 
> I think this part should be in main boards's dts file, there should have
> hardware plug header, which include these signals.
> 
> If there are other added on boards, add-on dtso can resuse the label,
> pinctrl_sai2 and pinctrl_codec_mclk.

No, not really, the audio-board is a bit of an outlier so I would prefer 
to keep the audio-board specific changes in the audio-board DTO instead 
of polluting the base DT with its specifics.

>> +};
>> +
>> +&pinctrl_hog_feature {
>> +	fsl,pins = <
>> +		/* GPIO5_IO03 */
>> +		MX8MM_IOMUXC_SPDIF_TX_GPIO5_IO3				0x40000006
>> +		/* GPIO5_IO04 */
>> +		MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4				0x40000006
>> +
>> +		/* CAN_INT# */
>> +		MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25			0x40000090
>> +	>;
>> +};
>> +
>> +&sai2 {
>> +	assigned-clocks = <&clk IMX8MM_CLK_SAI2>;
>> +	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
>> +	fsl,sai-bit-clock-swap;
>> +};
>> +
>> +&sgtl5000_fio {
>> +	VDDA-supply = <&buck4_reg>;
>> +	VDDD-supply = <&buck5_reg>;
>> +	VDDIO-supply = <&buck4_reg>;
> 
> buck4_reg can provide addtional label, such as porta_vdd ..., so needn't
> this sections.

I simply renamed the base DT regulator names to buckN_reg and ldoN_reg 
for both MX8MM and MX8MP eDM SBC , no need for additional labels .

>> +};
>> +
>> +&spba2 {
>> +	#address-cells = <1>;
>> +	#size-cells = <1>;
>> +
>> +	sai5clk: clock-controller@30050000 {	/* SAI5 */
>> +		compatible = "fsl,imx8mm-sai-clock", "fsl,imx8mq-sai-clock";
>> +		reg = <0x30050000 0x10000>;
>> +		#clock-cells = <1>;
> 
> Not sure why need overwrite these informaiton here, suppose it should be
> the same for Soc.
I don't quite understand this comment, I am adding a node separate from 
the sai5 node, so I won't end up pulling in unrelated properties for the 
"fsl,imx8mm-sai-clock" (which is not "fsl,imx8mm-sai").
