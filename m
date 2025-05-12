Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D17261577
	for <imx@lists.linux.dev>; Mon, 12 May 2025 10:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046362; cv=none; b=lQ2yE00zM1yvdOCU8GgSgqHz7OQTHUlIwzISymMI3xdOB2+B/b5dt8Hmt29X3TUQeIlKE9MhgHAjikqNZ+FTIEBrCCYIv5dU1qQ984r+zwsUA681EOwiMKk8gFUH/3Kw0FZNGrAbgN10ewqBNHvhDJQXXcDEujkaJAsOECg56JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046362; c=relaxed/simple;
	bh=mLLIpyFiRzCKEImiqoPC0v0UcgjN4CKT/HsuUkB/IcE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lJkzVdlLzQk3Rq/K5IV+7CjmoHypoGLcH9Ye5NYfo6GeHiPlGA2lc6BFaWS2kTHGCQmVcan0WJvIBqPSc/Is/n0UyGtEeSFeqDDv/AHSR2irffAR8A9/7YpBsNAb6pvYodgAxb1m/E/CHjcQjsHaCmBhPpgv9/3H0NaCkHiUF2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r3Qw7jcM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r3Qw7jcM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF27C4CEE7;
	Mon, 12 May 2025 10:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747046362;
	bh=mLLIpyFiRzCKEImiqoPC0v0UcgjN4CKT/HsuUkB/IcE=;
	h=From:To:Cc:Subject:Date:From;
	b=r3Qw7jcMD/AqzhW4ctUfL8NajFvKBzFUpMtB1ePJFtHDeQhR4dqQca3Eg/Qrb9PrY
	 dgawHMrhuqKMKhBC/3+qRAtX8y7+4CCFaa8ZXHo5PSPtwPHErkHcHtBrbVJEleiFGL
	 9eUL6uzvuPP2ywvbrd1ntaemvNEZCUyeX9aJzzcPS43SzrnpI5d+bH8EmI3G2B6VcM
	 JRLN3qHcYnrk443RlHLOKXWtL1S5rDFvTBWOT1yf9Ow7wYLmKMKDq/RkUXIdzDHwUs
	 WfNCgBZuni9n/W07rC/jKAApe57pY+ymWXpJH0mloRc6dkoiLR2VGjx1/MQEytmrTA
	 bYVOJt6cvrbYQ==
From: Shawn Guo <shawnguo@kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX drivers change for 6.16
Date: Mon, 12 May 2025 11:38:54 +0100
Message-Id: <20250512103858.50501-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.34.1
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

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.16

for you to fetch changes up to fd0bf2bb32215976c269d6e68c1a12b5815e6c20:

  soc: imx8m: Dump higher 64bits UID (2025-05-09 18:16:28 +0800)

----------------------------------------------------------------
i.MX drivers change for 6.16:

- A series from Peng Fan to dump full 128-bits UID for i.MX8MP

----------------------------------------------------------------
Peng Fan (3):
      soc: imx8m: Cleanup with adding imx8m_soc_[un]prepare
      soc: imx8m: Introduce soc_uid hook
      soc: imx8m: Dump higher 64bits UID

 drivers/soc/imx/soc-imx8m.c | 177 +++++++++++++++++++++++++++-----------------
 1 file changed, 108 insertions(+), 69 deletions(-)
