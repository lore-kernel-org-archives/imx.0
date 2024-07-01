Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B57F16DEC0
	for <imx@lists.linux.dev>; Mon,  1 Jul 2024 20:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719867312; cv=none; b=GrXPuLSU5JcYBAb+ocREw8AGmPLG6yVW2LWMj3vLF65mbetFp53VVWeq4pXDJX7SH4TDkhmJIU7uxQNF7c1XZe4xRimsC34RAV03Fl6fIQwnhkApK3wWk1YVDhuvdzRSO+EZ6rMdo9fz9EuR4DnEdI7TQzqKSewkJjc/7Ru1hXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719867312; c=relaxed/simple;
	bh=kX7MZxVENfv94wL+QrYqkcNlABVfQrdyPkrHiDgyWjg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bO/OMseRcilm4RDtcMvXvbd1kZ7qmp+aO8FsL6n8UbdWC83o1Z4FtF+z3AKKLry+4fkEtCAVzb/KL8hzm//qKazGtHsy73RjPWGZFSHUyjlHH+zaMjdqmEMuXgA1C4wdGMt4Dp1Jlh5PW/XMyeM8ei/PuFKQ5sQndoB1Fm2YgHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTXz+SaW; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTXz+SaW"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7068ca5a807so198165b3a.3
        for <imx@lists.linux.dev>; Mon, 01 Jul 2024 13:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719867311; x=1720472111; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YkUjNOfBhiaGxWDuumc0E1As2Jd8Umf0Y+lF31dLNhY=;
        b=TTXz+SaW8PInPh/zC8sYwdOo6quAKLM+uGD/hMoQxrbSy1SZTRauKLU7TiBrEJLHDt
         3/BfceVB7SDe2rsm25ZZi1WzdvKsW4qUE1yScLVHxbLgnRitCswr7XhhO53KPY/kW16M
         aOq9B9+vDTVEAStncKKgflW2W8mxQaPzMPxZcUpls3vzjLQZ0CByaLlZVtOv7Eifsb9p
         OF8lMF1G5NCLXhjXJdzJ+pbEIFU42tf0g4nzG4+kRcjmS8tkulHmHrc9EWBfv0uObI9O
         2krqHu9gz+ZXIyd34WCTDyAV8oD+CMKz3QTtmppbVhz2c13zue+r/CTKzCucvmVkhyid
         dkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719867311; x=1720472111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YkUjNOfBhiaGxWDuumc0E1As2Jd8Umf0Y+lF31dLNhY=;
        b=UJa6YGjc4BIddyALPNgpgfzItpNE+UbshtRl9xpJu466hP2BSW5fl58a2cJWBUi8Le
         y0Nxw0ixIva3R0lfBqVBivaPWdNkydoT25ep0qy+5zDpZRVhGP1XpGVZVhM47ve8YeTx
         I3IX+vKEM6yncUb48WwfoCy8ye144RQzGTIFlYTOad5m+49VlPEosPCjYm7nLPi/4cff
         I8Yc1Jih1r4+FH6kk33WZnUs2mYTquA+nfQejJ6uReaMnj7TycyYPZvZhmPqhxJY+EN0
         RvccN4ulRDtBtAaTs0Ap30Ex2Tt0XhU+G+AwPdGU4ugl+ZykBgz4/NAEyj0UByWkw2d8
         9NxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcTefIc0A6onxbB6DNSEXOwscIGuZBOkjglENoBF5cykmgtylAkPVlsYWEw68G7cQnOT9N/1PujuIoHvHC0FQbq8dg
X-Gm-Message-State: AOJu0YyVckTUd/tKudFQJ88W232TZEW8KlklY0OMFGQP0wm/BtOIIugl
	/kabpjID0tpoFgkpUWvDL0D39rhZHb3Z8YzUffDTHAi6WXJStA2AxAMN+w==
X-Google-Smtp-Source: AGHT+IFDcv7a0RpmKggtPswqll4BHilpwu061zFF6Nvcx+6O0kyHDJWFCgbtdFGQn1biI87o+bNFHA==
X-Received: by 2002:a05:6a21:9997:b0:1bd:289f:2ccb with SMTP id adf61e73a8af0-1bef62c978amr10181144637.6.1719867310817;
        Mon, 01 Jul 2024 13:55:10 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:27dc:3453:bfb9:bce5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804989f5asm6994602b3a.195.2024.07.01.13.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 13:55:10 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] arm64: dts: imx8mp: Remove 'snps,rx-sched-sp'
Date: Mon,  1 Jul 2024 17:54:58 -0300
Message-Id: <20240701205458.164053-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

According to nxp,dwmac-imx.yaml, 'snps,rx-sched-sp' is not a valid
property.

Remove it from the imx8mp board devicetree files to avoid
dt-schema warnings:

... 'snps,tx-sched-sp' does not match any of the regexes

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi | 2 --
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts         | 1 -
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi     | 2 --
 3 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
index 8be251b69378..15f7ab58db36 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
@@ -71,7 +71,6 @@ ethphy0: ethernet-phy@3 {
 
 	mtl_rx_setup: rx-queues-config {
 		snps,rx-queues-to-use = <5>;
-		snps,rx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
@@ -106,7 +105,6 @@ queue4 {
 
 	mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <5>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index c2c708c492c0..35e0ed23bbdb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -294,7 +294,6 @@ ethphy0: ethernet-phy@1 {
 
 	mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <5>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index c96e74684e03..d23a3942174d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -241,7 +241,6 @@ ethphy0: ethernet-phy@7 {
 
 	mtl_rx_setup: rx-queues-config {
 		snps,rx-queues-to-use = <5>;
-		snps,rx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
@@ -276,7 +275,6 @@ queue4 {
 
 	mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <5>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
-- 
2.34.1

