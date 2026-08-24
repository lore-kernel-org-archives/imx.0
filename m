Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4A2390239
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 21:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787607063; cv=none; b=gBDIKxQbUSpGLkTXyIDEuBtXv5VFs1k3eLDC65wI3e79h8+32w5hTTCqD5HzOA0X9S6UFrNmDAM8dM0sL96XPNAOQF/+sQqPBVjINFTM3DYXj79P/yqyGO8RRT/RkbJc67r4Pcrq0qc8OHw+C/JQbsgEtD6tETYMe4ZVgSoRUYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787607063; c=relaxed/simple;
	bh=9epPxeHWNF8W940Jf+0CNBre0EINBiimKM4d85ai6W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+0giynDuyIsr098SC8n47DBNqjsnOlj3QuLPLm5x0RPLs45XShe91frE+auEBMKhRM+ux3STJxcVnMQEJE5aLxsJZcBe69FmSfz/BNkOXVlyPeHOxk2TJ4hA9Z9CJfSNFgHvq0AxX3fO1i3DdgL2kqsTgQ3ELju3CvaYo0rP1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=buZW05gc; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="buZW05gc"
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:9a6:acd5:d8dc:dcdb])
	(Authenticated sender: vjardin@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id C55642003B4;
	Mon, 24 Aug 2026 23:30:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1787607059;
	bh=9epPxeHWNF8W940Jf+0CNBre0EINBiimKM4d85ai6W0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=buZW05gc6K5VVSLaQz9HETJnwKgZiZe0c967arfsdrSEpjokoRbdMJrOnStbDH7Zf
	 onw2xa+5HBhIxAt0SuN1Ef/Wlb/I4bZjEYKp1/KX+Q2MyZLhB0QCTf7AaRPN+juiEZ
	 30lMmCJW5NF9Rt3p1FMxkV5jBmM7sys1NljQ7V7iLOTLSFmG6DSI/3Ck+8e8oz9CTC
	 KW0mOeKALISmUHNjbRSpQSxdB1amMz2ZV1+yBHgzoXBqqCJuCA4Sh8Imxwq1NeVepC
	 AEXBqLNhs+cx7/iWDa2FiVoDk6Z/ZEpckaSZfQmAfWb0uax0AVsyTgjkqEV7W1EjSJ
	 6g7hCqX6UlyMQ==
Date: Mon, 24 Aug 2026 23:30:43 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Josua Mayer <josua@solid-run.com>
Cc: Frank Li <Frank.Li@nxp.com>, Carlos Song <carlos.song@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Thibaut Collet <thbt.cllt@gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: lx2160a: fix IIC1 pinmux submask
 rejected by pinctrl-single
Message-ID: <aoy4A810WeNi7YAw@L30177.local>
References: <20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr>
 <20260824-for-upstream-lx2160a-pinmux-fix-v2-2-0a525d5f4cd5@free.fr>
 <e9a20a84-a20c-456b-bf17-0790d2aea633@solid-run.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9a20a84-a20c-456b-bf17-0790d2aea633@solid-run.com>

Hi Josua,

> >  
> >  			gpio0_3_2_pins: iic1-gpio-pins {
> > -				pinctrl-single,bits = <0x8 (0x1 << 10) (0x1 << 10)>;
> 
> Perhaps add a short comment here on reserved bits, e.g.:
> 
> "LX2160A RM describes bits 11 and 12 as reserved, but writing 0 to them was confirmed harmless."
> 
> Feel free to rephrase.

Done into the v3:
  https://lore.kernel.org/all/20260824-for-upstream-lx2160a-pinmux-fix-v3-2-5556ff1e6be2@free.fr/

Thank you also for the Reviewed-by on 1/3 and 3/3, v3 includes your Reviewed-by,
  Vincent
