Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900179;
	b=X4AqRXYl4Xfo+JCIz3HJ+zUoxjpcGbPNOOrBtWsr4edgh/4ofi/vU2ZKd/4a6obNzSYk
	 Vonn92GEDQrcaf0me0xHTUdqI1On946j9BNb66M+2YbSqUlw30nTZwPrHQEMicsuSw4EZ
	 A7/YGVdBM5W1RV65hOyggUMIzRSY9QoEX7S7Ei4CpkYZcEDN79wryIkivM/ZvAqoWag0I
	 GqXDIvTg3ge9TWi65aG2iF8yxoVRXCNd+HnqYIlUDGR/WRrQ/4QpDGxN1RgcCOpyUtLqb
	 6qi+uefwhT50GI2hfs42Rb9TL/TWtHuX61td1HvP33jm4Ep0oUnS7uy5cMSzOOTvcQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900179;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Z6ysyxV6ULE9MXoe/n1oFDP9yT5OOZNjVC1qfeffxMQ=;
	b=Tp+/nUvgW0aTtdHe+Ae5pOY2srCd9TQ3LCJqlzoXTnTeAqxsEkImLjQ+W2cqIaE1MLls
	 yIhQzEFU63H1hdUXrWljnIjQQruUxsfX2huShilqkBBWYmhL0nde/f3XJnhizcJo9QqCD
	 CNKSRx8zqjmEwtdEneskGwXyupdkcI/mWW4+RrZcCejlql1xHu47EJRSDlX5pb7jy3w0v
	 BkDCFmpGkdMAOY+8dFkwHgeG1XoyoeaRbqXWvWEJfQlpXoi6ugfm3rg0Pcinw6HnjRexO
	 7jNB7Nxuz9TGdKHI34XJe2cWMrWU1hisHtR+tUGJdaqEsMAH3xdMAlbiXAbaFP4WcpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lMLFP57r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B1E606A31C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 07:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lMLFP57r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13251F000C4;
	Tue, 17 Nov 2026 07:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794900179;
	bh=Z6ysyxV6ULE9MXoe/n1oFDP9yT5OOZNjVC1qfeffxMQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lMLFP57r1G3d6SIJnrXDouijZXkbOWjLS8pbwd1pPDHB+MpL61HDdR0TRz0fnNWpD
	 Mbxsaqk+UbY22YRpXnmmZZXoKkEs3WIjmGCIU/8zNAMmO7s6PhplvjBr2jfnsc7W5g
	 vrFrDbOHsrXS/Ls7JUZwusVmNH1z7qj7wv5e64abmQx0SK/P8Y4at8lKrZINArycIF
	 Od+A7UKUX8iPKD2d24h2pguGqINIfuCj68S6TtsBs9svlTP1Cd9vBuz4eOCMNpqGZm
	 HGcUL1udnv2eEi0+IhbOf4INkLwtL+tKwXbtQmkJ3Y11Ge0XvGjg2dyBRylww1Ccg+
	 KzlkxatfnyPHQ==
Message-ID: <sashiko-outbox-218320@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/8] irqchip/imx-intmux: Mark input interrupts as
 level-triggered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peng Fan" <peng.fan@linux.dev>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261117-imx-intmux-v1-5-189e7e0ad98d@nxp.com>
References: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
 <20261117-imx-intmux-v1-5-189e7e0ad98d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:22:58 +0000
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
- [Low] irqchip/imx-intmux: missing Fixes trailer for IRQ_LEVEL fix
--

commit 16ad01e929ba768146f616b1aa477818ab9093de
Author: Peng Fan <peng.fan@nxp.com>

> irqchip/imx-intmux: Mark input interrupts as level-triggered
>
> The child interrupts are handled by handle_level_irq() and xlate()
> advertises IRQ_TYPE_LEVEL_HIGH, but the descriptors are not marked
> IRQ_LEVEL. Apart from the inconsistency, the flag feeds IRQD_LEVEL,
> which makes check_irq_resend() skip replaying level interrupts.
>
> Set IRQ_LEVEL in the map callback.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

[Severity: Low]
Since this fixes the missing level trigger flag present since the driver was
introduced, should it include a Fixes tag?

  Fixes: 2fbb13961e74 ("irqchip: Add NXP INTMUX interrupt multiplexer suppo=
rt")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-imx-intmux=
-v1-0-189e7e0ad98d@nxp.com?part=3D5
