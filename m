Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA5536A01E;
	Wed, 17 Dec 2025 10:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966731; cv=none; b=JZ56pVsLs1+Tmu09FEC/rpcnyR8LZ+bdHMJC5PgacyYU1UMwQ8YBpV0WhAQsXgvLVLypHI6a5vThyapEgLW9KvIClsX2HM+qibot2z0gUVi97AG8nEIgaCRM3IMGBOWi/6zI35lwZ2gu2HaptYfRaDux5FI9RH5m70HW7G2i9BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966731; c=relaxed/simple;
	bh=b3fa3ZW7Btz5urPS10XReNhAoJDTbHbKM52vabWMgfI=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=AupLS5d+UZI8a5ofT/ue2CeXjsiA9P3dak+nxU1jeHXy+qWQTbEJu8u+IPh18zSv5HjgKn4/WOXID4jSOYrRX1IiTXtXxVvuW2BBtXfIsyJtv0tK48fTYU0ulq8C2c6kMmIayKCgwQtoSHqIXFjBgGYGt7pAG1xMFFVMs9xK9FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3kcH5UW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3kcH5UW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C015C4CEF5;
	Wed, 17 Dec 2025 10:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966730;
	bh=b3fa3ZW7Btz5urPS10XReNhAoJDTbHbKM52vabWMgfI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=f3kcH5UWPQk5umEClpVniEspgHBzoJL8PmCMlcHQWbehjUOrxiYt8L5rHadEJkd2x
	 ImU7pskBgAfdRoxBw3hX9YLbjiu3j+YClj+XyH1sOi34ekmWp/xY3NdNbkyWR5GaaV
	 e62mQUecv476zqqxajER7Qyw6tIBsBjG5sD+3+XVPhyeTq/BM3s+HDU/qSYMsUE4cv
	 hqixaDHD01uyhVXLm0SC0F76xFqjyRNQ7jf3jNTQAAkZzEJz+UUkVbkjxpZIY5t5SA
	 ZDEoBMG+Gz65hkUePrn67AOjou0kecYxqrTrM59XAv+0uo2IqmPPt78UacMsM7rgHT
	 Ak20kSNG1/nfg==
Message-ID: <36c9a024a4c96830f13bc1e7c005f231@kernel.org>
Date: Wed, 17 Dec 2025 10:18:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 13/22] drm/bridge: imx8qxp-pxl2dpi: simplify put of
 device_node pointers
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-13-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-13-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:46 +0100, Luca Ceresoli wrote:
> Simplify the error-management code in
> imx8qxp_pxl2dpi_get_available_ep_from_port() by using a release action for
> the struct device_node pointers.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
