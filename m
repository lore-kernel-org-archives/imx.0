Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39A512C534;
	Thu, 25 Jun 2026 05:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782365258; cv=none; b=RmDPk4ah4tnggN4oY0nPP9n0kdFJPF96ryO1QbJIXc3Agpix03U/V7PZJ04akQwz8NYN+HtFxEw7DdMdWYSIDVYd+ubhR6U+lwDIows0hXqvCG6GLFIaw2Q7HxLn0wMJAH6hI9YsxwMZGDWPm3b/1chVSPXB9VDJsfiqFNNTUSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782365258; c=relaxed/simple;
	bh=PLFX/fMvPL/M3Vu7MS1bs//SUwq/XNazxZ+DVKv6nug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eUlg/078yODLScmppQ2xf744pq6/FGbnXVbEdcY2qnCHnxlPnB5JARLvs+crGO2gyMw3kjPvLc1JY27CSt7giySLglr5lv789LG++o10yhi8hl8b3Tj8naIz0tFY7xazL8iDc+ZMzXiC8oSW1Sx6f1dNM9IFst87O4ggBMHfMCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hbp0Rqw0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hbp0Rqw0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DB61F000E9;
	Thu, 25 Jun 2026 05:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782365257;
	bh=XIlJvHl/4bt7x8KBIhxiFXowDV28kzXdsCsNNWO9VeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hbp0Rqw0559W5Q6yjBbyShcjex9c1RJYiXuJygZ/PC1fjA5MrUE0loS2qlrdak2RC
	 WpxHjZmTCcA/901fbN5XQodujszhhn5lCQJWCGpDQKhX1HoCDEjsAR5g2qKpUHx8RO
	 c23RYuukpnenjtwLrGtF8FVs6MuXGdPnVezJ+dCr9eT0CbgUi/Cot3PHMkunudAUcW
	 G97g04oY5/ZOZWSxXMhFwyerlr6kXJM4lRJB/Ynrtg9Zbj26rUVaV7Z9JDRDmWQYD4
	 lgfAtgKB5vNbuXkSfDFonqSqi/3oOAZruu/3ojetMq0qccmtdcW2oM9GiqyI5Fs1Xv
	 Bci2stBcwRVTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] arm64: dts: freescale: Add dual-channel LVDS
 overlay for TQMa8MPxS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260625051449.2560197-4-alexander.stein@ew.tq-group.com>
References: <20260625051449.2560197-1-alexander.stein@ew.tq-group.com>
 <20260625051449.2560197-4-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 05:27:36 +0000
Message-Id: <20260625052737.03DB61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree overlay adds a 'ports' node to '&panel_lvds0' witho=
ut deleting the existing 'port' node, causing a structural conflict and lea=
ving an orphaned, one-way OF graph endpoint.
--

commit 8dc3732086b5dde9e7781747b60e7109f1ba68e8
Author: Alexander Stein <alexander.stein@ew.tq-group.com>

arm64: dts: freescale: Add dual-channel LVDS overlay for TQMa8MPxS
   =20
This adds an overlay for the supported LVDS display AUO G133HAN01.
Configure the video PLL frequency to exactly match typical pixel clock of
141.200 MHz.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lv=
ds-g133han01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc=
-2-lvds-g133han01.dtso
> new file mode 100644
> index 0000000000000..2d2dfda944faa
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133=
han01.dtso

[ ... ]

> +&panel_lvds0 {
> +	compatible =3D "auo,g133han01";
> +	status =3D "okay";
> +
> +	ports {
> +		#address-cells =3D <1>;

[Severity: Low]
Does this overlay need to delete the existing port node from the base tree
before defining the ports node?

Without an explicit /delete-node/ port; command, both the port and ports
nodes will coexist in the merged device tree, which violates the mutual
exclusion rule in panel-common-dual.yaml.

Additionally, since the overlay re-defines the panel_in_lvds0 label to point
to the new ports/port@0/endpoint, the old port/endpoint is not deleted. It
will retain its remote-endpoint =3D <&ldb_lvds_ch0> property, creating a
one-way link that triggers dtc warnings for graph connections not being
bidirectional.

> +		#size-cells =3D <0>;
> +
> +		port@0 {
> +			reg =3D <0>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625051449.2560=
197-1-alexander.stein@ew.tq-group.com?part=3D4
