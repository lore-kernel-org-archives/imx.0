Received: from mx-relay90-hz2.antispameurope.com (mx-relay90-hz2.antispameurope.com [94.100.136.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A706939EF3E
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 16:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.190
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772728422; cv=pass; b=V+Xdj/gujUyzdVJFScFfZACZ4D7aSZZHzwXDM55zv4TGRMDve750bhVYLimncr5a593Vk2h2IExdyRXkDaJx2z7hRTq2cn32kaG3QhNJzdY+GmFjB7N4SEk+XXPfBunedvPpQxE4EyU6zT/JHAk+V2U9BQ0HP0el+kn3tMlKUp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772728422; c=relaxed/simple;
	bh=aBp8xR1iTTFcZBMVQ+foO9mCkmwjd/5ncvfXOCgU/6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=drjInIURuttXjL9JYzbN1WxMTcn33whikNn53QfUhl6ZJ0O7LSKKMUl2MstjSaPw3B2MUNWJaqyS/+SR7xpzLWiZk4YF4UsRFNXOCbUyqp3Fi6lO7o/NvHAHfhIh0/nddJ5MDQjjqPFu30Wjd4PtHr8N+ze+uWoe8hClfJNCeeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=PVZOdgRp; arc=pass smtp.client-ip=94.100.136.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="PVZOdgRp"
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=kQ0KzDnbu1PlI/JdLZkDqAqrxLxl5G06+OR7mjHBzrw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772728403;
 b=JxjwHhrLK68Yjn2aJ5wYsU5jsau2UmxoK6FUaPEmIYfewJRXSLPJADn09gnSdBj6KZEaZiF9
 qTw4U7RuxuoZrOV1B0aJgoU5BBZEWje7z5S1LgyHwGvKMCzdiMoj42IBFfddGmAwl7FsZLx7I4q
 tgiCQ4X6mDy2ieu2atH6ZVVRv2GI3KU4WZwwJ0noPMalJOQzRV85mtnbMJB6pPmBZkKN1wJ/KP/
 uXREfcbFmm9Ntb1YzYn82uYdLYlVtPWdksBu4TmClBh6+kWRnjfqjs5rJxr5jLApK4YIj/PrsZ8
 zg8th8pmcYbxuDLuqIk/acA2dPDgccX2e7oY3vs3x/72w==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772728403;
 b=J3lvyJTbjDoh3XQoZ2SPVxdg7Qkv4mPtSJSWui+GTZxhBgDBeNv8LIdMLAIvEN/kus5FkArS
 o9bAmgSGOFpkydbRmPbeUrPr5SDKm2M7XrT7D/VJ5H57MypNYqpsNIiglY7gYqhsDCuuym8wCvq
 lWjWX+dHe4Sxwghfj4FdA1e6IaMyayonmC59+OV8OPQe9TS1D04yEDo6yMMz0FdBaawVTVAZ9IM
 vv09jfvJAS/kum2tvDDHpGKGmR8EkKjhewwv4FEU0ptIs9Vq9BbCulkPeGseH1ZoSMdrXur2OKr
 V40LFS4xNVGZ/7bJTlO590NFtdw2+XArq2ExU2PvLDgQw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Thu, 05 Mar 2026 17:33:23 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 88EA3CC0D36;
	Thu,  5 Mar 2026 17:33:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] clk: imx: fracn-gppll: Add 333.333333 MHz Support
Date: Thu,  5 Mar 2026 17:33:13 +0100
Message-ID: <20260305163314.2642523-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4fRZpj1jQSzWj0k
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:e09355286075a816d83ad3ff6a06a7b0
X-cloud-security:scantime:1.332
DKIM-Signature: a=rsa-sha256;
 bh=kQ0KzDnbu1PlI/JdLZkDqAqrxLxl5G06+OR7mjHBzrw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772728403; v=1;
 b=PVZOdgRpjbkM454ia359gZQassy0UR2CnX9udKp8Qitia5nty1umtHijyKyHMXBvxOioFG9N
 wien17jn1QOcJczTahk7zfKtiECaZ6Q0uINI+4LhQv2TPSN8Lnz8lN1WS4Skk4TbqBrhSj78ZB2
 +ygh80ygj/OqimF7CVCBnIPRa4gJxwWWnltdTchndM82CeuR6l8BG8maJvXsP1+6IrGvhn8jalA
 BBOvh66I+Kqhfd8shAqG/dShUEiLNWT+dyMYHdgXetOni82gTUqlyRheF849cjBQSd5AOv/bYoX
 erJ4shgKZEqZMKxMcwnS3OvkyWzJO867nXeZskd2DMsyw==

Some parallel panels have a pixelclk of 33.30 MHz. Add support for
333.333333 MHz so a by 10 divider can be used to derive the exact pixelclk.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/imx/clk-fracn-gppll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 89ed7749bf47e..fe6ee77ba1485 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -88,6 +88,7 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
 	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
 	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
 	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
+	PLL_FRACN_GP(333333333U, 125, 0, 1, 1, 9),
 	PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
 	PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12),
 	PLL_FRACN_GP(241900000U, 201, 584, 1000, 0, 20),
-- 
2.43.0

