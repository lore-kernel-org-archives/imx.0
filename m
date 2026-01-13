Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718793939B2;
	Tue, 13 Jan 2026 15:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318963; cv=none; b=u/yhI+Mb2vSzsLDuzwsOsEMfeUwaUCmQRUKUmGF3MCVRGw8sFNzQC5tZD/45sR5f435cj2xXF+gQZlXqyCC/X1HqgBKfnkajuemmrJUCJQCnyCVeSpPiUXuAExM1HvspJUAf6yPcA4GDj/PnvO0DDEvjo6wmfXdA3uOFul5HKrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318963; c=relaxed/simple;
	bh=rrnWNw3vkU2Ih+pUchIRcev1TZ+Nr+r2PD7leoOT0ic=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=pxSLbj8KyLRAcFZ+Rw79/HshAxRL5LXccnj8d/SFyRwnaH9cWMmDtXB3dqvBGh0Yv7J3XfXNhdDGb1rAMkl8m0yDOqyK3Yg0h79swjfl45NicXMj0Saux/E0Jk5BQpuCAakxV4UNv+dciaCBnvcSYoXtaCU2Safwnyk6B6DKPz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRIX4ovA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRIX4ovA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84744C19425;
	Tue, 13 Jan 2026 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768318961;
	bh=rrnWNw3vkU2Ih+pUchIRcev1TZ+Nr+r2PD7leoOT0ic=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=dRIX4ovAcZciutAuOjH7KQc2v9gHBtJoOBqf4Pxso1e7n9i4dWqiX+7IqmwrjPTPJ
	 B0e5/4HJ7m54NhbtKd6S9xn2jiVbR4u/eV8I8+jALdOPwALqwmScrcM10i+OkgwtFp
	 y8LgNs1nJxKeX2TY4+yq6gIpP8z5YZiVRJsr5cWkdSg67W4BVMTa0QYnme2T7YBQm7
	 UgwdrDoBegVx8/wmLfJiMJmB7ll6tIsVzXk/O5fQWvMk1D5Fhh+HTU/NZ2lGmbiOUR
	 vb6yvGPhdaSXuswQaRoRBCFC5JjMfEAJvh/gtzzX4eFYKLDEvHcV4LRuVHGLcwhC2g
	 vKxh6FazgkQ+A==
Message-ID: <45d26d0bc35eb157f798cc74004af133@kernel.org>
Date: Tue, 13 Jan 2026 15:42:38 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 10/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: use a temporary variable for the next bridge
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-10-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-10-8bad3ef90b9f@bootlin.com>
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

On Fri, 9 Jan 2026 08:31:41 +0100, Luca Ceresoli wrote:
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
