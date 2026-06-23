Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3641F3AD51C
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 06:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782194934; cv=none; b=GZa9u7x5uqoUgxD4zWtMa3jHNENTGoN1hAI2WTX08bryQnoX7Eix9cGqycg+KbQS8/K9FdXsT86CptpE38zxqdS4VXAhsXLHyE+JQso3A3RECztTYQbvHA+PtgAa4DYC1AAFrxbxQb2Ss1hwxh1QcVmJjv8kF35foTLADIv2IC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782194934; c=relaxed/simple;
	bh=RKwev+QoZoh8tf51fdNldA/tA3TTPz4xZMxScX/5ZNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d8f7Qq0pexq6klkgbFVYhiu0QmhmtXjcKkmyD/q4muM7FzHq8cwzfU3aYPztLrFvHbCgY8+zbPQeb/6NGdFVgwPR+DpMp+pdJssDWDnKhdb630xF0cCozjKqSbnY8X6hfD9Bz6iyTlfqDKYlZ0SYaleg0i4FRgc4PkGSgDeDhgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAD3fADvIjpqf_nJFA--.53251S2;
	Tue, 23 Jun 2026 14:08:47 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] i3c: master: svc: report timeout waiting for STOP idle
Date: Tue, 23 Jun 2026 14:08:21 +0800
Message-ID: <20260623060821.23238-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAD3fADvIjpqf_nJFA--.53251S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF15Ar47AFWDWw4UZF43Jrb_yoW8Wr18pw
	48KF90krn7tF1UJa18Ga1aqFW5Z3Z0qFyxC3yIywsxurZ3W34qkF17AFy8XrnxJr18Cryj
	yryYyayq9an8Jr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjZNVP
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

svc_i3c_master_xfer() emits STOP or force-exit for the final transfer
and then waits for the controller state to become idle, but ignores
readl_poll_timeout(). The function can therefore return success while
the controller is still not idle.

Return the idle-wait error through the existing warning/FIFO cleanup
path so the caller observes the failed transfer without emitting a
second STOP after the final STOP or force-exit has already been sent.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/i3c/master/svc-i3c-master.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 93805df8a940..93ae6eb1a355 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1488,8 +1488,11 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 			svc_i3c_master_emit_force_exit(master);
 
 		/* Wait idle if stop is sent. */
-		readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
-				   SVC_I3C_MSTATUS_STATE_IDLE(reg), 0, 1000);
+		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
+					 SVC_I3C_MSTATUS_STATE_IDLE(reg),
+					 0, 1000);
+		if (ret)
+			goto cleanup;
 	}
 
 	return 0;
@@ -1502,6 +1505,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 	else
 		svc_i3c_master_emit_force_exit(master);
 
+cleanup:
 	svc_i3c_master_clear_merrwarn(master);
 	svc_i3c_master_flush_fifo(master);
 
-- 
2.50.1 (Apple Git-155)

