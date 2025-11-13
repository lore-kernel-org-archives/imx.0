Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEA12E6127
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 23:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763077448; cv=none; b=NyCMJqqm11tMSNzcwdZKQ0KIxMDcXNRo9D1xAMFEWFQXHFCDdrMd2KNw6vrrRFdLZ51sd2yt+wCw7ZBSHqwIk6BPS3e61WCKzpdHFfdbNPgUYAB55xX0mgbFOc9KCz1lakAJ28MlG9ruEd43heaRadtlgCebXPH/JzbIpIGM0Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763077448; c=relaxed/simple;
	bh=K7IDGxVuPc9htF6r6S29UFO6As+kDcP693ftPwC5HNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=So0iARvl8PsD2IQtC1s/GEsKEy47cv7OL7g6JtH5gJJtQ3eaWJGEDfUOC++deTNdTbWlDAD54iG/iq+LOUSPbBl9DZPdahR24hQE8BJSUO9la1bxJY+L23etzExzhCSKwHX4si3PifCkRgFlGhS6JsX0f25FY+bpS4RiYGeTeFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=bUA0bMJ/; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=bUA0bMJ/; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="bUA0bMJ/";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="bUA0bMJ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763077445; bh=K7IDGxVuPc9htF6r6S29UFO6As+kDcP693ftPwC5HNA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bUA0bMJ/gdo4AtN3mgMuLhlRW8QiX4zoYg4i1a2YGagksW2ZVI0cfH1VeMMfZ6e0T
	 UM+HXdeaJ3gJquf17wUV3WmsI/JZyXLH9jw2VCzdSLPBOfzCbDovmrdlGGqddrhJW1
	 RtsAlXq3AuhnJhH44D0Pavuep1rIvbD+uUKKk4luT/bpgM1EaCEOyKjrSRGnAR0TTo
	 xAIzxrhvUEsCRR1A86McMV0S0p4aM9js/ORyR61O1rdkH+cYyTRKn3fKnfy0UP75nf
	 kQ+OV+o7WwCp7R/X5qQOVKEQuKqYYuxt2qNprl69gv7Nxh+wqUlMHeLyaBzLccjQd3
	 SYUKkT+hK2raA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id CCB253E101C;
	Thu, 13 Nov 2025 23:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763077445; bh=K7IDGxVuPc9htF6r6S29UFO6As+kDcP693ftPwC5HNA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bUA0bMJ/gdo4AtN3mgMuLhlRW8QiX4zoYg4i1a2YGagksW2ZVI0cfH1VeMMfZ6e0T
	 UM+HXdeaJ3gJquf17wUV3WmsI/JZyXLH9jw2VCzdSLPBOfzCbDovmrdlGGqddrhJW1
	 RtsAlXq3AuhnJhH44D0Pavuep1rIvbD+uUKKk4luT/bpgM1EaCEOyKjrSRGnAR0TTo
	 xAIzxrhvUEsCRR1A86McMV0S0p4aM9js/ORyR61O1rdkH+cYyTRKn3fKnfy0UP75nf
	 kQ+OV+o7WwCp7R/X5qQOVKEQuKqYYuxt2qNprl69gv7Nxh+wqUlMHeLyaBzLccjQd3
	 SYUKkT+hK2raA==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 48D363E0FFD;
	Thu, 13 Nov 2025 23:44:05 +0000 (UTC)
Message-ID: <eb9fa1ab-07d7-4f9d-add4-e6fff015ff44@mleia.com>
Date: Fri, 14 Nov 2025 01:44:04 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ARM: dts: lpc32xx: update #address-cells of arm,pl175
 to 2
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20251029202801.3963952-1-Frank.Li@nxp.com>
 <20251029202801.3963952-5-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251029202801.3963952-5-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251113_234405_854406_AB387800 
X-CRM114-Status: GOOD (  15.11  )

Hi Frank.

On 10/29/25 22:28, Frank Li wrote:
> Change #address-cells of arm,pl175 to 2 to fix below CHECK_DTBS warnings:
>    arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: memory-controller@31080000 (arm,pl175): #address-cells: 2 was expected
>          from schema $id: http://devicetree.org/schemas/memory-controllers/arm,pl172.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> index 77f210a2152dc..0249a1838ee0d 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> @@ -155,7 +155,7 @@ emc: memory-controller@31080000 {
>   			reg = <0x31080000 0x1000>;
>   			clocks = <&clk LPC32XX_CLK_DDRAM>, <&clk LPC32XX_CLK_DDRAM>;
>   			clock-names = "mpmcclk", "apb_pclk";
> -			#address-cells = <1>;
> +			#address-cells = <2>;
>   			#size-cells = <1>;
>   
>   			ranges = <0 0xe0000000 0x01000000>,

Recently you've made a conversion to YAML for arm,pl17x memory controllers
and now this warning is reported - and by the way I believe and it's
opposite to the commit message, the warning is not reported in the upstream,
because lpc3250-ea3250.dts does not enable the controller.

I wonder and let me ask you, why two address cells are needed here?

My default preference is to get one address cell for NOR flash ICs, and
I'd suggest to make a change to the dt binding of the controller.

-- 
Best wishes,
Vladimir
