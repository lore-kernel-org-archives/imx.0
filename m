Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B092D261577
	for <imx@lists.linux.dev>; Mon, 12 May 2025 10:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046372; cv=none; b=T+TDVxpFAD42o2JficoNADcraGA/xZfsqQL1JXOXwPcleDzdV10dVWCXqZcS727O1gvBvgjSBo6iWJoNKrrtUoGnXXEv1oqJjwUe0D6CgEtDFwteDYQXAKoIthFRwe2FbENL8qZUZpyHa29Iti4yqtgvXdpslgrLCqAsFMIt0tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046372; c=relaxed/simple;
	bh=nRWsb2wolmIY//6flqGvzmnzjfqP6D0rAaoQXhZBqFw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dcxV63K7k4paHNy1IGz7Uu59T70mVL0Lt0WCK178Qp02mp48gJT9bB54mEiIU0D+Fu+qz0CUpS+3nQ9hFWY9czsf65b7waNYHikOUY0bfG6vrLDPRWYx/RRRoc/vBl1dqeExhE1CEgEFzW8Yf2W0bRxHCgDEH9SjhW99oCQ63uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8aYIXd6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8aYIXd6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C90C4CEE7;
	Mon, 12 May 2025 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747046371;
	bh=nRWsb2wolmIY//6flqGvzmnzjfqP6D0rAaoQXhZBqFw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q8aYIXd6C+TalCCIXOp2o3UTZ1HaM6grqhJqnRtTyPSdm8mh3IORbBkN0T2fQmBmN
	 dT9QBCvxqd3CwzpUD7re06jG7AI8ULeIHSE+4opZd5t83Q9yx20nkt9OO8Mfe5mPgv
	 5XQVQv9FIy7LEz8Y/N64w79BAN0R8t3c3i3b8YEqXETvJskjEOWXKrqu0k349Ae5MC
	 0w5QKWN3LWg55htmEl0V9rvGrDe+j/8bvnNKRuN0kPXziWL0MLHwgmtlMn36PDE2Q8
	 kQrLCkdimgsaDsxy81LY0KsS8PboOi7K+tlUIdAEYrA2+mWeDuAyrKjp5ZGQ9ABpMC
	 kE5DXCdI0EC2w==
From: Shawn Guo <shawnguo@kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] i.MX defconfig change for 6.16
Date: Mon, 12 May 2025 11:38:58 +0100
Message-Id: <20250512103858.50501-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512103858.50501-1-shawnguo@kernel.org>
References: <20250512103858.50501-1-shawnguo@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.16

for you to fetch changes up to ef4c2c789a8a42e90a335e7411bd3cae3eb8d8d6:

  arm64: defconfig: Add Toradex Embedded Controller config (2025-05-09 22:41:57 +0800)

----------------------------------------------------------------
i.MX defconfig change for 6.16:

- Enable Toradex Embedded Controller driver as module in arm64 defconfig

----------------------------------------------------------------
Francesco Dolcini (1):
      arm64: defconfig: Add Toradex Embedded Controller config

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
