Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D25326947;
	Wed,  7 Jan 2026 14:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794943; cv=none; b=MxgjI4N99ATZr+cSJkxVUm2SqDbqeKvmV+5EDxJJAZ/uiTm90GlThp7QE3aWhuD1UNEfIdlra5hO5FG/REGxAstX6dhtTPxnr3fEY0F1Ed3oi0dXnDdwXrG6pk9IKbGbQJD6F3FxR5R2KH2dgpT8UKdamfl5ekSvPsB7FZ22YiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794943; c=relaxed/simple;
	bh=PZWDOBLRey6Z9yX+RyF83GqTHUzZPfvvBMqFhTb+pZg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=pUsyu2grPYFyyMO6P2Lja6YSvira+FfcjTPc220x1oNU5279MCv86CRgQjo6JArIL5i6c3t7dwVVBMPXr+hQXqRP5PEM1s4OiRuFV+3A5UCOfTJQjrV2BZu4YPGra/eBBU/KdIM8+zlWZSXPGBgmTWG2NoOrDHFp2ZXIQ/luVIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrPQ+prQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrPQ+prQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4990DC4CEF1;
	Wed,  7 Jan 2026 14:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767794942;
	bh=PZWDOBLRey6Z9yX+RyF83GqTHUzZPfvvBMqFhTb+pZg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=GrPQ+prQOkX4BEgihC3kMMyG17wnhrSstZOLnQqhZ6YxGPgNVxNzO9jWwat+cRVab
	 YGij8q6a7bz/LWjIjWmcwvp6BWxpKKVc9XXYetlswpDBnQb4wbV0L1i7g2HW2ATEBW
	 KuzxcHzluA9oP5Vhbb2SsPp5J1X9cpdarnFrhtHopxt8scZm93r11XFzve7R35Luw8
	 7iSpo71PthPlVmkmcLOo5dQ8mIkp4hToG2zAP7+WoR/LQe2Hl8JX0i40O/AgTdSJH0
	 VYGGgVpsT90VnW0ypGc2ZqLlW5NW/xfnW2dze6eGtP5l5oaxfSJm2xPQK+GI40qTO9
	 8koUD5HgnSc9Q==
Message-ID: <af317ef80c6bf8e670df3d6dbabacdeb@kernel.org>
Date: Wed, 07 Jan 2026 14:09:00 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 10/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: use a temporary variable for the next bridge
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-10-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-10-283d7bba061a@bootlin.com>
Cc: benjamin.gaignard@linaro.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philippe Cornu" <philippe.cornu@st.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

On Wed, 7 Jan 2026 14:13:01 +0100, Luca Ceresoli wrote:
> In preparation to handle refcounting of the out_bridge, we need to ensure
> the out_bridge pointer contains either a valid bridge pointer or NULL, not
> an ERR_PTR. Otherwise calls such as drm_bridge_get/put() would try to
> redeference an ERR_PTR.
>=20
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
