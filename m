Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5088E283FEE
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 23:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763078154; cv=none; b=jRPYRTE0wMP9i/QoOuJDEDTkp6ArTo0KrCK0wVc+IVD1ybpqivVHg20XFdudkNq5xVCAfoOOWGA7CMOwlFAruvF5TNdDqWPSmOyWB9LPRZldeDoDpx5GPkzB1EG7VUuw6VEZNVpphVNT5R7nWiPC8DkevtFKNthpKhGWgzSx49I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763078154; c=relaxed/simple;
	bh=ZRVq35L6TkrpSlFnqbXH25zsbqFI5rryoyNnRXqRoZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PxGOSUX64834t2cl7ju/wusut+RW9YPFdASoP1FICKvrXv1FotOkwasB5vgVS4TDboe8QHIHiZVoKgD8IqRrjX1Itrd96EdqU5obELfp6cPKfPoaORHdV+wkf3kMuSr68l1smIFoIOBtARoTm37MY2GS4rVoX1G9Lbnn01AE9Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=jpX9Nghw; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=Vvu7kgOm; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="jpX9Nghw";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="Vvu7kgOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763078152; bh=ZRVq35L6TkrpSlFnqbXH25zsbqFI5rryoyNnRXqRoZQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jpX9Nghwryf8uxSu4AB5hnX+xmz2yENYr9YicLYFq25z0toePQTIZ11EMoj/6NBzI
	 3kb4dCVaVQrJUfaL5IP2BPZ5/rnxOJf0j2aBppjWzTHzzJYuQorjpu/kao+bIPxUtl
	 epJCoPKLrmFqi0W5EiVO3dp916n2EaeLJSGgfmYFjFYYru3yWgnMzBcL9nBxCEZTDo
	 bxob+zX/arIl+YKlJmYy5fP0JkvzZWrhkkE4Tkl0+8G+eH8JSdssIkHQmkB45/nmos
	 EXPrYR0qZfuLDblqIyg2VapQuQvt4yNmivSo+2ri5lZNK7a0cF1EFdAFC299HYWthg
	 nNxYVGeXwV1Bw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id EB8793E101C;
	Thu, 13 Nov 2025 23:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763078151; bh=ZRVq35L6TkrpSlFnqbXH25zsbqFI5rryoyNnRXqRoZQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vvu7kgOmglxU/7GZV4bsMZsuyEbf5c1ubIWr7hGRZyOsvk32piaTwQUXHVy8zASBC
	 AFB+Q6Jkb5dYi8RgHbL4x4va2KkxMcU+/AmO3zK8H93wQphIgMNKA983m7J6OSRN7H
	 Au3CNfatXMfGRoviloOdx5biqQRLh/wISVansZ6kVL9UZakxWuBZeMnYvn5PPdinpi
	 Tcj6wrVHdCPskHdzNE2zM9H1+Yr2hV2p7k678DOF01IVHRWlrhf8I+SXGmXvC32bmx
	 9DRhnUgUTmwhj6cyEwyUJ1FkTlqbuLqioOlGDdHUaC3inVMtvwPvv/ZBl4khSEujGU
	 KdgyiNX/dCvMQ==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 688DA3E0FFD;
	Thu, 13 Nov 2025 23:55:51 +0000 (UTC)
Message-ID: <af66cc8a-051a-4512-9a02-468b17550775@mleia.com>
Date: Fri, 14 Nov 2025 01:55:50 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ARM: dts: lpc32xx: add bus surfix for simple-bus
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
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251029202801.3963952-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251113_235551_981863_740BD6B8 
X-CRM114-Status: GOOD (  15.55  )

Hi Frank.

On 10/29/25 22:27, Frank Li wrote:
> add bus surfix for simple-bus to fix below CHECK_DTBS warnings:

typo in the subject and in the commit message above, s/surfix/suffix/

> arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: usb (simple-bus): $nodename:0: 'usb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>          from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> index 2236901a00313..9790b0a1d6537 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> @@ -86,7 +86,7 @@ dma: dma-controller@31000000 {
>   			#dma-cells = <2>;
>   		};
>   
> -		usb {
> +		usb-bus {

Device nodes under "usb" should be just elevated, the "simple-bus" here
was used only to group some controllers together.

>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			compatible = "simple-bus";
> @@ -307,14 +307,14 @@ mpwm: pwm@400e8000 {
>   			};
>   		};
>   
> -		fab {
> +		fab-bus {

FAB shall find its place in the AXI/AHB/APB/... list, isn't it?

>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			compatible = "simple-bus";
>   			ranges = <0x20000000 0x20000000 0x30000000>;
>   
>   			/* System Control Block */
> -			scb {
> +			scb-bus {
>   				compatible = "simple-bus";
>   				ranges = <0x0 0x40004000 0x00001000>;
>   				#address-cells = <1>;

Here "simple-bus" is also unjustified...

-- 
Best wishes,
Vladimir
