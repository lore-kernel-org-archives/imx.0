Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885EE78C91;
	Tue, 28 Jan 2025 11:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738062392; cv=none; b=EfUHyhLVvGThpMf+Hy9gBJ7n85fI+t+quOCUg7ZYt20sL68SfrirCP/NoBE/PSAaY1os8tDARNDzFkqozY2i2Fylmp7E5runRbKTtnyvSc6UHAS78MBEze39lpUHgQe6IuUFEAcAqAOiyMu7m3CQXmEuhHJblgc8W3QWs+m5L0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738062392; c=relaxed/simple;
	bh=gv76C6wO6xMSzCbvBBvWgdOv3lE3r87BRuayIE6KiXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTplVHU+gtJ5lYIv0KR0B4ywLM0OYS5dOrZbnd6hy6f2ZX+J+Ul9xNEBX3i0FDJlZemyCKtmoobFYsZht9hFUGEMWThmdg0FBT3VJuKkoOyNfMOhnroVqoeOhMvLvc7tESXTQBhF31cl3RzJFktGd5jzXePYhoONbQRQaLEPUxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XcQcWjNV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XcQcWjNV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE901C4CED3;
	Tue, 28 Jan 2025 11:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738062392;
	bh=gv76C6wO6xMSzCbvBBvWgdOv3lE3r87BRuayIE6KiXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XcQcWjNV+M54DU8459RWEa5PzPrw7zxbkleDhYV9iQAmDaK4meu+eLCoc1DTqGguo
	 Wesux7TJh0K2V0U4vpXK5RXzqxCBEYdcevhSPJWDFSdcuE6VfmFtmXcRt8Je+u0egA
	 zaG6oHZg3RoLriyomnEd8AYlf+J8q4AcDPZ22vn+7qZOERK9HEKiFGqW2Wx/7ScGdf
	 nBbkFWLx21ose6DN6Dv7FXKbc6JjpkQb2Z5aawSjltVAjro66uaGQwk/ZolHLirx1l
	 4tVCThK1r8RMDP8ftEza3BWkcz8qGD/K/VoSbleSZ/Skq+sXFPOyGdn6sCMEfkBU6r
	 ePo501YS3WSxw==
Date: Tue, 28 Jan 2025 11:06:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Frieder Schrempf <frieder@fris.de>,
	linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Conor Dooley <conor@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Bo Liu <liubo03@inspur.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 0/9] Use correct LDO5 control registers for PCA9450
Message-ID: <bce1bafa-aa90-4a1c-a2d3-cabbeb69e3f0@sirena.org.uk>
References: <20241218152842.97483-1-frieder@fris.de>
 <15348147-8806-47b7-85c0-2850c7296ed0@kontron.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IvZLa3vdj9aLxx+U"
Content-Disposition: inline
In-Reply-To: <15348147-8806-47b7-85c0-2850c7296ed0@kontron.de>
X-Cookie: I never did it that way before.


--IvZLa3vdj9aLxx+U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 08:44:28AM +0100, Frieder Schrempf wrote:

> I just want to ask kindly if there is any feedback for the driver and
> devicetree changes in this set?

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--IvZLa3vdj9aLxx+U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeYujAACgkQJNaLcl1U
h9DpOggAhX9BLy687yuZnM+F3nUkkbj07gR84dcQcicE5ja/aM4ckgi/aDAgvHsC
34rd94+v7TO8cmQ/SPT4CBd9L4CEKv/JjAFKAKXXH1ya/Jc4SzMi5oFAhf8c/MMF
tC/b/6NyIOcVioXf15AuAoNQ4NFFTrumHaBiI1kau5bps8k1Gsg2y4Wv2+pXZDlm
3WMG+8B1eZJaMAwIa0P5XfzpPHEHya91HC/19XObNMzeJB2TMXBad1aflEZTimZY
lDDIfbIZhndkR5XbCf9V32CCPH8E9Sqs+tggHY+X4PDGTuahfa+U9JCRqvpPNYL4
40RSbzMWSYG148fvbylknQXQwAn5Tw==
=P70F
-----END PGP SIGNATURE-----

--IvZLa3vdj9aLxx+U--
