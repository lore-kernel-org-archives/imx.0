Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A729E2417C2;
	Fri, 14 Nov 2025 14:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763129511; cv=none; b=MZZP2c3wfs71C2zprX4AiOMiM0RqasWNa5wEDTMuC7KUwyQF+9XUh0lfjAIIoNkvjjgyZELOUMyTE5ui83vA6UIdH/wNTRfJlHj6GysOdGyOY1Sk6czVQJBJNwIDonLmUsWWY/zIScB5qmVoDNQ9gUs8BZh0h9Cbf06ULp4HfEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763129511; c=relaxed/simple;
	bh=dar1GitVgzSL3thT8mS4kxQWjGPcF9tQbQT2Aymvgos=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gORppcuwjoy51+nf02dn3qje9NztQY2B1KCu3tQhn1kqmTR7kz53DWo1JLE+8LJdh8gGBPOuy7oOpLsMvwxNL5YpJ5SM2RCGitGmDO6k0TYnwwMkWyNl7flP8WHtgevwtcjNyBRvIUfhGFnU4tYFUGudf39aBKw3d9vFVRM6nbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4B6Kofx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4B6Kofx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09374C4CEF8;
	Fri, 14 Nov 2025 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763129511;
	bh=dar1GitVgzSL3thT8mS4kxQWjGPcF9tQbQT2Aymvgos=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=R4B6KofxY24gm6MFTqcyyNvHTaNzuWJXRAaGk4u8rw7/Cd9Mvkq2/pOW2l0nJUC95
	 DLpaP95ksxZEHuwzO3xLrcePwgLsQZyBbybKko/IJXa/bgXxiNaAQlyG4+0dhbPBHp
	 offTIq4/W7UhOR2dXrgKqIQC9OOw27If265I/G8XKd/sww3zW0QMrZ3qV2932U6I0a
	 vTgJSbBQxO1gXjwK2+F1SqRoF3rkvlJkDtwLcsCyay/SV+FFA/ucQDUdke2yZWO9F1
	 ElqzjwgzUjf+PkE15gSofI/T0TZ738F8xpmXyRIPq4VjNyd1QcVXLGSNxWTscjjyPB
	 BVM+DiteEBHAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21B4CE7AEF;
	Fri, 14 Nov 2025 14:11:50 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH 0/3] arm64: dts: freescale: moduline-display: several fixes
Date: Fri, 14 Nov 2025 15:11:48 +0100
Message-Id: <20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKQ4F2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0MT3ZTM4oL4tMwKXaNkS4MUY9PEJIOUFCWg8oKiVKAw2Kjo2NpaAHR
 ob81aAAAA
X-Change-ID: 20251114-disp_fix-2c90d35ab0dd
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763129510; l=971;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=dar1GitVgzSL3thT8mS4kxQWjGPcF9tQbQT2Aymvgos=;
 b=PuPgSFng3RzGVizBii7B7MV3Vbtta44/VL4M7bg/F4COAzYEuLd0ahfv4wT90G6ISGumlb6k/
 qAdZK50Fa7PDc+++LX7EXgXB8CJGQs/UCkK166ioG8esh7w0G1D7ZHb
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

A couple of issues where discovered:
- compatibles should integrate the SoM
- the eqos mac address is stored in eth_mac1

The first one is breaking, but it is early enough that it can be
corrected without causing any issues.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Maud Spierings (3):
      dt-bindings: arm: fsl: moduline-display: fix compatible
      arm64: dts: freescale: moduline-display: fix compatible
      arm64: dts: freescale: tx8p-ml81: fix eqos nvmem-cells

 Documentation/devicetree/bindings/arm/fsl.yaml                     | 7 ++++++-
 .../boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts   | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi                | 5 +++++
 3 files changed, 12 insertions(+), 2 deletions(-)
---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20251114-disp_fix-2c90d35ab0dd

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>


