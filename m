Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D6C1E376B
	for <imx@lists.linux.dev>; Fri,  4 Oct 2024 16:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728058021; cv=none; b=U8DNIDAHVE0zo/389WtC8TCDGYKbytob4wyzwPowXcc4bV4ZoZM/U8QEHOV0mYm3bVvtqe/llYwY/xt2DFwctoklWQd1QZN0x7mcRTP8j71PIbyGAHANZPvDU0FzQNkMu2406R8piDf6S3gB8oeQGUY9M3OkD3GM0RxYguhcrq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728058021; c=relaxed/simple;
	bh=B69eyQbcEBKnZVfyHa2gbWHepeyPz/kmnqlGKtQXpDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oMHu68w6QVIYgg3DsPM4gn32szJaV2d1qI1itg/oRVWNCdVaNJ64kUgIHqVLv2ne0RHG/M69+48S/Qlr7n5HTGimFZ0urKLh+IFTv+ERzOxbI1k3j8gDnWDdsUV7ubrIw/k5lxASZEn6GfVNUWJLL6/usQPba1lpgLDbSC+Se/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=g26L3fcf; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="g26L3fcf"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id BC865A0BB9;
	Fri,  4 Oct 2024 18:06:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=lPTT1nXxz8sDPpQ2LsGw
	LpVVCr/3k30SGq086cduSXs=; b=g26L3fcfkVXWQv7S/ojLOADDjLX7UbLlWxcp
	wCNjf1kDjKnY5fyMf75Au1bAZpQOXeKfFNsp4+l06D8OZsj6YsC6nv6GA8C4PfPU
	PUOncSdkq28QwGYcxdn2K5ImHWpwW87DE2GoTFFRZ8LkMi0m+Gt8Y+msG22ntNLL
	SkGJoNmLAXni3bB9o+E8aeL+q9ejiDEB2cynt7iu7Z4dyH5cCARmERo8fGcU40Mv
	0ceqOcJW1wFHtDCwU/X8UINw357zsWVRL9pJyF2IyJPGTy9G0Cf6/VQvYpcADheg
	qdJZ2Ddjlxpxbd6JNK97G7ThEjG+dpe1wG6idy/w/C++NskfL/SDkhcT+WSNuc8h
	SK2+7fIaBe97QNrsl9MhyUDM8SCqpFASDt+rkRHEz3tYmPktMQltq4sJmqJcdVKJ
	5dyUEK5X+NKgnigO9OGEXs1v/pebJouhAu92PjsGygJJ2fUeWjo44ZPOhUxfJU4z
	vkY8Q5+yaLXgFeBxoYSaA26DMxBlF6LdJgBgBmelrCPuW2H9RTkR8Yc+TkGDSvKR
	5qi2F7Hee9iZBD1TjHOT/9Xad8MVwTz3nMQ8mmbdQ05emQCR9tDXPAlm5Xj/eIiz
	dQ87+OMIx9XcUDzVHKbgwodSVIvSvlTb8HJks/AQwRMBskhY+biPEsShf4IG7LEu
	g9ieG/c=
Message-ID: <df75e31f-2232-41f5-890b-90d0e2457f28@prolan.hu>
Date: Fri, 4 Oct 2024 18:06:48 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/3] net: fec: refactor PPS channel
 configuration
To: Francesco Dolcini <francesco@dolcini.it>, Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Richard Cochran
	<richardcochran@gmail.com>, Linux Team <linux-imx@nxp.com>
CC: Francesco Dolcini <francesco.dolcini@toradex.com>, <imx@lists.linux.dev>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Frank Li" <Frank.Li@nxp.com>
References: <20241004152419.79465-1-francesco@dolcini.it>
 <20241004152419.79465-3-francesco@dolcini.it>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20241004152419.79465-3-francesco@dolcini.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855657165


On 2024. 10. 04. 17:24, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Preparation patch to allow for PPS channel configuration, no functional
> change intended.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Csókás, Bence <csokas.bence@prolan.hu>

