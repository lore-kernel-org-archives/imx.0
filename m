Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE293D902E
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365550; cv=none; b=XBl3P+2TC/Z75xdZvo5/EKzYxcV5hZTyAhCb4GYXO+KdLFWzFccDCu3uPFRtJS3MYtUW1B9b6WyHbfMPGZhKmfRjxKMYGLslc+ENW1IA9/PgoAtDdcqLpP5ikrr90I7B002SaQAGsd20H60izwSmL/UwHFapseU/gkqdQjcExic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365550; c=relaxed/simple;
	bh=RiauInVACv9oIOx+NqLlF7ICmj/eQk5U/vnXep2iR8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MENyLmziAykJHeuShS815XZ/h4oo+7HjpIuYIKtmUrRdnnGcYyW5fDmuuegVC01msxHqxCcyfLDILbpj4Th76BQmgIN8GzDvm0tczEkl3rDIsUmFhN8/PVwgF56rgY8uSZB1o3lcphM0zEQ8lBvp3P9zH9jyXoHHyjYm7prpNeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0VM3lW3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0VM3lW3"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954df200ddso12288485e9.0
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 05:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786365547; x=1786970347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZEdQ2A6GGoHnGpTa3UasQyiE4AH49ki9i07irxjtKrk=;
        b=d0VM3lW3HCreKZr3UbZsD4c4VdCnqHzlscPSphDD1idw5TRjk7X3nfDgihI7/bxXbt
         MFWfcPe2tn/z2j819D47DZQJ5n/Ig4NX5VjdSXJrinTo5zJ5zPSGFm5gESJbsFuBW2/E
         GGHwbRYiWSTp7xlnlAtYZ2wpMmpy1nwR2dkJyquZG9t3BYWTCW4xoxEtaJ/jzlVJKnZO
         sKOxNz99t+24MyJ9hMsR+8YuVMP8eV0sSS8D5n2PdGioiUy6ckrsCti39uDeA/eWd0d5
         GuURouNR80QrMMTsL7x675c1YzKbFMUOP6+TBBesn0wksXUERJo7aPC97ByDPyg89xMW
         /pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786365547; x=1786970347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZEdQ2A6GGoHnGpTa3UasQyiE4AH49ki9i07irxjtKrk=;
        b=l9u1H1Qdo0UppaqX/aBwXT7ojPLYDUqgsitE0reBUenbuRg5b9cyy947Brsrpdjrt1
         cnKxU0uD0xnaq5BjNjwa8sYqhuZay2uKeAIeoLy/dR0eYA+yWe6ivS8BCIjbXZtpVFTb
         lyLqnSSpyAktWdL/0htV6EgNRmMIDt0JAHjOhzwg59OVP5dbqn0i2tMhr2mzkYzDSHZW
         8WB4csr3geRYcGavz87rAHFYxREZLZexnTrx4VOUJz+VH/LFeBWNGFJMG0wMz7VpNxNH
         ZEEnEXR8nmQgBD8GACLD5eRljoYG9wlrEH4LsRh9CBZQ52MhvbV/7SYQdGQwZYJqgobG
         r7ww==
X-Forwarded-Encrypted: i=1; AHgh+RoMSVg2aCjddIwGswvmtob9l2C58mXYT+4bKkMGZkHM8Cn+LGAJWaByVW0mAikAAVf/Jbg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGpv622jqyTZajl9BHw0LwGvK/jS0x1JDl8DieRVgKLaK8+KB1
	j5y6Q03k3UV72t+fVIpcuTEmpTbflCRT3u1qhjNz7uY4cWq1h1Nj8Lt8
