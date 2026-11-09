Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.75.79.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220784;
	b=Nx/ktHyIS+sHvaBxExOtAez7ITtBH2S6DCH/6HpCel7c9JpCiN+jK9zomeCdQhognbJo
	 W1iXyqg2I2exrc7z5/GvkcCnfLY3e31N/a6MmMDLo3njlBbVmU7/Iolbb9IVuHByuC3WP
	 benHM1JSqoNQGweHSCMbLSzCPVZT8IBkbGEA6MLboLEbJXiL52uzhDN1UtDXjeGzhf1M/
	 b7qXk9r2LOa5Cqc9mG37/g/CaKJCLE9yu9X9yLpK8bA5BVotYiS47iqI5w+81ZHv+qtUq
	 dDETD76BWP6CJeNP4uwVUc77B+yUJEKJjuL2dVMvTQkj9dbEBwi6FMgBrw5UxNVODsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220784;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-Id:Mime-Version:X-Mailer:Content-Type:
	 Content-Transfer-Encoding;
	bh=QAvczo67RSfalJeCsyzcJCLsA81gRzj2i73BFxVghM4=;
	b=0R9/SSoBlSkue/PV+59sYngp/MfEdso304RsV6H9PeSeDmzro2eoSVsvPk/QjH3z90Mx
	 MqL12k5Qeh6nMYveb5TuSLzNGjVper+ilqmbqtd1oMnUil/no3JNPVK5IvL3MH6nqT5J5
	 4UZd+4hzg/YoSzT3SCJ0YgRzUL6Os6qvT0xRh+HlcC84+cwXCCWijOGy/WnQR6VqSBbIQ
	 u9IJE5X0YnJc0A9qGrbZJMvUdibJPwYCrMmWzHCvrorMwX9Jv1NoSFj0J9XT0n5Io37Fk
	 Lrv38UKszOSvid0Cp+1kOL1UNTJh0YMv9/oLoUIeaZnw1MbZYKwUuZuZ+DZH8P5ePOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=email.cz;
	spf=pass smtp.mailfrom=email.cz;
	dkim=pass header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=FlElEeVi;
	arc=none smtp.remote-ip=77.75.79.23
