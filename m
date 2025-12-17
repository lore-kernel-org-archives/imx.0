Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5146835F8D3;
	Wed, 17 Dec 2025 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966583; cv=none; b=kF2niO7j3SNXEX846aVrCqXSJeR5yZHTq0GbTjTnKO5zgIpSGHyeux2K+gUwJqq38G9etSzoNf0yWMoBDdliP6x1yfbyK3Nmv6V2XYnw4sgNXxZwGLj5kHY5WNTNAUW3bmDqkb42CPS2Ilbv84OhLmmudqeqFBGi+4Ki5F+jXN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966583; c=relaxed/simple;
	bh=14N7+pYy72kfKgLZ+eBjOCn+SrYbkirrM1jMUhs1cHQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=deLgoacOiKhnsL8WKLQTwvF4hv/ddHd2Z2aAFu0/NrTj40MMOA4HjKzmbCUHNjRV+miEO8IXiVs/GowSXCJpQG/jLbSLR7w3Aafbk0XFVqJL3I0pdjw3C9hBVEC5HM9OOIJgq23rNqIc1arK3VmUjkju0Lv8O0sllryhNp5rwek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aO4cKOOV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aO4cKOOV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DA0C4CEF5;
	Wed, 17 Dec 2025 10:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966582;
	bh=14N7+pYy72kfKgLZ+eBjOCn+SrYbkirrM1jMUhs1cHQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=aO4cKOOVeefvLNc7CIcIB6uIcGA3BuF9GQzoKy8YZd8b2Y4g5nJG7VGIYtYX1RgJl
	 JtCo8irlnMdjj//V1tJESEEtgcwreO/bhOOE84u8Ntu9XqZw92P5hPXukEJKxtiLAv
	 oqyivM4O3SUfDmtimYCyNzvkYi/LxQrGOK/Wt4Vl+DOtQGKylSV3oiCYtzz4GU7V1B
	 aHi4qtO8bodJ7FZa7y1cSasyLx7CbX2x6gEmyA0QSXJzandD7d1JdaL5z0LQb+ReSx
	 6iMnJVp+NV9mw+hyfHBdymKVubU/pQ8ljPbc8lS/nTiWokbnOqar3D3bq0e+DMzan4
	 sZwiYbbCTfCCQ==
Message-ID: <bf2654046433c0f580bac440c3e72299@kernel.org>
Date: Wed, 17 Dec 2025 10:16:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 04/22] drm/bridge: make of_drm_find_bridge() a
 wrapper of of_drm_find_and_get_bridge()
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-4-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-4-b5165fab8058@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

On Tue, 16 Dec 2025 18:58:37 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is identical to of_drm_find_and_get_bridge() except =
it
> does not increment the refcount. Rewrite it as a wrapper and put the brid=
ge
> being returned so the behaviour is still the same.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
