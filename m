Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6654B313524
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 08:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245859; cv=none; b=HeI9kcEuFTWaZKCptVCGRjMstPEe/HI2+IjN6jZSQqaysDg97u2+p7oh6VmMTL4/H/8Ef4ZH9harUlT2f97toOCs1F3qcnuNnG3vnjw2STg0ycB9uutPveHcqq7h2fuHfWhGtrRQLABqALERziiIs9IruDOl7NeiJJccRPWLLsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245859; c=relaxed/simple;
	bh=hE8eRrlZUZHrDQPlhusOekEPvK+5gOYO2FsqnPkGBWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pkts0UTe0qXs/KtA1HbwG8yKnbPbVQzlh8nD35hakpm43t+5HKPLxsc2AsxY2Nq5sXINhMkyafAb9SuZa76iteN26fSWBqbKJ9vTtzN+lFU0hIctNqa+XnQHkinGgJUYTlMjfVcpwR4BtVoZRccVliKlil19yj130ZVqcLBnyzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jlF7lq3I; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jlF7lq3I"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 52BD34E414EF;
	Tue,  4 Nov 2025 08:44:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 255AC606EF;
	Tue,  4 Nov 2025 08:44:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D10FD10B508D9;
	Tue,  4 Nov 2025 09:44:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762245848; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0ou/gTfBTt7Wprt1RCKinoE0CRdPLoTJcbQgIfWcSKs=;
	b=jlF7lq3Iz+l+2JGMUu5dkgxs3HIUO5VzVJkidrjRxf99R05cpBkyiXt34TR+gjDc3Y9p/l
	/EFDclvJ4y+F/wqF3TBN912tjXIjmQUqfOlz43QsDOYDwUs/HhDYUZ4G0jMGicdJROUj/Z
	hxVkLjkrDxOwNepO1EuxbB++3q4kuC0JC/GYgp9MYw+lGNqk0YJN5rIzMMYvTG97JZmnAy
	FPD+kdAVa1r7xVf6TUtTYgPwl8wdgRXjdUa0vDYsHaHLp64/bHPPqbA+YkPIZXvOA+zLDX
	Yqiill3FxkQbWEf48OleR5Z+9qEj9M2Jna6akwP/5NldP7lQzdDDuY2yFviKog==
Message-ID: <e2d250f1-64d6-44e6-b894-510465787bd8@bootlin.com>
Date: Tue, 4 Nov 2025 09:44:01 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 03/11] net: stmmac: add phy_intf_sel and ACTPHYIF
 definitions
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
 <E1vFt4X-0000000ChoY-30p9@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vFt4X-0000000ChoY-30p9@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 03/11/2025 12:50, Russell King (Oracle) wrote:
> Add definitions for the active PHY interface found in DMA hardware
> feature register 0, and also used to configure the core in multi-
> interface designs via phy_intf_sel.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 27083af54568..7395bbb94aea 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -313,6 +313,16 @@ struct stmmac_safety_stats {
>  #define DMA_HW_FEAT_ACTPHYIF	0x70000000	/* Active/selected PHY iface */
>  #define DEFAULT_DMA_PBL		8
>  
> +/* phy_intf_sel_i and ACTPHYIF encodings */
> +#define PHY_INTF_SEL_GMII_MII	0
> +#define PHY_INTF_SEL_RGMII	1
> +#define PHY_INTF_SEL_SGMII	2
> +#define PHY_INTF_SEL_TBI	3
> +#define PHY_INTF_SEL_RMII	4
> +#define PHY_INTF_SEL_RTBI	5
> +#define PHY_INTF_SEL_SMII	6
> +#define PHY_INTF_SEL_REVMII	7
> +
>  /* MSI defines */
>  #define STMMAC_MSI_VEC_MAX	32
>  
This matches the docs I have :)

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime
