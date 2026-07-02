Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBE635AC1B
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 17:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013454; cv=none; b=bb8xZFnXfQ8VBpNu5QoxVo7/IgMrxY7n23qkLyKi0jbEaL20ieiJAr3b3zzttmbDNSblfQje5phlzhiBppXdBjEm6DkLK+4SNDPJyrQJSdDCvzBlqZwmPpPuuLLulYZQKBG/1NkZ3fKusq8TJ2xdi+m6LCcUC04B80cSzR8a4z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013454; c=relaxed/simple;
	bh=GOLu9EwugKwD5dHd/BXtOeFYvm1vRZTvHK3DBcGINDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kfGhT+LTWxrLKePBzDAa00pyvbv9JXI4eYHB9tRxUAFR0mvwAFHZjdCa+6VUiDJqcdfvVhkUMthHniMKd+/KxBR1PIwotS4+rgEqp0in8/BBERKYCi1rTA6998zYIyVA0D6347aMHt8VY2eipPOeeg8V4dHZkdhqWGbnbmeSGoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Kc/AXq//; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Kc/AXq//"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 339D41A0DF0;
	Thu,  2 Jul 2026 17:30:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2B02602EE;
	Thu,  2 Jul 2026 17:30:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90FCB104C958B;
	Thu,  2 Jul 2026 19:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783013447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=nqmuPPmfP9VFcLThHSDeBnpXUiiV8nG4V34GV0c7hOk=;
	b=Kc/AXq//tuSUAOD406+lAEEvx3VeHJAeHfcb4ALztzre2D+frAtf/I9C8kI5ykr6SF4pX3
	t7zLeeL/l4zixdSRttiAuF9YAtkQ5hiy22Uf5zn9epnwzhpVxJMKg0uxtsgwtsEEtwsMav
	O4JKcL2oVvBd9siz6dqEeUE3qf6bnnUaiIhDU2x0uHEvmFfwgcVVn3V4kAqosy1fnYUVck
	SA9jk5Z8+R6OWunRDah0pF4wi98UWDkdhvt0dSdjB52eeZOE8jDqVd+E7JcO2GYU5lqdrh
	qfnTzmPblF7shcNYUFTE+7DtEUERRUPfMZ8BVIady+0xAyOsNBOZDPySMExAWA==
Message-ID: <7576597d-6910-4d58-95b3-28ca64f42b57@bootlin.com>
Date: Thu, 2 Jul 2026 19:30:39 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 07/14] net: enetc: differentiate phylink
 capabilities for pseudo-MAC and standalone MAC
To: wei.fang@oss.nxp.com, claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
 xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
References: <20260702025714.456233-1-wei.fang@oss.nxp.com>
 <20260702025714.456233-8-wei.fang@oss.nxp.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260702025714.456233-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 7/2/26 04:57, wei.fang@oss.nxp.com wrote:
> From: Claudiu Manoil <claudiu.manoil@nxp.com>
> 
> The ENETC pseudo-MACs are proprietary internal links that do not
> implement any standard MII interface, so restrict their supported PHY
> interface modes to PHY_INTERFACE_MODE_INTERNAL only.
> 
> Since pseudo-MACs can operate at any speed between 10Mbps and 25Gbps
> in multiples of 10Mbps, set their MAC capabilities to cover the full
> range of standard full-duplex speeds: 10/100/1000/2500/5000/10000/
> 20000/25000 Mbps.
> 
> For standalone ENETC, expand the supported interface modes to include
> 10GBASER and XGMII in addition to the existing RGMII, SGMII, 1000BASEX,
> 2500BASEX and USXGMII modes, with MAC capabilities up to 10G. MAC_1000
> is replaced with MAC_1000FD to explicitly exclude 1000M half-duplex,
> which is not supported.
> 
> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

