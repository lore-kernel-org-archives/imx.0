Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610581;
	b=qt/BQfCZqEwyYiC+Hjq65GBpOJrdWeWMubDv/b+g55fKMl0av2mf7Qk9a7uaPkv4Ffx3
	 Gn2UkOgo0z80XMU5vK7Hf7nd2kBUoMX58jXKZXz4qIPeRbnsaP1Tg36r78NeTFurBr9lQ
	 Fn7jZj14CZQ49g0DYCECxxBJQA0wlHJ3rw12KTOjR9Kb77eQ3wiifbcb6+r7byFo21S2h
	 cCRdYGXTZ4TZxJSmC/4jo2eCd/qifIC610a9WEbtizrOH959pHY5R7jR6HRYqbZoQStEv
	 pfumvWTQIc+WmTc44xFk0DgHOLR0m0IfUQFWquPnhLxh8YPZlkZU3zVMWvvcchFpalg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610581;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HrR6w+1v1Ilovrv/vg+7pGzUf4sEv3IkY00Mavxbaj0=;
	b=aUeqj/HA5IFnLx7d/xDtV3VUA53+pOALQHFk+75oKF40gfdRC6eXZTsDyuOKrpyq3pHs
	 yLSnAjnU63Hp2MB60Ke/V2Sib4KkUGd2OLmfbSdVyjyQ9xWnvqC8v6mwwSv9sX8eaILAF
	 DNMb7CP0JyqJn0ti7gPo3diY8tfjY1jE9J0bBj5ncWX8Rzzy1FgNAPr6xiPciko8kJUQB
	 JBS3oB2kBr3bKOVs3qfvBeazf8jElMyNqtMVliRxmOgZFay7lFZ7tPXpnH1XVjTfw0ADc
	 49hrrZiTLX1X0LzK9X2qeCOL9p87+dg2jNGVbONbzPNk7xyEdU8MP9gS1pkLgu/jpNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K4YviM4I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C9D606A323;
	Wed, 25 Nov 2026 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K4YviM4I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB5E1F000C4;
	Wed, 25 Nov 2026 12:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795610580;
	bh=HrR6w+1v1Ilovrv/vg+7pGzUf4sEv3IkY00Mavxbaj0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K4YviM4I6zAeNcxpriyu8SgGh4qPvy9o/aQv1aGE7dzBfGpcSub9Shite1dVvsFkc
	 EFxh26oI5s/v1MGaneU+efbiNbC9yvsd87o3sU5TR36B+ja0WNBCgVxdbqiQxsGHY6
	 j/r+/KcTNHO3TuetSogHSip6d7e+rjoeJatZNAND07p4RLnN9kYQ/BO/LbI5CS3BzO
	 ewLglHtChOuKlOzYP3IkJGYLEJlB5yVSViHOY8vfhl4Y6o6KzXMH9q/fls8Xz0yzKg
	 wUgyRxj36lJdaiEyLGHlEV9omjCksp+epkmS9gOkbcCeSshRDWqTjv1zxEIe631n6e
	 Bvb1MMxxmRx2A==
Message-ID: <sashiko-outbox-233387@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: imx6ull-dhcom: Change eMMC pin configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christoph Niedermaier" <cniedermaier@dh-electronics.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261125123520.6040-1-cniedermaier@dh-electronics.com>
References: <20261125123520.6040-1-cniedermaier@dh-electronics.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 12:43:00 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] ARM: dts: imx6ull-dhcom: missing Fixes trailer for commit
  611b6c891e40
- [Low] ARM: dts: imx6ull-dhcom: Co-developed-by trailer used for patch
  author
--

commit 4bb7eb12f6ad509b598e0b39f61b66cdb22619cf
Author: Pascal Zimmermann <pzimmermann@dh-electronics.com>

> ARM: dts: imx6ull-dhcom: Change eMMC pin configuration
>
> Tests have shown that, with the current pin configuration of the
> eMMC (usdhc2 interface) read errors can occur with a certain
> type of eMMC chips. Tests conducted with all eMMC chip types
> used in the DHCOM i.MX6ULL SoM showed that there were no issues
> with the pin configuration currently used in the U-Boot. That is
> why this configuration is being adopted in Linux as well.
>
> Co-developed-by: Pascal Zimmermann <pzimmermann@dh-electronics.com>
> Signed-off-by: Pascal Zimmermann <pzimmermann@dh-electronics.com>

[Severity: Low]
Co-developed-by: is only for co-authors in addition to the patch author in
From:, so the Co-developed-by: line for Pascal Zimmermann should be dropped.

> Co-developed-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>

[Severity: Low]
Since this fixes eMMC read errors with the pinctrl_usdhc2 pad configuration
added with initial board support, should this include a Fixes: tag?

  Fixes: 611b6c891e40 ("ARM: dts: imx6ull-dhcom: Add DH electronics DHCOM i=
.MX6ULL SoM and PDK2 board")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125123520.6040=
-1-cniedermaier@dh-electronics.com?part=3D1
