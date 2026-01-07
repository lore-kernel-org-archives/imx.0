Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A15D3101DD;
	Wed,  7 Jan 2026 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793113; cv=none; b=T3LazX9FDbb6dLuM7ZEZsuLpK9QxTVNQkfzUeY1JsiuMwuWxjAaY8uOPob7UoWaDdPZOWiCDh5DihlVW4qpB+MdQOuPeUmdw9zkx1DggD9gsr/9dhoS8wkL8h3mKMjHx3U6oskivvQvwJoGZKnXPO3RL+Cha7Wnq77AHBSXIKBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793113; c=relaxed/simple;
	bh=5AuEIKQRaUTKYvyexM1F0XSO1bD3dwL6lWSlAHqpMDQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=uuGdZ/Z3PbEw0g1vWFtQ5Zx6f4CZzlfl2FuKtfwZkoQJqC0+IOKNnR1It+DizjmOzsQNNG4umn0iL/A7oxBxrCZoDjV9eUPTIAre4aboCK4fitNZhCWL72BXWbKpjnJLAC1FvJNtRdz+6xLVcWvnyMXXg28sRlRo5NEoMcTjHf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUYmwsZr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUYmwsZr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74BDC19421;
	Wed,  7 Jan 2026 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767793113;
	bh=5AuEIKQRaUTKYvyexM1F0XSO1bD3dwL6lWSlAHqpMDQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=VUYmwsZrYLDh9idprF4/FuorE9A4MAV3dv0EdWpPLiQBbcJ2KUGtgQ3VsXuteOMe6
	 r519kSjJ5M89E+PKZed+vv8jsvVjOebiaqlcn2zFFAGzKICXSd3mxEeAeMaI1pqs/g
	 IB1wtq60n3ybwQLnMYmvNFvsZG/NwGuasbA6X6Brfs17XQIARu1wZUKu1Bmz77RiUF
	 SqmtmE8PLD8E6Wqye/0MlVmZnhLRq2mGt05szhbua63fghwRg+6xoFzx82YpLnCh5B
	 XpsBtK+QIzQpAHwUcWDzaldTQY9+9Q8p5dxMbLZFefH5kf7453hPsz/W70Av4EzJGQ
	 XUTIemUBN6g7g==
Message-ID: <2f14571f948b24e7c453895bbc1b33d1@kernel.org>
Date: Wed, 07 Jan 2026 13:38:30 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 04/12] drm/bridge: thc63lvd1024: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-4-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-4-283d7bba061a@bootlin.com>
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

On Wed, 7 Jan 2026 14:12:55 +0100, Luca Ceresoli wrote:
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
