Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711C83C944F;
	Tue, 10 Mar 2026 19:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773169660; cv=none; b=p3trt9fP3x5oF3ml5vsKW75hR/9r7njYeWlzX0JVquNW6Nxga5PEsiVv7/+W8J9tT9a2zjOKcr4eBtXjElEn8G1/AUs5euT6Naa65VWCzDFYRR3jKQxQrcdSuw05do/yeqrlK0GHm//Bi3qXKYl65TJjhp0UpSHbVIiQ2vFGqHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773169660; c=relaxed/simple;
	bh=gCNcVUJrbZCTx48PDUwX/v6AbMJIIgCA0UtWdlcRzS8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AgUhyVFIrlW8qE7wtYqAjmZ/gKT6LDo2MhoqKBhAUl8sopcbi02UnePGlKKCfvbRFzYM/nEGOx7kdPKRhgAIWNVJK3oboqw0LPxAE4xb29/XPtkf9LXbSICHCuudW0yk+/uVPSnxvg5HmMw/ohI067B8kjL+S28JrcISTE1EXOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pX2WUf1p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pX2WUf1p"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25ACCC19423;
	Tue, 10 Mar 2026 19:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773169660;
	bh=gCNcVUJrbZCTx48PDUwX/v6AbMJIIgCA0UtWdlcRzS8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pX2WUf1p4xIkgApszm33gEz3I8nqKMZ9vY7xIE7T9cfwWAW4q5WjvWMnbWnsBilyO
	 EJwKfMgQMVikqKJq+x+HL30FGCqxiCj07dUPJT9zeZVWXssLhSZlrc9fVTAcKU9bNb
	 w5hIMA31eGE1foUMK/u7wqDC+vHGY9qj8gRZxYMzx7yorcXRaOWmJ6oVXfZZB1i+oY
	 /MXDpS76xg8R0ReulFP4eC9NlzyWE6OO+mVipulAHfWnar/RY1U2eaNXfmOgnXitc1
	 hJnhivwAdJHBSwi9j+Gmw1SEJKFnCQIYetcJDkzyTSkYK7QhlvnaG4DrErtJ/xTsPX
	 y7F0jeH4UY+Tw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16945FD4F0D;
	Tue, 10 Mar 2026 19:07:40 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Subject: [PATCH 0/3] mtd: rawnand: mxc: set raw chip's to child nand@0
Date: Tue, 10 Mar 2026 15:07:36 -0400
Message-Id: <20260310-gpmi_nand-v1-0-6a665151aa75@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPhrsGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMT3fSC3Mz4vMS8FN00C3MDM9MUCyOL1DQloPqCotS0zAqwWdGxtbU
 ATw+ipVsAAAA=
X-Change-ID: 20260304-gpmi_nand-f87065d828ef
To: Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Max Krummenacher <max.oss.09@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773169659; l=1291;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=gCNcVUJrbZCTx48PDUwX/v6AbMJIIgCA0UtWdlcRzS8=;
 b=JtKAcoccqwCOput4I+Q0xQSZ8wccSMzXvMjV1Hy9NnjhF2ZqA43LLSYFkQeUDYjNFVKtFmLWB
 XIxkoshi519BUYVKc28LvUWBnuScyy/mJY7iVD9SaFK/mWwa2xzFFpz
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

The nand-controller.yaml binding requires a child node (e.g. nand@0) under
the NAND controller. However, the driver currently assigns the controller's
of_node directly to the NAND chip.

Search for the first child node with the "nand" prefix and assign it to
chip->of_node. This filters out properties such as "partition" that may be
placed under the controller node in some older DTS files.

Fall back to using the controller's of_node if no suitable child node is
found to maintain backward compatibility.

This issue went unnoticed because the default behavior works for most NAND
chips.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (3):
      mtd: rawnand: gpmi: set chip->of_node to nand@0 child node if present
      mtd: rawnand: mxc: set chip->of_node to nand@0 child node if present
      mtd: rawnand: ifc: set chip->of_node to nand@0 child node if present

 drivers/mtd/nand/raw/fsl_ifc_nand.c        | 10 +++++++++-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 11 ++++++++++-
 drivers/mtd/nand/raw/mxc_nand.c            | 10 +++++++++-
 3 files changed, 28 insertions(+), 3 deletions(-)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260304-gpmi_nand-f87065d828ef

Best regards,
--
Frank Li <Frank.Li@nxp.com>


