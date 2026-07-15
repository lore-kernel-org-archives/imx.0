Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBCD2ED16D;
	Wed, 15 Jul 2026 19:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142642; cv=none; b=JJJvt2PaLcNbRkuHBcpUgJavMKm1seq2sGgDGEZDdxVXmbwdAaH5OS8LyHkT8Kr8PZ5CKOQd/HbYxyR8RFB6ZCC46szG29CYZoFs3Cbcv5VWeMujtr8l6Ggeo4+OF1zg8opUP22SEKsF59WaBScWZf7uWUQOehMi1fnwsHdm9HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142642; c=relaxed/simple;
	bh=6am+2U8ArlFrnLtxDEsJTaJh6CagCAzM9L6SMYGVYB0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jgsdg+3FJqVqyoSWmJvPcy9R2HVhxYzJTVrdyakgheLjW1Q7qJ0OZnT9RKh2q6RIVWxbmfJqu9LfcyT+EZrHN652xEmt2zsIVqwe5bkIbXkZeFVSDgfs1LqkbD9O6z/crmlawvJWmI9EUetOOvdKKpkJEuwVUKRHZAbKqLsH6AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxXAnNwf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxXAnNwf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6511F000E9;
	Wed, 15 Jul 2026 19:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784142631;
	bh=6am+2U8ArlFrnLtxDEsJTaJh6CagCAzM9L6SMYGVYB0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HxXAnNwfK6A0qK1Cb3Rk/naiJHPuKtLa0+EmZD/8xRp+BklKJtliHzdlCB2CSgEKJ
	 D93itkxX3MhIS0Vjna9nhAcx51CzqSU8TI6qmNwuiefYTGZXWxj8BI9/5YiVaEMhqs
	 ziFl97QjGDUFIhRUfgLabfywzT+V4/6OhCGW24tF+GqrtnH7zB5bUt10tvgXTVTKm9
	 yDUabnAmaaU/eEheQ9/7MAmfZbP69T1rkpOwmNtI57M+nC2pUSVbfW6KhnUPPVK4DX
	 Eqc8ebZx3GnLXwMF9tauHVTbt2yL+fkOwhPGHywo1ELYGObc2xfuL/e2mI8nBXZipU
	 JpEkuaz+vjrzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: imx8dxl-evk: add lcdif overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260715-dxl_lcdif-v2-7-da797562636e@nxp.com>
References: <20260715-dxl_lcdif-v2-0-da797562636e@nxp.com>
 <20260715-dxl_lcdif-v2-7-da797562636e@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 19:10:30 +0000
Message-Id: <20260715191030.CA6511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The overlay configures the ADC input pads for LCD digital signal=
s but fails to disable the `adc0` controller.
- [Low] The panel device node is named `lcd-panel`, which violates the stan=
dard Device Tree bindings for display panels.
- [Low] The overlay disables audio codecs and DAIs but leaves the top-level=
 sound card nodes enabled, causing endless probe deferrals.
--

--- Patch [7]: [PATCH v2 7/7] arm64: dts: imx8dxl-evk: add lcdif overlay ---
(Note: The format of this report is altered to a free-form summary due to
recitation restrictions. No code from the original patch is directly quoted=
.)

commit d5a124bf1de36e3cda648d2a3efe1d55a60da419
Author: Frank Li <Frank.Li@nxp.com>

arm64: dts: imx8dxl-evk: add lcdif overlay

This commit adds support for the waiken,101wx001 lcd panel by introducing
a new device tree overlay for the imx8dxl-evk.

[Severity: Low]
The device node for the display panel in the new overlay is named lcd-panel.
Does this violate the standard Device Tree bindings for display panels?
According to panel-common.yaml, the generic node name for a display panel
should typically just be panel. Using a non-generic name could result in
dtbs_check warnings when building the device tree.

[Severity: Medium]
The pinctrl_lcdif node configures several ADC input pads to act as digital
LCD signals. However, the overlay does not appear to disable the correspond=
ing
adc0 controller. Will this cause the adc0 controller to probe and expose
non-functional IIO channels to userspace, potentially resulting in
applications reading meaningless garbage instead of valid analog voltages?

[Severity: Low]
The overlay disables several audio codecs and DAIs, such as sai0, sai1, and
the various wm8960 components, but it leaves the top-level sound card nodes
from the base device tree enabled. Could this result in the sound card
drivers attempting to probe and failing indefinitely with probe deferrals,
leaving dangling devices in the deferred list during system initialization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-dxl_lcdif-=
v2-0-da797562636e@nxp.com?part=3D7
