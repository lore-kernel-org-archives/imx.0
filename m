Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF7C405F7
	for <imx@lists.linux.dev>; Thu,  1 Jan 2026 16:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767286668; cv=none; b=frbUz60YpCMpmAnUjY2v/HrZEDmPuhf10cNlibwXWDe+DmHz0d61+/0VkwQEwYTtYKXS3Yi5gHfeda7KoQlTZwNHdyKxp7/x8AwZ733o4hfYp4o6KqfoSYajtvqSTixUQoRmpExIoXU+wZkhf9bJ+WdAC3smm07w2c4yzePgrHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767286668; c=relaxed/simple;
	bh=t34bAUbZkTE3XnJnjfdrbLVgvucIxRaGkiaDw//WMLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVUEExoOo74YK5pklJtGjMWIsjQp9BZ99y1vSXeOaq+57C5+gt/p6C8lm0Hg38RKOvDeFBywUWQMoPT8hpuk7xH/7uD0TiFLyZMVBHculTIuw/MV8s4at0LSuUOqKzYz7TrWnNFPfxcDH6GbUKysayQJkxXEl//3aJFm1FVrZVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rXGQB1LY; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rXGQB1LY"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dhtKy5gdlz9sJG;
	Thu,  1 Jan 2026 17:57:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767286662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UwhbiH2i/ANAo8+Wch6/HUZJO5n6DwRlRD01nwzx8Ks=;
	b=rXGQB1LYkbEvVkSNsX47TyNne9IPu2vluqViPLO0Fty919Nx3pbgT/jEtVHbbYdNhWDQ6x
	I2bZulzHV3RA1ofyCei2a2VwEDM1cyFyWKp4yY6baAbSWd6cjbG21PxYtTW5ONie3c91Ar
	Q3x0Am/w+eU6tPlCjGaHGc6xO1enuwvMiJ1IEJVkA3E0OOG2dxdT+gB5e7f5/7+pHO0kkW
	JOW9Tha6mjXB9HE7DC6gL4uCJTVLmrrb+jr0+A77VgS5B/VdcSOIJ6g+fQsb19Zhw87T60
	FDi/EDk+eX8NGx31EVhi4be97Zl7uBToY7PRC4/5ppcCuUTiRijCMr3l5JrVZg==
Message-ID: <b2dd2109-c2d9-412e-9b11-5851485acf04@mailbox.org>
Date: Thu, 1 Jan 2026 17:51:12 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx95: remove CLK_GPUAPB
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: Frank.Li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 festevam@gmail.com, imx@lists.linux.dev, jiyu.yang@nxp.com,
 kernel@pengutronix.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 liviu.dudau@arm.com, robh@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org
References: <20251231031915.752262-1-jiyu.yang@oss.nxp.com>
 <37489cb7-820d-46cd-a7ea-0f9097604895@mailbox.org>
 <aVXByNiEfC66RDG0@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aVXByNiEfC66RDG0@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 8f8f6702e7912ba6456
X-MBO-RS-META: ustjw9ys9hf7hrrizs4wzjh54u9p1ppq

On 1/1/26 1:37 AM, Rain Yang wrote:
> On Wed, Dec 31, 2025 at 03:11:21PM +0100, Marek Vasut wrote:
>> On 12/31/25 4:19 AM, Rain Yang wrote:
>>> From: Rain Yang <jiyu.yang@nxp.com>
>>>
>>> Dropping CLK_GPUAPB simplifies OPP handling and avoids unnecessary
>>> complexity.
>>>
>>> Fixes: 67934f248e64 ("arm64: dts: imx95: Describe Mali G310 GPU")
>>> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
>>> ---
>>>    arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>>> index 88bde59e61b2..ab446aa6f73c 100644
>>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>>> @@ -2164,8 +2164,8 @@ netc_emdio: mdio@0,0 {
>>>    		gpu: gpu@4d900000 {
>>>    			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>>>    			reg = <0 0x4d900000 0 0x480000>;
>>> -			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>, <&scmi_clk IMX95_CLK_GPUAPB>;
>>> -			clock-names = "core", "coregroup";
>>> +			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>;
>>> +			clock-names = "core";
>>
>> I don't think this is correct, SM can disable the GPUAPB clock from the SM
>> monitor:
>>
>>> $ clock.w gpuapb off
>>
>> Linux has to make sure the GPUAPB clock are enabled to access the GPU
>> register, hence the clock have to be described in DT.
> Hi Marek,

Hello Jiyu,

> CLK_GPU and CLK_GPUAPB can only be controlled internally by the SM, not by Linux.
> CLK_GPUAPB always runs at a fixed frequency, does not require dynamic adjustment,
> and is practically always on.
> Additionally, CLK_GPUAPB's frequency is absent from all OPP entries. Removing it
> could simplify OPP handling logic and reduce unnecessary complexity.

But the SM can turn the GPUAPB clock off, correct ?

Linux has to be able to turn GPUAPB clock on, therefore the GPUAPB clock 
have to be described in DT, correct ?
