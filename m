Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8B42E647
	for <imx@lists.linux.dev>; Thu, 25 Apr 2024 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714038972; cv=none; b=SaP89tmexYiRWEIsgmyDoo8upCdXJAJNg1/FIqAePuNP4o2KmoS9fcte9EZF5vyrtIBK5RkmM6BkuRkIGR9HL5VfMi/UA7nfizGdY0/YzzPkT+fpGY7Rj4S7KvNBc/axhhqAnSUDt29zvnsvCk8plFeVJSuRC1MHG/fvbOgkQNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714038972; c=relaxed/simple;
	bh=keREG8VOOTy4avuSTdnT/gcg/ZfYhNKRJ0pfeqnt/5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t8/dHdoSLN4o741ogO5s6t1VOnojlIt87epzR7o095L0i7w0YnW4U9h0hokpRjhdN053jo3tOZiwxitIqHeKsIVQh2mS2sZB6BMfmBJlTrI5AWplvSpv9nmuYKGO0A9RAEpeRR1qTLmNmPexjezpACyv9uwiQ2MTNXYxpRsZrpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ONuytCpX; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ONuytCpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=xQul+LRJa5DBqWGtv092kro7gL1oG1Dc98ltSQ5nIAU=;
	b=ONuytCpXMYEEPHdRlj4YG+hnuQ41IsIM5HpG0VhuF93KWW9Zp1f3xrmFZBX5o+
	HA3Na+D0DECoj4dYMjZl5Zl9xIoIUC0ltqeBNwzEm1SdQW8rTN2xniu3GXf7kg+P
	yBGW48mhblJncz/XJ7WVCshjCqF9Mohmr8jGOStS34rI0=
Received: from dragon (unknown [223.68.79.243])
	by smtp2 (Coremail) with SMTP id C1UQrADXX1GnKCpmhnh2BA--.6268S3;
	Thu, 25 Apr 2024 17:55:52 +0800 (CST)
Date: Thu, 25 Apr 2024 17:55:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.9, round 2
Message-ID: <ZioopqscxwUOwQkf@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID:C1UQrADXX1GnKCpmhnh2BA--.6268S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw4kAry5Ar4Uuw4DWF1Dtrb_yoWkurc_ZF
	W8GF1UWw48Jr4UA3WUtw1vgr9rtF1UJryrAryUXr47X39rAr1UJFy0qrWrXrnrXw4rXrZr
	JrWUXw1jq34rCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0StC7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGArLZV6Nnu1lSwAAsy

The following changes since commit 00b436182138310bb8d362b912b12a9df8f72ca3:

  arm64: dts: imx8qm-ss-dma: fix can lpcg indices (2024-04-03 20:44:54 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.9-2

for you to fetch changes up to d7f3040a565214a30e2f07dc9b91566d316e2d36:

  ARM: dts: imx6ull-tarragon: fix USB over-current polarity (2024-04-25 14:21:00 +0800)

----------------------------------------------------------------
i.MX fixes for 6.9, round 2:

- Fix i.MX8MP the second CSI2 assigned-clock property which got wrong by
  commit f78835d1e616 ("arm64: dts: imx8mp: reparent MEDIA_MIPI_PHY1_REF
  to CLK_24M")
- Correct USB over-current polarity for imx6ull-tarragon board

----------------------------------------------------------------
Marek Vasut (1):
      arm64: dts: imx8mp: Fix assigned-clocks for second CSI2

Michael Heimpold (1):
      ARM: dts: imx6ull-tarragon: fix USB over-current polarity

 arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi | 1 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi              | 2 +-

