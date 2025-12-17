Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEB935CB72;
	Wed, 17 Dec 2025 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966531; cv=none; b=uS9yFURPVdyZSlhSa4Grsa6l4JBFHo0l1raAgrjf4kL25RIabknZsxGWoI4jVjug/3E0d2GZVsdIpYEziXWPnCliNBcvHEnijuWAagbhn3tyGvdMEYiyJnsANLn9Y+L4IjT3sK/itGnPr9ngL1TlAwc3FlRak++JInYgzgnGyWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966531; c=relaxed/simple;
	bh=skfOYgfAuvLlvVFtYXO0nED04VoALMEVUW5taGZIDUg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=MnSEZkt7FNDpODQLAKQL1LwzmhJ1ULkTEHMSH2lTJup7qZxzahsZw6wNxWgk4Ol8Tc2EDkcbaJU0MuKYbm90UT9s/c1jyvQ6B5Xro9JjGXh15rAjh6YEb3SlhEWPElTcz2QJx6g9K2mDiT21ABgYuXHM8qCJcMQTZBfGBfsZwqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nz6p3DZz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nz6p3DZz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07F6C4CEF5;
	Wed, 17 Dec 2025 10:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966531;
	bh=skfOYgfAuvLlvVFtYXO0nED04VoALMEVUW5taGZIDUg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Nz6p3DZzkqG8H4Nvbd2AHyWRx3TWgtrkGHCbG7nJP/yZ7YpQbUQ4sScJ0axpFSM76
	 N3I04sjA4YLG+NMnOi+SoQIqDF1B4dY/9PK8lKk7/0Ac6Kknuhe3HgXPUfh1dMkWaL
	 gGtES1r559SgmtcLu2EFp2cMk2ewcqkb19tBrfbdgplxNfF+Y9Pf1SbaPVem2zSlaP
	 rRBieyJeZ4v6dRrrqHwDQZDFBOJQdzqi9c/tID5E3JhRqWUOg026uwBdbq6QPX5GKc
	 p8HKcRIw2JDAKvrK23Ukl+qpfo+Ew8yzKm60eggM9XvyoV4GM2kJUpBxmyM6Rv6pA2
	 udWFcrUaXyBwg==
Message-ID: <0ba037c65f9cadd51082abf2b7857ba7@kernel.org>
Date: Wed, 17 Dec 2025 10:15:28 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 01/22] drm/bridge: add of_drm_find_and_get_bridge()
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-1-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-1-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:34 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() does not increment the refcount for the returned
> bridge, but that is required now. However converting it and all its users
> is not realistically doable at once given the large amount of (direct and
> indirect) callers and the complexity of some.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
