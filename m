Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F77A4248B1
	for <imx@lists.linux.dev>; Sat, 15 Aug 2026 15:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786808423; cv=none; b=AYjozmGdVuXSbmQeb5u8fDSlSeQZYlTOvpC/g/MxQA8FUgGwmgRB437UxBHUM3ISFIqH7BcywZseRKu7s/Zd9p03508XsKn1tSgnnfhuWFYW79zJ/hTO+Zrmqh6V74EDzlFv7XfeCkNYeJ7ZHpvcpKqOQwEnS7NHslXh8Rc7xx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786808423; c=relaxed/simple;
	bh=sQGJLNtTYZGq8oJ6AjkX4RsX8qmFj8wNB5rVntT49qU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xs5hc4qm9rT9ft+KvWsVMi0rI9+NTunSWBBNwZ2CR7UanWL/JJUVNaOM3h7EVqTCTFvyTMeYJ8o3yFctA7DFgllpOWLjNjUH4cUvj+1Ir9vXovAGrxaTYh2dwH2TYbopktnoEI1jMXbc0rZFDekjq6vidmjLT7zKdmYHtn9HHk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oP89n5ct; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oP89n5ct"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C0E1F000E9;
	Sat, 15 Aug 2026 15:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786808419;
	bh=bYMPvv7A4W/ol74n0Et6yV8FgBmIGrGeNplU3CEKqlM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oP89n5ctziwauLKM1lktZMSaDzEF93nuzrGpYu5WQG/VwWyiat8IpxoRJeB+k+FBL
	 M9Cc9QnKgfHIixr0x0g4hagg4lxZAUaZey6ZN7hX+/wygcsC7LncyXhTC9ajdbI7GI
	 Vs+wV3lLZsH2VeU98Tg7K/N8GQZHEh3DTS5Sj07TByD6wJKfI1J7eOYiEDdqM1JnkK
	 5BxfpgcCHBvP+TNxN0ItjdAAL2x0mCc48JdAn377X9QfEzBqElTH3qI6Fh5XKfevlw
	 M5acF5QRljYDIYEleuxEpqlKyRu0DKwVIcnaK4xeM2fJtqY326Wai/77vmIAKLhh4E
	 lDF+f4ygtnEdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: imx6q: remove KSZ9021 PHY fixup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Heiner Kallweit" <hkallweit1@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <8fdc784c-5e2b-40ac-aed8-7639f43df88d@gmail.com>
References: <8fdc784c-5e2b-40ac-aed8-7639f43df88d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 15:40:18 +0000
Message-Id: <20260815154019.22C0E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing the KSZ9021 PHY fixup breaks backward compatibility with =
older Device Trees, causing Ethernet to fail.
--

--- Patch [1]: [PATCH] ARM: imx6q: remove KSZ9021 PHY fixup ---
commit 043c886239c15d5e6801536fd77e59f0f71dbb60
Author: Heiner Kallweit <hkallweit1@gmail.com>

ARM: imx6q: remove KSZ9021 PHY fixup

This commit removes the board-level PHY fixup for the KSZ9021 Ethernet PHY
on i.MX6Q boards, which was originally added to configure RGMII pad skew.
The commit notes that OF configuration support was added in 2013, making
the board-level fixup theoretically redundant.

> diff --git a/arch/arm/mach-imx/mach-imx6q.c b/arch/arm/mach-imx/mach-imx6=
q.c
> index 7f62009257526..58f53fba202f4 100644
> --- a/arch/arm/mach-imx/mach-imx6q.c
> +++ b/arch/arm/mach-imx/mach-imx6q.c
[ ... ]
> -static void __init imx6q_enet_phy_init(void)
> -{
> -	if (IS_BUILTIN(CONFIG_PHYLIB)) {
> -		phy_register_fixup_for_uid(PHY_ID_KSZ9021, MICREL_PHY_ID_MASK,
> -				ksz9021rn_phy_fixup);
> -	}
> -}
> -

[Severity: High]
Will removing this fixup break Ethernet for users booting with older Device
Trees that lack the explicit skew-ps properties?

The Linux kernel generally treats the Device Tree as a stable ABI. Older
DTBs implicitly relied on this board-level fixup to set the necessary PHY
delays because the KSZ9021 PHY driver only sets RGMII pad skew registers
if explicit *-skew-ps properties are present. It does not apply default
delays based solely on the phy-mode.

If a system boots an affected board (like Sabrelite) with an older DTB,
could this omission cause Ethernet communication to fail unconditionally?

To preserve backward compatibility while still removing it for unaffected
boards, would it be better to conditionally apply the fixup using
of_machine_is_compatible() instead of removing it entirely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/8fdc784c-5e2b-40ac-=
aed8-7639f43df88d@gmail.com?part=3D1
