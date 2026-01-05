Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A8D2F5461
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767637312; cv=none; b=soVsgvtYvo1WQ029zrAhgQxIMn/8PUzBerwkovJeAbn9co/oBWL+Zog8K8JI0oPZj6kuOCgyLSyN9LH8/IFzLaDkoH2eHVTO18bF2ziSgSJZ2uqpyokjeTwwNiBsBnrlbVPjzDRdaTj0Nnx2YpM2cCDDKuMUOOBKFlRgHSa/brc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767637312; c=relaxed/simple;
	bh=z6/Wphu0OAMssonNpeRuI/trkuqvtCdVfy8qVsTvcIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QjcVTMb1YYW8CnHOb+tMUmirv37p5vBUBEbiVwT62/fqIXAL1OMmOsN2rPXLyhl5Bf3mZwu0+NQf9GniKzUABuLz3G04q4dhWwoyd7PR11KExYSWcdZIEKdUfapxzGRF9gSDbVOoBUpnLxUCEM0B2MvId5JyLc8MHCaqrvfOYPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=D+zS7y9c; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="D+zS7y9c"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dlN170fMhz9tQq;
	Mon,  5 Jan 2026 19:21:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767637307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MMJqVJMgue288REwsy/Kw6YGKx1SN8vSeF+6ZE5Moss=;
	b=D+zS7y9cPJmp7H19AB12Uc+mBc/ke2p2UuL4YS/0DSDQ4r9a1VtgyxCG3UMOVgOgehUf28
	SC4w4+OQxJagppCvCwXk+2ay5KJdqaSkokOqIBSHotCxFb+laTaFAOTXUu+SUOb0qdzUpx
	90yJkRxTdCmw/FuXWXIvMjkpNt9hStakeolIv+f+MkFrZ5totTC/Hz5wE7C2KnS/muevNw
	JGDj1ZmrNZ624ofZCrxpHgjcEFfrYWxZ95rKILE13KfaVyvWGpLFhdZUIyC5ETUGfs0gNE
	cnatCGqwGVkFCuTb+0jXZKCoKWSRE9CpChJ9ILyUnJlATxGRAS7CFiN2y34LYw==
Message-ID: <0355f521-e506-447f-bc6a-cf4405903cfd@mailbox.org>
Date: Mon, 5 Jan 2026 17:31:55 +0100
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
 <b2dd2109-c2d9-412e-9b11-5851485acf04@mailbox.org>
 <aVegAt002L20oBGf@oss.nxp.com>
 <0de33175-1dc3-417b-8dab-9b57940f0789@mailbox.org>
 <aVsfpHtID4SdPP1n@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aVsfpHtID4SdPP1n@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: xdypdcre8setbt9xhn7hd96tdehyypri
X-MBO-RS-ID: f32776500066e9b0833

On 1/5/26 3:19 AM, Rain Yang wrote:
> On Fri, Jan 02, 2026 at 02:53:31PM +0100, Marek Vasut wrote:
>> On 1/2/26 11:37 AM, Rain Yang wrote:
>>> On Thu, Jan 01, 2026 at 05:51:12PM +0100, Marek Vasut wrote:
>>>> On 1/1/26 1:37 AM, Rain Yang wrote:
>>>>> On Wed, Dec 31, 2025 at 03:11:21PM +0100, Marek Vasut wrote:
>>>>>> On 12/31/25 4:19 AM, Rain Yang wrote:
>>>>>>> From: Rain Yang <jiyu.yang@nxp.com>
>>>>>>>
>>>>>>> Dropping CLK_GPUAPB simplifies OPP handling and avoids unnecessary
>>>>>>> complexity.
>>>>>>>
>>>>>>> Fixes: 67934f248e64 ("arm64: dts: imx95: Describe Mali G310 GPU")
>>>>>>> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
>>>>>>> ---
>>>>>>>      arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
>>>>>>>      1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>>>>>>> index 88bde59e61b2..ab446aa6f73c 100644
>>>>>>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>>>>>>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>>>>>>> @@ -2164,8 +2164,8 @@ netc_emdio: mdio@0,0 {
>>>>>>>      		gpu: gpu@4d900000 {
>>>>>>>      			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>>>>>>>      			reg = <0 0x4d900000 0 0x480000>;
>>>>>>> -			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>, <&scmi_clk IMX95_CLK_GPUAPB>;
>>>>>>> -			clock-names = "core", "coregroup";
>>>>>>> +			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>;
>>>>>>> +			clock-names = "core";
>>>>>>
>>>>>> I don't think this is correct, SM can disable the GPUAPB clock from the SM
>>>>>> monitor:
>>>>>>
>>>>>>> $ clock.w gpuapb off
>>>>>>
>>>>>> Linux has to make sure the GPUAPB clock are enabled to access the GPU
>>>>>> register, hence the clock have to be described in DT.
>>>>> Hi Marek,
>>>>
>>>> Hello Jiyu,
>>>>
>>>>> CLK_GPU and CLK_GPUAPB can only be controlled internally by the SM, not by Linux.
>>>>> CLK_GPUAPB always runs at a fixed frequency, does not require dynamic adjustment,
>>>>> and is practically always on.
>>>>> Additionally, CLK_GPUAPB's frequency is absent from all OPP entries. Removing it
>>>>> could simplify OPP handling logic and reduce unnecessary complexity.
>>>>
>>>> But the SM can turn the GPUAPB clock off, correct ?
>>>>
>>>> Linux has to be able to turn GPUAPB clock on, therefore the GPUAPB clock have
>>>> to be described in DT, correct ?
>>>
>>> Yes, CLK_GPUAPB can be turned off by the SM, but by default it remains on, just like
>>> CLK_GPU. AFAIK, there is no scenario where either of these clocks could or would be
>>> disabled in both SM and Linux.
>>>
>>> If enabling or disabling CLK_GPUAPB in Linux was wanted, the same shall apply to CLK_GPU
>>> to make this approach reasonable.
>>> Also, OPP framework shall be adjusted to meet these changes too.
>>
>> You can not depend on the state in which bootloader or any other prior stage
>> left the platform. If the clock can be turned off, you must make sure they
>> are turned on for correct hardware operation.
>>
>> CLK_GPU is enabled as parent clock of CLK_GPUCGC already.
> Hi Marek,
> I'm afraid it's not what you expected, the CLK_GPUCGC patch already based on the CLK_GPU is
> always-on, you can disable the CLK_GPU in SM, then run any gles application, the board will reboot.
Which kernel version are you testing ?

Also, can you share your /sys/kernel/debug/clk/clk_summary ? The clock 
relationship should be visible there.
