Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A018A4E50D4;
	Tue, 29 Sep 2026 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673898; cv=none; b=jiaelvvJIpYuLXyG3Z9k1aowACbnQwTTuqQX+ZmpRIXXx4IjrNlO8Gm/3BvBWRT7qS/nsKNMgVW8C+1fwO6dPPnVvMO3bloD3Zc7fAN7rJ68drk0fzGrxB8TjQRDeEvX3i5sTKAdHaymtB1BzS9Zy6PPMk1vczSLJNH9u8RIWCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673898; c=relaxed/simple;
	bh=8BrEBN8/3CQVEAjV6H1BaOHxtnUlf00WuZ2LkyAJsXE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nNTjNCQhUZbhcXwv8xw4qiwJiUbgVTMcMryviO6z8okrBqE/g3i+3Nrk+jcsiPv8h1KP8x0FkJWeTJL4/M7DKOi2sBmwH2XP+tHArZwOWA3jfUed0enTul9suw5dRTCl41omWtbHcgR2xYomcDWTLiTHJXooIb80X/rEd1T3daQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXNkZN0/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXNkZN0/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049FA1F000FF;
	Tue, 29 Sep 2026 09:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790673894;
	bh=JCytNskX7tZ5K1el9pjwkdsfGNzHyUnl2MbA1hYmx9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WXNkZN0//posIq+qGkJLky5cTg+iUdLZTHQnx9SaWcRTIQO0HV2ZRfUHmV05PHymn
	 C0h7QRSkEBQDLWmvmK2LU8vCbiq8a4Qj9ER/0Tf0dxO+eSi1CIuP26Tq/Gxy+F1OhP
	 GgREldR+yyLOhA9y6wPA3UwZtVO8mDOZDTAr+U4qoKlF7lH1zraEaT4rhjOEqwwIzW
	 DpTj9crM7PFCla16O9ucXhEfmWk7D+O/Df7EwCiCz7+kNAvAClnta18A/NQlv9l4o9
	 uNmKZaR/YJhjyUeq3XVLLhmEI8jrOELLMs1fXQ1B0AaqjDJ4Z+RbMqiQA8kluTExeC
	 ZhzvqFtW4U1Ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260929091811.3735201-2-petko.manolov@konsulko.com>
References: <20260929091811.3735201-1-petko.manolov@konsulko.com>
 <20260929091811.3735201-2-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 09:24:53 +0000
Message-Id: <20260929092454.049FA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing vendor prefix 'draeger' in registry
--

commit 023f077ed12c923bbdeea3fb8737b7678f238fe6
Author: Petko Manolov <petko.manolov@konsulko.com>

dt-bindings: arm: fsl: add Draeger M48 dual-cpu board

This commit adds device tree bindings for the Draeger M48 dual-cpu board.
It registers compatible strings for both the imx6q and imx6dl variants
used on the board.

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 656f2596e1d53..8f3a04228780a 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -260,6 +260,7 @@ properties:
>                - boundary,imx6q-nitrogen6x
>                - compulab,cm-fx6           # CompuLab CM-FX6
>                - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
> +              - draeger,imx6q-m48         # Draeger imx6q variant of M48

[Severity: Low]
Looking at the properties definition in
Documentation/devicetree/bindings/arm/fsl.yaml, is the new vendor prefix
'draeger' missing an entry in the vendor prefix registry?

If 'draeger' is not documented in vendor-prefixes.yaml, building the device
tree schemas will trip a missing reference, and schema validation via
dt_binding_check will report an undocumented vendor prefix error.

>                - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
>                - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
>                - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929091811.3735=
201-1-petko.manolov@konsulko.com?part=3D1
