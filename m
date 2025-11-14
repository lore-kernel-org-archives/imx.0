Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35AB32D0CB
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763138647; cv=none; b=CD9C5Bm8jpOB6GD8jFFhnBwqlWj8n7VX+WvrrmKZVA93oUHMBBouG4tM7gasnvspnvSWvGkz35n8IaoVBYFJY9gzjcBzl7/AfZ1FG2By0xZZTKKOB3KbaP7AwGFjzDg4XtyRFZzW8ds80Fh+ZUg3wkalFEZ1vWbK6+Sit8/iM3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763138647; c=relaxed/simple;
	bh=amx1Z+RrD4CwZ1rF6kcX9RLp5bCo6GnsqSibeDGvxyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEo/uXIqOvqLiBxOUGs/SoPitnFmVdE1GnlmBoqdmInVosKBhH0atiihNDzQbdJWI00uDgx1RLe5eMBvi3TDqHkSFWizdfrcFPyjUBg5ttAbHDLbaqS1NMKlukFz8z/oQIr040TxUnq7lbxZeZiyARp8NPR53wTUzmGkZeds/bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=Jr6lUwqt; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=Jr6lUwqt; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="Jr6lUwqt";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="Jr6lUwqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763138644; bh=amx1Z+RrD4CwZ1rF6kcX9RLp5bCo6GnsqSibeDGvxyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jr6lUwqtdr04b1l1ZEG72BDuCoatMDSU4HJBDfQSnzXgD43UAD7Yya8jLAOHFM3pz
	 LK+Ox5L6zQoko/4ZvLV5i4Z+4Wyd03by68F2Ftrd/PUFTz4cLrtR0Uh3YFQ4wy9nUL
	 JODrdFz9ms4H8d8kzf2o8jrHfA4D+PjWNIxxPvKvkUTOsse4SAann7ST4O5aonw/jO
	 udYtZHr4LLYpCz1UK0kTSAeFlaqJm2TXsGJyxzn2goTbucnSPvvCquQfc/6ErV0hBd
	 j0oSj65KXxFCQBVFYAHwKbapDHIIScULCidB2h1CKoawRyUpOrkVctlQXW8G2OpcRx
	 igzZpM9O9PMuw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 2AD5C3E1525;
	Fri, 14 Nov 2025 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763138644; bh=amx1Z+RrD4CwZ1rF6kcX9RLp5bCo6GnsqSibeDGvxyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jr6lUwqtdr04b1l1ZEG72BDuCoatMDSU4HJBDfQSnzXgD43UAD7Yya8jLAOHFM3pz
	 LK+Ox5L6zQoko/4ZvLV5i4Z+4Wyd03by68F2Ftrd/PUFTz4cLrtR0Uh3YFQ4wy9nUL
	 JODrdFz9ms4H8d8kzf2o8jrHfA4D+PjWNIxxPvKvkUTOsse4SAann7ST4O5aonw/jO
	 udYtZHr4LLYpCz1UK0kTSAeFlaqJm2TXsGJyxzn2goTbucnSPvvCquQfc/6ErV0hBd
	 j0oSj65KXxFCQBVFYAHwKbapDHIIScULCidB2h1CKoawRyUpOrkVctlQXW8G2OpcRx
	 igzZpM9O9PMuw==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 9629B3E0CE9;
	Fri, 14 Nov 2025 16:44:03 +0000 (UTC)
Message-ID: <03494fa4-26e6-4691-8fa6-5bd99c2c25a1@mleia.com>
Date: Fri, 14 Nov 2025 18:44:03 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ARM: dts: lpc32xx: add bus surfix for simple-bus
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
References: <20251029202801.3963952-1-Frank.Li@nxp.com>
 <af66cc8a-051a-4512-9a02-468b17550775@mleia.com>
 <aRdWoQ/vPplF0aQA@lizhi-Precision-Tower-5810>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <aRdWoQ/vPplF0aQA@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251114_164404_195024_621ABE18 
X-CRM114-Status: GOOD (  17.26  )

On 11/14/25 18:19, Frank Li wrote:
> On Fri, Nov 14, 2025 at 01:55:50AM +0200, Vladimir Zapolskiy wrote:
>> Hi Frank.
>>
>> On 10/29/25 22:27, Frank Li wrote:
>>> add bus surfix for simple-bus to fix below CHECK_DTBS warnings:
>>
>> typo in the subject and in the commit message above, s/surfix/suffix/
>>
>>> arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: usb (simple-bus): $nodename:0: 'usb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>>>           from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>>    arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 6 +++---
>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
>>> index 2236901a00313..9790b0a1d6537 100644
>>> --- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
>>> +++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
>>> @@ -86,7 +86,7 @@ dma: dma-controller@31000000 {
>>>    			#dma-cells = <2>;
>>>    		};
>>> -		usb {
>>> +		usb-bus {
>>
>> Device nodes under "usb" should be just elevated, the "simple-bus" here
>> was used only to group some controllers together.
>>
>>>    			#address-cells = <1>;
>>>    			#size-cells = <1>;
>>>    			compatible = "simple-bus";
>>> @@ -307,14 +307,14 @@ mpwm: pwm@400e8000 {
>>>    			};
>>>    		};
>>> -		fab {
>>> +		fab-bus {
>>
>> FAB shall find its place in the AXI/AHB/APB/... list, isn't it?
> 
> what's FAB means? It is too short and hard to find exact information
> from google?

You may find UM10326 "LPC32x0 and LPC32x0/01 User manual" document online,
LPC32xx is an old and simple SoC.

FAB stands for Fast Access Bus, it's a bus behind AHB to FAB bridge, you
may get an overview from "Fig 3. LPC32x0 block diagram, AHB matrix view",
and "Table 4. Peripheral devices on the LPC32x0" lists all FAB peripherals.

So, FAB is very similar to APB functionally, could it be just another
name of APB?.. Likely we won't know for sure.

I'd suggest to send a change, which adds "fab" to the list of permitted
device tree node names with a "simple-bus" compatible. Or let me know,
and I'll do it myself whenever I find a minute for it...

>>>    			#address-cells = <1>;
>>>    			#size-cells = <1>;
>>>    			compatible = "simple-bus";
>>>    			ranges = <0x20000000 0x20000000 0x30000000>;
>>>    			/* System Control Block */
>>> -			scb {
>>> +			scb-bus {
>>>    				compatible = "simple-bus";
>>>    				ranges = <0x0 0x40004000 0x00001000>;
>>>    				#address-cells = <1>;
>>
>> Here "simple-bus" is also unjustified...

-- 
Best wishes,
Vladimir

