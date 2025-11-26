Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303731DBB3A
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 12:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764161436; cv=none; b=TkdbdHHQEiWychWm779k6hDVYV0z4xffvsagIDYoB/r+NSHiYjGiMV2ULRFk/GNC4Q8a27UkMbvpIMubnWdSH0t111kU7ahvJ1elNiQYBUn80i4czV6egrC8TPp1z5lQ6nnziTVRx6P5iLlDi9eu8LQRMH2Df0oofm0YVAq2U1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764161436; c=relaxed/simple;
	bh=8hsdszgHHoVyNlpsZ3yB5Hx6M+PRM7tle+IVfNOhLqc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NLupINhohiYX/pOOnhpYAPHHd+1GPDpGWKY1MLGFz7Rt3ThrDcLGjrqfX067VzX4JSxFx4Tnut86aUmh3/k8mY6GjBRNk9EX3HDfPrYKfzzRFBhDbEEWDJo9DMU6p5PGbYxHECWwHcjYJRd9d9yu2VdEgFGQpR3RVcJSlflK/Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vOEyW-00036i-CM; Wed, 26 Nov 2025 13:50:24 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vOEyV-002bsH-3D;
	Wed, 26 Nov 2025 13:50:24 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vOEyV-00000000BmG-3mws;
	Wed, 26 Nov 2025 13:50:23 +0100
Message-ID: <9b608b44e684cadaee5c1d33d1746b08f9ac7ffa.camel@pengutronix.de>
Subject: Re: [PATCH v6 3/5] reset: imx8mp-audiomix: Extend the driver usage
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
Date: Wed, 26 Nov 2025 13:50:23 +0100
In-Reply-To: <20251126124218.803-4-laurentiumihalcea111@gmail.com>
References: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
	 <20251126124218.803-4-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

On Mi, 2025-11-26 at 04:42 -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>=20
> Switch to per-device reset map to allow reusing the driver for other NXP
> block control IPs.
>=20
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
