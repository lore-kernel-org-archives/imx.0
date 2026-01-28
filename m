Received: from sender4-pp-e105.zoho.com (sender4-pp-e105.zoho.com [136.143.188.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B6336F43A
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 18:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769625591; cv=pass; b=sIYqokF+U3gxZeQQxZsBgO21p+oZvIeeEvZr+v5D/pRq34vn7Gh0kjZ0IbObXNfLG5sRSRCjaXKgkq4MNPGfVVY54fTAiVOhGBrm7tQd7Ln852jacLVdMsKaqaGHGorSinFStcQ4LcpdZJo2mCUqgUvXoOSmBsOGeNRGDuAdE+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769625591; c=relaxed/simple;
	bh=MxebTbAZUFLbzK4gDQaBOG/UyO9QFwW2tBOjqEq3Zoo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pOEsZeKANszbo8keMxFVPE6BEWSDj7aJ6FMq8FkeGEtCaJUKKFLrwYNkJxESJdMyhBcsEgqvw9ruhS6qvm1FEn8RHfyfYYUIjXVGm4ZqUacCObsJswLAfuUsPhWYcRN/5L3tIA65MARwu+5cklNPwLa5QEtisSCDABAinqiP664=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=H+U+O24m; arc=pass smtp.client-ip=136.143.188.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="H+U+O24m"
ARC-Seal: i=1; a=rsa-sha256; t=1769625575; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cJzG+f1Lp5kPWoClVFG3pHdmgaQWHCCm/4QRxmbYJGgtIvyJqBEWUZIpA8QpzORTggpj6rZBmo8mbNJ4erzRaPznOG587qn0de687wOYrcCtEp/evwLO/Hp+MtaeVbjxxwvmGFg76tN+EhJ32JiPOd+/Gaa1HL2wkh1XVfuPgYM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769625575; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VPiGGxfGk9qyGZNYwtEphY2A7pL305cD7LB8ReFqHtM=; 
	b=FyhxyttixDXvWIUwxQjv5uhh9SJWPABBcar/WnZnbQUDD5v2blrvzMMXlsbn5M6x8PNlJ624hZW4wwLPxositCFcA+rVfdznwHOXGsoTxi2pYFaW4Dv0b65sD+r+EBPz5MYT4VW6nupssCMGT5Q87i3CYfcPIeLMJJ8UsXhZqGs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769625575;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=VPiGGxfGk9qyGZNYwtEphY2A7pL305cD7LB8ReFqHtM=;
	b=H+U+O24mv7g7vETn8N+6833+tmyfjUDguKJA4VGyB6PQVmJ4F+kZf0RrZjdto5B7
	9m4L8pNNRuCYGpPL8BAVZvmijpSHuDONichWdhVcPi5UXwwOSA0Ty133A6WjCZhmHPB
	BE2Np5xP9zvwZd4ao/PunpVaFLINgDyfiWPm9icQ=
Received: by mx.zohomail.com with SMTPS id 1769625572938868.1314700606614;
	Wed, 28 Jan 2026 10:39:32 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/2] Fix a __clk_core_init parental issue
Date: Wed, 28 Jan 2026 19:38:49 +0100
Message-Id: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBQFr9L8tT9CVVCuYli05amN0Ja2GhLC3
 W1k8RYzyZuVEqJFok6sFPG1yXpXoD4IMi/lnmA7FCZZyaaq5ZV9SBxUhMsMp/QIftiFmwtwvrW
 t0cOJyjdEFP3v3vudI+ZPyeddklYJbPw02dwJM76PZeywZOq37QdEK1balwAAAA==
X-Change-ID: 20260128-ops-parent-enable-fix-65ee4977cbd3
To: Mark Brown <broonie@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3

Mark and Alexander, please test to see if these patches resolve the
issues on your boards.

I expect the first patch to completely fix the problem on the Avenger96
(STM32MP1) board.

I'm less sure about the i.MX8MP board. I believe the second patch is
needed there, but I don't know for certain, as I don't have the hardware
to test.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (2):
      clk: Disable CLK_OPS_PARENT_ENABLED parent only after CRITICAL check
      clk: imx8mp: Mark arm_a53_div as critical

 drivers/clk/clk.c            | 6 +++---
 drivers/clk/imx/clk-imx8mp.c | 4 +++-
 drivers/clk/imx/clk.h        | 4 ++++
 3 files changed, 10 insertions(+), 4 deletions(-)
---
base-commit: c099ccb60bc99900dd54ac22d7e68b8e56f15e4b
change-id: 20260128-ops-parent-enable-fix-65ee4977cbd3

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

