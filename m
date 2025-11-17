Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D53230AAAF
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 19:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763406361; cv=none; b=hjYHSEarp7aT4znnFyu0ETxtjQkGlQKVfRUAUGSPjawv+3VVCi8u24ySRmCie8htEqiL92AriMhaxT0TpXbO1SykTvPtXM6vnssLuuN6j3KSect/8bBulPOliGbpGzS65l40y/MK85SVnNAnFB/UuBfqqzEePMrN/Rni+RHoTC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763406361; c=relaxed/simple;
	bh=O2M42ARMh8MZeBLFMF0MGMXM/A+hOHGoaVAvWRDPJRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hl5u0Q1/LlRzYP2bQohLN1l5zVCaKAAp63vzAelsZcRNfhyDkN2Oy4I7Ruj2Egnu8hUqUZkbDI87SDINQzovsG7AnkAI3WrubXB26LIhHWiltxgUaiXaZzWeHYh1exisCNS0/3itmLD14lj35jLKkSD76m/rYEiJD21rQC21rhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=kcfQx2pw; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=kcfQx2pw; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="kcfQx2pw";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="kcfQx2pw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763406351; bh=O2M42ARMh8MZeBLFMF0MGMXM/A+hOHGoaVAvWRDPJRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kcfQx2pwlfwx3m/Jgbsny+J+qYam4ZMA+1WtQFJoKp+baKmWNnfbOZ3rVu+6+HpD6
	 bqEsiqKdFXXrbMK4mjehYSVMM97OaxlSTI3y4dW2LwPFfIQj5rOle+SyETRNeqLNs/
	 701hf+3J+Mhn5rQJXFx/7xY0kl84yr5+wXWtWZTBuYEdRAzpK7brwcbJh+0v0h6SX2
	 GlSsJhdjlOnGUZ6AqbfwnTEMgmsmN0o7ynCLQ/sGLbq3LVACw01qAdY2jLj6PYQFuP
	 ku6zHjyQutnoylgMPwHmCMNdncfolurAb0fDh7+dt41srLNY+JnhA6QecEG2lcyc7r
	 pVjr1Va7xQLcA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id D00803E1D1D;
	Mon, 17 Nov 2025 19:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763406351; bh=O2M42ARMh8MZeBLFMF0MGMXM/A+hOHGoaVAvWRDPJRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kcfQx2pwlfwx3m/Jgbsny+J+qYam4ZMA+1WtQFJoKp+baKmWNnfbOZ3rVu+6+HpD6
	 bqEsiqKdFXXrbMK4mjehYSVMM97OaxlSTI3y4dW2LwPFfIQj5rOle+SyETRNeqLNs/
	 701hf+3J+Mhn5rQJXFx/7xY0kl84yr5+wXWtWZTBuYEdRAzpK7brwcbJh+0v0h6SX2
	 GlSsJhdjlOnGUZ6AqbfwnTEMgmsmN0o7ynCLQ/sGLbq3LVACw01qAdY2jLj6PYQFuP
	 ku6zHjyQutnoylgMPwHmCMNdncfolurAb0fDh7+dt41srLNY+JnhA6QecEG2lcyc7r
	 pVjr1Va7xQLcA==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 4A4423E1D02;
	Mon, 17 Nov 2025 19:05:51 +0000 (UTC)
Message-ID: <e0c3885d-6db6-404e-b31e-a7674d96e10a@mleia.com>
Date: Mon, 17 Nov 2025 21:05:50 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] ARM: dts: lpc3250-phy3250: remove deprecated at25*
 property
To: Frank Li <Frank.li@nxp.com>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 imx@lists.linux.dev
References: <20251114174712.1206027-1-Frank.Li@nxp.com>
 <20251114174712.1206027-5-Frank.Li@nxp.com>
 <face044b-01ed-4077-b497-3caaccf57c98@mleia.com>
 <aRtJdTMxFaXdVnvs@lizhi-Precision-Tower-5810>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <aRtJdTMxFaXdVnvs@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251117_190551_877347_712C5581 
X-CRM114-Status: GOOD (  14.37  )

On 11/17/25 18:12, Frank Li wrote:
> On Sat, Nov 15, 2025 at 02:23:50AM +0200, Vladimir Zapolskiy wrote:
>> On 11/14/25 19:47, Frank Li wrote:
>>> Remove duplicated deprecated at25* property because the same common
>>> property already were added.
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>> changes in v2
>>> - new patch
>>> ---
>>>    arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts | 4 ----
>>>    1 file changed, 4 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
>>> index 15463a96938cc..0f96ea0337a1f 100644
>>> --- a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
>>> +++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
>>> @@ -213,10 +213,6 @@ eeprom: eeprom@0 {
>>>    		pl022,wait-state = <0>;
>>>    		pl022,duplex = <0>;
>>> -		at25,byte-len = <0x8000>;
>>> -		at25,addr-mode = <2>;
>>> -		at25,page-size = <64>;
>>> -
>>>    		size = <0x8000>;
>>>    		address-width = <16>;
>>>    		pagesize = <64>;
>>
>> Just squash this change with the 3/5 from the series, or I can do it on
>> patch application.
> 
> Yes, you can squash when apply.
> 

Good, no need to resend these changes for you, but I would skip sending
a PR for v6.19, the patches will be targeted for v6.20.

>>
>> My ask about splitting the changes was about a separation of the 4/5 change,
>> and it was done as expected, thank you.

-- 
Best wishes,
Vladimir
