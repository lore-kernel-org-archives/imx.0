Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56EE3101DD;
	Wed,  7 Jan 2026 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793141; cv=none; b=AqnrMpeaEC01GJwHAfADdtCYjqmzYn+8PyfxTaX/0PEPUZRwovTUC8mcT3syAnETbmEAoSpl5JUQ8xr6DY3NbqUjpXYVsUjmk/rtfebszAjFwgy6rKeGswDU5n0pQXjLYtFqPiD0OlvmEuq9hXwim5iNe7M2LAsnKjiTLuDE+H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793141; c=relaxed/simple;
	bh=aEqRWFuPevWKBcTlO3uE/jvjmQbiHigKLxHYyzU2pxM=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=TVaDt4sbrzyGCdXgZGEWu40+ik/rWi1r5714oaaZt4OBEfHRed7IhB0NHk/EFRlypYIKoldVTxGe60nY0ImHEZrbe2S6brioK4QEe/J9NAfr89xp7d+gxRw9oiVBttwwBHH80nYeKRTxfyjCTYFfYGaa5HlD75OtXfmhBTp1PmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXht6jDb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXht6jDb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46BBC4CEF7;
	Wed,  7 Jan 2026 13:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767793141;
	bh=aEqRWFuPevWKBcTlO3uE/jvjmQbiHigKLxHYyzU2pxM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=EXht6jDbVqctgLT66VWPExYwrn6xTKd66EXrwQm/8YEbSkoxFLW7D/nOe9fy/pu9g
	 yUBLlnV7pFw46s0cprfrxXrH5iQMTo/+cmT1VlJBFp7ED1KX5dZcjsImDXOXi1To/M
	 TGoVBChiQQnG4aEzX8wLut0vSjUhby8sgh5BestNTtohLv8W8f8TES8uDPVbw86xah
	 vIy7MUUw8sWUdDu9ZRzeh5YEEnudqYfERMUGWBExFcRd0LQqHtxeaGnJGfpoc7kx9k
	 UQ2KpZpZQOzTFLjMoMIBKaLtr20ykKphzPM0PY4szQcYuQpZK1KyDXRtWOoZlfXI/o
	 loFjggdJ82Qig==
Message-ID: <90b31e8d61e5773bcce8e5e229fc5563@kernel.org>
Date: Wed, 07 Jan 2026 13:38:58 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 05/12] drm/bridge: tfp410: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-5-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-5-283d7bba061a@bootlin.com>
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

On Wed, 7 Jan 2026 14:12:56 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done by using the drm_bridge::next_bridge pointer.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
