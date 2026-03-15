Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2EB371878
	for <imx@lists.linux.dev>; Sun, 15 Mar 2026 17:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595521; cv=none; b=b3gSUalKC/zxZE0WkWLz3TDAlY78uIfIYA6VEa3eB3Vpvqt7gBBuMHt1h1gM/26C44Sr5855L0yi++6fGnpLI3dXz8VPzZLFLaO31SKy6pxDt3d7qQ+WFHWOK6hEhDKpVZigeesiG2HF8SU8mzRZK2I3996jI6YT7ifBVpKGFu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595521; c=relaxed/simple;
	bh=iKpFG0Av0hoqoOlPYCyOzyzjoAeTHTDVQHbGXDPimao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aEEhIZkYW57Pwop6pC9P4pnAS8NFQZ4WBCgxAt3w0PFjDZa1YypLRNfismG5UZJKLjt092OEZBOvtJOlCEhWQ0DnfG6St5QAXRFzKWyb9+yaLcuaLopF8WsdvQVnyNjlOEvYGg9jjaNmGTMShGmw3nSWGpewfcqLUK+XudM4AIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niWD3OCk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niWD3OCk"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48534237460so42258835e9.3
        for <imx@lists.linux.dev>; Sun, 15 Mar 2026 10:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595518; x=1774200318; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBcY1jNO230ersIPOAT9WM1qbuR7iZiog4/B3vVvee0=;
        b=niWD3OCk/QDpFxU4YHK/UsZ2rV1HRim7VICagzFAJt+38zXw2/Stz2qHdAkhjsWfDy
         mx0275BUGpcZWLCSquE+5xox/tkUBsbEilmxFbdnat7fcyLocRFN3BNpcM1iOkl7pOs5
         gMdqgmeQ3x5PO/wgVoPC1x+/RB7DpouIBo1O5bEflYnVbOBA2xyfvRpY2ARgsCUkr+jq
         8QO6jHF8ffGQeXKhttGpAUivlFKWvEWJgm6EEWbfo8gNHy43Galc50Cs2IvWOk8eyfu3
         0g1+fyEf6Nvoyxtgpyp1jV8GNZrxLhIavsDswFyDkipcnkmZ8mx76uds5ZtewQC6phEB
         LJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595518; x=1774200318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBcY1jNO230ersIPOAT9WM1qbuR7iZiog4/B3vVvee0=;
        b=ZvylbFzUyAZv7EAPKtPooxHeQiiZyykUIE7iRqo3TGWqJJ+YKXtIYBAqZ44A+32Zd2
         j8hWL1heMOpJiffB7FCQ3gJOjXV+o+88Oxwp3TaeoKYQBCJYWhz2eCKcZGzeVWcOULu/
         A6SE9OB5Gncpk3BgG82O2ggb6XBSQAFsg1BYMK50F45+kj6eUsw/LPd4TSt+aDsZUW8Y
         omKiJXCO4pxB6oIB7bUioZmhDNfbYOx2IEmihgRB/yxK7dq+1nzxK4uQr+sjpKWeJGGY
         tQL6ZoiI5iwNkdiZXhAPcLteyLMCTkOTwZCw8/0b+iaKdDPq7K+48Hk6XqsST81sIFbd
         eaow==
X-Forwarded-Encrypted: i=1; AJvYcCUYn6UBdwF/9bxhy7xSaU1bU3r5cpzZ4yxqALmiGhLsuQcLy1VXqyNV2KkA9FlWQapIX8E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiRpC7F7yah8/HHkwEPwmvntxEawx2TAUPz2okHtBNCWoGRdJQ
	Goezb+cvoCgLoev8XbX7rJtQkkcoui01+MSvWvVkTgvIHvI+s4ICpZw2i3tYYZqFgYf4IA==
X-Gm-Gg: ATEYQzw2Dhf8PRIDPAd2DM0wM0WBykMt4FUWNSUVioxFAFdhdqUi9zAUXetTlJBJaPx
	7bLneQKHFrlwESBM4zkmL1z1BUl/LT6DSgGNnd8/VsnRiIDF1tDhofHCdjpWCB3VAkXmrFFaC5e
	tpO+ncp20tRvcQk1SS892I/lgzxS/2pCMf45Ghd6/qvDQc0VOsVUo0E1Fac2uoKA+g/96pA260t
	Bm5unqpjgDsPcinwN53mNHLVPwIHBr4l9Yuzh4mMVxg4L5zen2h+YGmAlanYMB5lih4VKNgmo7p
	V25v+ByDksvyySc9MRUxDF+X9fjHIjYZMPAGyO0YzuM6prujs2YxrANoLJhatd2oUGmSZKxT03J
	JXNjmHQv+YJJWGo/W3IRxnjwXqAfNLkq5+YUMYtSPJGWAVnFvhmSEywhw14OgT31dAJiyUMDGzV
	virLrxhlD0VLLThsajxwFsm4eOyNDBXH7fjMc=
X-Received: by 2002:a05:600c:8489:b0:482:eec4:76d with SMTP id 5b1f17b1804b1-485566f7a2amr181338655e9.17.1773595517762;
        Sun, 15 Mar 2026 10:25:17 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73easm457168325e9.3.2026.03.15.10.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:25:17 -0700 (PDT)
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
	Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 2/3] rust: block: rnull: update to Pin<KBox<QueueData>> for PinInit
Date: Sun, 15 Mar 2026 18:25:06 +0100
Message-ID: <20260315172507.270480-3-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
References: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
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

