Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA063AA4E7
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558900; cv=none; b=O8kPHnbtLttMbw0h1gR/ov8vDFP/BCKzhqEVfBmuvPlXhosuZMfUjCGdT1/37Kj/YohkHxOVoPHQv3/ACiKVD1P4SAvTmE9BBLsCKK3gb4Ol+/FC5K4/VUOsPX6ccTdFEL4xY793cQnvidh4cZNdxD33/ULprgrL1Yy3c7Lmn10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558900; c=relaxed/simple;
	bh=b9hOXyslqJyXK9TLIMvo1eypOQPDwowlp3t6tklrexM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XEvQJ0U7TSh1ZXUTBA2GwAOnT2MbyVOKVXyfuj0PDiEYvNECOxMfHu+6zpz9INHixqDi7jVGRYrLAV98iY4mj8Ma4/rrihB0r5WKdFkeAwG3AuiKDZi7FmaHlxNYfa2YEe+nKmkrubJUsuLfB8auo/g4XUT68Ia2xzcDCSzok6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=C5X+Vejd; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="C5X+Vejd"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1775558890; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Xck3+WNDdIEVOXQAh3tLFBYdo8woEiYyv83w5MePz5M=;
	b=C5X+Vejdzd6puTTBE55252wPNxkOTzi9OW8l6EjidtHkRU2ZXg/RP8+s4wE6Gt5fcrUfU0DChr2Jkr+5kkwVojaG9L2G5OEp5KfYbk8Icfz9tMdKHIcDPCkD9QF9jiXdoxxkBxrx+yQ0GnZYlzbvb2hfCiq7cPKnGN/cCTYLi5w=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R491e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=guwen@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X0bYxc9_1775558886;
Received: from localhost(mailfrom:guwen@linux.alibaba.com fp:SMTPD_---0X0bYxc9_1775558886 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 07 Apr 2026 18:48:08 +0800
From: Wen Gu <guwen@linux.alibaba.com>
To: tglx@kernel.org,
	richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	jstultz@google.com,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	daniel.lezcano@kernel.org,
	sboyd@kernel.org,
	dwmw2@infradead.org
Cc: vladimir.oltean@nxp.com,
	wei.fang@nxp.com,
	xiaoning.wang@nxp.com,
	jonathan.lemon@gmail.com,
	vadim.fedorenko@linux.dev,
	yangbo.lu@nxp.com,
	svens@linux.ibm.com,
	nick.shi@broadcom.com,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-fpga@vger.kernel.org,
	imx@lists.linux.dev,
	linux-s390@vger.kernel.org,
	dust.li@linux.alibaba.com,
	xuanzhuo@linux.alibaba.com,
	mani@kernel.org,
	imran.shaik@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com
Subject: [PATCH v2 2/2] MAINTAINERS: update PTP maintainer entries after directory split
Date: Tue,  7 Apr 2026 18:48:02 +0800
Message-Id: <20260407104802.34429-3-guwen@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20260407104802.34429-1-guwen@linux.alibaba.com>
References: <20260407104802.34429-1-guwen@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update MAINTAINERS to match the new drivers/ptp/ directory layout after
moving emulated/virtual PTP clock drivers into a new subdirectory.

Adjust file patterns and per-driver entries to point to their new
locations, and add a dedicated MAINTAINERS entry for the emulated PTP
clock drivers.

Signed-off-by: Wen Gu <guwen@linux.alibaba.com>
---
 MAINTAINERS | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cb48c9ad9ddc..2b5464e38238 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18335,6 +18335,7 @@ X:	Documentation/devicetree/bindings/net/can/
 X:	Documentation/devicetree/bindings/net/wireless/
 X:	drivers/net/can/
 X:	drivers/net/wireless/
+X:	drivers/ptp/emulated/
 
 NETWORKING DRIVERS (WIRELESS)
 M:	Johannes Berg <johannes@sipsolutions.net>
@@ -21243,8 +21244,18 @@ F:	Documentation/driver-api/ptp.rst
 F:	drivers/net/phy/dp83640*
 F:	drivers/ptp/*
 F:	include/linux/ptp_cl*
+X:	drivers/ptp/emulated/
 K:	(?:\b|_)ptp(?:\b|_)
 
+PTP EMULATED CLOCK SUPPORT
+M:	David Woodhouse <dwmw2@infradead.org>
+M:	Wen Gu <guwen@linux.alibaba.com>
+M:	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
+F:	drivers/ptp/emulated/
+
 PTP MOCKUP CLOCK SUPPORT
 M:	Vladimir Oltean <vladimir.oltean@nxp.com>
 L:	netdev@vger.kernel.org
@@ -21261,10 +21272,10 @@ F:	net/ethtool/phc_vclocks.c
 
 PTP VMCLOCK SUPPORT
 M:	David Woodhouse <dwmw2@infradead.org>
-L:	netdev@vger.kernel.org
+L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/ptp/amazon,vmclock.yaml
-F:	drivers/ptp/ptp_vmclock.c
+F:	drivers/ptp/emulated/ptp_vmclock.c
 F:	include/uapi/linux/vmclock-abi.h
 
 PTRACE SUPPORT
@@ -23323,7 +23334,7 @@ S390 PTP DRIVER
 M:	Sven Schnelle <svens@linux.ibm.com>
 L:	linux-s390@vger.kernel.org
 S:	Supported
-F:	drivers/ptp/ptp_s390.c
+F:	drivers/ptp/emulated/ptp_s390.c
 
 S390 SCM DRIVER
 M:	Vineeth Vijayan <vneethv@linux.ibm.com>
@@ -28219,9 +28230,9 @@ M:	Nick Shi <nick.shi@broadcom.com>
 R:	Ajay Kaher <ajay.kaher@broadcom.com>
 R:	Alexey Makhalov <alexey.makhalov@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
-L:	netdev@vger.kernel.org
+L:	linux-kernel@vger.kernel.org
 S:	Supported
-F:	drivers/ptp/ptp_vmw.c
+F:	drivers/ptp/emulated/ptp_vmw.c
 
 VMWARE VMCI DRIVER
 M:	Bryan Tan <bryan-bt.tan@broadcom.com>
-- 
2.43.5

