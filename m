Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B9F46EC64;
	Sat, 26 Sep 2026 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432016; cv=none; b=M6kxkPmWaRezuS7PN56JIVnl0J21/dNAuj//4EoVO39CJFtOF7u+vvn4B6CVRIEiXyy6HnII9tmGYlxO3P7tzxokygIVv/862Kzk+HwsMhXR9whU5hMmBDrsmogbZkU3/91GadujBIJ09Kk63hl6uRu3bvUPj2CwDHo1jpwO15A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432016; c=relaxed/simple;
	bh=BJ4kqKPcIZklLy+IYA8QPmgsHGGwBRgsaEzeNA3bRus=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f8tnf8nk6XtnQoxzmjSbpndBajm8FyY+Q24ilOx/YY7kSA9Q+/IjRgcBLZuoRNCV8H1HoOeLZCB79SoutdNfQkSWNkICqJm2+3vUcDE1GThnt8flkX4PQcfOVWpdTOaOxPCE5KCWSKn/ZxRXwzl1Gls1tlK1dFE3HQ0M6za8VJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dec9+5zb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dec9+5zb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DED1F00893;
	Sat, 26 Sep 2026 14:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790432015;
	bh=VlMyjR3mrcWPjZFJCyEx/M/CNCgzarORf8yFFTLgFKA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dec9+5zb4ghxqmrCFcRIjKX0i/o4FyP+XUxkRqgx8y87Fwt2/V8Otw2eySJ6L8GWj
	 DDhkCee2R7YsFWesoeKM/ngaXbEd8GFh5stYsURyIhcExbRcwFF3JmJof9JoghDcqD
	 6mBTNt+/S8m71drHcxKxUkbu7dnPtEU0Ucho8xmzBNyKLrnwaBpQckZAwGyAIBA34/
	 +WhlqibfdDJm7VVng9Ac2jHnFrOzsCPDq5hcsUnL+qIRUKF4DYCtX/sa/hfbODGZUG
	 jJLUfScLr4huXR82ybKt0EB4m/o6NwRMumBwB8WOBKI7GmcHSMwP2+f9dCDAKs4I3T
	 K2WHJg95Mln2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 07/11] ARM: dts: imx6ul: Reuse Variscite DTSI files
 for Concerto
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <305bd230d96770d84ff0e9395fe92fe7ab39bc3f.1790344389.git.stefano.r@variscite.com>
References: <cover.1790344389.git.stefano.r@variscite.com>
 <305bd230d96770d84ff0e9395fe92fe7ab39bc3f.1790344389.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 14:13:34 +0000
Message-Id: <20260926141334.B8DED1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Devicetree ABI breakage: removal of Wi-Fi pwrseq and Bluetooth nod=
es
- [High] Hardware regression: missing no-1-8-v and non-removable on Wi-Fi S=
DIO
--

commit c9f442e674490d5de5d44643de9d80e88f35d5fe
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx6ul: Reuse Variscite DTSI files for Concerto

This commit converts the i.MX6UL and i.MX6ULL Concerto boards to use shared
module and carrier DTSI files. It removes the old LVDS graph and drops the
kernel-managed Wi-Fi and Bluetooth nodes in favor of userspace control.

> The old Wi-Fi power sequence and Bluetooth nodes modeled enable and
> reset control in the kernel. On these SoMs those controls are handled
> in userspace, so use the shared Broadcom Wi-Fi description without the
> old kernel-managed nodes.

[Severity: High]
Does removing the hardware description of the Wi-Fi power sequence and
Bluetooth nodes break devicetree ABI compatibility?

Devicetree is meant to describe the physical hardware wiring (e.g., reset a=
nd
enable GPIOs), rather than userspace software policy. Without these nodes,
will standard upstream kernel drivers like mmc-pwrseq-simple and hci_uart
fail to probe and manage the hardware for users relying on a standard
mainline kernel?

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi b/arch/ar=
m/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
> deleted file mode 100644
> index 6d16ff7909dab..0000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
> +++ /dev/null

[ ... ]

> -&usdhc1 {
> -	#address-cells =3D <1>;
> -	#size-cells =3D <0>;
> -	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> -	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_32k_clk>;
> -	pinctrl-1 =3D <&pinctrl_usdhc1_100mhz>, <&pinctrl_32k_clk>;
> -	pinctrl-2 =3D <&pinctrl_usdhc1_200mhz>, <&pinctrl_32k_clk>;
> -	no-1-8-v;
> -	non-removable;

[Severity: High]
Does the new imx6ul-imx6ull-var-som-wifi-brcm.dtsi file missing these
no-1-8-v and non-removable properties cause a hardware regression?

Without no-1-8-v, if the Wi-Fi chip advertises UHS support, the MMC core
will attempt to switch the bus to 1.8V, which will fail if there is no 1.8V
regulator configured.

Additionally, without non-removable and a cd-gpios property, will the MMC
core treat the soldered chip as a removable card and fall back to
continuously polling it, repeatedly waking the CPU?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790344389.gi=
t.stefano.r@variscite.com?part=3D7
