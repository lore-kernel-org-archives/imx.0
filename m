Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A87F30FC10
	for <imx@lists.linux.dev>; Fri,  2 Jan 2026 13:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767362020; cv=none; b=epGR38PvzuwEZGx+QuX7a0Qf6/3bwL4ZH5tV0lwT3DryGY6tttkTUVNuHteEnN8V/Y1fltctDnn/t8miZtTrNy0IEQEJVotmuK06rrpKyQwe+s1yUwLsoWj2pkoKlWN+8C+yg1W8nwbd5vWMESqRwSgFq5dYb3W2iijA0r4hW6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767362020; c=relaxed/simple;
	bh=gHuBgv2PqEZ4lJJD4FceQkqq+SPiJSqYIRLDA6kWIyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDZsOcgVxLq6vg3FOfYg4/i1l1v91mdpKf/z56pjOdwbUZ+czd/hbQtZCPHXtIDFk/yVzCeXLBvJ4JtWHS+dKxduxMHd4oQsH+G+XkTx1m0nS7SNuuTLgpZxWJMzR9x2tXrx41CpowWj8B/AAHTa+CFHZnW2s7L6tZy5VpZWmMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mihNgPx/; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mihNgPx/"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4djQC270Gsz9stX;
	Fri,  2 Jan 2026 14:53:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767362015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ujVKOuzo5WqYG+lz+h/KUlxw8OmDWuGVBGYVvXW42P0=;
	b=mihNgPx/gLD9uHoofpTBP+ijkKRfW9R0iSjTMv2iJ87GXsbO6ZXnbANN4HYn+OeuE3Iz4x
	YmmXoeJdARn7pITD1kHG6QtBjvD3u0l5juuQUKJxnUjaW4F1sHdDClXfk19gpbdNaqilpD
	re9v7+ZgkVY8RK2JMHogg1PECqRzA6lp/kCPId/C0tR/RoVnEmPL5niryFmko5oJKb4mUn
	gufNrKNpSICS1BMKOzTfC/ZiDp8ScZRrQ8W03McScz4NQiUOzd34SG+wLp4bfO5w8eOfzY
	obyRXY2ol/5SefQn98MgCRDHKpzlSwVhukROUYHoE0sbGrM9SQGv+IsBLgc2mw==
Message-ID: <0de33175-1dc3-417b-8dab-9b57940f0789@mailbox.org>
Date: Fri, 2 Jan 2026 14:53:31 +0100
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aVegAt002L20oBGf@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e019832cff23643e43e
X-MBO-RS-META: y1eoui7nrfmfe6kre5jnazb59cqu4f7q

On 1/2/26 11:37 AM, Rain Yang wrote:
> On Thu, Jan 01, 2026 at 05:51:12PM +0100, Marek Vasut wrote:
>> On 1/1/26 1:37 AM, Rain Yang wrote:
>>> On Wed, Dec 31, 2025 at 03:11:21PM +0100, Marek Vasut wrote:
>>>> On 12/31/25 4:19 AM, Rain Yang wrote:
>>>>> From: Rain Yang <jiyu.yang@nxp.com>
>>>>>
>>>>> Dropping CLK_GPUAPB simplifies OPP handling and avoids unnecessary
>>>>> complexity.
>>>>>
>>>>> Fixes: 67934f248e64 ("arm64: dts: imx95: Describe Mali G310 GPU")
>>>>> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
>>>>> ---
>>>>>     arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
>>>>>     1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>>>>> index 88bde59e61b2..ab446aa6f73c 100644
>>>>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>>>>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>>>>> @@ -2164,8 +2164,8 @@ netc_emdio: mdio@0,0 {
>>>>>     		gpu: gpu@4d900000 {
>>>>>     			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>>>>>     			reg = <0 0x4d900000 0 0x480000>;
>>>>> -			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>, <&scmi_clk IMX95_CLK_GPUAPB>;
>>>>> -			clock-names = "core", "coregroup";
>>>>> +			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>;
>>>>> +			clock-names = "core";
>>>>
>>>> I don't think this is correct, SM can disable the GPUAPB clock from the SM
>>>> monitor:
>>>>
>>>>> $ clock.w gpuapb off
>>>>
>>>> Linux has to make sure the GPUAPB clock are enabled to access the GPU
>>>> register, hence the clock have to be described in DT.
>>> Hi Marek,
>>
>> Hello Jiyu,
>>
>>> CLK_GPU and CLK_GPUAPB can only be controlled internally by the SM, not by Linux.
>>> CLK_GPUAPB always runs at a fixed frequency, does not require dynamic adjustment,
>>> and is practically always on.
>>> Additionally, CLK_GPUAPB's frequency is absent from all OPP entries. Removing it
>>> could simplify OPP handling logic and reduce unnecessary complexity.
>>
>> But the SM can turn the GPUAPB clock off, correct ?
>>
>> Linux has to be able to turn GPUAPB clock on, therefore the GPUAPB clock have
>> to be described in DT, correct ?
> 
> Yes, CLK_GPUAPB can be turned off by the SM, but by default it remains on, just like
> CLK_GPU. AFAIK, there is no scenario where either of these clocks could or would be
> disabled in both SM and Linux.
> 
> If enabling or disabling CLK_GPUAPB in Linux was wanted, the same shall apply to CLK_GPU
> to make this approach reasonable.
> Also, OPP framework shall be adjusted to meet these changes too.

You can not depend on the state in which bootloader or any other prior 
stage left the platform. If the clock can be turned off, you must make 
sure they are turned on for correct hardware operation.

CLK_GPU is enabled as parent clock of CLK_GPUCGC already.

I don't understand your concerns about the OPP framework, this keeps 
coming up in the discussion one way or the other, but it is not clear to 
me what this is about. Can you elaborate on the OPP framework concern ?
