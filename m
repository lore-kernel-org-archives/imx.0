Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357081E8332
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 14:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581931; cv=none; b=YFDI6y+T3AGFfWabEgVrcULzF5d9D3RBZhkyx8hA2Q89zM/UIEH+EJqE19kRrcWFsxgWFa+AQFVwyEWruq7QmPZuqUgf/drXdKmF6u8Sh+town411mBK/XTxuAvi/6nR4YqrpkXY57Y8pY7ZV9sD81VpXSi9OxOORuh7z6mzPrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581931; c=relaxed/simple;
	bh=zsjaSRO2QCNAwkYAw7QCBJv3/XfV0P8rygdGYk8VH9s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kYBpbnoQ8ERyYJTKGouF5SSta29VNZ5jE02G7OZ4Y+LELHqe7CM2yWgitZo4YbqnOgcwsYBWLM7zLtgTzoN2vUU9UjFV5KNlJlqSdm4Ltsjg3fLGxHxmE/MbobI7/W2whii32ByYOpaioSv2FYbTPOhb3cazKjXf6j8o8rgD6O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EEA4F200393;
	Mon, 24 Aug 2026 16:32:02 +0200 (CEST)
Message-ID: <538fadbd624cec58c86504be5bd6484a820743ca.camel@pengutronix.de>
Subject: Re: [PATCH 49/70] drm/imx: ipuv3: Convert to atomic_create_state
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer	 <s.hauer@pengutronix.de>,
 imx@lists.linux.dev
Date: Mon, 24 Aug 2026 16:32:02 +0200
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-49-fb793475c05a@kernel.org>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
	 <20260821-drm-no-more-crtc-reset-v1-49-fb793475c05a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fr, 2026-08-21 at 16:39 +0200, Maxime Ripard wrote:
> The ipuv3 crtc implementation provides a custom reset hook. However,
> this hook only allocates the state, initializes it with
> __drm_atomic_helper_crtc_reset(), and frees the previous state. It
> does not perform any hardware reset.
>=20
> Since this is exactly what the atomic_create_state hook is meant to
> do, minus the old state cleanup which the caller handles, convert the
> implementation to use atomic_create_state with
> __drm_atomic_helper_crtc_state_init() instead.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
