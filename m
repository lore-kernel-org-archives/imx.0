Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C83B375F63
	for <imx@lists.linux.dev>; Sun, 15 Mar 2026 17:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595024; cv=none; b=ovgj2u30nQ1UPTEGlXAMz1I04HKFZIzo9QaTYO77NcRrwpmAn6na+rzntjho9iXnsn/vYi4XoRR95dNJC8rR0orEL4jGsetx4k8KAc8zjahKORqDse3DltMAGu/4GEMZLni3IzS/8co3elcTYTfPBKjAydmompoR99lXVeTK0XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595024; c=relaxed/simple;
	bh=iKpFG0Av0hoqoOlPYCyOzyzjoAeTHTDVQHbGXDPimao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mk2ffY6TQycVg7BC3KjQxzckFPhaZpGR8KnqsjHwRlcK11E1U4qeKgW74LAY6aScjkK69+pJ5/Ll0YYgxfg0oUzwKE+nETivXhx2FNGPgvkLaNURJn1gbIun3Byx7zhifaNc1olFK8jcLHhg6wTrVgHeiChRr+ZiHfWUnZ5qJ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dR1QSP2M; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dR1QSP2M"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so557343f8f.0
        for <imx@lists.linux.dev>; Sun, 15 Mar 2026 10:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595021; x=1774199821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBcY1jNO230ersIPOAT9WM1qbuR7iZiog4/B3vVvee0=;
        b=dR1QSP2M3VdGAThHDONoNjuVnBYfLXVFZgMCDBdR9SklFPhYQV/WNsRTZHBg60MDW5
         SWfZl4Oz1hVxE8KAT4qId8gxhEAmL5UXmOeKVTJQ0u3SdzsGZMbQyF7tiFmqcMIrm20O
         aCuw7EU+5HfVjvoU7bUcCSo/GrJ00/VAERIXKks3M/yEzzWUNIlxgEVdLarZiG5ExIto
         2hTN4hi9iUhSOB47jSrliKJzhXw7onkhDt/b0/DIQhBZIfRGBzCguPgTQQiSnc76m1KD
         JS1YE1e1/YWrxJ3vvOY7HUnKzLmd2DlwxBhAFE+ww6N2JPSYzrWm/8Ja+/5wnSNu9v3O
         j6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595021; x=1774199821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBcY1jNO230ersIPOAT9WM1qbuR7iZiog4/B3vVvee0=;
        b=ZkHOOxbtTdP79cy9SIL2BDcBaRZcRUbReYp2pRemZoLNB8tYZuqy/BbGIwqccqbCvx
         z6Vj0b01ncq3GjHJOv3FdFwm8KD6IK+bKyp4TUOfcKXfmWTKYRWYfXm105XmlhTq2pD6
         FobKLh4z2rhFB4xd9yEbdvvJ3qSDMNWBkhmH4Oe4I6hnQHXXV+d8fcC2t6cBav628ZFR
         hSQvtkjvrzMcGquBTHJmyw3n1DtY6PtL189GTbl00fqN0NHR3qiijlwjuyZLVhfXkXXg
         1SfAekqOXIRTwyqz2B829PMUZxELujIcdgv2fU7RPELwr0R4AVALOIGWiVNQXeWgx230
         lLsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmimA4QUhBa0OnruWZ0uRZPTTT8JfFlS+xdWR7m2wSvudYqsIHnybDGc+kqjmnzCSKu/I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk1hwd38ncqD80y5U1qTH0/me80whQ55yz4Wl22MTEzu1XGrRA
	/BmSu7puXHpZdcf9IrXPauku5dP/m6t3TDv9HP3h7NZQ/KP92YyVYCke
