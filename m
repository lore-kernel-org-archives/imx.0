Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6F222339
	for <imx@lists.linux.dev>; Sat, 15 Nov 2025 00:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763165806; cv=none; b=KaMVzzTkDOVS7l3qXTGZ4Jzo13FFfhCTYKMg57U2CqJwytnK23kPvrgHZiW3E85FnTIafrXHdPemwjC+Xsm50CaUPjbyF73rUNo5zzQniGslUFl9u/97eDMqjshzhciC3Dxppi6Na1MtuiDJRTTX0wek3nUSFV1In40tSO6wLzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763165806; c=relaxed/simple;
	bh=alGYrlAwEOwi5Ic0/WsJgHzayrg1ogR5hqg7HxgRYyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mUzXn9V+rsXES6HWytcfItkKR7e9b750g9nxI0q4pvtmMhZhl+r1HEPm1PKVb6CHnNebJkIgFfhUbMKfuzDT61LUugyPgPfc5BJvotNDjdhiUoRXwBJmAMByGRi3kqLEE3EZ7il8WyaqdHhIUyf5wY/PB1x1MxcPlXa4V5k+JwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=JOp5wtSe; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=rvwYuWDH; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="JOp5wtSe";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="rvwYuWDH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763165803; bh=alGYrlAwEOwi5Ic0/WsJgHzayrg1ogR5hqg7HxgRYyI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JOp5wtSeU7fbQE8G+WlMR7b8XOeGAfjy1x3VxjOOPfzH9L0KnA2HwXVKZfPmuqLek
	 Jk4IiWUUsOVMHO02dL5LsRBLAzZpJUGHHlYYd9tk98vhkHvrfJJKS8j8bCZ3Toqj3e
	 nonHJ4XCMzNelUPqyckzrB8/oEa8l6+DkQmAtippx4Mx5FxH1wGghUiWna5U+rWvaC
	 YFX/HN8JHm40/A04BzAb54eZuKzbXJcPr/lLuiMSz8dHaDofkXMaYLt9Ag6TDzy7xx
	 XyBhZWusHngV/OngDGe8V3Q27spmMmqlJSX12JKaUOUFGl35H2jrAzHQe9yqpiXeEf
	 gVBH66mVVX3Hg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 008CF3E16D7;
	Sat, 15 Nov 2025 00:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763165802; bh=alGYrlAwEOwi5Ic0/WsJgHzayrg1ogR5hqg7HxgRYyI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rvwYuWDH3jT20GsiJvCpoqZlWTzI4ssPkzWt6Bjq2LotY51lb+sFUK4XXVkSVSGJs
	 DmisGw34enXe0AeBzAnbWKZlaws9757XH6uKqbXyUCAf+X8aIsgOfma3DAxzhnp2Wi
	 V0QElfxn57GbzFc2ttynAWA6ywdid5H+mnfaLuour6GnmkQaomM0dPjI9lhSa3nypX
	 mMO69WbOCHE3bCvIs+OYdPPEeuTHR1vWuOUduM5s4WlrKDZtm3WiJPgP0+JZMbBQlx
	 qAMywYnZ4NHLnO3ziluaz2PgKeC4FxEm52cg6YJuiNLICwFQ+0YtXE/Jc4rI3XGpfr
	 lq/l4WiTB4vDg==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 6F3223E101C;
	Sat, 15 Nov 2025 00:16:42 +0000 (UTC)
Message-ID: <09def66c-0101-4113-b788-bf31966b9316@mleia.com>
Date: Sat, 15 Nov 2025 02:16:42 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] ARM: dts: lpc3250-phy3250: rename nodename at@0 to
 eeprom@0
To: Frank Li <Frank.Li@nxp.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20251114174712.1206027-1-Frank.Li@nxp.com>
 <20251114174712.1206027-4-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251114174712.1206027-4-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251115_001643_016385_94964797 
X-CRM114-Status: GOOD (  14.03  )

On 11/14/25 19:47, Frank Li wrote:
> Rename nodename at@0 to eeprom@0 to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): $nodename: 'anyOf' conditional failed, one must be fixed:
> 	'at25@0' does not match '^eeprom@[0-9a-f]{1,2}$'
> 	'at25@0' does not match '^fram@[0-9a-f]{1,2}$'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - new patch
> ---
>   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> index 732d590f6cfdf..15463a96938cc 100644
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

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir
