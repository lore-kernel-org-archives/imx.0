Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C74283CB1
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 23:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763077672; cv=none; b=X8f5Uf4VXuGj6eOVE/BIx7quA4mHD7LlIrsOU/ILuMivQ1bTVamw/jnQxZDcikXUc3cIGMJFmzpq9qVeX9cstySgk8UfrfMU4eH9JBg7WnkUFTFuC6acBt0qLF8GpM6QPnpJLxjcGV+SsIYUkEm3q2NpUfNYNzYTXFMIs+1n+Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763077672; c=relaxed/simple;
	bh=wfe3+QVKDuUk4kmXVMyxrndi9c6nSHlF9pQuYtQldts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GSTt1rbpo1YtmZGieHgZD0JC4/Pf0NVQkg5AZuYU8aFcL6yvfCjSH1MzGeqxZ961iAYqZXoRpiXtrms2ix6X2rIi6C9QbbJdux735srkoNzPP1er+jTXV0e6Duq6o0UbxM780brM7RgjigGlMbZ7/XNfnBK7yx8marsC76lkVzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=dXFXFg1I; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=dXFXFg1I; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="dXFXFg1I";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="dXFXFg1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763077669; bh=wfe3+QVKDuUk4kmXVMyxrndi9c6nSHlF9pQuYtQldts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dXFXFg1ITDq+gWdY+Yz7PEcVHCm2vqBDDA8DEizALg1VzbMGQF4KWzL6WnXEpmAW7
	 5PwbzWIMFKyKAQUUK/KNuV24lAqQxQ2puHq3ggwpSg0clnUDEkvpT+AiHBHo2uXi/A
	 jLUIsICZEEehV0EXR9pLjQvpJz/s1Rq84Npyhucdfh0FDoZ2CacjG5vOebEpXi6Fz6
	 8FoNKMggK84ftcbg5re9S4VXhYWI0L8snMumY/n2MtCF8l8O13X2KAp7uywRdYr/Un
	 ZOLbXKSGNDzg/r/EvY9WfV99x40qM+1pLB3KtqZ4Z5I57m/OTbjM+U6vhQ0EEHg+/O
	 iSBikoi62OC9Q==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 62D203E101C;
	Thu, 13 Nov 2025 23:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763077669; bh=wfe3+QVKDuUk4kmXVMyxrndi9c6nSHlF9pQuYtQldts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dXFXFg1ITDq+gWdY+Yz7PEcVHCm2vqBDDA8DEizALg1VzbMGQF4KWzL6WnXEpmAW7
	 5PwbzWIMFKyKAQUUK/KNuV24lAqQxQ2puHq3ggwpSg0clnUDEkvpT+AiHBHo2uXi/A
	 jLUIsICZEEehV0EXR9pLjQvpJz/s1Rq84Npyhucdfh0FDoZ2CacjG5vOebEpXi6Fz6
	 8FoNKMggK84ftcbg5re9S4VXhYWI0L8snMumY/n2MtCF8l8O13X2KAp7uywRdYr/Un
	 ZOLbXKSGNDzg/r/EvY9WfV99x40qM+1pLB3KtqZ4Z5I57m/OTbjM+U6vhQ0EEHg+/O
	 iSBikoi62OC9Q==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id CE2003E0FFD;
	Thu, 13 Nov 2025 23:47:48 +0000 (UTC)
Message-ID: <4bf7223e-1611-4149-a4d6-9a3ac103e264@mleia.com>
Date: Fri, 14 Nov 2025 01:47:48 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ARM: dts: lpc3250-phy3250: add at25 required
 properties
To: Frank Li <Frank.Li@nxp.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20251029202801.3963952-1-Frank.Li@nxp.com>
 <20251029202801.3963952-4-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251029202801.3963952-4-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251113_234749_422596_BDF43F74 
X-CRM114-Status: GOOD (  17.54  )

Hi Frank.

On 10/29/25 22:28, Frank Li wrote:
> Add at25 required properties (size, address-width and pagesize), which
> duplicate deprecated properties.
> 
> Change nodename 'at25' to 'eeprom'.
> 
> Fix below CHECK_DTB warning:
>    arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): 'pagesize' is a required property
>    arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): $nodename: 'anyOf' conditional failed, one must be fixed:
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> index 21a6d0bca1e8a..15463a96938cc 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> @@ -200,7 +200,7 @@ &ssp0 {
>   	cs-gpios = <&gpio 3 5 0>;
>   	status = "okay";
>   
> -	eeprom: at25@0 {
> +	eeprom: eeprom@0 {
>   		compatible = "atmel,at25";
>   		reg = <0>;
>   		spi-max-frequency = <5000000>;
> @@ -216,6 +216,10 @@ eeprom: at25@0 {
>   		at25,byte-len = <0x8000>;
>   		at25,addr-mode = <2>;
>   		at25,page-size = <64>;
> +
> +		size = <0x8000>;
> +		address-width = <16>;
> +		pagesize = <64>;

Is there any need to have both sets of properties?

I'd suggest to remove the deprecated set in a separate patch, note
that your done change is not described in the commit message.

>   	};
>   };
>   

-- 
Best wishes,
Vladimir
