Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AFF32ED52
	for <imx@lists.linux.dev>; Wed,  5 Nov 2025 15:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762355782; cv=none; b=MrRHPXeHzOM1RWLpsvqmTe5ULOkJnS2y1XMD0SRNbBz0YPvTTnBA+lisBZGDjeh9K4x8XaKDftljsFzy0BpXl+xxskEkt2fFn7Pavf+JWbR7kF2Nw1oUol0xzHIB84+SuBXnkZzPRht55dW0UMeoE9iJyLHEJwllEXkxYG60UnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762355782; c=relaxed/simple;
	bh=t7kyvdcWGBvgbAjLqvJfui1li//+LFeswgZfjMXv0AY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uu0yYjT8ROM9/I7RgWHVhlIMg91BWy4PZIFID1AqweL2Wuu6yYmaCh1mSyATsst3E49dXbciq3B3Lx57MShuEVN4fGtcnETe4QQNASw6ON5H462VI7+BCQK6NYkxxMqEF5YRFhnPl23Ap/LvT4xpfkfUhyG1vb4nol1GWZuoTEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGfF4-0001py-5l; Wed, 05 Nov 2025 16:16:10 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGfF3-007Dc2-1v;
	Wed, 05 Nov 2025 16:16:09 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGfF3-00000000BfY-25BY;
	Wed, 05 Nov 2025 16:16:09 +0100
Message-ID: <9baa4aa8c3e5b15cc23b6915ae1466fdeba75291.camel@pengutronix.de>
Subject: Re: [PATCH v4 1/8] reset: imx8mp-audiomix: Fix bad mask values
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Abel Vesa	
 <abelvesa@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio
 Estevam	 <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Shengjiu Wang	 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  Pengutronix Kernel Team	
 <kernel@pengutronix.de>
Date: Wed, 05 Nov 2025 16:16:09 +0100
In-Reply-To: <20251104120301.913-2-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
	 <20251104120301.913-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Di, 2025-11-04 at 04:02 -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>=20
> As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
> "memory map", the definition of the EARC control register shows that the
> EARC controller software reset is controlled via bit 0, while the EARC PH=
Y
> software reset is controlled via bit 1.
>=20
> This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MAS=
K
> and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values woul=
d
> imply that the EARC controller software reset is controlled via bit 1 and
> the EARC PHY software reset is controlled via bit 2. Fix them.
>=20
> Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more r=
eset bits")
> Cc: stable@vger.kernel.org
> Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Applied patch 1 to reset/fixes, thanks!

[1/8] reset: imx8mp-audiomix: Fix bad mask values
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D997c06330fd5

regards
Philipp