Received: from mxc.seznam.cz (mxc.seznam.cz [77.75.79.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C25606A326
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 10:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1C25606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=email.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=FlElEeVi
Received: from email.seznam.cz
	by smtpc-mxc-685566bfbf-xlpnn
	(smtpc-mxc-685566bfbf-xlpnn [2a02:598:128:8a00::1000:9b3])
	id 0a2fb6b9f4db04130aa138a1;
	Mon, 09 Nov 2026 11:38:52 +0100 (CET)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794220732; bh=QAvczo67RSfalJeCsyzcJCLsA81gRzj2i73BFxVghM4=;
	h=From:To:Cc:Subject:Date:Message-Id:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=FlElEeVi/y5ot2kn+A79b9hWgIgCoDJpxEsC9bi1TycepDmisqCrPJ3rhrdnLwg6l
	 uG8WWC4ct6q2xG+QAI4fZOjj8NfdYiOts1KqRA3rlPRUFH4vhkb/ohAXKuytIyFHkd
	 RItTTrNynfnFo2WBl2ncd/sj1wzYJIN2kNJtnzJAd+LVkbm5LkEL88fEKQSxdBhY/E
	 PH3mMfDXZF6XsKDyOqEnJhy7AiC0/xvqPchvmuVG5OrHz53ZmOA2/pp9qpNvHsZYA5
	 AsHimeXL/hQewfv6VPiRXcmz3byNfqLXLVgpciP7aQxSvG+UqJ2YOKyUv8rLJhpNnV
	 AcVhEn51tpYHA==
Received: from unknown ([82.144.143.215])
	by email.seznam.cz (szn-email-ebox-5.1.30) with HTTP;
	Mon, 09 Nov 2026 11:38:39 +0100 (CET)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: "Herbert Xu" <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: "Shawn Guo" <shawnguo@kernel.org>,
	"Sascha Hauer" <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>,
	"Fabio Estevam" <festevam@gmail.com>,
	"Marek Vasut" <marex@denx.de>,
	<linux-crypto@vger.kernel.org>,
	<imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] crypto: mxs-dcp - Fix softirq locking and completion
Date: Mon, 09 Nov 2026 11:38:38 +0100 (CET)
Message-Id: <1qB.ZqMy.4DIhrOb2ZPx.1gyQAk@seznam.cz>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (szn-mime-2.2.19)
X-Mailer: szn-email-ebox-5.1.30
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

The request queues are protected by plain spin_lock(), but requests are
enqueued from softirq context (e.g. by ESP on packet receive) as well as=

from process context, while the channel threads dequeue them in process
context with bottom halves enabled. A softirq that runs on the same CPU
while the lock is held either deadlocks on SMP, or corrupts the queue on=

UP where the spinlock does not provide any protection.

In addition, the channel threads call the completion callbacks with
bottom halves enabled, although the crypto API requires them to be
called with bottom halves disabled. With IPsec, esp_input_done() then
runs xfrm_input() and gro_cells_receive() in plain process context,
which races with the NET_RX softirq on the per-CPU GRO cell queue and on=

the xfrm state, and defers the NAPI poll until the next interrupt.

This was observed with strongSwan on i.MX6ULL: the throughput drops
quickly and eventually no packets are decrypted at all.

Fix this by taking the queue locks with spin_lock_bh() and by calling
the completion callbacks with bottom halves disabled.

Fixes: 15b59e7c3733 ("crypto: mxs - Add Freescale MXS DCP driver")
Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/crypto/mxs-dcp.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
index e1ff6ac8b213..b6749eb8f6f4 100644
--- a/drivers/crypto/mxs-dcp.c
+++ b/drivers/crypto/mxs-dcp.c
@@ -420,10 +420,10 @@ static int dcp_chan_thread_aes(void *data)
 	while (!kthread_should_stop()) {
 		set_current_state(TASK_INTERRUPTIBLE);
 
-		spin_lock(&sdcp->lock[chan]);
+		spin_lock_bh(&sdcp->lock[chan]);
 		backlog =3D crypto_get_backlog(&sdcp->queue[chan]);
 		arq =3D crypto_dequeue_request(&sdcp->queue[chan]);
-		spin_unlock(&sdcp->lock[chan]);
+		spin_unlock_bh(&sdcp->lock[chan]);
 
 		if (!backlog && !arq) {
 			schedule();
@@ -432,12 +432,17 @@ static int dcp_chan_thread_aes(void *data)
 
 		set_current_state(TASK_RUNNING);
 
-		if (backlog)
+		if (backlog) {
+			local_bh_disable();
 			crypto_request_complete(backlog, -EINPROGRESS);
+			local_bh_enable();
+		}
 
 		if (arq) {
 			ret =3D mxs_dcp_aes_block_crypt(arq);
+			local_bh_disable();
 			crypto_request_complete(arq, ret);
+			local_bh_enable();
 		}
 	}
 
@@ -480,9 +485,9 @@ static int mxs_dcp_aes_enqueue(struct skcipher_request=
 *req, int enc, int ecb)
 	rctx->ecb =3D ecb;
 	actx->chan =3D DCP_CHAN_CRYPTO;
 
-	spin_lock(&sdcp->lock[actx->chan]);
+	spin_lock_bh(&sdcp->lock[actx->chan]);
 	ret =3D crypto_enqueue_request(&sdcp->queue[actx->chan], &req->base);
-	spin_unlock(&sdcp->lock[actx->chan]);
+	spin_unlock_bh(&sdcp->lock[actx->chan]);
 
 	wake_up_process(sdcp->thread[actx->chan]);
 
@@ -750,10 +755,10 @@ static int dcp_chan_thread_sha(void *data)
 	while (!kthread_should_stop()) {
 		set_current_state(TASK_INTERRUPTIBLE);
 
-		spin_lock(&sdcp->lock[chan]);
+		spin_lock_bh(&sdcp->lock[chan]);
 		backlog =3D crypto_get_backlog(&sdcp->queue[chan]);
 		arq =3D crypto_dequeue_request(&sdcp->queue[chan]);
-		spin_unlock(&sdcp->lock[chan]);
+		spin_unlock_bh(&sdcp->lock[chan]);
 
 		if (!backlog && !arq) {
 			schedule();
@@ -762,12 +767,17 @@ static int dcp_chan_thread_sha(void *data)
 
 		set_current_state(TASK_RUNNING);
 
-		if (backlog)
+		if (backlog) {
+			local_bh_disable();
 			crypto_request_complete(backlog, -EINPROGRESS);
+			local_bh_enable();
+		}
 
 		if (arq) {
 			ret =3D dcp_sha_req_to_buf(arq);
+			local_bh_disable();
 			crypto_request_complete(arq, ret);
+			local_bh_enable();
 		}
 	}
 
@@ -827,9 +837,9 @@ static int dcp_sha_update_fx(struct ahash_request *req=
, int fini)
 		rctx->init =3D 1;
 	}
 
-	spin_lock(&sdcp->lock[actx->chan]);
+	spin_lock_bh(&sdcp->lock[actx->chan]);
 	ret =3D crypto_enqueue_request(&sdcp->queue[actx->chan], &req->base);
-	spin_unlock(&sdcp->lock[actx->chan]);
+	spin_unlock_bh(&sdcp->lock[actx->chan]);
 
 	wake_up_process(sdcp->thread[actx->chan]);
 	mutex_unlock(&actx->mutex);
-- 
2.43.0
