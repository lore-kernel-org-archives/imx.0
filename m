Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF16E36C59C;
	Wed, 17 Dec 2025 10:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966785; cv=none; b=YZiL+d3m2kVnj8sWeUWkjbQNIY6ONBg0wXsRG2abp5y2TxvAuKcFkONwK+bTohIP8GmVoqO9Ev7tUbA4IpgVcCbToHcMgNX50jHD8BK979oskXZKFevLatNqcTSxFVa8/yqckyGoWHc8YUPpFsncqEFw22lh8n5CnevhgtPtHhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966785; c=relaxed/simple;
	bh=fJfYyQsSeLQOss48wj6CAg5BxlIApsVGcX6BEMY+KK8=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=evkX2NDT2DYEzUY4e7fnSBOaSYIcAyFO0QOrLb4vMS6bWvP0YKPFDW+1p+BWbrdesXc0FnAsT5kc0F3Nu+dX8EHeJlkMUx6S7a62HGqawWp8Pye8gWBVGfVcyYTUku0eAbaqm+81RsEGeZ6ah2sFOVJ2EixtDzI4Ut44xH8h7pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQeoRHM+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQeoRHM+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBFFC19421;
	Wed, 17 Dec 2025 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966785;
	bh=fJfYyQsSeLQOss48wj6CAg5BxlIApsVGcX6BEMY+KK8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=aQeoRHM+TibsLmXwFNHe2NxMIf97IfBwI3Pg30hMh9GSe9zJkjaTYVqnVFvUzK1eO
	 hqEQHweDaAiEYuLlPpORiJkPZIkXeo6wCE9zochTalRWSUuAlc5hFIsrO83aOjMHQc
	 dRDBXCaydtBWbBPLhu4uiRNN5MNGkCxbiijFFTpwoKsMjBiyz7fSzN05w0kR1HecYr
	 2BzJ+YfrqyRk3+VKVNamL+je8lR7xEqaXbUUbdtOq2oWqaScH4kTOjKtiYYWZwhkAP
	 PrQCawA95SgM7kkFgsvUlGK8wVa42zlA4iNvg64opzMHA23KfnBNWF7wPh3QPeq1fZ
	 N57d79xsvAOMQ==
Message-ID: <aff5a75a33e6e111347a7a79ebc26ddc@kernel.org>
Date: Wed, 17 Dec 2025 10:19:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 14/22] drm/bridge: imx8qxp-pxl2dpi: remove excess
 error message
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-14-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-14-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:47 +0100, Luca Ceresoli wrote:
> imx8qxp_pxl2dpi_find_next_bridge() already emits a DRM_DEV_ERROR() for
> every error except -EPROBE_DEFER. The caller emits another one, which is
> redundant. Remove the message in the caller and keep the two in
> imx8qxp_pxl2dpi_find_next_bridge() as they are more informative about the
> error cause.
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
