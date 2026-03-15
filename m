Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F204377551
	for <imx@lists.linux.dev>; Sun, 15 Mar 2026 17:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595681; cv=none; b=peMS27Ts+PneZOdr49s9F1o4PYkt6fLTblI5bM6X1npSfA/oJDBxwUoUznakVsVvj6KnZube2Av2UkBkWJ8tr9o80kzyOozqfaYP9bPMAxwDBE6M+W5asS8AZ4xAMGs38dLdJOVWmZgXNewg1vGK5zcGX4yK45r2F6d7A5r4i1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595681; c=relaxed/simple;
	bh=y8Mtr9pcqnP0vzscG2RNUti3BiDjvt7BhqDCfc6+Xhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qYXHs1OqmYE39v3Cv0xNUonoCDFNynhqcBsxN7GdncFXhc4iND35HLvxsv5TC47jfQXpdM4uW2luvP1Q3Jo9zBrrBbM9x58MaYBZGiYDmcIdqY8r0J2YYQtGiZcOSeGkLyDI3boqr7qSHCBsRawI1NrmGsYQX4DdzxPb8AW7X94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDMTMnDP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDMTMnDP"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852ff06541so42350025e9.2
        for <imx@lists.linux.dev>; Sun, 15 Mar 2026 10:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595678; x=1774200478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dhH5M5FJNqVSup5S7MKNqMM3K7FwdoGd3zPkVDPQec=;
        b=DDMTMnDP4L7TAGW4RRzSo1X2gZmfmVUrG59rbl93doYB1NiTVzy6hLTdk8GHRafrD6
         HH/k6PiNuBczZrzGJwKvYlw5n16by0N750g+U979mTHBHdQCIlpbKGmjQ6auK7rp8B3c
         RaepXDcxIiN8RmbmssG0sV8jxl30GbZcLvBKCXpLbCeN09CoLwaa0TEgRQQdQyisfcu0
         RYZOyabZcSDqTMCJvrlB/3Q2ZW9bz7/ey/mifne2aPjVAI7hxcHB5INJNja90EuIuyI4
         deLzCiUDpXUgnQxHEYYf3f7bCR0uSwbdUeXW0ivg1b5dBz/7tE4pDk9Rwv+fQwAmlEwK
         w5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595678; x=1774200478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5dhH5M5FJNqVSup5S7MKNqMM3K7FwdoGd3zPkVDPQec=;
        b=C/zPjttWRKPWmCuYv5gyZul8yA01GnSFvGl3FzLZjxdTBdK0ZMt/PnE0o/+RKD2Sv3
         5m1JcpsOM+HTmD2yySgk/JSdLEg2L4VvbbQu8/yGldHtMHdowUaRHR8W87zb+p2YuRFg
         z4Hf4QEIrdWVBJdJQpGYvvSNttj99oWZwPpW1SFp9/r/+UweTvZ9RLw4fXN1vTNIaOdT
         QJBXuJthcQFmM/Y95KLcsSkuGCWisdThWpN/5uQ/HyepUlG9PYYmXa9J21R+tDdRDq2x
         JHIL2rq5tw4bDAulSpfzigw2BPGbJuJjxAOWM8vbdKtTgA8hpbJ1QCq7PMx3A96CJMeE
         VsKw==
X-Forwarded-Encrypted: i=1; AJvYcCW6GIUTEYOlAaoKDaQPcaP1MUx+PVHo2uF3NxKFRfMl2IQJ4f4/IH6MsfpIEAcmN0fKRas=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq03SQUx6mtfR+uwdrao4WOqrdblwY5S1sFhoHn7rLwzhYNBpS
	17ZOxhMUMGj7vXXBx3qPjNh3wE/4p5MP+AVsa7nvjjJ48jI+CC4TB01S
X-Gm-Gg: ATEYQzyfySihGuCGRVQalaklXGNPenOlpZI/Jb8qzEoxt6SHPiJy3t89R8U1sie79bO
	pXr5SL0Qg5rR81Dti5CNIhT8wWCbCYkTCe0+ri37GSt5E7BnZKs9im2sdWC6sssSnh6D7JmxPw7
	7quPsQjjAwpLSET6Al4czcmG2/HVEYUoHsV3/9C10/vK2DFH882Hm4sQdJNy2hA3/toMYyZCMHZ
	QvRNJw5w/LESy8F5m1KyB3ZsAkRDoZopxzmszZcLZGp87n++DK9qLWxVUsIAvtj0sv8TWSiwLkp
	DSvsF4QYyihS2+ImkFeuiecCDJQYF6+K692aXihYrdnmuvxzdBECq57yoU0grBQH748Jw6qtXlC
	wk9w0dmLxHUEAzjuZa/tPm0uJ66I7vwMvCHYNfj1o0KFtfmv3+YTWAsDSCgBnVDjTOifGLNW8iy
	JFmQUdRhqDdEnZ8Wo+6llK1rMX/71t64QVd1c=
X-Received: by 2002:a05:600c:c162:b0:485:3fd1:992c with SMTP id 5b1f17b1804b1-485566d2fe7mr159704575e9.1.1773595677669;
        Sun, 15 Mar 2026 10:27:57 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6586csm73644905e9.20.2026.03.15.10.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:27:56 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
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
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 2/3] rust: block: rnull: update to Pin<KBox<QueueData>> for PinInit
Date: Sun, 15 Mar 2026 18:26:39 +0100
Message-ID: <20260315172746.270734-3-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
References: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the Rust rnull driver to use Pin<KBox<QueueData>> for queue data
allocation. This aligns the driver with the latest PinInit zero-copy
initialization abstractions in kernel 7.0 and fixes a type mismatch
with GenDiskBuilder::build().

Signed-off-by: Adrián García Casado <adriangarciacicuelo@gmail.com>
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

