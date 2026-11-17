Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900383;
	b=VnnGqzJX7a9oh28nG+oSvozsn35anp91ALU753jHxNFXgmOsmoQQ9OOaNmW5s2Pbt9bD
	 O0uHvPVrniQCp7xtRs/huITyvOHi7AEVAofH33QRo7bwPt2cbH5bpX45gm5X9SewP6BBc
	 PkgLBhGIs/RgLb7syQOkWBd/ZV5HNTSO3S9dxmEz7MN5grfby/ygh/gEmJeLsC/vkONjW
	 xEjr3Rw+QR46+E59ymR+O/Z5/16Lu/+pIf3WyUjKG3S5sVAsJ9cKjM3FEe8Rdx8reOlNJ
	 TyVMmAzl92J20EekWoTZOWQvpGRbU00h7HDjqSWmyDpP2JF69IS4n69z7RYMmRSPmPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900383;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4hYHqPb5+zPy9eu/WXwcru8XM7EBDtcxGiS2Pm2U78M=;
	b=u677l4kK+bjYOWjZ83Gnnkq2d40ih6kKlZASk7oS85+O/1odZtnnO4iEmGks/6F8r4Uh
	 /l1jWHDI5JgWa8BVKBqUeODv0YVHeUgx7theSfzGKVtZXbnsK+BOETgHXxS7KrULZtmkb
	 fkUd9QOnxQgwKx3zeiyzeDG2rIIxxc+3ebK0VAcCWtTTkeCn68P4zXfdVzsm0ZRSditwC
	 VDrVHK9KsToLxak1o+vC1/raOwF5b4zYkjtQ1KEVece0TMQvScYp2shHHWGgfFLaU4/JH
	 KRebIstfQcui6NDoG68cCoaU6XMtWKn8NYWYEcYZs4/y1X34gZPABevhq3nUW+Wx3lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sx05YkJN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C5F606A31C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 07:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sx05YkJN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABDF1F000C4;
	Tue, 17 Nov 2026 07:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794900382;
	bh=4hYHqPb5+zPy9eu/WXwcru8XM7EBDtcxGiS2Pm2U78M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sx05YkJN7OFIC5zeHbRdOqQn34wrjOxx9xVVEOHFQ6d1PyekidQtN41gZ3ZcuIu6u
	 evb0p8Qy41iBjQ3WLev+phLzghKfLzeOEBjJX9sSxIA4j2/YseSza5gmFQhzrtmmzA
	 HuZ8qgxu3XfSfrMlyNy6E51dvxUrcaOmFOowxkoCaU8wma1gNuvCmQRSF30bn3Txgz
	 ExwhikJkAO5hAWi3S2KRXvDM1YKTRjL8fvQrAp99kZcH0HhPbBFwSPwxiHSglWEZNc
	 03qn70mdEaEGUkcVR9btfcIZyPPBMH11Oi+CL/sQIf9dir34NNtAkf/Eyh9sLe9Sp8
	 ZZ88lRmB2y4Sw==
Message-ID: <sashiko-outbox-218338@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] irqchip/imx-intmux: Handle platform_irq_count()
 errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peng Fan" <peng.fan@linux.dev>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261117-imx-intmux-v1-3-189e7e0ad98d@nxp.com>
References: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
 <20261117-imx-intmux-v1-3-189e7e0ad98d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:26:22 +0000
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
- [Low] irqchip/imx-intmux: inaccurate commit message claim on
  platform_irq_count()
--

commit 4b2c3c2659aa7c57d57499f3c306054374c5ecd2
Author: Peng Fan <peng.fan@nxp.com>

> irqchip/imx-intmux: Handle platform_irq_count() errors
>
> platform_irq_count() returns a negative errno on failure, but the driver
> only special-cased -EPROBE_DEFER. For any other negative value probe
> continued with a negative channel count and passed it to
> devm_kzalloc_flex(), which is broken.
>
> Propagate every negative return value and also reject a zero channel
> count, which would otherwise register a controller without any channels.
>
> Fixes: 2fbb13961e74 ("irqchip: Add NXP INTMUX interrupt multiplexer suppo=
rt")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

[Severity: Low]
Is the commit message accurate about what platform_irq_count() can return?

platform_irq_count() only returns -EPROBE_DEFER or a non-negative count,
never any other negative errno:

drivers/base/platform.c:platform_irq_count() {
	int ret, nr =3D 0;

	while ((ret =3D platform_get_irq_optional(dev, nr)) >=3D 0)
		nr++;

	if (ret =3D=3D -EPROBE_DEFER)
		return ret;

	return nr;
}

A negative channum could not reach devm_kzalloc_flex() before this patch;
the functional fix here is rejecting a zero channel count when no
interrupts are found or index 0 fails with a non-deferral error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-imx-intmux=
-v1-0-189e7e0ad98d@nxp.com?part=3D3
