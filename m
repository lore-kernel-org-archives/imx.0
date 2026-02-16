Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277A42744F;
	Mon, 16 Feb 2026 06:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771222678; cv=none; b=W8xPnfIZ+Rs5Bh6y8o5LCYXWPhSPaI/tCd9CxM3ZjRgtujtIma/6KYPdKJ2SuygVdP4A4tqBLZQQaFKr37loQnyMF0eHDI9/uqg/eJlXlz9VQegFwhTert4+pZOqzWxjSsCudlQygpw8ozLSWl/0VQnp9Hk3mT9waN9gRlAz/sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771222678; c=relaxed/simple;
	bh=NK5LUjbfC0BVzjhcuYYDpuRoBEyVNMqfzIGQv6x7rLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X3UpQjbW0RDOgZ6RtFOXVM6Jc9+N2oQW/FyBLvVEuraSV3wX2G5QwSWqe931siKvxUFk3f1fCRJIE/ov3hRiyPr4ZAKCdCA9rZ8PxcYx8NYUnN2HJ6Jg6+u0u4eaK+YAUQxbTogLDI9KMjUiFqa+eQxIF98PNtH5DzGFjRdEpbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=0E3OGHJq; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="0E3OGHJq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Eujn8FiH7OE1KhwJl5b99W69u8s9g+bZu/FLxdOyUL0=; b=0E3OGHJqcwj8n70RCnWoahPESO
	eHVE2Bq1bozN2rNOaU81peL+fjGjpAWbikMxPnZNh/+UVn1QSnB/pbKsy/Yg171EOwlp8oVfXBX6E
	AeGZEuiXW2rdxf7AdkfHfsCLgcaxHI9TCZjzpjoNbkhpAknabOc8/i2OmA5av23Mtvv3wIJy60G1H
	SpzOcLjyJX4qUOLBXfVYUauQVB1+TdKNHnEGoz7PJFR04h4I9Po5IGUtHAv6C+IlfOieNXjN1KJTI
	1vA9tZeYUyumyLT23S9qJQMd0Bz6l+ijqxBDjL5QGstAdlnyHsWCgED5mJCmBrT/UCt1VPDpBDMNy
	cwe+WwGw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrrvg-000000061cq-07n4;
	Mon, 16 Feb 2026 06:17:56 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH] i3c: master: svc: spelling corrections
Date: Sun, 15 Feb 2026 22:17:55 -0800
Message-ID: <20260216061755.2801697-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling for 3 words as identified by codespell:

svc-i3c-master.c:340: tigger ==> trigger
svc-i3c-master.c:532: reamins ==> remains
svc-i3c-master.c:734: filetered ==> filtered

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org
Cc: imx@lists.linux.dev
---
 drivers/i3c/master/svc-i3c-master.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20251210.orig/drivers/i3c/master/svc-i3c-master.c
+++ linux-next-20251210/drivers/i3c/master/svc-i3c-master.c
@@ -344,7 +344,7 @@ static void svc_i3c_master_reset_fifo_tr
 {
 	u32 reg;
 
-	/* Set RX and TX tigger levels, flush FIFOs */
+	/* Set RX and TX trigger levels, flush FIFOs */
 	reg = SVC_I3C_MDATACTRL_FLUSHTB |
 	      SVC_I3C_MDATACTRL_FLUSHRB |
 	      SVC_I3C_MDATACTRL_UNLOCK_TRIG |
@@ -572,7 +572,7 @@ static void svc_i3c_master_ibi_isr(struc
 	 * 3. IBI isr writes an AutoIBI request.
 	 * 4. The controller will not start AutoIBI process because SDA is not low.
 	 * 5. IBIWON polling times out.
-	 * 6. Controller reamins in AutoIBI state and doesn't accept EmitStop request.
+	 * 6. Controller remains in AutoIBI state and doesn't accept EmitStop request.
 	 */
 	writel(SVC_I3C_MCTRL_REQUEST_START_ADDR |
 	       SVC_I3C_MCTRL_TYPE_I3C |
@@ -774,7 +774,7 @@ static int svc_i3c_master_bus_init(struc
 
 	/*
 	 * Using I3C Open-Drain mode, target is 4.17MHz/240ns with a
-	 * duty-cycle tuned so that high levels are filetered out by
+	 * duty-cycle tuned so that high levels are filtered out by
 	 * the 50ns filter (target being 40ns).
 	 */
 	odhpp = 1;
