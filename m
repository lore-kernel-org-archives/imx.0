Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FABD1DF980;
	Tue,  7 Jul 2026 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441046; cv=none; b=E3dDLXpKEiH3CdthsLv83Wq9mtG6JEaJtPUYpiMPj39urBSGQH4bJA8HX7WcdLPlqGjYMxplzsjH53gsfGac4w25JQbTBnjiTohFUWO/f6Vr3Ev2smUxWoWQ2kWhsg0TGbKHZ2N3GeiZRp0HZCDzA43W8lQu7EB/lnrAHdEiBpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441046; c=relaxed/simple;
	bh=xgLExI0ZuL5DFxT5uluj7rr7PhbjkL77u6MZZR5PtbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i92jEi0SO5QvoQDwOji2mEFnaJ38xdXMiJv0qoEUUhUvy5/h2bWS3ffPyuh/pBZP9gkNFfOvXKXo58Vy7SmV6iDTQTV/NhvwZsmBdgqqXOplb0YoT7KRD5U/5ujzILjSXyGUynmkdXkOwyXOkx/G9qxi31OpTcHP7Y+tUFDFv+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b17ecv03; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b17ecv03"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33B31F000E9;
	Tue,  7 Jul 2026 16:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783441044;
	bh=xgLExI0ZuL5DFxT5uluj7rr7PhbjkL77u6MZZR5PtbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b17ecv03MbfTVaSpEzLG6tQCe0ajEsjzdNtBF5yFEw/xPJ9mPRLmTOQXzIj7xi5rl
	 5L+BXGRiEEFdKGSBkxo8EEtDk3rXdY8rSN8ZE0u5JMqCc+rWqYA/LtDNYOo6To3uXs
	 feJg2WMJard4Bb1WAOF5R9F0YffjOaq9AGBgNSbwXYK8kzTwaq8P1Gchj5EaqxZAu/
	 eUA2qKVCfT2e9eljFA8jolj9IN409SZLQnbi/E0MjVb3ygyX2wr2/yisVbDhqVGuWF
	 dTNhqfICrvYN/KYsCjks5axFkmWfvYOtvPQreo7yB6o7lUPiyG0fhzAsMnMgr5YvEQ
	 lvIkg6FCHDCLQ==
Date: Tue, 7 Jul 2026 17:17:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: add MBa93xxCA as mainboard for
 TQMa91xxCA and TQMa91xxLA SOM
Message-ID: <20260707-shriek-pogo-92d37cd50a0f@spud>
References: <20260707091424.1702245-1-alexander.stein@ew.tq-group.com>
 <20260707091424.1702245-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bzecNQfsPEZxdUFH"
Content-Disposition: inline
In-Reply-To: <20260707091424.1702245-2-alexander.stein@ew.tq-group.com>

--bzecNQfsPEZxdUFH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--bzecNQfsPEZxdUFH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak0mjwAKCRB4tDGHoIJi
0ngXAP4weMhA+W5ND8F/QU6x2I5O9/BMKIggo/2x2S9gYoOMJQEA/2wqCmFM7+6V
Mrx0WZSCsLtoqqQ56pFvzD7qbnF9pwE=
=KS78
-----END PGP SIGNATURE-----

--bzecNQfsPEZxdUFH--
