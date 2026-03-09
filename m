Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74583D3D0F
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067181; cv=none; b=FFo1sBdfyNtrj2TQ9K+mcn/PRQuKSC1Wq15+q/wYLyveSRAxR5q1rZnCxIY45yXbxbdvjY6UdKMwA+AQqk+nPxS3DdBkvM+fBgI5FYHgodCM5yH9Lmz1BDdR3HOWr0tk5AeDFi7xyCnNKEeKat/gZkXA31Zr1GpNElChaJ5wc5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067181; c=relaxed/simple;
	bh=GIQeCWpXzFUtNJp/mJUZgo1pJ+8bxueWsKYYeUgP+vk=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=AkzNc98a55bL3cG+vgTXEbvbYOt7yQ3hD4W57Xd6g9MIXO5mZgZdQ1ODfcJyLWizhrrpTE9AEQmOSjV1hkTkdfR7zD0lNioOUWzxOm7wLI06QjpctjDwI3hPQtmW+B6qSFcL+UfM6b6lYtqDJnD7PcrJuMlpMYiRdyA+knmqYQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BUQ8cjP0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BUQ8cjP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FJJogOm7mAlsex83R1hkauB1mXrgfQo2P5H45OLn0pU=;
	b=BUQ8cjP0OtevqaMKjUy13bCjoVIgCbAytsjJ5QOOMLK1amz0NnKCcwFzZEdIwGkyryT+yV
	UA6m2QkCrDoXGkC7j4xYhA+ln8tTtL7uv8zKOe1Cue6h2kPJZw95tbKAa5ffYo4jrHUy72
	vCBJG2HW+6EkKmsc2avGEPzfJgrJFgc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-DIU4An9hOg28CSzrCFF5xQ-1; Mon, 09 Mar 2026 10:39:34 -0400
X-MC-Unique: DIU4An9hOg28CSzrCFF5xQ-1
X-Mimecast-MFC-AGG-ID: DIU4An9hOg28CSzrCFF5xQ_1773067174
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7fc27cf7so851781985a.1
        for <imx@lists.linux.dev>; Mon, 09 Mar 2026 07:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067174; x=1773671974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FJJogOm7mAlsex83R1hkauB1mXrgfQo2P5H45OLn0pU=;
        b=QntnjvDWnkmFOTo0+vLAGxkV09BSIUL5ziKKmKmHKmGzdVfvajJNEOGlSx97LxLvUs
         u8L8gWmkPU1psRkkseq2louC/X94nbZ49FxAB/eNJ5HlLs1nJP9/BDRqO+5dIkEl+3ZO
         xh6XwCXWodV0bewX+2EoGyfaoFnqv8nLLXNBt3BZ5OORynvaGRt23dW6XDxvkc4fDxmM
         xaA2XeSOOzAQlQcHMNjbxb2GoDSgqV8XeZkQxKRDAczMnpUstwgBcet86BhvHcfv7yhu
         1oAZYryEWLg3G9d4l8fHkZSBBtMvoHF/O9Emw3WJtn6ZPndMLZfBHaElpcP0SBl7fQ6X
         u6Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXG1wJoMAfH+l6Eb8PapAp+C8frZc2DtSO9/3I0H9Lgh+gdIR5x8Xw9aUIlaTUG25Xg5d4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzer6M+tgFuOc1UFsS+z1pfVt52IbGmCIvQL6hdLKg7sZjuVYzU
	aXsQtNeoE8y4d8lYBQXxWcZgXQPqms3zVNlHdZ0RH4+fNR+lYB/ds3OtG+kMuyIrjikoQ+9LBpF
	7VXh6dNw9c9KBjxrEvm5oD0K+3xSdwS1H9IjujkhUnFyX0Z7HChegTg==
X-Gm-Gg: ATEYQzx2aDy4oYPRoAG63WxAoTKGWifaMOBrVaOjSAsZR0fLk/Fjav+lamcPKvLxhdk
	e51JL/zSkNGlSXVJKGsDLSwfUyvp/Cr52+Yw/voyXJqvs7fjS4SyZQjsQUp6mjfJs34hns8nqAd
	moDMsGQwviTbBZdv6XJfA4ytuxSBh94DUj0MZSw42IGhUKLL3FBtrY45sxspEU4THutY6jNtTyO
	9cI2+jYglP34lAVf1VLhHpGXI0EMER5/n8xc5giG1ZvReVg4kLwi5emlpYMyVgphQZ0FrxCbA9L
	ZJaF6wyWzxJTdrfBCwOzsOQXK/AgTo21cAZ6jVmHa/4bEXd9FlEl4NwZPjm4iZT3ixwSlX2JuTq
	5zpyhiVgr1Bw3Ra+Rw9rhrC5vhdGoad3aqE8/0nYduDr7cHZ7l6XqwmRUOL8C4Q==
X-Received: by 2002:a05:620a:bcd:b0:8c9:ebf3:7623 with SMTP id af79cd13be357-8cd6d3847f8mr1387163685a.20.1773067174183;
        Mon, 09 Mar 2026 07:39:34 -0700 (PDT)
X-Received: by 2002:a05:620a:bcd:b0:8c9:ebf3:7623 with SMTP id af79cd13be357-8cd6d3847f8mr1387160185a.20.1773067173790;
        Mon, 09 Mar 2026 07:39:33 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:33 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:46 -0400
Subject: [PATCH v2 07/12] clk: imx: scu: drop determine_rate op and use
 CLK_ROUNDING_NOOP flag
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260309-clk-det-rate-fw-managed-v2-7-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Peng Fan <peng.fan@nxp.com>, 
 Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2909; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=GIQeCWpXzFUtNJp/mJUZgo1pJ+8bxueWsKYYeUgP+vk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3Z4oJ3R3zSTjPU8qrm2YlCE1aVbV7+2GsQknTcoOH
 u/9VXNgX0cpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATydvN8JttUR6/67KHqj2N
 jU02NcpW0pUXDouve7JATG36Du4NTmEM/wz5HP7ZnliZvbBZeUPmgSXZZuwM3VuKa/ydc/JZFjP
 p8gIA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wicm5_CnzwLT8gS5JigEb4_E-HSmU_Ns57Zh5E1_J6c_1773067174
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_NOOP flag.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
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
index a39c68d664655537e81df55c7e6d32304de9338a..13fb77562b031bb82d6fa2d19f9092ed33966aa4 100644
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
+	init.flags = CLK_GET_RATE_NOCACHE | CLK_ROUNDING_NOOP;
 	clk->hw.init = &init;
 
 	hw = &clk->hw;

-- 
2.53.0

