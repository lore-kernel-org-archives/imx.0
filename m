Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982409;
	b=lLWm3z60LgZmEV60dEmFxYS4+w5oCIuU8D+CwsUCw3an7lUXM5qDgeDF0lpi/+IuIV59
	 VJXJ4AYfNWtqCHWgg99d2FYl2c4ciBQvJbQTa9XiwmPyjCTFgeYcoOiOfa65/sdK88xpp
	 vCP5Rp6Q96rCYX+OUzvkS4UPewrx00KC+mhaD/2+0Q9ymVIcP0uYNhTWZGQuiPie/Bb7J
	 Tf2tkc1/xsEnf/xQsw/3z/5JRPdT+btc2A1liVR8T3C0rnSECDrqViHPDz8QQPfsp62Ut
	 JjKJ13ntEezm5gcgAF2hzCYAr+Vh10E+s23dNvblgVotnEq+VE089M256VNIRMcCz6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982409;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xeQG5p/L0tTSG0kvXOBrmS69IqNwUGi6h9BZEJ9fWtU=;
	b=NYqqnHQ/MsedwDOZksY5DpsEo8Trp0NsdiHj0IDOKXZPZr/sb8JQVMAcX+XDPckWAudu
	 Cc76LIZqt9MRTkR5GpeYXj/15u6VcLE14I0ddRFsO7QNf+2tAdT4KEg3gzpLOyiqCLD9S
	 cD6Q7AAAkI3IItLc4nLrVnMAHQO81d4QQbRYp9BJXEaWIWwu8c5ycniPGpRGfoBigZMx1
	 2BdmizNBkSvIroIfz9GRkYo0rrHO+bhySa5XPIa30uQyx9EZSs/JRsGkqyOHEl4jHc6+d
	 yz7UZ6MU73HaAN9NB75DeqJIB5MKib7c8q829vNojBvtXWtuv0Dxzm9ojs6vZXDkQCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oerRCXh3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71BB606A329;
	Fri,  6 Nov 2026 16:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oerRCXh3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC131F0089F;
	Fri,  6 Nov 2026 16:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793982408;
	bh=xeQG5p/L0tTSG0kvXOBrmS69IqNwUGi6h9BZEJ9fWtU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oerRCXh3VJUNBJwSLOtKXZoK9+2JtRHnmSDIYaGchP9uue2jR5TMig3ItwffeC/OC
	 EJLQRJCJ8/8M5b3HOPyJ/FNj/9l8SIa+W8CMBHAQauUGp3vfBQYiz990zFL5FzJ/w1
	 90Fuh58McBm+2bI7n/DHN1OzgloOGUbh/nu8iTtCT9YUY7vEJ9Hz1NRF2Ab9qYOSC8
	 76BFFGP81+rQNTn1YdfSDB2h0l7fmj3KrhbnN3h93wdeNWrpWkgs3rmGiEmba+U/oH
	 65LEqeFh9+UWp1vOSKHha53b40/jSC1uX0lCUMB+uamzAQRcATxlO63h6IPxUJK157
	 t9NXY/U+jYSKw==
Message-ID: <sashiko-outbox-201807@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] Revert "arm64: dts: imx8qm-ss-conn: add usbotg3
 iommu information"
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com, =?utf-8?b?b3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5E?=
 =?utf-8?b?IEZMQVRURU5FRCBERVZJQ0UgVFJFRSBCSU5ESU5HUw==?= <devicetree@vger.kernel.org>,
 =?utf-8?b?b3BlbiBsaXN0OkFSTS9GUkVFU0NBTEUgSU1YIC8gTVhDIC8gTEFZRVJTQ0FQ?=
 =?utf-8?b?RSBBUk0gQVJDSElULi4u?= <imx@lists.linux.dev>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261106161809.3512378-1-Frank.Li@oss.nxp.com>
References: <20261106161809.3512378-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 16:26:47 +0000
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
- [Low] arm64: dts: imx8qm-ss-conn: missing Fixes trailer on revert of
  73c3b40e536d
--

commit c86416aa16fabe358034dcb770ee1f94d28923c0
Author: Frank Li <Frank.Li@nxp.com>

> Revert "arm64: dts: imx8qm-ss-conn: add usbotg3 iommu information"
>
> This reverts commit 73c3b40e536d9cb624db90b460bc384147576a57. There is
> a hack in U-Boot, which calls sc_rm_set_master_sid() to set the SID for
> bus masters that depend on power domain information of the node. But
> cdns_usb is a child node of the glue driver, which does not need power
> domain information.
>
> More time is needed to find a good method to program sc_rm_set_master_sid=
()
> in the kernel and reduce U-Boot dependence. So revert this patch first to
> get USB host working again.
>
> Reported-by: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
> Link: https://lore.kernel.org/imx/b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gm=
ail.com/
> Cc: Peng Fan <peng.fan@oss.nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

[Severity: Low]
Since this revert fixes a regression that broke USB host mode, should the
commit trailers include:

  Fixes: 73c3b40e536d ("arm64: dts: imx8qm-ss-conn: add usbotg3 iommu infor=
mation")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106161809.3512=
378-1-Frank.Li@oss.nxp.com?part=3D1
