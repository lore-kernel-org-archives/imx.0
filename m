Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587A236A01E;
	Wed, 17 Dec 2025 10:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966703; cv=none; b=LYwRJEl12+Gi/3XNesz9XMPuBLwMxEG/P3gv1UMJxj5XcnXg35c4nvEcLak7TwHgDgqytZO8bTsxgVhdW9m/X52PkHNIN71JvCr1R3fCwBYCr4CWlmwZJIA6gsg8nXSOAaTVvCpmfRZcPPcN0fIkHf5MF6/DmdRaTEalyNoxx0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966703; c=relaxed/simple;
	bh=gGGu/6JNVBgNvuM6ZsKdOI4ON53xGWkWHM73FXbvNis=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=nTFWcnW/7AXHUyoU9pJ5zYwdMjq3snDLc4d4SF/k7/Jtj/0cMxt1JVDhBKJQRRF7XJyOhkJd4y5Rl1XP/IuKmL/9lnuK4fawlDouTVbVXgjjsPEAYJ5RG56Sias4RhETFLmWUNAG5+GSs0kfCEEgMHVO34Aq1nUGKxs5oPJt4Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o9TOZ5xb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o9TOZ5xb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52486C4CEF5;
	Wed, 17 Dec 2025 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966702;
	bh=gGGu/6JNVBgNvuM6ZsKdOI4ON53xGWkWHM73FXbvNis=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=o9TOZ5xbmIgqxSOK8HVTeLQOxHTGpU67pqx7lt/Gy9iAK1IOrXCBrOKaYEXM9Fw5Q
	 NKRDYHrBWhLUhZOyNFDQuXbWwI2vArQELO850hGsATfwRpbngWW+8heC3qvmO+LLpp
	 Ix0HZprfSAhrDLQTsG2u6mxCrkAPxADMVKtZSw4TiBPNf3R1GBbgH+Mb4rVsuVvQOA
	 8DV+e6ydAj+0yqMkx8/kdd1kijBRC7KtfmJEBd7cUwlxjLrsRAEyo+bF19y4eV3+I1
	 6fnobX50SZqrHlKYt7dWV2uYZ9vZMEI3DnZgzzN+mEL8EKDcI1b7E+D6XlptFXJlDz
	 b7Y3QhgdQ+o9w==
Message-ID: <7e16dd4d1eb87f96ab70ded4f16a04ef@kernel.org>
Date: Wed, 17 Dec 2025 10:18:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 12/22] drm/meson: encoder_hdmi: get/put the next
 bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:45 +0100, Luca Ceresoli wrote:
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
