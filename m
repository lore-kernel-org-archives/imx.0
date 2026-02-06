Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53C336BCF6
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384165; cv=none; b=aJoWP5dV6Lx68KkNZ459dhx3vJ+X8BHgjFbNLjJ4fKl37ORHgQcw02kAAEUD4Cu0njnVcPGGhHwoopbWbtXPfu+PuAH4IploiunpnudCXU+fzaEfS76NZvYEC9pza08w6QerQUMN86qjfjBV0YH6OzyqTeSbdodW/7pYsIdKlVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384165; c=relaxed/simple;
	bh=tyNERdnhwcJsB4+IZJTjocTy/p1a2PIJI9XlyIeVAK0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K0hVF2+lVTI5ZyRxvIfMmEnswnqVhVjY8uY0Emmw0riko9gq2WiNqCssEjGwAM04sVDckBN0Y2H+Z/+SpndCfOc6FDARFER84BFZBXMu6oobcKDyxXzbHsedFMRzjDOEIbwEhhg0VxakwcN0d+uejLNk4adSf5ZR8uRw4tN8t9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1voLn9-0001ty-3f; Fri, 06 Feb 2026 14:22:35 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1voLn8-004Pax-2n;
	Fri, 06 Feb 2026 14:22:34 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1voLn8-000000006G1-0Vpa;
	Fri, 06 Feb 2026 14:22:34 +0100
Message-ID: <f88fc05d521800c95d281111fa7cf54219089258.camel@pengutronix.de>
Subject: Re: [PATCH v2] reset: imx7: Check return value of
 regmap_attach_dev() in imx7_reset_probe()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Chen Ni <nichen@iscas.ac.cn>, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 06 Feb 2026 14:22:33 +0100
In-Reply-To: <20260206050109.119348-1-nichen@iscas.ac.cn>
References: <20260206050109.119348-1-nichen@iscas.ac.cn>
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

On Fr, 2026-02-06 at 13:01 +0800, Chen Ni wrote:
> Add error checking for regmap_attach_dev() call in imx7_reset_probe()
> function to ensure proper error propagation.
>=20
> Return the value of regmap_attach_dev() if it fails to prevent
> proceeding with an incomplete regmap setup.
>=20
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