X-Gm-Gg: AR+sD111U1gS1+lUABojfoPKYWM6vy2dFwgMmM7PLsrYqLv/IGKiMarnH/B7GU7hbY9
	9SikXpJiD1ltdx1v8OAqWqfZdK3gavIgFrkse1mqeCfm5U8vfNYIVfHJoJVSExr3pUQWYIdA9vr
	3QBYlZKy7VEoj0LebMLQH6k2xjJXiPTPXQ0Q3TMEsKOOf7xKpor5Hy9GP2zFpeixAPqXzocoDXJ
	/CkOBuNN81GM7Qs68ZaRaj5eseYb6tDDXxz032QHZnrSWsaQgOi9CExd30AvB+WcCK12jVktMIQ
	of3e8G5U7MrVtzMxoJEG5DrW7zd74A7DB9hJKExcRM6Gq8ibDhlFVvVyILJk2o0LkX4KO8CWYhG
	orKKXM/yDO7bpnY7lxkeJKsaHSvwrR5/C1FyWo2zfiPU4SueN8yj9Fq3YlSinUvyVezpPDQ+II6
	WkgXDJUoKRYJM37hhsn9wTSW2F4XcoeE2g66DIGAPEQdpOl1CxHnvutEJ1kvCBOlY22mI=
X-Received: by 2002:a05:600c:4f4d:b0:498:ff3:71ed with SMTP id 5b1f17b1804b1-499727b9053mr17974925e9.17.1786365546389;
        Mon, 10 Aug 2026 05:39:06 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm421460675e9.10.2026.08.10.05.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 05:39:03 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: stable@vger.kernel.org
Cc: Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	netdev@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.18.y] net: fec: do not release NULL pages when RX buffer allocation fails
Date: Mon, 10 Aug 2026 14:39:02 +0200
Message-ID: <20260810123902.2611897-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

fec_enet_alloc_rxq_buffers() leaves the loop as soon as
page_pool_dev_alloc_pages() returns NULL and jumps to err_alloc, which
calls fec_enet_free_buffers(). That helper walks the whole ring and
hands every rx_skb_info[i].page to page_pool_put_full_page(), including
the entries the allocation loop never reached. Those are still NULL,
because the queue was allocated with kzalloc(), and
page_pool_put_full_page() dereferences the page, so an open that runs
out of memory oopses instead of returning -ENOMEM:

  Unable to handle kernel NULL pointer dereference at virtual address 00000014 when read
  Internal error: Oops: 5 [#1] SMP ARM
  CPU: 0 PID: 384 Comm: connmand Not tainted 6.18.43 #1
  Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
  PC is at fec_enet_free_buffers+0xb0/0x2a8
  Call trace:
   fec_enet_free_buffers from fec_enet_open+0x1e0/0x504
   fec_enet_open from __dev_open+0x114/0x238
   __dev_open from __dev_change_flags+0x190/0x208
   __dev_change_flags from netif_change_flags+0x1c/0x58
   netif_change_flags from dev_change_flags+0x44/0x74
   dev_change_flags from devinet_ioctl+0x3a4/0x768

Seen on a Colibri VF50, 128 MiB of RAM, on the first ifup after boot.

Skip the entries that hold no page, and clear the ones that do after
releasing them, so that a later failed open cannot release the same page
a second time.

Mainline is not affected. Commit a2ae70c0efe4 ("net: fec: add
fec_alloc_rxq_buffers_pp() to allocate buffers from page pool") replaced
this loop with fec_free_rxq_buffers(), which skips and clears the empty
entries. That commit is part of the XDP zero copy series and is not a
stable candidate, so this is the equivalent minimal fix for 6.18.y.

Fixes: 95698ff6177b ("net: fec: using page pool to manage RX buffers")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -3341,8 +3341,15 @@
 
 	for (q = 0; q < fep->num_rx_queues; q++) {
 		rxq = fep->rx_queue[q];
-		for (i = 0; i < rxq->bd.ring_size; i++)
-			page_pool_put_full_page(rxq->page_pool, rxq->rx_skb_info[i].page, false);
+		for (i = 0; i < rxq->bd.ring_size; i++) {
+			struct page *page = rxq->rx_skb_info[i].page;
+
+			if (!page)
+				continue;
+
+			page_pool_put_full_page(rxq->page_pool, page, false);
+			rxq->rx_skb_info[i].page = NULL;
+		}
 
 		for (i = 0; i < XDP_STATS_TOTAL; i++)
 			rxq->stats[i] = 0;
-- 
2.43.0
