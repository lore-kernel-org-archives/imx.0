Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD3C361DD9;
	Wed, 17 Dec 2025 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966626; cv=none; b=k45bInr3DBomgvyQhLiw8dknG6yGVhbGVzrWQH7T+OhWBk8I3ZIRQZ5uw4xbJVCO+kXX7dSy0quL9qcFIqdRu2yXp/wpuj5vMJDMwaexZuEkPUZn1F4gQ4DfpFGGe+/aoV1gyIos3eH1kb2HE0t5juAKIjh8m1uqDyYQXLDLx2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966626; c=relaxed/simple;
	bh=mZgmTPAeMOlNUGInXD4jCnDjAKu2QFFNlX+3u+2jIAc=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=p3JBOgH/qftXr74+/7K1asDgRhr+FDGkFaxF0WBktu3GxNWBIY4MV7y5kd176HoruOEtyMOkFv4ShVstVt6us2Q0IXST2EeJqtOGlcgkmQLb2R7fmfE10+wJqslfnXEIV+sl5HXwBN+hJigxTbXdSKRuIlcHXKBnQ7rIAEKTFj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyZAKLyF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyZAKLyF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFD5C4CEF5;
	Wed, 17 Dec 2025 10:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966626;
	bh=mZgmTPAeMOlNUGInXD4jCnDjAKu2QFFNlX+3u+2jIAc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=VyZAKLyFoi3kNFjG5dOkan+Qis7IQcXAKUc7okV15sa3Du0PSNJfnus2iX/r1acOQ
	 26zGZkm7o5M+xp1aBKtVPRBSYi7SgUPYKH5wZQeVv4qy5KEPuvQLyMVPOoeDxPuwPy
	 WTU36fOOpVOxpXa73nbFDyWwksA0xJBLCzX3cC3neAzgWhEyvgGkGfgEiDkNzNnaXj
	 skrcOyBoe+Sh5yLymrrlgsdXfj67lvuljIFJXiZ7y0q1YmFDrA4FV2EvLFSrPeev52
	 49ufHVFENgYAROMzIktwy4ImrH0phkgwUQRt/qrNh9mWTn2uBAq0Av6X7PcxRghwIQ
	 fsL/NCIkBT4CA==
Message-ID: <58a8aea8735f1ec8db23a95da8b7e0a8@kernel.org>
Date: Wed, 17 Dec 2025 10:17:03 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 06/22] drm/bridge: add next_bridge pointer to struct
 drm_bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-6-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-6-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:39 +0100, Luca Ceresoli wrote:
> Many bridge drivers store a next_bridge pointer in their private data and
> use it for attach and sometimes other purposes. This is going to be risky
> when bridge hot-unplug is used.
>=20
> Considering this example scenario:
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
