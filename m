Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974329;
	b=fmB/w35SUUdeqrJ8R3l5CoPWqunxCG/e8pLMn8iGwrquioOioxmq2ExnfXuRTpy1riAV
	 BmFylu8axLDJmmv4ZAHFgj/mrKyLdQJv4NcxoRcAReA+d6tVVi6LnGn4MWhUZKHIPMF23
	 ux8C1uAkCluFFyokqbn8lrx/09MLqO/LGbhgdaqShEAupUfqrWwnJW25QbapgHaENxxEN
	 /CL6Xqm4PGtW2iq6puL3/eCm2B/kCm25DUA0ng8+YF2txetxSCgDWYTgfyUtkUgHtHj+B
	 sGsujqKu73fJacDsnKVH1jDgptqzVTfVtMR6hoBF8HSWHp0ZCdnZXnfc6eedBbLXzOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974329;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4XpFVS9+/GxWCtMg0s0kFGwjlbQ41jvzXZOYilphHuY=;
	b=SAsZrcGNy9rh4ytsiRExPk6idFKNF5ZG2NmWAsxYAdayIl4od28ewVkNCSZqcG/xfE4L
	 VC4ied+qv9ZyfyX4aUNx/G/9Cty+uzD/RPylVFCHMtZX1b4qEk7bG1cCVFEuepdvXDMSR
	 i7qbdXQVJ9D1idOhjezXPGeIB5fwYDuDhDaQhV0IVO7+0UrDMtXyMKghz7ScfPGRsEpFl
	 vpeJj8uNoM3GF4Hn3rsXu1/9T4jk6SxoOxFkeuQLvntVuubFEnz5fVAT6sefSmuF2ob+x
	 N7Den5VVPow9H9Odmne+Zlp3L++9b8jN71rLdXcQ1xry8So+lJsYZ5L2+lZWE9tlX0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eTECLWEu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C06606A326;
	Fri,  6 Nov 2026 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eTECLWEu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B801F0089F;
	Fri,  6 Nov 2026 14:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974328;
	bh=4XpFVS9+/GxWCtMg0s0kFGwjlbQ41jvzXZOYilphHuY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eTECLWEu80D9BP+gqIwVQDdg4OSZ7TrQ+5iyd3rTlPf7eSCudagWHA53jCe5ricYG
	 ep1aYCqN2IpP4eaQetRZLRBw0WOlDCQigVgSTNgFrxx5QGE+JGe8MRivcSiXL8x2tq
	 tbFgL0TlyE3jdcSSbYmSUG+IJqOm4EQbOen5ftTWXAFrg63BfrcVlHnrxeXUgEaILZ
	 Vb+sUBNted7G4Ec0QMRRlHXkh+uV9wqfJQ2A8zJazPOvUyzMivLkQuPtt7eA8SispX
	 3uniTneE+Oj1klnPj/eT2hkdSLV84PYW4gr/U6jWPug3awq/Gaiy5Jn0jPdqSCj4E8
	 SYWyiTwEYaZjQ==
Message-ID: <sashiko-outbox-201547@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8mp-phyboard-pollux: fix i2c3 gpios
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Remmet" <j.remmet@phytec.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261106-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-v1-1-aea3a86f3f57@phytec.de>
References: <20261106-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-v1-0-aea3a86f3f57@phytec.de>
 <20261106-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-v1-1-aea3a86f3f57@phytec.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 14:12:08 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: imx8mp-phyboard-pollux: missing Fixes trailer for
  i2c3 gpios fix
--

commit 996d81256c2ca17742cc01729a7897a22eeec9c7
Author: Yannic Moog <y.moog@phytec.de>

> arm64: dts: imx8mp-phyboard-pollux: fix i2c3 gpios
>
> sda-gpios and scl-gpios were swapped.
> scl is GPIO5 18 and sda is GPIO5 19. Assign the correct GPIOs.
>
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> Signed-off-by: Jan Remmet <j.remmet@phytec.de>

[Severity: Low]
Since this fixes the swapped I2C3 recovery GPIO assignments introduced when
i2c3 was enabled, should the commit message include a Fixes tag?

  Fixes: 18c783cf09aa ("arm64: dts: imx8mp-phyboard-pollux: Enable i2c3")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-wip-j-remm=
et-phytec-de-bspimx8m-4200_pollux_upstreaming-v1-0-aea3a86f3f57@phytec.de?p=
art=3D1
