Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393DC322B72;
	Mon,  8 Jun 2026 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918863; cv=none; b=tmcMCdCK0IXQrXrWVS1JKgh46owpo143ZTu++IUhO/uQxUh78SjgqmkjGLGMvQatNI0mD5oQGqNwoOeJKgEwz4QtJkO+b7utlkhSwsKGDV3VtNYceV3KF7qBpZ1qGGrgpuSRFs46B8chpc7WWJQ2KelDida6BRO4cIChwTldrIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918863; c=relaxed/simple;
	bh=d+EZBqP+S1aJsp/54O1thKJUxSPzexaWOdFPdQexaOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHgfueCUHNBkNvzW0Fo3yonW3eerg/BUtFHJJMYU8IY8FeKsTtBIPU2sbqHwtLSHglFYeBNvijf+afokhcgW3GVmRzKZJlBLCxCWJe/KB4CnZ0u16V3N0nmxXeYxeX3SbCJw33s36gBP798DzLg0wwJpjkKIhsMKUo3zjYNsUtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hK0pgCWv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hK0pgCWv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652A21F00893;
	Mon,  8 Jun 2026 11:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780918861;
	bh=d+EZBqP+S1aJsp/54O1thKJUxSPzexaWOdFPdQexaOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hK0pgCWv91eMLD6Vb7Vjy6FrQ9Y1cL3wtLXb/5eQqR565L49DIaE1d0oIQvDGQdoc
	 /UGL3EOQ72zhpnpz/u4CpFmCN1SHGjN3Vpppt5fwLzvw5Bra8bS9MS97dCKmo1PYj0
	 6aVeZZBbUhNEeijzwN4XyDloYovC0zjoB8DCw0EXzGLjIrkTJ9PtUOhhPPLXp1iOU6
	 8z0FTezbycjRP97nSjcsyMdM8FciOe3nIwXyHdkjnKwI85Xk/++YtrMoei8u4Ougya
	 ZLW5jMWmQoqRO7/IxFbx2VCkyZr3RbJhTsko7FN6aYeezBmuTbwk2yxm37rqrwsBA/
	 KwRXAVbq1fkbA==
Date: Mon, 8 Jun 2026 13:40:59 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/37] drm/display: bridge-connector: split code creating
 the connector to a subfunction
Message-ID: <20260608-mindful-heavy-frigatebird-be9faf@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-5-45e2bdb3dfb4@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="e7zj77hk553y5yo5"
Content-Disposition: inline
In-Reply-To: <20260519-drm-bridge-hotplug-v1-5-45e2bdb3dfb4@bootlin.com>


--e7zj77hk553y5yo5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 05/37] drm/display: bridge-connector: split code creating
 the connector to a subfunction
MIME-Version: 1.0

On Tue, May 19, 2026 at 12:37:22PM +0200, Luca Ceresoli wrote:
> In preparation to introduce bridge hotplug, split out from
> drm_bridge_connector_init() the code adding the drm_connector into a
> dedicated function. This will be needed to be able to add (and re-add) the
> connector from different code paths.

Same story here, explaining what you need later on that calls for that
change would be nice.

Maxime

--e7zj77hk553y5yo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaiaqSwAKCRAnX84Zoj2+
dp1sAYDuIBPdRMXXYBe4R+Ta//fpPl4lVKuHiYq4geMva/MrZIlnJY7jkUmM+ILE
qeT0kEkBfRpI8JftVgC2DB8CWv5JjL9HjVHimGNWg5t97RHprSbK09+C/O7VS3Ng
Kvor1YDv5Q==
=iyL4
-----END PGP SIGNATURE-----

--e7zj77hk553y5yo5--
