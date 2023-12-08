Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93397381B1
	for <imx@lists.linux.dev>; Fri,  8 Dec 2023 17:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQeoKGdO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0966AC433C8;
	Fri,  8 Dec 2023 17:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702055315;
	bh=HUSkycKQqdvCwDWPRR3SQZhNrNjKB7XwUDzkxrLiRAQ=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=IQeoKGdO2IjGdLDLwstlNRatIRxtFVG/GFlPRnq0oOVTi6NG+rOKE3Qymo2xPBxnb
	 P9deDtyZTu3WmO4vbaEFxCIB2E9wcVtvtHqKC7Omdm9NvXtWVcwpx2s4s3TkPwSO4w
	 iG0gazrUWQQwu/Q+B5sF4dFnRHkvuE13njfGh8H4xV43AG4Vw/7CbWVMppaXpaEjRF
	 +CYiSPUTDCq6JMNVi65Y5I1n1JyhZDu00lWTwPpYZo4rZASNojZ4bFL9z/bGkjNuzo
	 yBzT1OYLrrfnmyPz9Q0lHh3mB/3yPBpW997M7oAzcf4xwDNrDIh+xsYEVYFjZ5fX9E
	 LCGTrHneastaw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EB725DD4F1E;
	Fri,  8 Dec 2023 17:08:34 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for v6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <90aa3b5f-a0d4-4609-85c2-e3d4cc944102@app.fastmail.com>
References: <90aa3b5f-a0d4-4609-85c2-e3d4cc944102@app.fastmail.com>
X-PR-Tracked-List-Id: Upstream kernel work for Rockchip platforms <linux-rockchip.lists.infradead.org>
X-PR-Tracked-Message-Id: <90aa3b5f-a0d4-4609-85c2-e3d4cc944102@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.7-1
X-PR-Tracked-Commit-Id: fd1e5745f87a9e06974d2f42d22b3e1682c99105
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a6adef898741eb07526aaf9d8b982d3dff4a9e67
Message-Id: <170205531495.9242.2736142793084399675.pr-tracker-bot@kernel.org>
Date: Fri, 08 Dec 2023 17:08:34 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, imx@lists.linux.dev, linux-rockchip@lists.infradead.org
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 08 Dec 2023 14:59:56 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.7-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a6adef898741eb07526aaf9d8b982d3dff4a9e67

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
