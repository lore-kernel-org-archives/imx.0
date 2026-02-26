Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CA83F076C
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 18:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129881; cv=none; b=f1fW8UWamnKMyXWLoHQePXk2ye7PZYCKmwPXY4KQV6TCcIPLtdeQPVItc2ETc/3AjntMDBGuYsnsyrGM81IKHLIVHUNj+9ou/wYdc1aJUjfPb75CgCrATbQ8ylXK+EQyvibg7gBrbMZG4+qbK/sgnnObbHNlY4c6FuJ5pcoYI/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129881; c=relaxed/simple;
	bh=6qZbkdxMtSneOlfO4R0ArJjnlVRfKKFMaBW/o8xc5Po=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=e2FFDE9GLOToctatplZY3z6c5E6XgWqFuhGrhc9Rye68HUFQNxtpmbI5zYT82ZqpOSwbI14F/S5bABisZBawch8i5EFCPzqUtk3goAfzQ2poWUq2uGeCnq0EvAqRcO9IDNPkTFHmSdnO3aselVg9zFiKOrnQaIvuSu/ez9eX/3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F5Qhg7u/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F5Qhg7u/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ijW7r95GaxQntZ0kViwhWrj/j40WE3Casb9HevCeJAY=;
	b=F5Qhg7u/iWyxU97gjnPyvKFgPdwS/pSuEfUB5vgHABVlsYxsR6396D2I/ozEjODNLuPTjm
	URWBoV+voH57augNRxgpsn4N1hrwV/Df2oaTqxkrBNhVMmyN5H0FOXkY9N3vWOyaaeu3j2
	XSB7eVbBnDdA15sWnHFMXy3//a5pTII=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-TjYTgMaNOCi7woxqPY7Ecg-1; Thu, 26 Feb 2026 13:17:57 -0500
X-MC-Unique: TjYTgMaNOCi7woxqPY7Ecg-1
X-Mimecast-MFC-AGG-ID: TjYTgMaNOCi7woxqPY7Ecg_1772129877
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4d191ef1so143344085a.0
        for <imx@lists.linux.dev>; Thu, 26 Feb 2026 10:17:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129877; x=1772734677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ijW7r95GaxQntZ0kViwhWrj/j40WE3Casb9HevCeJAY=;
        b=CoGbM1zHNOZJ99+dxO8VoRReAq5HmnjwLQ3dpX0d4DDkGJGLsli41ij4JFJxDLF0S4
         DOTcLSzJWsdIpPkAZcFlYaBtKeBiIzaHoRgiS2/oy5US+vV4hQ8vVoj9V+hxU4bn4Fsl
         2N7gAM6QO5ZtoxN1Lp0Ju8GfXgmkcQYMNdpcO9OCcjx/LymTNrn4W1pHSGadZnvnp/0e
         Gm68sQRWSueiL5EV8i4fvfN6GyDKU/Ul3TdYlvlsFO/TF8BNNl8C9u1Hgbpq6w+pF9yS
         VKjOxcm2bYIrJYV35HHOw7Oh5uA5QZFpjAIt7b7IkXVmjqPagcYmX+v2Ze+xB1szNQ0m
         EBog==
X-Forwarded-Encrypted: i=1; AJvYcCXMUnegzY7XNIx5d3N31eCRAcKqOMiLYLrOv417qvhs58FOVvx5WWmKtmf0e3YhmE25+gE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLhtB84rFrnVJda0UMTf8lVxNZi13+KjL48buPB/nXL71PqsgQ
	Ruu8WYq1QNGnBQHc7med6MGKNSwxLNKa1IvxvQybaQLnileXVOpBkkUR7HOJ//FD2et8e+PXdT3
	N0X8//z/rFV9dKqhEsXszdr5x2or1dkbpjkyUlW8XJ0LeH/cnnlBd7w==
