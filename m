Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF79831D375;
	Fri,  3 Apr 2026 11:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775216602; cv=none; b=Kf0des/kQlwjCc0gmIrFC9XQ4QYApO2DlxkOrGtwGQwqI2/ugxOJlIFAbhAFugvsy2ektlnwmmArPmob3nv2VFe8NnW8ZZOhQxsQIFW2xiMjoVXzasF0tqu0gU/VoGX97n4mxJ/W2/LJBFsVXpcfLrU++26LckmkdvzpZaD4a8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775216602; c=relaxed/simple;
	bh=nHOAlStK0yrlXQs+u/fb9lpL6PjE3lfkGJ95j8Xl3nA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0vCwFNAkugx8B3AWkLhcphR7pQjw1tnZYHFGcQPJ0+MkIyihnPynv3qfOn3e94Rd1nTJWuto6BXj6ejsHA9sHMbrm4pPILOxOoIZ80LKRNHiIfLh/so5L+1miCSCnoH7rkkGRA1FJsh3IoCEdMpUx5ER3ZCkRqbqF+VMh4bdjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YyuHvdfD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YyuHvdfD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58017C4CEF7;
	Fri,  3 Apr 2026 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775216601;
	bh=nHOAlStK0yrlXQs+u/fb9lpL6PjE3lfkGJ95j8Xl3nA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YyuHvdfDDlqPoMZDZjxvIJhSoBDAhKwdbUD2svKr3+MfA4KxH3cvX8Giw1t5EGV0G
	 vxlttlQtZ89rshVo8UyvmLsaJ697M9N6CuB/lXxnMnklVpbWJu2Q/pPR6gOrF8rRFl
	 wfL49F/yY83JguOMukBYajhn359hvV3MzdCXL5K5Dl+8bwaLhNE52aWvOeYeu6wpVq
	 32oAI5PYc7jyAuFhGFqiLq6fWA+LzDrz8gO9bUY+gf3DlsJDLXF8InlezI7kIk5z0p
	 vSsVU9I2cEE8+S1u9+NuL3EyNRhKsi/+DgjieCIRrzJweaKLChSV0WOTY3V9tbGzCy
	 b44b3DqiMX4yA==
Date: Fri, 3 Apr 2026 12:43:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Frank Li <Frank.li@nxp.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 1/1] dt-bindings: timer: fsl,imxgpt: add compatible
 string fsl,imx25-epit
Message-ID: <3ba9e33e-8d58-469c-9c21-5861c0f6c5eb@sirena.org.uk>
References: <20260211214947.3705328-1-Frank.Li@nxp.com>
 <aaiIdS0zRPBY81aE@mai.linaro.org>
 <ac9ztfwZMrZZgTeP@lizhi-Precision-Tower-5810>
 <77a77b79-a489-41a8-98c0-00242cbdf24f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u8+SQnjbHNPxZuSK"
Content-Disposition: inline
In-Reply-To: <77a77b79-a489-41a8-98c0-00242cbdf24f@oss.qualcomm.com>
X-Cookie: The Korean War must have been fun.


--u8+SQnjbHNPxZuSK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 03, 2026 at 10:15:49AM +0200, Daniel Lezcano wrote:
> On 4/3/26 10:00, Frank Li wrote:

> > Can't find it at linux-next master branch, anything wrong!

> The patch is in timer/next but may be linux-next disabled my branch

I have a timers/drivers/next branch in your git tree in -next but
no record of anything else.  That branch was last updated on January
20th.  If you want something else adding let me know.

--u8+SQnjbHNPxZuSK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnPp84ACgkQJNaLcl1U
h9DozQf/YNeuimr/qBF1dSRHOHAPPCJDwyu6/YY4S+uJp5MPGgO8XaXHsKHMtfkz
gOyIxskBRJM8hZf3XmZozh2FqhOqw0Kndi2zXvpunr7EQsTnKuQUaVbHW9dznM7f
GXElrI3MMi5flsW5bj9qvg882psBbU9bN8a5tj9PpKZvqhYrQCyBzZcUXn+sCpEY
iYiLu0GaKh5NeQ6V9Acq9C1Np5twKfNpAjX6brcoCmcF3RhqCrAQ8RtvtbI5BiwY
0Ay1VIG/KY5dJCJh8IESqwwDG92/XyV4oxxFMSRQtM+9wabl0cXl4ytmSQCH6f19
2qYyqWp8185FXBG91h1oPmi24oTtXg==
=Cmi/
-----END PGP SIGNATURE-----

--u8+SQnjbHNPxZuSK--