X-Gm-Gg: ATEYQzzCJhWgEsaseEcUDkhYPUyd9vcF5e/LeFwgxdkXAuE9BfvIqcc5uP6DSKXrJsx
	RweeOQuEHdstToGA3G8Lc5fh2xQDhXeoienksQ+D0V12D/rO1f8GKtoZHS5TgXkiCoWhRywt6Eh
	qNf9Bv1bwSWGaasevlQkVifUl/yQ5mcjLWypvz2lUe2oBD+QrJkqWZc754fbaXDsfu2C1Z5Oy/x
	u34oSqsQZ7Sc/hw+vGTeDn9fgeQ/9oCyu/hk7vnQvi1re+PXcaplglpS5IJGg0a1dMvEu7MMcVa
	66vODYXUmRz7vFRUtPkFwcQUd6mLZSarZ24lixsgZqBIAqo1svwGqguAT8+p0kDM6fcgH4t7IHU
	jhnFH8XeVceuxX8vcd4M+JipLzGnxIhAUXqvcb066JRMht++BXBHq8je+/pwEUrHurShf7lST/u
	OTkpCFpb8kr/u0xhxhi14eSaR1tuu1+EVKwA==
X-Received: by 2002:a05:6000:40ce:b0:439:d74d:a686 with SMTP id ffacd0b85a97d-439fe1ae6b7mr26631100f8f.28.1773595020567;
        Sun, 15 Mar 2026 10:17:00 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm40536429f8f.27.2026.03.15.10.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:17:00 -0700 (PDT)
From: Adrian Garcia Cicuelo <adriangarciacasado42@gmail.com>
X-Google-Original-From: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 2/3] rust: block: rnull: update to Pin<KBox<QueueData>> for PinInit
Date: Sun, 15 Mar 2026 18:16:51 +0100
Message-ID: <20260315171652.269020-3-adriangarciacicuelo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
References: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the Rust rnull driver to use Pin<KBox<QueueData>> for queue data
allocation. This aligns the driver with the latest PinInit zero-copy
initialization abstractions in kernel 7.0 and fixes a type mismatch
with GenDiskBuilder::build().

Signed-off-by: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
---
 drivers/block/rnull/rnull.rs | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/block/rnull/rnull.rs b/drivers/block/rnull/rnull.rs
index 0ca8715fe..23df23936 100644
--- a/drivers/block/rnull/rnull.rs
+++ b/drivers/block/rnull/rnull.rs
@@ -54,7 +54,7 @@ fn new(
     ) -> Result<GenDisk<Self>> {
         let tagset = Arc::pin_init(TagSet::new(1, 256, 1), GFP_KERNEL)?;
 
-        let queue_data = Box::new(QueueData { irq_mode }, GFP_KERNEL)?;
+        let queue_data = Box::pin_init(QueueData { irq_mode }, GFP_KERNEL)?;
 
         gen_disk::GenDiskBuilder::new()
             .capacity_sectors(capacity_mib << (20 - block::SECTOR_SHIFT))
@@ -65,16 +65,21 @@ fn new(
     }
 }
 
+#[pin_data]
 struct QueueData {
     irq_mode: IRQMode,
 }
 
 #[vtable]
 impl Operations for NullBlkDevice {
-    type QueueData = KBox<QueueData>;
+    type QueueData = Pin<KBox<QueueData>>;
 
     #[inline(always)]
-    fn queue_rq(queue_data: &QueueData, rq: ARef<mq::Request<Self>>, _is_last: bool) -> Result {
+    fn queue_rq(
+        queue_data: Pin<&QueueData>,
+        rq: ARef<mq::Request<Self>>,
+        _is_last: bool,
+    ) -> Result {
         match queue_data.irq_mode {
             IRQMode::None => mq::Request::end_ok(rq)
                 .map_err(|_e| kernel::error::code::EIO)
@@ -87,7 +92,7 @@ fn queue_rq(queue_data: &QueueData, rq: ARef<mq::Request<Self>>, _is_last: bool)
         Ok(())
     }
 
-    fn commit_rqs(_queue_data: &QueueData) {}
+    fn commit_rqs(_queue_data: Pin<&QueueData>) {}
 
     fn complete(rq: ARef<mq::Request<Self>>) {
         mq::Request::end_ok(rq)
-- 
2.47.3

