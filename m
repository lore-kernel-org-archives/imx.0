Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3794261577
	for <imx@lists.linux.dev>; Mon, 12 May 2025 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046365; cv=none; b=CKigjbLlaSy+QdzwZl3SyjKev+gfdlC7963GXljDk+QZVAiGbUVehm4KwHsvHZNCIUws+7bCgjrTMqThm+ec28IBstPusf9SmWrYCjLeTRdPJ1spHq+aiNgJBI9c2h/7wey24wqZfj0sU7Kjnm30mv28vHKMrltTdhfHH4tjylA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046365; c=relaxed/simple;
	bh=Gf25hQtLrP64X1RkCZBTbVL8CRFWFn58eYwvwpG9HwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QW0lq1kTJ2bKR6G43BTgDH58QAORcp1nnO6PCaCF6kzWtro4Tk5dOFElyumpc8dlGyS/tiMbW7zAxEcLATEcOs0rKVJHJ8qsq/2SfUHg0avA1oYTRKsv2wAeAJzmBmV477UQFhLRZiS8qo+tNi+A+NR6qz+4p/A80k1WGBTloGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljdEIkqm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljdEIkqm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC58C4CEE7;
	Mon, 12 May 2025 10:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747046364;
	bh=Gf25hQtLrP64X1RkCZBTbVL8CRFWFn58eYwvwpG9HwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ljdEIkqmukAAosQc/JKWrVJRPrf8u4b5uFIfnTgIMMIhaSLKJjpVmqjj3RqNCyATj
	 JQBmfCIOee0tCB/339L/wMTf5TATKwUk8XkOm3iMiNv00rxN0y+ReoAukWiawHbbDE
	 Xf9Nf5L1MNovAJYW6g22Kicm1JKjxoQO9APFpH2dZpqIAAvMw3yLO7NpKb150wkgUR
	 /6h4p0FoaoxLz255j34+KvDQTTFTiVN3sjcY80EdhjZY4Zs4OCEOfmGdEY147WT4y5
	 jlRmmBq2BOqQugZKr5oZHJUwC+9yj1eMIMNWfrWqSlAfKwfYTSIdCCrCenII7fej9t
	 JQsTUykO0GURg==
From: Shawn Guo <shawnguo@kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] i.MX dt-bindings change for 6.16
Date: Mon, 12 May 2025 11:38:55 +0100
Message-Id: <20250512103858.50501-2-shawnguo@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.16

for you to fetch changes up to b20c69cd708b8f1b61e311cf05632fefe583f1c4:

  bindings: arm: fsl: Add PHYTEC phyBOARD-Nash-i.MX93 board (2025-05-09 22:50:37 +0800)

----------------------------------------------------------------
i.MX dt-bindings change for 6.16:

- New compatibles for TQ Group boards, i.MX943 EVK, Nitrogen8M Plus ENC
  Carrier, phyBOARD-Nash-i.MX93 and phyCORE-i.MX8MP FPSC from PHYTEC,
  and Toradex SMARC iMX8MP SoM/carrier

----------------------------------------------------------------
Alexander Stein (1):
      dt: bindings: arm: add bindings for TQMa95xxSA

Jacky Bai (1):
      dt-bindings: arm: fsl: add i.MX943 EVK board

Markus Niebel (2):
      dt-bindings: arm: add MBa91xxCA Mainboard for TQMa93xxCA/LA SOM
      dt-bindings: arm: add TQMa8XxS boards

Martyn Welch (1):
      dt-bindings: arm: fsl: Add Boundary Device Nitrogen8M Plus ENC Carrier Board

Primoz Fiser (1):
      bindings: arm: fsl: Add PHYTEC phyBOARD-Nash-i.MX93 board

Vitor Soares (1):
      dt-bindings: arm: fsl: add Toradex SMARC iMX8MP SoM and carrier

Yannic Moog (1):
      dt-bindings: arm: add imx8mp-libra-rdk-fpsc

 Documentation/devicetree/bindings/arm/fsl.yaml | 61 +++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 2 deletions(-)
