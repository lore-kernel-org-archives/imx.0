Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3105F3DFC62;
	Fri, 17 Jul 2026 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290948; cv=none; b=hxAivWm41LwcjqEIrMj5oKiIR/R2f0xA0pICz6gQ8vfhSCnGc/RwUtZWdy4J/jEATU6z78IskE+CiXjmV42RrXHUP1HSal/cY+co3WVRB3YiTXsbeg9PukedNXSbPdi05sd7SQLLJUnlLE1jsuTpEIQKL1IV8cEL7BngbKnuvbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290948; c=relaxed/simple;
	bh=l/wlF4QcdizdEvDsLf+DlBNxr6UFs70WEyf/E/9DHRI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Adshn5YX+pLCEQc9M2V42RkB6M3kyio5n7qo4cPeu7N3EnZXFh3mCtRv5MV0jhTinl9Q7tZwvKX+lVvUZg1GY92UfVTmueTS6v6xV6ifQ4F9ZdJOOw1uLGtgHdjDhfLa3kZvSEIWzT4Au77kJ98UYph6/YNlYuFXrIvQjNzSWbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McD3J9mt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McD3J9mt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5BB1F000E9;
	Fri, 17 Jul 2026 12:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784290945;
	bh=l/wlF4QcdizdEvDsLf+DlBNxr6UFs70WEyf/E/9DHRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=McD3J9mt9QSo7ejD7wNm9b11kBvlEasv6/0urt2iDOpy9k07/l/qOJH1MKdPtF3r2
	 IW6as2u0DlBAaeZ4SLfBBORYpTKO7MCxkvWRIZTnq6hs3/Gdox7ttSJOoNvfVYCL8n
	 cncWXYVW43C1Pc6NOtMyyrCRRDmbfc8XJVpsrPUGoGdMs2RdNQ9IS0l1K4VkY3o+cw
	 +z9+ac1mfOyrHuV3BLIc5I4WCfcSN+/GbuJpV8Z03WOq4uNCF2m/r91VBVQCCB3hQ5
	 WpF6kIoKF7Lax1yw3aySncsrbS77nqXW0Jzheb7BUgRRt4jS1g5lDWORIZVWPNDXfI
	 k40IHEJfCTZyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/11] arm64: dts: lx2160a: explicitly enable
 serdes_1 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717120635.2118610-2-ioana.ciornei@nxp.com>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
 <20260717120635.2118610-2-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 12:22:24 +0000
Message-Id: <20260717122225.2D5BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incomplete device tree update: the patch claims to explicitly enab=
le the `serdes_1` node in "all board DT files" to prepare for an SoC defaul=
t change, but misses several LX2160A and LX2162A board files.
--

--- Patch [1]: [PATCH v3 01/11] arm64: dts: lx2160a: explicitly enable serd=
es_1 node ---
commit d3826fcfc7d054169418a33dbec45e352c709bff
Author: Ioana Ciornei <ioana.ciornei@nxp.com>

arm64: dts: lx2160a: explicitly enable serdes_1 node

This commit enables the serdes_1 node in board-specific device tree files.
This change prepares for a subsequent update that will set the default
status of the serdes_1 node to disabled in the main SoC device tree.

> Explicitly enable the serdes_1 node in all board DT files. This is
> needed in order to be able to change the default status of the node to
> "disabled" from the SoC DT file.

[Severity: High]
Does this commit miss updating several other lx2160a and lx2162a board
files?

If the default status in the SoC device tree file is changed to disabled,
it appears boards that rely on serdes_1 for high-speed IO (PCIe,
networking, SATA) might be left without functional interfaces.

Could the following board files also need the serdes_1 node enabled:
- arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dts
- arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
- arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
- arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi

Is there a reason these files were omitted from this patch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717120635.2118=
610-1-ioana.ciornei@nxp.com?part=3D1
