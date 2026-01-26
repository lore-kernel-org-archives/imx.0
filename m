Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357E9153BE9
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 01:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769391444; cv=none; b=M2C+cFmQ/4Vf2TTz1NUz5PLOT8lZkEvEIZDPKaebKcQi8mNmOnCkg4DGn8OcDR2cfexBh/2rNPaVocbC1/SHILBOy87uHhvs9F+YXHDZ0ZIy28WJvWONIWPGrwLMgtT6XFARvqNVvt6kq7rJAjhI085ceVFiUzr1X+k8JJzLRG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769391444; c=relaxed/simple;
	bh=7pk/lskPODQz/Z9FXM3zs3HPJR4HlRI4IYSCBskmIb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L/9yc48i/Nd6P821VIm64/Ee5NKUbPoHnYpMt2SeStKyprK30i45jUp1BvgnSaCBGUOd9rIKRGygdnT+K4CSrZJGXwLYiz2RtYIdpuU3DQbl25lNTstyHw0tLd6jK0r6eK6BGuIenqTa73CS9PTCtXqebQ3UTRZO4sSjYwaMoZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GUX4TorC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUX4TorC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36757C4CEF1;
	Mon, 26 Jan 2026 01:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769391443;
	bh=7pk/lskPODQz/Z9FXM3zs3HPJR4HlRI4IYSCBskmIb8=;
	h=Date:From:To:Cc:Subject:From;
	b=GUX4TorCIi1Jbbm7gM6u155i4pDxUjW/WiHj15Y5lGryS1TasqCwR7gZ4ZrPt7ANS
	 qTlzyxIMXMXBhKd2JFo/3Pz7SuvrneINNOHIih38ju9GrAcQ0QHLhjqJAaChiVa3YV
	 4WDn2cWRhmfD+7hyPttVt93dJBXz060fgWa29F9DWebevymdmm/cIxD5JjBVq6j+72
	 ruFx74IO9QrYj0jB8aO6sRinDXnjHclA+TbPRFc+Qa5CGE/hSsG3tYkkeqCTMC1a8H
	 v/Zp6vpjt4XM2MifZtdNX2O7tlKSc58AsCkr+2vEaOuvwAEjejYOI4IGPbHpKEjwDi
	 fRUt3T60l9cZg==
Date: Mon, 26 Jan 2026 09:37:19 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX MAINTAINERS changes for 6.20
Message-ID: <aXbFT9N4bZ22wxcb@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-maintainers-6.20

for you to fetch changes up to 473dd9ecb3fd139ffebd6f7a9f73fb73d85fe2aa:

  MAINTAINERS: Replace Shawn with Frank as i.MX platform maintainer (2026-01-26 09:24:50 +0800)

----------------------------------------------------------------
i.MX MAINTAINERS changes for 6.20:

- Shawn Guo steps down and Frank Li steps up as i.MX platform
  maintainer

----------------------------------------------------------------
Shawn Guo (1):
      MAINTAINERS: Replace Shawn with Frank as i.MX platform maintainer

 MAINTAINERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
