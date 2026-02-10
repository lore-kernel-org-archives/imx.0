Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36EB28F50F
	for <imx@lists.linux.dev>; Tue, 10 Feb 2026 21:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770758835; cv=none; b=jQDRjbX/yzIZ7CfDwyxKMRgIMhi7pQMChRW69VErNETwpLwM/FwDw6xdeIHxZlTOQ5tBkddN/BBgUvSLlnE3CjW4Z0dplSXEIw8h41XB1k+bluwvs50E9mLjgTXATkIP4q1kIL9N17GPcDdMsMjInkeabngntA4mTVkJvDZC1sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770758835; c=relaxed/simple;
	bh=Ci9CcHO6GuGwt60GQnShVhOAfRO/3l7W3nLwg4phJDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GlKADBaJQeWcXFAxh0b1Jcv7QCTNjqC7B1imlNVrvVH/UXNvo7V2+3wEi2TLX4mTINLtXyvJQ1bNTJBkIZtiAkNFnwrAZbxDx36AVj045r8srSluLcFTaEiyg/TjO+R1181ovkMB8mgsTQkLn22X9FSshvx2dkV6BH/plAyI9cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Xm7xfRtu; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Xm7xfRtu"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 698601104B0;
	Tue, 10 Feb 2026 22:27:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1770758824;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=XscM2E/dW4y4NolWAJoTD+vo2fj8gfXABnlEwyo6sXU=;
	b=Xm7xfRtu7rKY0s1c0XVZowP1Y/sM8fFxLM5sgeZdV3g9v1Ur17sdSlLE6cbc9OwrEcJYb0
	Iucm/iKk8tZLjRGqy/AmrsQnViiR7VbSN57j6DsU4Rc5oPUZtPWLs3+IuM+Ne9hzcJOP1B
	/cv5T67VrL0E1dALltYXFbKPM6ixICLwtLAXlDttr1TrTa7jyEeJOuDtLjsXWK8i3pTISA
	HO4iYJ4geFUqlPv2Kmc9pYZuCOEN01OKZ5UZ2jRTNLk/01k/l2ju+484LNHKOquFKLeg7a
	y3QHvhf2snwN8ttBzwvPrlgYdS9Vde5xCLzZxu61hUN/MfsbCmzkN6FNoTCW0w==
Message-ID: <077a52af-add3-473b-bf3c-d3ae9c6a2874@nabladev.com>
Date: Tue, 10 Feb 2026 17:12:11 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: imx6ull-dhcor: Handle both 1DX and 1YN WiFi on
 i.MX6ULL DHCOR
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-kernel@vger.kernel.org
References: <20260209170739.22379-1-marex@nabladev.com>
 <aYoyrqV2lSJetls5@lizhi-Precision-Tower-5810>
 <9760a129-ee03-4556-b98b-2625739b21fa@nabladev.com>
 <aYtSV8oynehECLPM@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <aYtSV8oynehECLPM@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/10/26 4:44 PM, Frank Li wrote:
> On Mon, Feb 09, 2026 at 09:41:24PM +0100, Marek Vasut wrote:
>> On 2/9/26 8:17 PM, Frank Li wrote:
>>
>> Hello Frank,
>>
>>>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
>>>> index 75486e1b0c15f..a0adcd3fe1229 100644
>>>> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
>>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
>>>> @@ -201,7 +201,7 @@ &uart2 {
>>>>    	 * the speed can be increased accordingly.
>>>>    	 */
>>>>    	bluetooth: bluetooth {
>>>> -		compatible = "brcm,bcm43430a1-bt"; /* muRata 1DX */
>>>> +		compatible = "brcm,bcm4329-bt"; /* muRata 1DX or 1YN */
>>>
>>> in driver, brcm,bcm43430a1-bt and brcm,bcm4329-bt should be the same.
>>>
>>>>    		max-speed = <3000000>;
>>>>    		vbat-supply = <&vcc_3v3>;
>>>>    		vddio-supply = <&vcc_3v3>;
>>>> @@ -222,7 +222,7 @@ &usdhc1 {
>>>>    	status = "okay";
>>>>
>>>>    	brcmf: wifi@1 {
>>>> -		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac"; /* muRata 1DX */
>>>> +		compatible = "brcm,bcm4329-fmac"; /* muRata 1DX or 1YN */
>>>
>>> driver have not check "brcm,bcm43430a1-fmac".
>>>
>>> Look like driver can work for both CHIP without modify dts.
>> Sure, the driver can work even with the current DT, but the DT isn't
>> accurate as it describes compatible string specifically for the 1DX part.
>> This change makes the DT use more generic compatible which fits both 1DX and
>> 1YN parts. And it also fixes the comment accordingly.
> 
> Okay, can you descript more clear at commit message, especially how driver
> can auto detect 1DX and 1YN.
This is already there, see "drop the more specific compatible string and 
let the driver auto-detect the chip type."

What would you prefer to change there ?
