Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72BE284B26;
	Wed,  7 Jan 2026 13:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793096; cv=none; b=kNZZBQOx2yWYZSLMUOjkQYl6mXOsCI6PRo9i4YGOSwh4hxeYvqx951wtmI08qn8Mho8APALfutQUSmh0cZMLEiPhUqFir3C+n9WRxpMHHztDmQ9gxIJgaMtEb/U1w1vZ1MUwfiB/9n6JuSD99kq9k0mZdXBdjzg8ZvrAU240nXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793096; c=relaxed/simple;
	bh=Y/wgED5hw+MrTEJNVZdY67MNqhkUs/MWRDe7NwfBaOI=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Uw/Nrt/sOkSLLAFNCN7coC9FWvV+wvfcBJ22dX5syubmMqHCHxEF/HLPxvAyL090gYg5pvbx4WKrablEAvzulAJsL3abSe5IiNgN5/pKlSSMCa36VbW+upvwd8BhVi3PaXdVu/zP0rgq/3r1Y1sxT4F43WJzURl3BCGXxE2ImAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkKMLNYw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkKMLNYw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9274C4CEF7;
	Wed,  7 Jan 2026 13:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767793095;
	bh=Y/wgED5hw+MrTEJNVZdY67MNqhkUs/MWRDe7NwfBaOI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=UkKMLNYwXMtgJ3NQLejQmSkxP+dbdgzbbdR59Uy5ImyaP9y6EJ7gjgjlK7K2I2p21
	 go5pibyPoPPhYHLh6apqebm1DHiAssbxjWcGlL7a4lM1Y9eS9BAA/XUJ2zE3qaVwZY
	 2TdPTS8ZhfhmMKCPdcX3+ncJtl7AULdkzrz7HQjVEFtMA8U82UvgLiwBgJVwBe5bpz
	 cbTvLTFrJIcQFpTtlT33IF+KLXg65Jfjw4SPVKQ86zZqRM4IKSRsoXh6rhG0TLTCip
	 pyHi7zNId5rW02KN4fi72FaBUdu0JSY0OFyu4lkAKWlKfEhUTv2CFWWVemAuPhZeYC
	 t/39iwNOVmjYg==
Message-ID: <0126978effd421fbd3ec8a36235a3846@kernel.org>
Date: Wed, 07 Jan 2026 13:38:13 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 03/12] drm/bridge: sii902x: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-3-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-3-283d7bba061a@bootlin.com>
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

On Wed, 7 Jan 2026 14:12:54 +0100, Luca Ceresoli wrote:
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
