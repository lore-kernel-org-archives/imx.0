Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651791;
	b=aeGlrSnS1uAKOpReM3Js2cIJnFHdk5WCEfi0LCQznU3uYN+GAhIUg4WM2K2U0cgy8iGr
	 5VWqOGJRXL7+QRROiTblPfq8Uh5doJO9kC9pX0cWULLcrKUBFOR27rAYDA/HnxS6yCBEQ
	 PPqBaBEOymiKuZtLnKoLxxKnnCKwpStdfVUt9Nk7Rpc+KPmTfRVYmx9RDC8PCAOsFIiEt
	 +XwUUyhjnSJ6HFpl1Ebrc7KIb8ll23DZhIOh8hujuEg925Ew4DLkAGDTn394apXMuFvVG
	 OpSQcxfI1OEtoEV2F58Pjs9QVp9ghuuuFkkkLg8YPWtYRDw5Wm4FjDZPEeeOcVke+5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651791;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=YoPKot+7OFfT2JTNWL87bj+n+ySvp+5zZLX5ffnAJSw=;
	b=VP+WicaA7nVjU8fya1U2Yn3EWGBJsLLQl+rqaijOmcpx+eNuvEVLPYvHVhp04ZR26z1M
	 U5j0zVp0Q93llFVn9MfJVH/jN5EogxmitMSTLI9ipRkHX6PnPO4NzUSr9ekX1XTay6xzx
	 YQ7u1Jaqd/jzbvKCx8zrETFCHv9dpUxjaA3Nozreh8/VPrMg5CjCqlYUvnud9WZxiboYv
	 lFZwOSUWTkmH704RQ1DSqgPtKIX+gY/Y6L+mgnEnKNW3T/ViWsPzXo8ja2pOVRPgBt3EW
	 y4MDdYecF+VQynU6G5bohWqmTVUsSlF9RoRfJQ/KKm/+88a4yscVIaU2uVSSF/6o1IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=U8UrzikZ;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CEC606A31A
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 06:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45CEC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=U8UrzikZ
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 285091064DB;
	Thu, 22 Oct 2026 08:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792651779;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=YoPKot+7OFfT2JTNWL87bj+n+ySvp+5zZLX5ffnAJSw=;
	b=U8UrzikZz0xZabqwk+QoTCrngKROX+XZlyNL7Ubml2HXtPTUdBa/4P+rpMgCEW47j2jXPs
	oqL8LBGnpUBp8zdNbqwadWIT8ZHt6LIstgvYjdiKH7l+m/aV6HvWytVOPIQLCYftUlVyP7
	qUyCDufkNwHJVGozYYsZnON8LFYQ8yS+Gz/kjWw8F+YshkeRKUN3saIha4kLMNX80N8Nze
	NLCeJvUMgIdvcjAq6Yzg5AvsGF4nGq8C/Oa9V24UbZo4w+CoK/zKUVrw/LOddXXzQYa+FI
	uPc5BSV6IX2+cROaESq3NReNxjH+nyQlEo/q3gwVov1g8MrnpnuVmB72U10C+Q==
Message-ID: <d4b9c444-a848-4b4f-9273-1c832db45fc8@nabladev.com>
Date: Wed, 21 Oct 2026 20:55:39 +0200
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI
 device
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-kernel@vger.kernel.org
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>
 <20261021183704.GA1116319@francesco-nb>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261021183704.GA1116319@francesco-nb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/21/26 8:37 PM, Francesco Dolcini wrote:
> On Wed, Oct 21, 2026 at 07:19:30PM +0200, Marek Vasut wrote:
>> On 10/21/26 3:44 PM, Christoph Niedermaier wrote:
>>> On the maveo box, the SPI pins are connected to connector X10,
>>> but no device is connected. The device "dhcom-board" was used
>>> only to test the hardware, but was not removed afterward. So
>>> remove this device to accurately represent the current hardware
>>> configuration here.
>>>
>>> Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
>>> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
>>> ---
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>> Cc: Frank Li <Frank.Li@nxp.com>
>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>> Cc: Fabio Estevam <festevam@gmail.com>
>>> Cc: Marek Vasut <marex@nabladev.com>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: imx@lists.linux.dev
>>> Cc: kernel@dh-electronics.com
>>> Cc: linux-kernel@vger.kernel.org
>>> ---
>>>    arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 8 --------
>>>    1 file changed, 8 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>> index 047f7b2d8526..eb0b91040110 100644
>>> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>> @@ -60,14 +60,6 @@ &ecspi4 {
>>>    	pinctrl-0 = <&pinctrl_ecspi4>;
>>>    	pinctrl-names = "default";
>>>    	status = "okay";
>>
>> Drop "status = "okay"" too , since this controller will be unused ?
> 
> you can instantiate a new device on the SPI bus from userspace. up to
> you, but if I was a user I would appreciate to have it enabled.
Good point -- Christoph, is this the (use)case here , can the user do that?
