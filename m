Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00EF368267;
	Wed, 17 Dec 2025 10:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966682; cv=none; b=m86wbp2/89WPji7WoqifLgmSrUq7tG33v7jdGzdbjBk3z2/a9gjhbr6yrMSgjzbgoTKSBTOFkHXTAyPDKu9CU4Vxl0iZswNJxLQ+YBCA0HOuG7GuYbtsXuKzUjrI24XYqypEzpGomQzCVUSkEBiOEzDZwGFE65Bp04YZ7jKjCow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966682; c=relaxed/simple;
	bh=63wq7cQ07cPk2UFbCtAzGzxdoxkYBSOxCsTLdH1kFZ0=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=IlHbZsm0Yg0gBiMCf2saYFu1BuxZyaptVseBq2P2Qsq0QQYeIcVI+H+2jbwasFYz6/m4+SqoBKVx6Yt49A8t2XJ7h4Y8Yp7KiKV7NM4K7N9zLD8pXgVNVI3c68w9BhkNffHhytrMhq4U7RtB+soamD5haj/Xz2C9meUsIrtyQyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H15BsT0e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H15BsT0e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE9CC116B1;
	Wed, 17 Dec 2025 10:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966681;
	bh=63wq7cQ07cPk2UFbCtAzGzxdoxkYBSOxCsTLdH1kFZ0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=H15BsT0eaQ1D/ebqcBYDmXAEMdfwMhRHNg5Ft0Pb9y4mAQbfuzLUa8KjmKUqQMhqF
	 +XRVFdfgcosWyhZrYK9yGr/D+xAWGEMkyEJc81MQ6SxQyKSmCK8p4H9aiuXMbAlw/a
	 mpulpwF5Ar7SptGzBiNgyNtKQgQADBrhVFd+LpPAydtJjvpKNTfeQT34bEApChZnZ5
	 6AY2Mgbs7XQCh0iiVgKoRwpEsouVmfyQ6p2Un1/F7sNiMgyMVN6ddcxHHOmnLgJzrB
	 D0Nwqfm9qu3uqpe+nCJwVRpZNRTB9P12Noc0YhpWh0TGsU24IKggSzaVftcX6h6vGY
	 XaXZoPwwd3n0A==
Message-ID: <0330f880f446091e7bb31872f69f6de5@kernel.org>
Date: Wed, 17 Dec 2025 10:17:58 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 10/22] drm/meson: encoder_cvbs: get/put the next
 bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-10-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-10-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:43 +0100, Luca Ceresoli wrote:
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
