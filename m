Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5493ECBE3;
	Thu, 19 Mar 2026 16:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938852; cv=none; b=M4emR2ItV7VBTOPaKt366hSUB4JktjqMGZ6Lf2FfejknAnf3VVHJMPY7QYgZ5QufjAdr0nn2oXJaX6/5R+yeWReeeQbmKQHn3cKKeX7ELSL2mzRmjpVAD4HGjmbzJQuu93o62Rv+8HEc8ozmgVh98qEwcpcdKETzx6ETTfYIghU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938852; c=relaxed/simple;
	bh=Q9bmMfFx9VaqawS+DAi/VMX7Ox1YGfZETdSY0ka144s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzMUElKkciMtuOyG4M1cELaCLNTNgzhqLOQm2lwjB/etz9flLdnBOCmLjH5iB1PhZ2ZU40EuOrWJgtBfUzaPpTiqmsx3rNVd+WF3i5HBe4x+xkZjqDMl/TelMyobgeL0wSrvrmARCAkdhGBKIy3lGksr/z8oR4yrmMeKmdmxncY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6O09R++; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6O09R++"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548C6C19425;
	Thu, 19 Mar 2026 16:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773938852;
	bh=Q9bmMfFx9VaqawS+DAi/VMX7Ox1YGfZETdSY0ka144s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6O09R++VeRZeBLvlRglepXSbWOnsIhuBkcGpNhTMB1/MxNyYTeJapekjDaW9ym/U
	 g3WiEdfd8R7uBK2Xz+c723Mt4iJoIhcaf2D0KORmNFiAcBex9S3LDRiAatMQMSmEp6
	 hxCeFN1P2frgIgp4rTTbaO08bJzT3s/ict3CmhuZ7Od9S9bnxl1tk3RYNwiYwtltlO
	 BmL3gyQPevLioogcVVd92zpTvWC7r9ofVSUz2yQElRmOw+UfqSCYLuP3sXupZcEHPc
	 D/laaMiHxUOPr3yX1/rh+tkLZh0/blr5EGrrm3OO7RF/31GDgPmVJKMZcumqeUrw2y
	 q7Y2i0DjnTmwQ==
Date: Thu, 19 Mar 2026 16:47:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: add MBa93xxLA-MINI
Message-ID: <20260319-theater-aspire-8500b91fbdaa@spud>
References: <20260319125013.2421621-1-alexander.stein@ew.tq-group.com>
 <20260319125013.2421621-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/6QbIyqIGRlgMuc7"
Content-Disposition: inline
In-Reply-To: <20260319125013.2421621-2-alexander.stein@ew.tq-group.com>


--/6QbIyqIGRlgMuc7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/6QbIyqIGRlgMuc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabwongAKCRB4tDGHoIJi
0uTNAPsEyayXseF02444xp1C/jh1jrMtTIiGUoPEhRjgH5ffcwEApfj3NtwQgBqm
vlSCD93D6v9TigARn+e896cjCGUAoAU=
=JafL
-----END PGP SIGNATURE-----

--/6QbIyqIGRlgMuc7--
