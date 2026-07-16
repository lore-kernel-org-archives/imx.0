Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE65D41F7C9
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 13:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208548; cv=none; b=CCjl5GUx9cwOCyxOiljUCfpB22Fiy3TWcv1Uar7pGWK5K9VFUY8gvvTyTg8h/k14xgHwW1+oPIaU3Yvvu9nP6auky0mEs6lQrkkkI9QmZ9cySI5KEOjD2ZlhqTlCxfAtZ3IwIuxviogqiCp3wTlSwFtGVbfARu5Uezv7ZrhjHKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208548; c=relaxed/simple;
	bh=QsFN6cUl++XJvIAeu9y/uJNjP7IaflsVehPbDFNo4cc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Co3DjvGOiEQgvusTupABqdVUR0UMQcfLaJ/9hHizptj+Q2DBWnuOo+qXcXZNz8UHy2yNjbkajCPKEuOaBpM+qU+LdDVzXnaIu4CpjNI6hQXD3kw7nuaa3NANYveH+OkH7WUGuen+3zlAnL1odUhRvlY45oIIxBE/0dpAtHArgeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1EEFF202253;
	Thu, 16 Jul 2026 15:29:03 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wkM99-0026ms-06;
	Thu, 16 Jul 2026 15:29:03 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wkM98-00000000DA0-3x60;
	Thu, 16 Jul 2026 15:29:02 +0200
Message-ID: <a9a95c2cd7a6c73dce282eeaafe89cf2419b1375.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx/tve: take i2c adapter module reference
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Johan Hovold <johan@kernel.org>, Maarten Lankhorst
	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 16 Jul 2026 15:29:02 +0200
In-Reply-To: <20260716131937.1564892-1-johan@kernel.org>
References: <20260716131937.1564892-1-johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Do, 2026-07-16 at 15:19 +0200, Johan Hovold wrote:
> The i2c subsystem currently blocks during adapter deregistration
> whenever there are consumers holding a reference.
>=20
> Switch to using of_get_i2c_adapter_by_node() which also takes a
> reference to the adapter module so that an attempt to unload the module
> while in use fails gracefully instead of blocking uninterruptibly.
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
