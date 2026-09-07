Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BEE2BDC1C
	for <imx@lists.linux.dev>; Mon,  7 Sep 2026 02:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788747745; cv=none; b=PjjA5BHZPA9mom5WES3O3DiU1kx5mdCEinjby8/Wcgie7r9yKuTETxD01EO5ZMshEXNHKmT27GvzlbTA7f4aNDj3d/3nXLi40Yp0RTq9kxZeDTIZyoXT8WkI+2fBcE1e5rI6BDbWJ5tpIFq/8pc4WEn/drt0Z304BYeM77T3/QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788747745; c=relaxed/simple;
	bh=kikwjIBWbi1ZVPcjLbC6LahKuqRDwql903JtlKFMzSw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EmVag2xWtK3KeQ53wGZGCDhZp7aokuxmO4TU/G3sWWMG64eguwq2tH00Bpifr1y1D4wUblW+eBSYMJb/8xm9SHUuUqNsFB119sKM8ThLqzANS+VdnkDI1qfiw2Rxi8qKNUGsBN+ah5VTXmr+jWP56QrMOCuvxNVnpDUlA/rlZ6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f2442422aa6211f19a56ed5b684f684d-20260907
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:04840225-a6b5-4663-94a5-3b0bb104e2d1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:c061b8f89b39c84f8dd083eb29f874ac,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f2442422aa6211f19a56ed5b684f684d-20260907
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1804467761; Mon, 07 Sep 2026 10:22:17 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2] clk: imx: composite-93: return timeout from gate enable
Date: Mon,  7 Sep 2026 10:22:14 +0800
Message-Id: <20260907022214.1076402-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260821085616.1129333-1-gonglinkai@kylinos.cn>
References: <20260821085616.1129333-1-gonglinkai@kylinos.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx93_clk_composite_wait_ready() already reports a busy timeout, but
imx93_clk_composite_gate_enable() ignores that and always returns 0.
The clk framework then marks the clock enabled and lets consumers run
while the CCM slice is still busy.

Propagate the timeout so enable fails instead of looking successful.

Fixes: 4a3de5aa7743 ("clk: imx: clk-composite-93: check slice busy")
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
v2:
- Rewrite the commit message to explain why (Abel Vesa)

 drivers/clk/imx/clk-composite-93.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-composite-93.c b/drivers/clk/imx/clk-composite-93.c
index ef20ceb2d255..953f67d13978 100644
--- a/drivers/clk/imx/clk-composite-93.c
+++ b/drivers/clk/imx/clk-composite-93.c
@@ -43,11 +43,12 @@ static int imx93_clk_composite_wait_ready(struct clk_hw *hw, void __iomem *reg)
 	return ret;
 }
 
-static void imx93_clk_composite_gate_endisable(struct clk_hw *hw, int enable)
+static int imx93_clk_composite_gate_endisable(struct clk_hw *hw, int enable)
 {
 	struct clk_gate *gate = to_clk_gate(hw);
 	unsigned long flags;
 	u32 reg;
+	int ret;
 
 	if (gate->lock)
 		spin_lock_irqsave(gate->lock, flags);
@@ -61,17 +62,17 @@ static void imx93_clk_composite_gate_endisable(struct clk_hw *hw, int enable)
 
 	writel(reg, gate->reg);
 
-	imx93_clk_composite_wait_ready(hw, gate->reg);
+	ret = imx93_clk_composite_wait_ready(hw, gate->reg);
 
 	if (gate->lock)
 		spin_unlock_irqrestore(gate->lock, flags);
+
+	return ret;
 }
 
 static int imx93_clk_composite_gate_enable(struct clk_hw *hw)
 {
-	imx93_clk_composite_gate_endisable(hw, 1);
-
-	return 0;
+	return imx93_clk_composite_gate_endisable(hw, 1);
 }
 
 static void imx93_clk_composite_gate_disable(struct clk_hw *hw)
-- 
2.25.1
