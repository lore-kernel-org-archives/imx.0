Received: from out198-31.us.a.mail.aliyun.com (out198-31.us.a.mail.aliyun.com [47.90.198.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC57B374E5A
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 06:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789454299; cv=none; b=fnfzDTSVmxT2gj1a6cbGwKMn3FsGCVrjJOklKz7nb+bRvNmJJ0hC96pwJzQUTuiPL4Mk7yEB3dE8sWVBNSby66nHuwpNhx4RYhsFJJCEiVTiPk5M2lTcOJgHmhMv3h8at4U3o9flet6tZrJ72qBrI3k3bCp3Du/OVn///mb3J1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789454299; c=relaxed/simple;
	bh=ZoB/YOwd06LMU7y/5rAFHrOp7+5PEOkCp0msYuXXddI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rj3ATCBrk+LJX/Am2ke2bf0np62bbZfaabmG5JM8y6/OB5bTApGG1SC/Zqaa6t0K/lBnMSaa7XaRs3IlJnJ5wSdnYBrKEJ8CQHKLMOvs5t4Ay/ysl6r0gnJRoP6uwHaXO82AlOqhCDzpcksyJrq/v9EK+gZISSOgA93DZzG7ZJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yinhe.ht; spf=pass smtp.mailfrom=yinhe.ht; dkim=pass (2048-bit key) header.d=yinhe.ht header.i=@yinhe.ht header.b=HihnB6Td; arc=none smtp.client-ip=47.90.198.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yinhe.ht header.i=@yinhe.ht header.b="HihnB6Td"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yinhe.ht; s=default;
	t=1789454278; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=JDk6QxtZfGZM6KdJAQU6hPHN6qFU5g0NtpmNmfMi5Ls=;
	b=HihnB6Td9kW9ZNyrh7LBUZoOnwSyZqAYH0yvEOd8mE9J5o6HST4jYwz6cYaFuCXdR6VReT1+YXPlWPNdKUHWvIaEFTFKY4bpgv7xKnXhu9tLV90zndRsltog0DQmGgTrSK2qC7pAF5Deb/1WcepVMH95+FWfRkACPNIvj+iBACD3uVvxrUVJ0wVJ0BysABs8l9uNfwqJyHFsky2zzoc0gas/RjMKG3JgsdusnkUEFw56/SAgVrml54zsjJetyaqg+orxPUjB7Hqt7ANApz+rjocvu0lrIpuLLmJTgPFjbGRRkYrrg5QPtfLVmvXASf+BaBzqN02xA21UuU9CFhF3XA==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07498196|-1;BR=01201311R161S19rulernew998_84748_2000303;CH=blue;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00134703-0.0012179-0.997435;FP=16287160341114814124|1|1|2|0|-1|-1|-1;HT=maildocker-contentspam033045220102;MF=chunyuzhiqiang@yinhe.ht;NM=1;PH=DS;RN=4;RT=4;SR=0;TI=SMTPD_---.jDy73D9_1789454277;
Received: from localhost.localdomain(mailfrom:chunyuzhiqiang@yinhe.ht fp:SMTPD_---.jDy73D9_1789454277 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 15 Sep 2026 14:37:57 +0800
From: chunyuzhiqiang <chunyuzhiqiang@yinhe.ht>
To: imx@lists.linux.dev
Cc: shawnguo@kernel.org,
	mkl@pengutronix.de,
	ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>
Subject: [PATCH] can: flexcan: fix synchronous external abort in flexcan_get_berr_counter()
Date: Tue, 15 Sep 2026 14:35:22 +0800
Message-ID: <20260915063522.3010750-1-chunyuzhiqiang@yinhe.ht>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>

When the FlexCAN interface is down, can_fill_info() still calls
flexcan_get_berr_counter() to fill the error counters for a netlink
dump. This function calls pm_runtime_resume_and_get(), which only
enables the clocks via flexcan_runtime_resume(), but does not clear
the MCR[MDIS] bit. Since the interface has never been opened, the
FlexCAN module is still disabled (MDIS=1) from register_flexcandev().
Accessing the ECR register then triggers a synchronous external abort.

This can be reproduced on an i.MX8QXP board by simply running
`ip link show` without ever bringing the CAN interface up:

    Internal error: synchronous external abort: 0000000096000210 [#1] PREEMPT SMP
    pc : flexcan_read_le+0x0/0x18
    lr : flexcan_get_berr_counter+0x4c/0x8c
    Call trace:
     flexcan_read_le+0x0/0x18
     can_fill_info+0x1f8/0x434
     rtnl_fill_ifinfo+0x8fc/0xbb4
     rtnl_dump_ifinfo+0x364/0x448
     ...

ftrace shows the exact path:

  can_fill_info() {
    flexcan_get_berr_counter() {
      __pm_runtime_resume() {
        rpm_resume()
          rpm_callback()
            __rpm_callback()
              pm_generic_runtime_resume()
                flexcan_runtime_resume()
                  flexcan_clks_enable() {
                    clk_prepare(); clk_enable();
                    ...
                  }
      }
      do_mem_abort() {
        do_sea()
        ...
      }
    }
  }

Fix this by returning early if the interface is not running.

Tested on i.MX8QXP: after the patch, `ip link show` no longer triggers
the abort.

Cc: stable@vger.kernel.org
Signed-off-by: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>
---
 drivers/net/can/flexcan/flexcan-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/flexcan/flexcan-core.c
index 06d5d35fc..b08779ee2 100644
--- a/drivers/net/can/flexcan/flexcan-core.c
+++ b/drivers/net/can/flexcan/flexcan-core.c
@@ -765,6 +765,9 @@ static int flexcan_get_berr_counter(const struct net_device *dev,
 	const struct flexcan_priv *priv = netdev_priv(dev);
 	int err;
 
+	if (!netif_running(dev))
+		return 0;
+
 	err = pm_runtime_resume_and_get(priv->dev);
 	if (err < 0)
 		return err;
-- 
2.47.3