X-Gm-Gg: ATEYQzxk7zxsYyPemLSS6rMEMjx8oadGZ9YEyABUQ7EyfrZ0WVal2xsVC5XQ4jWytKY
	AS0k46UFzwmQjU5QJGvwXuGUwxpwRh2ZVlPFsk8PRgOxYvNP//9mBQ5DF3/PsMif3bKZacYqs2b
	erT3aTPluRCy0fpfyMGDOXmyKli1tlpYwp/vrkzrApHLHnVq1KCTSBl9+kuK//DXZ/Th079Q971
	ChIBNkgFpM1TdPHJzx0UaE1z4GUNFT7v/N55eOfpr1sXcdU8UKNCXykcFhfUBRLMpn4TfRbgc9B
	hE2VYBSN4qv523digvCQteNwA6E8OHBlB3uR8jyGFuNjGq6ym86v2R0cpItns/ZXpDCu/6AOZkB
	Bce1ttAU7iej3tEQSakkjOdZQrwmbrpjO3WO0FK6tRQ65Iia79MnIXZF5keRD
X-Received: by 2002:a05:620a:4621:b0:8c6:b315:1452 with SMTP id af79cd13be357-8cbc1122f4cmr327773585a.7.1772129877009;
        Thu, 26 Feb 2026 10:17:57 -0800 (PST)
X-Received: by 2002:a05:620a:4621:b0:8c6:b315:1452 with SMTP id af79cd13be357-8cbc1122f4cmr327769285a.7.1772129876524;
        Thu, 26 Feb 2026 10:17:56 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:55 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:51 -0500
Subject: [PATCH 07/13] clk: imx: scu: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260226-clk-det-rate-fw-managed-v1-7-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2881; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=6qZbkdxMtSneOlfO4R0ArJjnlVRfKKFMaBW/o8xc5Po=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9BlYqx15HV2X+DTHWy+tQ3WLucWER1nb59t0fHqz0
 INPZ69bRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABN5OZfhn84r1c09UaeFpBPX
 16vNL47RqE3oUs/llWBLWtxVy/HRhuGv3Nr9MYVLlc79SRF/8cTkh3j816Wc+19ncGTJlJ6q+Wf
 FCwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -dOjROTz8J3Uz1nKTZgw98wkfCsn9EtieL2Ecz5Y1eM_1772129877
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Abel Vesa <abelvesa@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/imx/clk-scu.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index a39c68d664655537e81df55c7e6d32304de9338a..db8e5773140a7f5fcb3b36f372e22f43675ee6ad 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -262,23 +262,6 @@ static unsigned long clk_scu_recalc_rate(struct clk_hw *hw,
 	return le32_to_cpu(msg.data.resp.rate);
 }
 
-/*
- * clk_scu_determine_rate - Returns the closest rate for a SCU clock
- * @hw: clock to round rate for
- * @req: clock rate request
- *
- * Returns 0 on success, a negative error on failure
- */
-static int clk_scu_determine_rate(struct clk_hw *hw,
-				  struct clk_rate_request *req)
-{
-	/*
-	 * Assume we support all the requested rate and let the SCU firmware
-	 * to handle the left work
-	 */
-	return 0;
-}
-
 static int clk_scu_atf_set_cpu_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long parent_rate)
 {
@@ -436,7 +419,6 @@ static void clk_scu_unprepare(struct clk_hw *hw)
 
 static const struct clk_ops clk_scu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
 	.set_rate = clk_scu_set_rate,
 	.get_parent = clk_scu_get_parent,
 	.set_parent = clk_scu_set_parent,
@@ -446,7 +428,6 @@ static const struct clk_ops clk_scu_ops = {
 
 static const struct clk_ops clk_scu_cpu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
 	.set_rate = clk_scu_atf_set_cpu_rate,
 	.prepare = clk_scu_prepare,
 	.unprepare = clk_scu_unprepare,
@@ -454,7 +435,6 @@ static const struct clk_ops clk_scu_cpu_ops = {
 
 static const struct clk_ops clk_scu_pi_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
 	.set_rate    = clk_scu_set_rate,
 };
 
@@ -491,7 +471,7 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 	 * clock status from HW instead of using the possible invalid
 	 * cached rate.
 	 */
-	init.flags = CLK_GET_RATE_NOCACHE;
+	init.flags = CLK_GET_RATE_NOCACHE | CLK_ROUNDING_FW_MANAGED;
 	clk->hw.init = &init;
 
 	hw = &clk->hw;

-- 
2.53.0

