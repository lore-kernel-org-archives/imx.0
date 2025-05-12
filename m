Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DEB261577
	for <imx@lists.linux.dev>; Mon, 12 May 2025 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046366; cv=none; b=CHi68PdgU9n7m5EgInbSKwyZhb3y2iqxfXaTNG7rMcp7h9Zl5n1teGXNAEOWYZJciNKek/MKuGV46664BQa3FJJzA72ORsxCejMAgGEPjskuGfCL/8lzsfTMRMdeZL9rEcPE64eOJGtWbZPHZHKTqNqLlR99b+Ale6z53+XFkEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046366; c=relaxed/simple;
	bh=SBRvjhmUtNuaagTaAy5xBuW4p4p/zWlNthxNMMao0OU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A/6zOF+3/JmpUNHPyc671oKpgYkxUVgEn6OJ5on62UGe2wn9qv5/+Z8JzMb6r/QoiRBeDUiUkdSVDtC6zTqRVUhJiB2gEXNiAwgFebMsctcMCwxoEmxEQO95zwmMzRMvCKcSQNVvrIW1RQcabuDPdiywpJYus2K04w0qXaZfBb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTGXERYL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTGXERYL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9DB6C4CEF1;
	Mon, 12 May 2025 10:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747046366;
	bh=SBRvjhmUtNuaagTaAy5xBuW4p4p/zWlNthxNMMao0OU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bTGXERYLRij4sOf/9Qbo7aPWtcEMIeOXa+S2K9OBy2m96Fnr1uAf/gzXtKAgp79FF
	 7+uJXAxerLMb4VHO0pPw/FJQAXQVG1atPWe0qm3f4YhmEk9RNDnQWWNh6uIg1lYI63
	 DDb+NZKlFonkgJX/d8b/vdYSyMZks3fgroKCadaBJ8AbyWhpY8BrGWURr/J9OPjagD
	 oNgylx06mBMyrU6Hlc4g+GJnnoKunIL7KOd8Hx8iIs/6fl9pijxpO5xRtWWX7pA3kC
	 6fzBj9HDRjqrfvOi1Do7d7qB2dPynz8gBgOTqOJvui3oyo74RUlQROY6kzrSsM4TT/
	 f5GvwLQBU9+kw==
From: Shawn Guo <shawnguo@kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] i.MX ARM device tree change for 6.16
Date: Mon, 12 May 2025 11:38:56 +0100
Message-Id: <20250512103858.50501-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512103858.50501-1-shawnguo@kernel.org>
References: <20250512103858.50501-1-shawnguo@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.16

for you to fetch changes up to 10d0bc88bbc884519abe7d966d86b1ca7f3d686b:

  ARM: dts: mxs: use padconfig macros (2025-05-09 22:53:33 +0800)

----------------------------------------------------------------
i.MX ARM device tree change for 6.16:

- A series from Alexander Stein that updates ls1021a-tqmals1021a device
  tree mostly for display support inlcuding HDMI, LVDS and CDTech panel
- A change from Dario Binacchi to use pad config defines for i.MX23/28
  device trees
- A i.MX7D change from Efe Can İçöz to include min and max voltage in
  opp-microvolt
- A few patches from Fabio Estevam to fix dt-schema warnings
- A couple of changes from Krzysztof Kozlowski to align NAND and WIFI
  node name with binings
- A clean-up change from Rob Herring to drop redundant CPU
  "clock-latency"

----------------------------------------------------------------
Alexander Stein (7):
      ARM: dts: ls1021a-tqmals1021a: Fix license
      ARM: dts: ls1021a-tqmals1021a: Add vcc-supply for spi-nor
      ARM: dts: ls1021a-tqmals1021a: Add HDMI overlay
      ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for Tianma TM070JVGH33
      ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech FC21 RGB display
      ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech DC44 RGB display
      ARM: dts: ls1021a-tqmals1021a: change sound card model name

Dario Binacchi (1):
      ARM: dts: mxs: use padconfig macros

Efe Can İçöz (1):
      ARM: dts: imx7d: update opp-table voltages

Fabio Estevam (3):
      ARM: dts: imx31/imx6: Use flash as the NOR node name
      ARM: dts: imx: Fix the iim compatible string
      ARM: dts: imx51-digi-connectcore-som: Fix MMA7455 compatible

Francesco Dolcini (1):
      ARM: dts: imx6q-apalis: remove pcie-switch node

Krzysztof Kozlowski (2):
      ARM: dts: nxp: Align NAND controller node name with bindings
      ARM: dts: nxp: Align wifi node name with bindings

Rob Herring (Arm) (1):
      ARM: dts: imx: Drop redundant CPU "clock-latency"

 arch/arm/boot/dts/nxp/imx/imx25.dtsi               |  2 +-
 arch/arm/boot/dts/nxp/imx/imx31-lite.dts           |  2 +-
 arch/arm/boot/dts/nxp/imx/imx31.dtsi               |  2 +-
 arch/arm/boot/dts/nxp/imx/imx35.dtsi               |  2 +-
 .../dts/nxp/imx/imx51-digi-connectcore-som.dtsi    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx51.dtsi               |  4 +-
 arch/arm/boot/dts/nxp/imx/imx53.dtsi               |  4 +-
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts    |  9 ----
 arch/arm/boot/dts/nxp/imx/imx6q-mccmon6.dts        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d.dtsi               |  6 +--
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               |  1 -
 arch/arm/boot/dts/nxp/ls/Makefile                  |  9 ++++
 .../nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso  | 32 +++++++++++++
 ...021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 ++++++++++++++++++
 ...1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso | 55 ++++++++++++++++++++++
 ...1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso | 55 ++++++++++++++++++++++
 .../dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts    |  5 +-
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi   |  3 +-
 arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts          |  6 +--
 arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts           | 12 ++---
 arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi          |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts       |  6 +--
 25 files changed, 232 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso
