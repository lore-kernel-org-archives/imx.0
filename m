Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6E02DF3EA
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 13:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763299398; cv=none; b=b8yvDm6wgXq0+3F28HwX6rdGFneLiUDzG9p9y5X1cviHH0Z/uwLZbKXP9D+vdx5HbX/oY30TPThQV6HCvgmRnBXtyRHqkgjn2x5luXBysQBCpneOq/tjoQfF2hupNSO+/8OgmL1HMLKEoIwd7k0dJQcswiSeks6VYQyLKaw1b8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763299398; c=relaxed/simple;
	bh=6I4cyNV0HSAE8orbsJnRXfFMajy8pAd/U7/NvJWKNGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G0Z5V6bfU5W0yI+M8t59aa/TriTkDMOwaKZTFmx8vrX3J3k0j7lFwxfIuE4AUt4b7A6BreuoqI/evdpXwaJ8KnoWDvSof59Pj7i8BkzCtzldjikiOF3pM09HjEbn5vHqX2WEXpkQXbv8Dd+pdBjN4i05w6X95yZkQWO7bqUR+7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=peEO2RQM; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="peEO2RQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=UyWmX8lyk6Q6Z7q+BldQ+cSN+KVoYs+SIyHi5V2ZslY=;
	b=peEO2RQMFXaIluYeeud6gLbCDaDrueelwCG5Jbhm2uYPmZTns9jGPk1sD1Oi2J
	9nwb2+KfyRhfvwoE3/GpC3bFsVJhKS8QvJ32BrmWc7ZY9udfsm1hJf80PL5kX9Kw
	Kj4BVCned518h/+k/kn1Wx/Ve3AYzWt8xB8V80YwOIlHM=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCXPz0r0BlpBasYAg--.7967S3;
	Sun, 16 Nov 2025 21:22:53 +0800 (CST)
Date: Sun, 16 Nov 2025 21:22:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.18, 2nd round
Message-ID: <aRnQK0kiLvQZ9X-f@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID:M88vCgCXPz0r0BlpBasYAg--.7967S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw47Xw15KF43XFW5ZFb_yoW8Xw47pF
	WSkw17Gr1fGF1rAF1DJa1v9a90yrn5JF15Gw4DG3y8trn8ZryUXrnxGrn5Wry5Kry7X3y5
	tF18Jr1DGw1kZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jBrWrUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOA7fRWkZ0C6S-AAA3M

The following changes since commit 6504297872c7a5d0d06247970d32940eba26b8b3:

  arm64: dts: imx8mp-kontron: Fix USB OTG role switching (2025-10-28 17:01:42 +0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.18-2

for you to fetch changes up to e89ee35567d3d465ef0715953170be72f5ef1d4c:

  arm64: dts: imx8qm-mek: fix mux-controller select/enable-gpios polarity (2025-11-16 21:10:06 +0800)

----------------------------------------------------------------
i.MX fixes for 6.18, 2nd round:

- Correct i.MX8DXL's pcie-ep interrupt number (Frank Li)
- Swap interrupt numbers of eqos for imx8dxl-ss-conn (Frank Li)
- Correct SAI3 interrupt line for i.MX6UL (Maarten Zanders)
- Correct mux-controller select/enable-gpios polarity for imx8qm-mek
  board (Xu Yang)

----------------------------------------------------------------
Frank Li (2):
      arm64: dts: imx8dxl: Correct pcie-ep interrupt number
      arm64: dts: imx8dxl-ss-conn: swap interrupts number of eqos

Maarten Zanders (1):
      ARM: dts: nxp: imx6ul: correct SAI3 interrupt line

Xu Yang (1):
      arm64: dts: imx8qm-mek: fix mux-controller select/enable-gpios polarity

 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi              | 2 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi | 5 +++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 4 ++--
 4 files changed, 10 insertions(+), 5 deletions(-)

