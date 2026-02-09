Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBF1242D6B
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 20:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770670025; cv=none; b=AIqCxVuR5z/slniQmXANVZqW9HUjv7lXinzTa74rwfWnhgMcLYKu8+QMxZWUBcdUwUMNlZgotBFgHpYfmsrBGAXf3y45m+DsdNXHlcrwPeoOnt+cl2UH9pvFxeTmUK4FYvdUiA4MQZSzuM3NI9Rt9Ho0FBwBXyhfI9BgXe+GGBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770670025; c=relaxed/simple;
	bh=DMLpEi6ZPTPoa9N+85G0HVq/cjD7Dn72uyfBN8twz5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QQNG2MYEBgxVez4LqfSWozULQHkmC7/WoSnPOJ9VXL3IqnknUHiK1x1RFYHXLBducwj/hjAuwS+YIAMuALvP7k5IazPRvCGnDkm/bupgrwLZya+wsuH3AVs5QHq80LrnCVEGxkC5YpROCVg0jgVEF2WOK6zBAM4npx3lDHImJKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=evR3W6HN; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="evR3W6HN"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B3F41102FD;
	Mon,  9 Feb 2026 21:46:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1770670021;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=lC/SYncgKW4XWLK8EoKHwDB7L/Xq+4HOQ9Bm5MSJPCY=;
	b=evR3W6HNNS3mhzOxyEsKLD0cLcuvyudT+EVXX+nAMe/QZ5QpotoCLi3jaGafks3BVG3tfV
	yN6VkaaQ7Kt0CHKUz1h9mN3tjXkBQuXX8WrwapYJ3lUkxE97SwgA9ffOt5Tpf0XAjmZsAF
	arqbAdTXW0679PFx1+gER01WG2ZKvP8FC0ZW93HPRwQc6HiU+a/UvKJRQFC5MaeuYSj7Rw
	4GTsD2k4JH3IGtruZOgY/zL0kRfVMKiWDUZOxHK1gL9l9NVFFVcDRxQ3IeDZYHXzhNocii
	6eiu8KHitFTcV+tzwRXuSg+BcMn8LR3A5+WCwz28eGNB8k3pK5jdlao96MzkHQ==
Message-ID: <9760a129-ee03-4556-b98b-2625739b21fa@nabladev.com>
Date: Mon, 9 Feb 2026 21:41:24 +0100
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
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <aYoyrqV2lSJetls5@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/9/26 8:17 PM, Frank Li wrote:

Hello Frank,

>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
>> index 75486e1b0c15f..a0adcd3fe1229 100644
>> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
>> @@ -201,7 +201,7 @@ &uart2 {
>>   	 * the speed can be increased accordingly.
>>   	 */
>>   	bluetooth: bluetooth {
>> -		compatible = "brcm,bcm43430a1-bt"; /* muRata 1DX */
>> +		compatible = "brcm,bcm4329-bt"; /* muRata 1DX or 1YN */
> 
> in driver, brcm,bcm43430a1-bt and brcm,bcm4329-bt should be the same.
> 
>>   		max-speed = <3000000>;
>>   		vbat-supply = <&vcc_3v3>;
>>   		vddio-supply = <&vcc_3v3>;
>> @@ -222,7 +222,7 @@ &usdhc1 {
>>   	status = "okay";
>>
>>   	brcmf: wifi@1 {
>> -		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac"; /* muRata 1DX */
>> +		compatible = "brcm,bcm4329-fmac"; /* muRata 1DX or 1YN */
> 
> driver have not check "brcm,bcm43430a1-fmac".
> 
> Look like driver can work for both CHIP without modify dts.
Sure, the driver can work even with the current DT, but the DT isn't 
accurate as it describes compatible string specifically for the 1DX 
part. This change makes the DT use more generic compatible which fits 
both 1DX and 1YN parts. And it also fixes the comment accordingly.
