Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910AC31E823;
	Wed, 25 Mar 2026 18:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462902; cv=none; b=SF4bda0tFuRX4B3ZeeedXAY931RCJc85OZSG9xKJbV22xvgr+HJUG1RAxVgM48dwhIvliND32YRQ9HHTKTmB9xKdlq3WA98h6JshpZNL6+yXkKGbAn/YWDekHIlEvTJrLfJifkIJxxbKWsmBzlvqB7M3uifkhzU2lUZTOl7T0/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462902; c=relaxed/simple;
	bh=wA3AaXCRzESvZkNtYLUwYzrrKD5GU9j1r4KSqN/38rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvC7pYvpI88gQvzGWPT8KA9BSVl9FoirFLqxszZBP0iEDzTpqlBEEdtw+coy4JB3vhnLze0aR8piMeqqgHULw+NKizG8hrwvzQad+2QGz845mF6MkrV72ipNiqtNh2aaUYYNeRm/jB+xl6jVviCYQnLz3i0MdkfiKgZnnFzJ9bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGQjrj+g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGQjrj+g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AADC4CEF7;
	Wed, 25 Mar 2026 18:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774462902;
	bh=wA3AaXCRzESvZkNtYLUwYzrrKD5GU9j1r4KSqN/38rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LGQjrj+gxcjEYMmX9E6vkFBMAwVAgdirn2pG9Tpp9ueqZE2BQR0ih3EeUv0nk4D9i
	 vQ3v88QAfHk8MntHHWRtYrP28nytUUPm77gc6YczOBwb8ulfBNl149K/S+sGDqz1kV
	 /vzJv77cg1U3Zv/gmu/h9mUyzS4Z1pcU7gesWjf/q+vF2PShtmiUgdHoUfYVbYV2W4
	 fUiV+xDZMM/ZF2bXhhqISFSxPLDBlg4jjh2bS6s+FarmanNQL4ZmpfDm+opQzlMYNo
	 UJkaox4ASPEdKnIGtzD9+LaGcNHk4KlzrLDQA7WNuSYlJvynZaSYfwPqVcvkYkYrSf
	 Ok68c/kDGJL4A==
Date: Wed, 25 Mar 2026 18:21:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: display: simple: Add JuTouch JT070TM041
 panel
Message-ID: <20260325-unretired-commode-4b5c46861c6d@spud>
References: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
 <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-1-10255d236439@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="03/Mmn5KrX/eOG5t"
Content-Disposition: inline
In-Reply-To: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-1-10255d236439@pengutronix.de>


--03/Mmn5KrX/eOG5t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--03/Mmn5KrX/eOG5t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacQnrwAKCRB4tDGHoIJi
0qPFAP4+1nsTJGSVuIqhbQ4xCZAfYKJhlukkxY4zNFocmAHrXQD/VIBzCTZxMeS5
CWnelrL2U25+YW2xEnElm2DC3h48PwU=
=xuAa
-----END PGP SIGNATURE-----

--03/Mmn5KrX/eOG5t--
