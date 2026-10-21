Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603239;
	b=nDjAFYxfAKgLNgtswkKBkdqlve1usCPHCdHJHGowRhjTa9pigzsFpheUTSF4GSWda93N
	 ILDpBo54Jw5mN5YR7V3LVing5qIsrv6Lz8dgKQRxX4QR/ZbSAC2727YWODQfWeWgxFYCk
	 HNLrab01YG/gVyy3LZM0Cp4Fik7uqX9zYi3A02FvI5W+X5hIAYiVGGs18yY+ueTedpOi/
	 J0u95Vm4gy2rB178X7VSZ2L4Ve1LESy21tSRVcHjqFCXZUsvMtFIdambOdcz/nXVsaxZN
	 gHQ9qWLoJ2PswrEq7K9Pc8Vm8N7EDqzamHG3nwkUwtIuhfk/f+f7ZYzoDVZP7tzhHqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603239;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=SuDvx00jor0zB+rk10Hah3tZomTrz/6EdT+On4Upk9g=;
	b=aSJ68ujcu0ZrTaWaznvjxuDbMRye9NDExXpHpXMDvGHtaljQiKf/hQUuslT4uv6PvDm6
	 e04oaa2dCRYI7to3xf4KWTBb2SPrRH4vOXqG0W0c9709n6yNFpEHRX/Og52a4O9zb+wks
	 gfA6og3m0wFa31LsGrvnAbPVtatDtPKgOY6lZuP5gqw0QhQdhDABkanVzHzKkF4mVUtaO
	 fi5POFC4kaOLbN3I9fPByQp2SGl2H1mTCe+y3O9bJzInisa92vr+v9QY77c+4pz2nS0HZ
	 etU1q77fE21BOW6Vqrl4H8oEh8MuV+VJ4b03XK3C23h/zUy/uh0eYOvZ8u1SP9cvJBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=XuBYSPHg;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B9E606A319
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 17:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B9E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=XuBYSPHg
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07E231051F7;
	Wed, 21 Oct 2026 19:20:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792603232;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=SuDvx00jor0zB+rk10Hah3tZomTrz/6EdT+On4Upk9g=;
	b=XuBYSPHgIeqY/Zc+aoRhwxC2Koif9dMn8TiYbm+/fpd+cuKrZE9gVoaOEwTbUvKl5jX2fx
	iozIXA3WwRrIcH8f5LZHJhdPOVNcJTnHN+9O9nT99HmPO1tbfSEv4LWkaz8DqMszURdO0D
	ou8YSL5AujzVwu+rG1AI3ryFt/4z9enkbIlZXTPgVNIrDtG7iBF4kt26w3wkdOiWVUi+9Q
	Vv1Ic19nDJ96rDT83NQyfUMQ+jti4RJV7M6LRWxczrNxq1lUIorAn5konHJ2rho/0jmxrr
	yKNedkmkv5AZqgw9PvRLEc2v3l/hcNAmxp0HbxTSKV0BQRvfCDgBa/p97J7l2w==
Message-ID: <3ca82faf-dc5a-4ef7-ad8a-f6273b3e0388@nabladev.com>
Date: Wed, 21 Oct 2026 19:20:31 +0200
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
Subject: Re: [PATCH 2/2] ARM: dts: imx6ull-dhcor-maveo-box: Correct PCB number
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-kernel@vger.kernel.org
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <20261021134435.17350-2-cniedermaier@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261021134435.17350-2-cniedermaier@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/21/26 3:44 PM, Christoph Niedermaier wrote:
> The PCB number of the maveo box isn't 525. Change the
> number to the correct number, 625.
> 
> Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> ---
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Marek Vasut <marex@nabladev.com>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-kernel@vger.kernel.org
> ---
>   arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> index eb0b91040110..bb82d97f9d84 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> @@ -6,7 +6,7 @@
>    * DHCOM iMX6ULL variant:
>    * DHCR-iMX6ULL-C080-R051-SPI-WBT-I-01LG
>    * DHCOR PCB number: 578-200 or newer
> - * maveo box PCB number: 525-200 or newer
> + * maveo box PCB number: 625-200 or newer
Is the rev.200 correct , or is the base board still rev.100 ?
