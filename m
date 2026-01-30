Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D684318EEC
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769782247; cv=none; b=SRBW2/eKRG4OqGr1gCeyxUzfQMQg5+KrOE/dmYyyDN+WtD2MsNR5x5rzl11eGXh3CVLK2I4EbpNFPSkPN396lqaTVZIuAbijhmnPCiAnU4iv8GQwk/uQCGKpX2wP0MguToboh8yUe9tUhxSqS3oX7NLDkUxAzvOjnsf1K/tXsRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769782247; c=relaxed/simple;
	bh=0W27QFew4CaxE2Y8p24O0EQN+GgOlw15dThWBwgPflA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qOxM8xVqiz1GIbKo2rRarQR/QzOZ9VFgbXitGhjCs0n97YBEVCmI/M1AmjTM9dntPXSJ+0pYwsk86Zvlet4q+kGJvsi+fPzI+oG3R8jGFiL9XNUqhSUISCidnvJrGX7iMhKFW8C8H2vr0S5zcnzMtAHoLC2c9fTgQFXAGZwBgQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9D9A71A071F;
	Fri, 30 Jan 2026 15:10:38 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 919641A071E;
	Fri, 30 Jan 2026 15:10:38 +0100 (CET)
Received: from lsv15141.swis.ro-buh01.nxp.com (lsv15141.swis.ro-buh01.nxp.com [10.162.246.138])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 34473203AA;
	Fri, 30 Jan 2026 15:10:37 +0100 (CET)
From: Claudiu Manoil <claudiu.manoil@nxp.com>
To: vladimir.oltean@nxp.com,
	wei.fang@nxp.com,
	xiaoning.wang@nxp.com,
	Frank.Li@nxp.com
Cc: kuba@kernel.org,
	davem@davemloft.net,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	pabeni@redhat.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org
Subject: [PATCH net 0/4] ENETC v4 hardware integration fixes
Date: Fri, 30 Jan 2026 16:10:31 +0200
Message-Id: <20260130141035.272471-1-claudiu.manoil@nxp.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

ENETC v4 targeted fixes addressing SoC level integration issues
regarding AXI settings and register access width.

Claudiu Manoil (4):
  net: enetc: Remove SI/BDR cacheability AXI settings for ENETC v4
  net: enetc: Remove CBDR cacheability AXI settings for ENETC v4
  net: enetc: Convert 16-bit register writes to 32-bit for ENETC v4
  net: enetc: Convert 16-bit register reads to 32-bit for ENETC v4

 drivers/net/ethernet/freescale/enetc/enetc.c    | 11 +++++++----
 .../net/ethernet/freescale/enetc/enetc4_pf.c    |  6 +++---
 .../net/ethernet/freescale/enetc/enetc_cbdr.c   |  4 ----
 drivers/net/ethernet/freescale/enetc/enetc_hw.h | 17 ++++++++++++++---
 4 files changed, 24 insertions(+), 14 deletions(-)

-- 
2.34.1

