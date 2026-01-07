Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D8034A779;
	Wed,  7 Jan 2026 14:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795983; cv=none; b=SJLyxc0VkqwFUYYayEqKGzUfXRDifQtFJSNJr78TAHOqpbPShhO2zhGScH+IsqMvXadcZCZg+Oh5GZ4CsSq67OVIfwAdHniWYSK0+ijt4MX35GDcqwYVw4AuEpufYsX19Vgi9qqpUuxBl/19bzukXQX6qY77Nj/MRC3OUO632nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795983; c=relaxed/simple;
	bh=Al+KCPafudLV42iK9rQx6eYRBeVnrBFIjRqTYhrzW5E=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=G2BSJDXvRDFKzDjGOJo3EpfYdAowOSLZRi0dCiht0siUhcBnGZzHYksSHw5g3V0GeZd+1dU6jmsotJjy1OFip7HuAtHku2DYy1HOSkZl4eH7sq4n/HjfqL4dqn87yH9TMdeJFlIQyqYL2GlrzZ4j+xabGwMjC6AWJvGeaj+3Rh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXRIFei4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXRIFei4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836B2C4CEF1;
	Wed,  7 Jan 2026 14:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795983;
	bh=Al+KCPafudLV42iK9rQx6eYRBeVnrBFIjRqTYhrzW5E=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=gXRIFei4N1O+jFAwEkSiyAtxCcngHhyObTnyc8gHFHfx6vBqEBcR1hgXV/QcmP3/D
	 pNKkrZ8tdoOChfeZRB/KnP9432SMlvMPXcETt8hA6zJDFhRUGUw/d5vUUorQqsjYz6
	 VNogqeoqgbnX23oG5hxdQCO1RiTak043P+bc9DnDI1riIB97djG4rUIAimzRynCHqH
	 GY17F9CADQkXYDvC8oHrycvtpDal/AAfpG+Zuw0KN4v0Nweo83mvhUj5OGVeUsv3S+
	 EGy+VUpVAGuDY7JUf6kIDVXZn/joSz/iK6/kp/bCNtqHApFvrv1DB+3ozCmxa7TiVq
	 C6WHyFhKDWztQ==
Message-ID: <61e5d3c5e5f7fc2b9a2ee8d707d3b664@kernel.org>
Date: Wed, 07 Jan 2026 14:26:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 12/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: convert to of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-12-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-12-283d7bba061a@bootlin.com>
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

On Wed, 7 Jan 2026 14:13:03 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done. Also switch to the drm_bridge::next_bridge pointer.
>=20
> This needs to handle both cases: when of_drm_find_panel() succeeds and wh=
en
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
