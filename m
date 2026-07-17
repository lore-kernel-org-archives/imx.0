Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1B4325701;
	Fri, 17 Jul 2026 12:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291433; cv=none; b=iFSSk94Qsq9igOax+ZJlA0Klqz6irQdabKomxlyqfw8UI6ky9fa8urJZlSaFocz26hro/bXKgmN+uehDEGz26DLIbo8ABRGibPUBtL7SycHZuzp66DfL7N7EWMeAMUxH+TTM/snIlfMnTnYXk5HNbaKSkg7OEwjDB/lSmhoZqjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291433; c=relaxed/simple;
	bh=1ycxZC2wtNKQ+x4yH6H19ifoAwp4Ht+9QQRRfMv/9cA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DjwFCVL88qgqIPLr8x11HzMJQCWHCVJV878z93zjGUyLmC0GzSqUN+IO4L2x7Xw5LVJS/keigMDkxE+ewvNw2xqjJfPR85bCRdwfnzOyey4fYgreV0Th2Xpk2hUWqZcKSwSBT3SxJMCkac0blQWC0JUQPus/tH0Yh+Sv+xEx4qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDuNfiXx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDuNfiXx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1F91F000E9;
	Fri, 17 Jul 2026 12:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784291431;
	bh=1ycxZC2wtNKQ+x4yH6H19ifoAwp4Ht+9QQRRfMv/9cA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jDuNfiXxdU5RGxPNgAiyQ5iZk95BXrK97EtOXeJKZjrq4D94wXzsos90UBYoZy0ts
	 RCT48wG3acwQ4HNumc1fPprNXj5i2NCxJOOdswcT0gUW/RVX11i0/8OdnikXPEqFrz
	 ep9aSkB88V8EHrh1DKApN0Ra7ptHpg4okIytOt1bMKIMPSKgw8MKYwRQkcO75pkCr6
	 NAOzUL4YYbOMs4lM4wtoMz1478j2JWi1SbeDSpV5n2Bc05x9mmdP91swiRI4xy8Qrv
	 +zLNUUh1LTOU2zSGjOEpLQQWOs7p3axqPKNInRaI86EWI/q3sYm+/FtKKEaTsp3OWQ
	 NTM+GIFJsYmlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/4] ARM: dts: imx7-colibri: Set LCDIF format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Francesco Dolcini" <francesco@dolcini.it>
Cc: imx@lists.linux.dev, robh@kernel.org, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717121847.488148-5-francesco@dolcini.it>
References: <20260717121847.488148-1-francesco@dolcini.it>
 <20260717121847.488148-5-francesco@dolcini.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 12:30:30 +0000
Message-Id: <20260717123031.6B1F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message body incorrectly refers to `colibri imx6ull` =
instead of `colibri imx7`.
--

--- Patch [4]: [PATCH v1 4/4] ARM: dts: imx7-colibri: Set LCDIF format ---
commit 9c45712860f8ad12db4bc3a18c8c4e7039c7f51b
Author: Francesco Dolcini <francesco.dolcini@toradex.com>

ARM: dts: imx7-colibri: Set LCDIF format

This commit updates the device tree for the Colibri i.MX7 to explicitly set
the LCDIF pixel format to rgb666 for its 18-bit width bus.

> The lcd DPI interface on colibri imx6ull uses a 18-bit width bus, set
> the interface-pix-fmt accordingly.

[Severity: Medium]
Is this description accurate for this patch? The subject and the modified=20
file (imx7-colibri.dtsi) both target the i.MX7 hardware, but the commit=20
message body mentions the colibri imx6ull. Should this text be updated to=20
refer to the i.MX7?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717121847.4881=
48-1-francesco@dolcini.it?part=3D4
