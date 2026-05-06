Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF332036E9
	for <imx@lists.linux.dev>; Wed,  6 May 2026 00:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028643; cv=none; b=tTHIl42gCi7h/zD5/WLuGWBc0CRRIfJsVdV8zwtHt9okS39pSlfQC16NoZa+kV7HR5Oxnctn1sC+uNQL/AZ2VPuwsg8ltZFI4sy7ystUtFLlGJZNnCChmB34xUB8Rsev8yszvRmxdhYo/qqvxk+VY2DD06E7mgyYoOHnoAZTJIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028643; c=relaxed/simple;
	bh=BgD+oQMuEH1fjaVOsxXLZwQNVYs4vGf/5ml2JNrIVXU=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=BNBSOxnrL+hYP6IS/fp9gx2uS0ZpKnYOROtx9t5MyWNXndG2A9/+h5mAEsR29MRCD5ySdYukJoSNsQ3mJ76q858E3VN9RVDcAgl5oOl4pEGhZbtNKMc8C/SaEWU6A1XNUlB4KLA+/vWzhjwzjwEny8D2s0p0zUV9iyTRscOAEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fHFv2fVS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fHFv2fVS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=30rTgzRaj4YeHU5CkBXJIEPPpMq+Ia7k4HuNzziJrXY=;
	b=fHFv2fVSHunGLEvfWB1PzhDJqoZqvDt260g34rcER028Zwe0PupSvMNZytqY3ss7xo3eFW
	Qpb3tWUTTM9zKrmOSS6lhbcn7lZrq5T96FkTJQqqrTRQ4LkF2/qX/Cgz8/ck4wrE3GRo/r
	eBncaX3PkUqmmMat4qxZKgzLDaKuUYo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-ehDBLbB9MZKlXDHUqfWW6g-1; Tue, 05 May 2026 20:50:39 -0400
X-MC-Unique: ehDBLbB9MZKlXDHUqfWW6g-1
X-Mimecast-MFC-AGG-ID: ehDBLbB9MZKlXDHUqfWW6g_1778028639
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eb52a22e85so363705685a.2
        for <imx@lists.linux.dev>; Tue, 05 May 2026 17:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028639; x=1778633439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=30rTgzRaj4YeHU5CkBXJIEPPpMq+Ia7k4HuNzziJrXY=;
        b=c7bI777aLd8k4C8oOMwp6xxpvitBOpHHnBDIls/mx5IYLIPU7rwTHIxl4a4RwfPofi
         S82UqKGg6t2h9ZySt04lAMAwRBMmG/Yt5OTlf6VBI4lTpWQ9hqGF4wD7fS/s+g89Rll/
         dzqwBK1YpBbI5tu/OWeeBKaiD6sThOxJnlOm4Y3GrGKtJsNVVxvhbGQnbJgqHY5s5HZq
         /eQS/quBwzV3Dh46aC9WfvdrnJK3Pm3avZ3Xn9VnXU6uz+7Q2dFHaB2kRDSDNMGKmqNn
         fX3/l7Xo1w3Bf85sweFUc6nfLPKv5Lyg8Wemz5TveaoSE5sCi16paSmOwxrYdE0Lei+f
         uutQ==
X-Forwarded-Encrypted: i=1; AFNElJ87MXf80LKqntK5LWUc9EcN2KHyWXr0eMzYZmC7+f9iSyeVosGXPCpfVnJ6vaShKh80hjI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsmDLzTQU5PlFRcq5f/Qpv9z7wCCXfDoBP94JqV78uJtnxZIn0
	ZpqvdZCaVEwk/myaxLP7JRp4BMSEuBmGXv8x09WKub+exkp/RWx8xxfieproSPqDUI7dBVblrEd
	G6/fBB/tiP7K+HXhYAawzu3qB5SDHoCiNzhHCbh7xqP93Kh/jPrzy+A==
X-Gm-Gg: AeBDiet5/jD7kkfDgGJSL41VAdeTJzsXx8a5keFi2pQf46OOuU7oMKZFmBE57jGXVQ5
	4h4JH5fRj4xaAibq6QeGXXT8W3eikAVSc1/iUgVHc4EQelfHnfUTiwTWifl1J4XrEyzIudFsn5N
	wELD4wS171/rTEMSNQYDG1uAMbZde6AB5ne9RRUUo5qwvmqh/4w7YASeb4qIETPNgGyxR3ChxvG
	k1yEVz8D8RU0QaP29KAAUVFFnTUTzQD4TVm0bniUiQiBZRQr7a4+M54AxPMFv0F6QVU1WyxwbuE
	+61xbcSzUzQN2jgKVBDk609ySDA7yDFjfQwICRubWNExpfnWm2UPlX43gCvEG/wEyg2M3BA1+fi
	opZevy+sFo7cOxMI/E4pTiklv1M+ki8BzQ4/M0IEPUp9iLoNDnaRi54qHTUfvRrgQLEAyzPEB
X-Received: by 2002:a05:620a:6ccc:b0:8cd:b617:6522 with SMTP id af79cd13be357-904d61ec30cmr233506685a.29.1778028638982;
        Tue, 05 May 2026 17:50:38 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccc:b0:8cd:b617:6522 with SMTP id af79cd13be357-904d61ec30cmr233502385a.29.1778028638433;
        Tue, 05 May 2026 17:50:38 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:37 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:00 -0400
Subject: [PATCH v3 04/15] clk: imx: scu: use clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260505-clk-determine-rate-noop-v3-4-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2668; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=BgD+oQMuEH1fjaVOsxXLZwQNVYs4vGf/5ml2JNrIVXU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfCwvr/K4sY+A++OW289npydPX3rounzuJQ53trOq
 Lp+RzPyQkcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATWf2O4Z9mK3vLvvUpysu8
 lodnv1UvrZnRZyPM33NxHWfsr7RWw2CGP9zL+R5sknm1LGnt8feVfgbtdzfqaG7tfT9LRLlz0ea
 mZwwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v9UnsKmcbGPi5NMe2EETt4uHIj0eO7raJSuE6dy9l60_1778028639
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Abel Vesa <abelvesa@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Brian Masney <bmasney@redhat.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/imx/clk-scu.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 658b6d94de9b..44220e9c5c2a 100644
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
@@ -436,7 +419,7 @@ static void clk_scu_unprepare(struct clk_hw *hw)
 
 static const struct clk_ops clk_scu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate = clk_scu_set_rate,
 	.get_parent = clk_scu_get_parent,
 	.set_parent = clk_scu_set_parent,
@@ -446,7 +429,7 @@ static const struct clk_ops clk_scu_ops = {
 
 static const struct clk_ops clk_scu_cpu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate = clk_scu_atf_set_cpu_rate,
 	.prepare = clk_scu_prepare,
 	.unprepare = clk_scu_unprepare,
@@ -454,7 +437,7 @@ static const struct clk_ops clk_scu_cpu_ops = {
 
 static const struct clk_ops clk_scu_pi_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate    = clk_scu_set_rate,
 };
 

-- 
2.54.0

