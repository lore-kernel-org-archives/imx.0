Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBC51DFDA1
	for <imx@lists.linux.dev>; Sat, 11 Apr 2026 08:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775895917; cv=none; b=YhRmLELyJ5l6/MU0TAYQKDtdapgzYoA5tH1dTioDNy5g0NhE3+6XhMYWApBiKvTZ5vWz221E+6aO47IVpGklWS9vGuT1geXF3gIYzo4GoXkUlS+Lu0KXVP61FFKJQl6OrM3uzFWBBVMewNuC7GquY9W+Bzkq1sX/htwYPKVKhcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775895917; c=relaxed/simple;
	bh=UNE/FDKJlKGVYWqaC8jppJoejgnR0BL7bQaOen40Y7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/t8M3CRhRdXXnIv7PEqo794Lo7w8EHvKodbrKzo4gqyPXEkmMuynh0eYWoFixr5mYm9lf1tEM6sTbTwp0xILum0Pye+lK3JO1YsS23gq89llRRhuvY8uf60AygZfxiJN6DLdnViDQSyNWH6/cyb49s9UoqvyiNFc46TjN7bpQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZ0gnSW0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZ0gnSW0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1E6C4CEF7;
	Sat, 11 Apr 2026 08:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775895917;
	bh=UNE/FDKJlKGVYWqaC8jppJoejgnR0BL7bQaOen40Y7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kZ0gnSW0NU0/XQ3BE9PFVmO1hpWpS0Wc7CQ1q9zLKt0griIZ3iS912V5O5S2YKLBl
	 2ZvC7QwupywZ1zEBYd/j800dp1o/VYOrBCsBevZuRbf/tExm/xMJRnpELdmPDlQK4x
	 Lt1pB5INeGUqXmYNEiLUvKSZNB5QSc3MCwWvpOqy3mfjkim6BTbWZ7GvZ+IfmOlgbG
	 Tc7Db5p7nGCde9yz6wSJZIlwtDSv5+tlMWL8DDFbj7CXg+06d6wdGI2HyJa5ukDFKi
	 bmNExfAR0ywMKN6gXgE6+7Ka2XyPvLZOaotskH0VoPmEgmucVCdanJB9ZlbRhegmFE
	 b9m1etNmJj+Ow==
Date: Sat, 11 Apr 2026 10:25:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: soc@kernel.org, arm@kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] i.MX arm dts changes for v7.1 (V2)
Message-ID: <20260411-honored-cockatoo-of-inquire-2d5c26@quoll>
References: <20260406020819.2812877-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260406020819.2812877-1-Frank.Li@nxp.com>

On Sun, Apr 05, 2026 at 10:08:08PM -0400, Frank Li wrote:
> From: Frank.Li@nxp.com
>=20
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/i=
mx-dt-7.1
>=20
> for you to fetch changes up to 0037d16644b15686eec420a90f05bcd2804edf6d:
>=20
>   ARM: dts: imx: Add DT overlays for DH i.MX6 DHCOM SoM and boards (2026-=
04-05 21:35:41 -0400)
>=20
> Changes in v2:
>   drop patch: ARM: dts: imx53: drop fallback compatible "dlg,da9052"
>=20
> ----------------------------------------------------------------
> i.MX ARM device tree changes for 7.1:
>=20
> - Device Tree Schema Compliance Fixes
>=20
>   Fixed numerous CHECK_DTBS warnings across multiple i.MX SoC families
>   Renamed nodes to match schema requirements (tcq=E2=86=92touchscreen,
>   uart8250=E2=86=92serial, iomuxc=E2=86=92pinmux, etc.). Fixed node namin=
g conventions
>   (added "led-" prefix, proper addressing formats).
>=20
>   Corrected compatible strings and removed undocumented fallbacks. Added
>   required properties (clocks, clock-names, power supplies,
>   #sound-dai-cells).
>=20
> - New Hardware Support
>=20
>   Added DT overlays for various expansion modules (i.MX6 DHCOM PDK2,
>   PicoITX display boards). Added support for muRata 1YN WiFi chip
>   (replacement for 1DX) on i.MX6ULL DHCOR board.
>=20
>   i.MX7ULP: Added CPU clock and OPP table support for frequency scaling.
>=20
> - Boot Phase Properties
>   Added bootph.yaml properties to multiple TQ-Systems boards and SoCs:
>   imx7s, tqma7, mba7 imx6ul/ull, tqma6ul/ull, mba6ulx imx6qdl, tqma6, mba=
6.
>=20
> - Bug Fixes & Corrections
>=20
>   Fixed interrupt property usage (interrupts=E2=86=92interrupts-extended =
where
>   needed). Corrected spelling ("TQ-Systems" with hyphen). Removed redunda=
nt
>   intermediate nodes in pinmux hierarchy. Fixed clock references and
>   naming.
>=20
> ----------------------------------------------------------------

Thanks, applied

Best regards,
Krzysztof

