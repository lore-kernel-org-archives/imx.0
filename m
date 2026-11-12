Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446949;
	b=M9iccdACh1oWvy+5XiD0oEUXEQixwKl6XVBlbGSUUE1mQlHdn8JVIFFoyQZLmNbYnrT7
	 Bm3rYdx4U4jrRbvRTXmVffmJPIfoJw1t+nO5Wf2B13WYwcnEnNKbS/gXgGCECiBuKSOrh
	 aYAaMcG8tAdvDvBw5P/1hvmrFMvBAR1K4ARRkOd6TUIbxqVBonQ8bHhQpEJdCIB0czfTa
	 l/65jFruFnkNgClHMo0itzbWjEJvo204zrws2WDoKs4Uxajo2PoF9hyntesVVqjxIlqvX
	 686YKNIJ9JKylBpf0jbLb3Xu4sTdq79DDiWhpCBYT9CpeqC1My3+GnyXEn4lvNLOlDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
	b=WYXxOODqYg65XM7t/bkFGyDwxtbYCEBB8KoU3Pz14AUuvTl8gq0Vh9LfJHrLIVU5NDBN
	 nr8KV0rH12Vr771vzDRLiLmlfveQ4N3cFpCN5UQPuXGJ1Lr4INQqfEruCqZXaVK03RYVd
	 eyM6SiipQ2pa1GBIquHhB86Aiy/qb716dyRcr+GaFUV0cYH4MTM44z6i/MbNf+vBKNF50
	 Mj3NRpTz6IRCf2Y+xtS4QTWOZsKXaTqDEg/I3L4ABLovygljNJyOhmnbkV9+GaaFucQPw
	 j6nYqQ9ebSF6Dq+Wsan0ZPjZ588Vw1/4AxvL0SOpSKOZ2+qstMHkuEFBuYLvfGOy7dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KUlEzTcu;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E9F606DDE4
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 01:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01E9F606DDE4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KUlEzTcu
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4adae3eb4d3so1586833fac.1
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 17:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446948; x=1795051748; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=KUlEzTcuGFkWyjKirPkMJX5RgeWxkKpEEPcHyY/XUltoq6yYmGIUk+xzORVuxqBJuu
         xwFWJmz2WrU3WeDFkHCG1ohqTHp7UNC68ISMn+jgeJET1kQOtWk2bVujSN0M+6axCZt8
         0rOM8iuo9vroKbNc1aIAQjh88aFJ2L8QOZwJxYLTGudNyH+Mzia7cwqJwf+5ncI4ppUH
         UpkDVkn3myZRbAfENJi1L+ZyTxQi73+/FlawfEbXUgF35xueAoGj1HCqxgq6a7gedyz9
         Vj6eszA4S1/EIx34jNWLa2G8OdZak/edOCJaSETNT8iXGxNO1pZstLarY6aptb7RnQf+
         0cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446948; x=1795051748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=XkDAlRjpGyJreIjKEW6xz1+w0OFXbT84owxdV0PVXTRyqsukFcmmKjBM3f+F6/lP5r
         1Q6NkfvsyTKq3o6E1j3nvwXO8mCdSED63eVqEIVGyoxb7hKsIOA03sVpZ8zuwgZht7WJ
         mHX6n1ur/Hj1DJvzRxWud2exq2rkPiGiKWCP3KERinWT+YANwqUOp2AsfwiYF1GTQPIj
         xW5pnYpqpjEnxP7w3uu8uJLfhVU/dqolaKvRxuiFwF1efk1CTBjdgkB9q9fwc4+MTKD7
         3J93+YGypL246KRI+W8AVetHWQLYZt3ZJBRVPFlc2aSiHsN6JgoA/NuNuFLuo7mEEOC0
         Fnhw==
X-Forwarded-Encrypted: i=1; AL+hErFLkkXY5EcoVBaJH4t96+hiyfML4yjJ7W1IDp/uPnF0PORtbhcJ5wmiwyd+C4K3GHDDYnI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8IgWfbBicrC6Goiigw+dn6wxO9cIwkXkWd0TxhudclipeekY2r
	pSvZ+pVEE7zPYn4xI3p56TQjC/AkJAQLq61CVkoDjxu3atxHMEnBWWaO
X-Gm-Gg: AYBFou3f0CoynqLNV7HNqt+GdGJK+slbcVzKJGC2yrlLj1BkvvC5tAbgiUXsD4D71kI
	yxaardikzu1bEq1C2MTJNhCy/S1429+OEsZiHE55o7ePryI2MZRmph4rh3Jiksu5MdHIunYGdV5
	5rhX/f4kFjSJn3W4+Hnu2eV3gSLoN2TP4xwGqlAG3WYlC36L+KQ/7KG6QpL0WRj/+yr5mJyyURJ
	UXuOYYA25dCyuvwumXqOGNJvKrK6too68hQ5XGVXWtrlbFl64gyBZ8pL4gn8dVAPRqHZo+Y/xU0
	TCBrf0uQH0aRZvWM8H70xY7tiCuTbWsOD/9INLOpsmBJRo2J2wCjaKFBrgIVo5OS/SLfvlvhV/6
	lcRLc97FFrS7FKLUo48cLH7ydjikxc1V3P58Ts9bQPGovWo+dsEsLwjb5BLl9vZ4G2QZng991PI
	hlEM9SkPIfUha6bYHKRc4y6uoyvPgUT8e8kcibqAZ4JSDOGE/C4Tq6ASbwEtKCf/0P5rlr2/qer
	zdGGZi/bqW5DhhBuv/NZ2yeUrqB4v9j9ArWtwS7xxoC1B8DswIFLf7DtVnMW9KNkA3AxdTa5oaw
	eCMgxr2lWGX32nvgnNP0W4+cPgpPQA6ZeBTpRJjpGaIuVrNHTnCkLTk57pdwpoeAgtlzDe7t6tF
	iWob79Z4jGwqQXYwqGrapRhR3XGzDjwoxgkksnGi/ToCFN+XtO7S3cdJqrNgbNvD+c2neOufkHJ
	0Zq5EWQ5hxVGUKP6tzA9XkNturtn6qtDhBAeYWdORdNRdBcj2xYpe+55wc4Xee4r+w5FUeBU/Po
	48=
X-Received: by 2002:a05:6808:c3ef:b0:4d6:92f4:d684 with SMTP id 5614622812f47-56b989191f4mr3926705b6e.63.1794446943169;
        Wed, 11 Nov 2026 17:29:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:10 -0700
Subject: [PATCH v3 31/58] mtd: rawnand: mxc: retain open-handle state on
 removal
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-31-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the embedded legacy controller and drain I/O before clock
disable.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index f976cf3f7210..b68c2f13234f 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1694,10 +1694,14 @@ static int mxcnd_probe(struct platform_device *pdev)
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
-	host = devm_kzalloc(&pdev->dev, sizeof(struct mxc_nand_host),
-			GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	this = &host->nand;
+	this->controller = &this->legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, this->controller, host);
+	if (err)
+		return err;
 
 	/* allocate a temporary buffer for the nand_scan_ident() */
 	host->data_buf = devm_kzalloc(&pdev->dev, PAGE_SIZE, GFP_KERNEL);
@@ -1796,9 +1800,15 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_lifetime(this, NULL);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto escan;
+	}
 
 	platform_set_drvdata(pdev, host);
 
@@ -1821,9 +1831,10 @@ static void mxcnd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver mxcnd_driver = {

-- 
2.53.0

