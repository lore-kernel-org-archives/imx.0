Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730FF334C0A
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 16:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763137982; cv=none; b=L4ybTNgBfhIzRmutHSqMZKLSOCWgVCLlW1NuwIN+WNJhm52JKnmZ1GIzU/cRjK2Li0Qq1MUXWqCeRcl8djGv9cDKV1NtC1EH2X6d5fH2gqdNkFrHhAdrmSf2yg0sB2+2T0uNYmqT0IYVAwHfHTcRbPq2OEND+6qPmV2K282s1Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763137982; c=relaxed/simple;
	bh=bf0pIEsi5Ze4Ewu72bp30eGErg5IlXD0tlNNo6JLWB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mf8Iandk1oN3W/619G0/+27UlGZMSgm1FEI0nLK7KKT1WkUIG8gCIeOvvaK4+tWst8yYB1/ftLT392xOfiw5Fks7rIiEf0sy2nhefe5z5FQsgyw2RmoTcCnZvri6wAgqLCG40ad7oTGPFx3oLPR9QBLdFosmhRP4gN2hwpKpIYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=PG73crPu; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=PG73crPu; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="PG73crPu";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="PG73crPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763137978; bh=bf0pIEsi5Ze4Ewu72bp30eGErg5IlXD0tlNNo6JLWB0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PG73crPueBHj1zRKa8VzXt3JKoUTpWxaF1KTpokvaIMSItnSXKbbT9fc7IQdB+Dk7
	 FQ/n2RKODlqbT1C1Rr2vBEVWe6LBW3DesZrxIhyWYZ8thxG+D8YGxU7MUpKXzoZGJp
	 VClnOzA0pwspGoMAnGyqXS7J8ILZUMdcfOOFqO/sOom9jaEog4enVBail6xVE8ankv
	 D2pCfDYO067CdOqc7JJZYaXo+W5xgfrzJODTYFPSlUEb50gVDSJICsZOUMtiL54MGD
	 IsTNBQN0kZO1vo7qIzF2l9pRuCR3nDIQ2l7I0/PUSFe/1if7rADDpHkFCuxz9soGOP
	 xapk4l/dEfC0A==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id CCE033E1525;
	Fri, 14 Nov 2025 16:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763137978; bh=bf0pIEsi5Ze4Ewu72bp30eGErg5IlXD0tlNNo6JLWB0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PG73crPueBHj1zRKa8VzXt3JKoUTpWxaF1KTpokvaIMSItnSXKbbT9fc7IQdB+Dk7
	 FQ/n2RKODlqbT1C1Rr2vBEVWe6LBW3DesZrxIhyWYZ8thxG+D8YGxU7MUpKXzoZGJp
	 VClnOzA0pwspGoMAnGyqXS7J8ILZUMdcfOOFqO/sOom9jaEog4enVBail6xVE8ankv
	 D2pCfDYO067CdOqc7JJZYaXo+W5xgfrzJODTYFPSlUEb50gVDSJICsZOUMtiL54MGD
	 IsTNBQN0kZO1vo7qIzF2l9pRuCR3nDIQ2l7I0/PUSFe/1if7rADDpHkFCuxz9soGOP
	 xapk4l/dEfC0A==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 450B43E0CE9;
	Fri, 14 Nov 2025 16:32:58 +0000 (UTC)
Message-ID: <646d17c0-7151-4a61-80c0-c336acdf0abd@mleia.com>
Date: Fri, 14 Nov 2025 18:32:57 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ARM: dts: lpc3250-phy3250: add at25 required
 properties
To: Frank Li <Frank.li@nxp.com>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 imx@lists.linux.dev
References: <20251029202801.3963952-1-Frank.Li@nxp.com>
 <20251029202801.3963952-4-Frank.Li@nxp.com>
 <4bf7223e-1611-4149-a4d6-9a3ac103e264@mleia.com>
 <aRdVY5aMCjj4fmDB@lizhi-Precision-Tower-5810>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <aRdVY5aMCjj4fmDB@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251114_163258_858394_49509EF0 
X-CRM114-Status: GOOD (  20.32  )

Hi Frank.

On 11/14/25 18:14, Frank Li wrote:
> On Fri, Nov 14, 2025 at 01:47:48AM +0200, Vladimir Zapolskiy wrote:
>> Hi Frank.
>>
>> On 10/29/25 22:28, Frank Li wrote:
>>> Add at25 required properties (size, address-width and pagesize), which
>>> duplicate deprecated properties.
>>>
>>> Change nodename 'at25' to 'eeprom'.
>>>
>>> Fix below CHECK_DTB warning:
>>>     arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): 'pagesize' is a required property
>>>     arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): $nodename: 'anyOf' conditional failed, one must be fixed:
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>>    arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts | 6 +++++-
>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
>>> index 21a6d0bca1e8a..15463a96938cc 100644
>>> --- a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
>>> +++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
>>> @@ -200,7 +200,7 @@ &ssp0 {
>>>    	cs-gpios = <&gpio 3 5 0>;
>>>    	status = "okay";
>>> -	eeprom: at25@0 {
>>> +	eeprom: eeprom@0 {
>>>    		compatible = "atmel,at25";
>>>    		reg = <0>;
>>>    		spi-max-frequency = <5000000>;
>>> @@ -216,6 +216,10 @@ eeprom: at25@0 {
>>>    		at25,byte-len = <0x8000>;
>>>    		at25,addr-mode = <2>;
>>>    		at25,page-size = <64>;
>>> +
>>> +		size = <0x8000>;
>>> +		address-width = <16>;
>>> +		pagesize = <64>;
>>
>> Is there any need to have both sets of properties?
>>
> 
> Generally, keep old one just for back compatible. It is quite common for
> this case.
> 
> I am NOT sure if it is safe enough to remove deprecated properties now.
> 

It should be safe to remove the deprecated properties, it is fine.

This way the backward compatibility is preserved, and while the forward
compatibility is not preserved, it is not supposed to be preserved anyway.

>> I'd suggest to remove the deprecated set in a separate patch, note
>> that your done change is not described in the commit message.
> 
> Which part is not described?
> 

Sorry for it, I reread the commit message, and both changes are mentined,
but please split heterogeneous changes into separate patches.

-- 
Best wishes,
Vladimir
