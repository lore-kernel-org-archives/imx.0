Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A01C33EB01;
	Wed,  7 Jan 2026 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793151; cv=none; b=MOuRP1LC4a5holynQf/j0BdtNiqdw1KrMKkb8DCXcqD3v1uTegNUJ0q8YpdEMCFJxFebuNk8gtfwB7srNR4v9dkB06uD3F/3pB1Op8Of3usCl+Gu1BuCcBrc5JdGeInq6ZfHTKwI2tLIyWCYHQjFnwlwOGbKu5CK0PVKvfpRyoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793151; c=relaxed/simple;
	bh=t5YunGd1CL633ttkiMZxmBZVpk41cVRg4uqkSooAV28=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=oj8zeCX8R2yiX+YH5G32RRySZizH53/PgmeFUhxxFlJwVu4+AUV/Hk2Y/jEuxOQiw6FC95J0mhCloilV2uSC7RvjZxPKDP72HB03XP1ekFCUhPwCoa2tkgNK4j8VRRXKs3b26fO12sLEnBl0Q1uo+U+5PBti2zLbk+hiSOmsBBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpQFfuqE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpQFfuqE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4099FC19422;
	Wed,  7 Jan 2026 13:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767793150;
	bh=t5YunGd1CL633ttkiMZxmBZVpk41cVRg4uqkSooAV28=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=gpQFfuqEEYKQKlLqHGJP0hUPiN/wFzN0LobJxctZZG+aB3h5sUALbzol+oOYxF/Db
	 gOo75IpjBigBtkbdlAY4Tvv/qAuU8a/MFoz14u39FlkHF9u6Id96ihQlREWeyq7U4V
	 NqJlxsRhknjOn6iNIJUq9UdCtBukUVuwregcmm+y0JMypfoUfVcLJaCV1zqFf3vkPv
	 tw1wZqz02VjP7OTdku0MG9GzdpLApCUOHqBaHYzDzJpfgdn+cwrUbgxkcvWpIpvnZ/
	 q/L2tJjVt02YbrGDDdf0ADek3Hbadm/uhl75tTJMH2XlBCXv4xHkqUzvWYjjDMAR3w
	 4AH744epiwbMQ==
Message-ID: <1ad5e0f651f8a0813b5f1c320e93eca4@kernel.org>
Date: Wed, 07 Jan 2026 13:39:08 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 06/12] drm/bridge: tpd12s015: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-6-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-6-283d7bba061a@bootlin.com>
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

On Wed, 7 Jan 2026 14:12:57 +0100, Luca Ceresoli wrote:
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
