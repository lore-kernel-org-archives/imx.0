Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB40F4A02
	for <imx@lists.linux.dev>; Sun,  2 Nov 2025 01:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762046193; cv=none; b=Wr0UDI2AevJ1NEQIr6/dhlAft8fRdJdn0vpitG4+ZAoZcetosTJ1JuzTB9DnEs7/M1Eh2pChDa9OP/RbP9vZPg7LeDDUKEeNfr7G+8tYVJkUYfvLGgpTaRKSt3eScGHyqJOP/inHhnMgcC6cd+gbzmfP4ne8/oiioZOdyF3Sbiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762046193; c=relaxed/simple;
	bh=5haLsaAB5+Dt1jog+Tyy3aRUvPmxkpKhR5q+8+mwLP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sTo7ki2hb514wZHY8YUe4WNYail1VRaZ8fhsMDDy3zL9C351Caf6Q/AwOzLJvfKVWWoqsBqvDbnNWWNY4c7hk0LSXGN8IYqGo+338xpIIKmqS3m81eBNWtMJXhcRI2wxOn9RDQJbNEz+xBTQJZcd9DvVraCsH8ERnQUVv6+igtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=G/iJR6a3; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="G/iJR6a3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=f8iBdMTYM8add2wHtraFxMsoOR1Rfz8Ac9Ii3lBw+1g=;
	b=G/iJR6a31RtVvkPkhUHo2zBInVOCT0kg8KmhXCSQDThUtD02BIm/R8do2JmOGE
	RkonRU9THFcD19yJ8vxsUdLa9YJ4AQ/7cjkmtIcraiNJNeajNOtT0hy2yVhtcnZD
	1gb6IgSktZGgaqwezvVyazzYhFod3ILORO/XS++SCBAyo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnr6_IsAZp2dEiAQ--.53065S3;
	Sun, 02 Nov 2025 09:15:54 +0800 (CST)
Date: Sun, 2 Nov 2025 09:15:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.18
Message-ID: <aQawyJZbMn52EKk_@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgDnr6_IsAZp2dEiAQ--.53065S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw47Kw4rCryDtFWDJwb_yoW8ZFW3pF
	4fCrsxGr4kGryrGrnrXrs2y3yFyFn7Jr43Jr1UX348Xry3Z3W8Xrs8Krsa9ryUAFyxZw4F
	vr18GryDKw129F7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2PfQUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQw7oGkGsMykygAA3L

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.18

for you to fetch changes up to 6504297872c7a5d0d06247970d32940eba26b8b3:

  arm64: dts: imx8mp-kontron: Fix USB OTG role switching (2025-10-28 17:01:42 +0800)

----------------------------------------------------------------
i.MX fixes for 6.18:

- Enable ext4 support explicitly in imx_v6_v7_defconfig to fix a regression
  caused by commit d6ace46c82fd ("ext4: remove obsolete EXT3 config options")
- Correct report-rate-hz setting for imx6ull-engicam-microgea-rmm board
- Fix MSI mapping for i.MX95 PCIe endpoint device nodes
- Fix USB OTG role switching for imx8mp-kontron board
- Fix a dt-schema warning caused by audmux node for imx51-zii-rdu1 board
- Avoid gpio0_mipi_csi GPIOs being deferred for i.MX8 img subsystem

----------------------------------------------------------------
Andreas Kemnade (1):
      arm: imx_v6_v7_defconfig: enable ext4 directly

Dario Binacchi (1):
      ARM: dts: imx6ull-engicam-microgea-rmm: fix report-rate-hz value

Frank Li (1):
      arm64: dts: imx95: Fix MSI mapping for PCIe endpoint nodes

Frieder Schrempf (1):
      arm64: dts: imx8mp-kontron: Fix USB OTG role switching

Jihed Chaibi (1):
      ARM: dts: imx51-zii-rdu1: Fix audmux node names

João Paulo Gonçalves (1):
      arm64: dts: imx8-ss-img: Avoid gpio0_mipi_csi GPIOs being deferred

 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts       |  4 ++--
 .../dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts   |  2 +-
 arch/arm/configs/imx_v6_v7_defconfig               |  6 +++---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  2 --
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts | 24 +++++++++++++++++-----
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  3 ++-
 6 files changed, 27 insertions(+), 14 deletions(-)

