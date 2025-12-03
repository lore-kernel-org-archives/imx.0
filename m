Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3AB2550D5
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 03:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764733852; cv=none; b=o0mRwv5M0JEIh+tdtY/uXr0e64NCWlt97Ol8sxTNIoJfyOzCRA+qiHn29pwfi690tOmkCbpJmDeO8XWDibclTNp+k9bOornOTN1YDONG49aqMsVLD0H/X1uMwGzRM5HU4AvVn/17X+I24Ch8NBXjhg2N+3qvXTmmByDrKyaTJeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764733852; c=relaxed/simple;
	bh=Q3ZToy5EEuu+A9zI9VCSqcmwzIdt+2p1mXaZvONgPFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dq1MObn863PX5TSniG10KAXwMzXZsrzYbKEdE2GdEc3vhOorSY23mHJpxRE8mU7eIRk8gu2mLa2UvOuNJ/2RKpBTAdmFQF1orBWj2/7RxSkj7RjqCT9MG/dqV3iMwzm4NQ7OasWwBqk/vOPYYnviswZdQAzSEUd0yg7ZSDQnds0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CQB0p/y/; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CQB0p/y/"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dLkFL3gd7z9tTX;
	Wed,  3 Dec 2025 04:50:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764733846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i6mxjAhqN52fQLJBVjoKMe25fLU7L+nNfg1TFd0Xx6k=;
	b=CQB0p/y/26lKNS6WXnrwX5QZ/QKv8bOAU7fnPVorPqGzkrNkDcw+dT5G55q7MnKUrC109l
	R+8+EBAYf9iq+4fE/he/smzs7UTEHV67WU/IgDcHVji5wtxQjEBf3iFjdRLFYXRapimyey
	uTWTC8iPhM9UgR5B6lwxNFseODyrK17OPNn9zLoVHn7kh/5FMy/iQd1wXCaBEskq/tsM8n
	XHr69HUKoe2dLsfuc13mIRpDr83Do9kScbON7nPQsnzAQ77AzlBjk6wG1kCXaLA5KcVa2B
	lmi3URiVQ3mfGkTuJqvMqEdO1V+py4vcXIWdKYvBvBddXEMeJuwgPx62WGvWTQ==
Message-ID: <c6e0e55a-06da-4665-972e-e9b5b8c08bf7@mailbox.org>
Date: Wed, 3 Dec 2025 04:38:19 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: Frank.li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
 robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
References: <20251129143220.14834-1-marek.vasut@mailbox.org>
 <aS-lEibp3zTsaR6T@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aS-lEibp3zTsaR6T@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 52256cf8b3a3eab14fc
X-MBO-RS-META: z5ckj1br1pp63h1rmuzx38dn6pe8qedj

On 12/3/25 3:48 AM, Rain Yang wrote:

Hello Rain,

>> diff --git a/arch/arm64/boot/dts/freescale/imx95-clock.h b/arch/arm64/boot/dts/freescale/imx95-clock.h
>> index e1f91203e7947..22311612e4403 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95-clock.h
>> +++ b/arch/arm64/boot/dts/freescale/imx95-clock.h
>> @@ -183,5 +183,6 @@
>> #define IMX95_CLK_SEL_A55P                 (IMX95_CCM_NUM_CLK_SRC + 123 + 7)
>> #define IMX95_CLK_SEL_DRAM                 (IMX95_CCM_NUM_CLK_SRC + 123 + 8)
>> #define IMX95_CLK_SEL_TEMPSENSE            (IMX95_CCM_NUM_CLK_SRC + 123 + 9)
>> +#define IMX95_CLK_GPU_CGC                  (IMX95_CCM_NUM_CLK_SRC + 123 + 10)
>>
>> #endif	/* __CLOCK_IMX95_H */
>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> index 6091c2713fa48..47f20e501315f 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> @@ -2874,7 +2874,7 @@ netc_emdio: mdio@0,0 {
>> 		gpu: gpu@4d900000 {
>> 			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>> 			reg = <0 0x4d900000 0 0x480000>;
>> -			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>, <&scmi_clk IMX95_CLK_GPUAPB>;
>> 			clock-names = "core", "coregroup";
>> 			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>> 				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
>> -- 
>> 2.51.0
>>
> Hi Marek,
> 
> Thanks for integrating this downstream patch.

Which downstream patch do you refer to ?

> Please note that CLK_GPUAPB and CLK_GPU are
> always-on, so the commit message should be amended accordingly.

The GPU clock do not seem to be always-on, neither do the GPUAPB . It 
seems the SM can turn those clock off perfectly well.

> Additionally, the IMX95_CLK_GPUAPB handle shall be removed, as there is no valid OPP entry
> in the frequency table, this also helps minimize differences between downstream and upstream,
> reducing maintenance effort.

Downstream kernel forks are not relevant to this discussion, upstream 
your content and then you won't have to spend maintenance effort on 
downstream stuff.
