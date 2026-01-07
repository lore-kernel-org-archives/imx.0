Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FCB2FD7A3;
	Wed,  7 Jan 2026 13:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794202; cv=none; b=Dz3g/xCHUcb6fXoJyxZx9nqN6kgkYD5ydqKCZUaVoDT2pAtX/3pyPKU+gcMnwmvHUtNTZpbvz64LS/c6vBrV1wJk8NJcgDJD+V7sElYNW37r3nyfy9Ueuy3dNfWpETJ6sfktqOoxcYTYS8bBO0VR8EwPFctnzDKQS0+oZzr3RVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794202; c=relaxed/simple;
	bh=is+q/rGp91VXaPijC+q4cj64jd7mGpSySGNDyI9q+mg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=cCvGtUzFOO1ZbVEKv8mnxogNUsXVJtiHXB3uH69pYHCeQCnJaMOmDjwhIQtD7JNMB5DFGT90yQs7+Ll88hZKUG/+QVfBUZYDF8DptIb3aMCinrKfUnjSrddxbU88T1nYp472wl+LmT6DDEkCUtZMYt2sI3e/6HgarCHcmT3M9dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3GY/Qvc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3GY/Qvc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80D6C4CEF1;
	Wed,  7 Jan 2026 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767794202;
	bh=is+q/rGp91VXaPijC+q4cj64jd7mGpSySGNDyI9q+mg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=U3GY/QvcyWmbXZeQ9v6SGEQMjvfLVh20Z62ki8Tf9dzfKJET754JDghzGb+Nd5Dz5
	 Vv5Zu4g7TWqz0suD8gP1N0yMEve5gmuFYdP3CI/CGFCAZitnQ0rzsxw0oKkeDLZEgj
	 XkZSIORN85IJg0iuV/GZyDdfl+PZICrqaGGIMFGLXJkAqMjNTlUP6NtL/JXiVDoZtn
	 ccKweo3sOYUcYpNAPpJyRW6LdL0DyQntjZQy5LxMZnGSxTEqTkAC1dm0KbxA1nHxWo
	 zbYtmLKsOIIMBFIp2guflw0pWEO045X/QoAkDeQoQVbXQQd0pbWcRfJGA9gGpVYPLY
	 Wcp64O+70hyzQ==
Message-ID: <d06f91d487a616258431aa0b8b615b05@kernel.org>
Date: Wed, 07 Jan 2026 13:56:39 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 07/12] drm/bridge: lt8912b: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-7-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-7-283d7bba061a@bootlin.com>
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

On Wed, 7 Jan 2026 14:12:58 +0100, Luca Ceresoli wrote:
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
