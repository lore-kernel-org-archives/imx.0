Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A57284689
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 16:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763136578; cv=none; b=b4md/bJeqIIFOsRgPUM1//I/8CDwHyDiu7fmeceGbnYX2wLKgR2kPhiPl7nmMgFQKh46u91SCcE9VkccpL+2fqZGICIlPGGvoeDzkuf723DYxzFzOMvuJKVG9inCqx4Xi+NPtytINlggMU5f+8g2hQBgyrvmchM0zxabk9JhtAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763136578; c=relaxed/simple;
	bh=1SO3Dy7hx4nN2IQu+3GA7xLbMuH69DLF1SBIkM22row=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aTkCueVfzfT+onNu7l2LtRn0I9T7pNhEdTCb8Ue0FVj5TvZqVCEv+TYbFx2lq9Eg6As4egy6FBae+m30+3PjQLfkR6S2ZwUV1Lbd0xTuyqMPLCyuDlGNwOPkad6bA4wdAxr4DDbPGvIgKZn6w36yKovyOi9mmhJx4/x2I1uEhvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJwMb-0003CT-Dp; Fri, 14 Nov 2025 17:09:29 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJwMb-000Ron-0N;
	Fri, 14 Nov 2025 17:09:29 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJwMb-00000000BWa-08pa;
	Fri, 14 Nov 2025 17:09:29 +0100
Message-ID: <e9b580b65add30dfd0be30c73610542dcea1f8cc.camel@pengutronix.de>
Subject: Re: [PATCH v5 5/6] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	 <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Daniel Baluta
	 <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li
	 <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team
	 <kernel@pengutronix.de>
Date: Fri, 14 Nov 2025 17:09:28 +0100
In-Reply-To: <20251114133738.1762-6-laurentiumihalcea111@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
	 <20251114133738.1762-6-laurentiumihalcea111@gmail.com>
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

On Fr, 2025-11-14 at 05:37 -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>=20
> Support i.MX8ULP's SIM LPAV by adding its reset map definition.
>=20
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 45 +++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>=20
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-=
imx8mp-audiomix.c
> index d3396f37d1ff..83fc8bcf80ab 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -3,6 +3,7 @@
>   * Copyright 2024 NXP
>   */
> =20
> +#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>

This now depends on 3b521bf8c512 ("dt-bindings: clock: document 8ULP's
SIM LPAV").

regards
Philipp
