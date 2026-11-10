Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296696;
	b=iIU3+dipJaoB6hOz0BiqXAPfhNFjZRXQHKEAjmBOuMXt+uYsv00zbXUihspc1iUPFjXK
	 XHkUHH8+fA9uMc05XZ/2KJ0D8CT9REgWAQKU7kkctyuQAzL+n78h0XJLoOXXoC09LR8PL
	 bDk3YMfjckCVtK3DF+h3v+4DPWy5syoIhXXy90r+0rcNXsVpguCzVDGnJdVKPky1ofiq8
	 tmGbqbKTGkRI/wMPNQgnOEfiAYcBGFCCqtWNGgaN1ZS8Ba9vliE2bO57nLV0vOP9X1DMV
	 eyXOQhrXS82xZsFTLzlsxBmUgaT/WN1denauQ0WEtH07XjtImpf2XLEoouWF8MkEH7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Wbdgh15lLoRVXKPHuZMnVRIK8oPQOLAhA/ub2vbd0UQ=;
	b=2Yjyssn/D1IlWDc4C4OIt4glg9mAvctc5YyD2tP8ya0ThCUjM9k7uyr6z2+hb609kDoQ
	 8+5oUHZw+UsUNvskkFCsRPyvWzS6Jj1Ahs35vX6yKRpwFhpUeB6cFJNQpjmaK6sRL3Jv9
	 dqdjTQ5MclcN0UuvQkhj1ky5D+hiyl+jjbz5idSU5mZUmUrlKCkua1G64Y3wwc2XYYsIF
	 2UfJBOU7PptALfJKnwTiOwEKNsfTyjjeIwFCzliwI7OoCXg4ccu3dI5gvxMTp+3bwyq/l
	 FXUJNmLn2Mv7DG0UvJ90IXfn3AwjYfbLCHpsSYDYYrTTGtsWA45p8Of6+wOMRbon6rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F3k9czIg;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D87606D297
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 07:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D87606D297
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F3k9czIg
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-70b875f6f13so1344106eaf.0
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 23:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296694; x=1794901494; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wbdgh15lLoRVXKPHuZMnVRIK8oPQOLAhA/ub2vbd0UQ=;
        b=F3k9czIgrmbOSoFTiWlOYdE2ygrneAOdHnMjZnkGoUGAOfAGehexPXotlrk/Gy1Z/t
         ZGQ7pUBlkNDn9JM3uNJN96anw4ZfXGNQAF5h+I/Z5HcFReWZxflCNXGgbgqLlVMosxsM
         GhUj2025LfQquB9VwSR9u9xdh0Ukd4ozfaXcVgrpZcQnaZhPlb5XycYlR2tuHID+Y7Wt
         tIKoW3KAriHZ/ScaoKx9NMz7YUfEgHT95yZeGX9H2mmnkwDyM7L9hNF0B0xavyWVkc0J
         ExiSBsmhYYDA/fxPLOqhyYU9TvgMqxf7m0V6iqk60QHvmfIrx+xRGcuuPQudUqpXNcGl
         lHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296694; x=1794901494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wbdgh15lLoRVXKPHuZMnVRIK8oPQOLAhA/ub2vbd0UQ=;
        b=2VTGC5ybMha0FC8OCyMUt0pG9g2dqKN2/ieliJrvIHRUxoFJIYH565KpzpRXkwrqFC
         0M4fPVGd5EmQTXOZ1SKc4quo11qwAmv5eZcJve7IaoXE3kZEttVchw190rz/MosYDnW4
         trxjxl6J9q/cNCPcbo5ZFhmCacsVzryh7eMRoYhZhPwkbjmJLY5cbjRSwGhT5zFiCIDE
         RYx6BLSkXmDFGntHTPEXhoZeE1i+aJ7fB5Lx9ZeYfHxNdMRbwy6KTEPTMRmUM+LAwXRg
         ojh2F03AGkXhF9R4sUEnf54rIR5iq1EoXjGuiFjbBl4qOhjg8WcUiPOm7b3R0GM5RDvQ
         SR+Q==
X-Forwarded-Encrypted: i=1; AL+hErGqHvBGdZ0E9XOpnKYkmEbiuB8kSE4L30bbCsDFbq9vMKaictFJHfhKclqObk/KXOGkV1s=@lists.linux.dev
X-Gm-Message-State: APuU4Z+cBJrp2xaHNfyA5b+C/3J1d+b4HTsAKV7jvrXahIrqvrQ4bM9T
	Z8YRqhTaTUHskSXWA/3t/UfD90r2ngtDZBcx0iGbcehrWEwtaIM2aCUU
X-Gm-Gg: AYBFou2u9YRs5dqSy1Z/XXlbPdudlJx+bdnxtAxHVCE1mkEEwAr/a0YJ5IeS/EVLXML
	eCNcGGYs3OHi373/VO17S7BQs07qcETOX3nYU8XqwbfUrUDIBReMTEhH/f/amaemYHV9t1y82aO
	NuQaCiFVs45x/ogfqQ5MphhGMzOWlC2aGCiEl88332dASTwuWy3ZviS2fffFR/01hA89AVcZLlw
	z39sE9WOPdva/Ix7SWi9IkqYSXQrUhGgeavE37tEZElYxqOUdCsRUMFmMHT2OxfenPJD+9cRQ4B
	fNDMmnK34Oicxb/AODXa7GOR6U7Q4bEU7r2YouFC9qnhd7l4TX6VVDtob1hVcICx1VIM2zsG5m2
	2iwLH0mjTb58NvB7uyFkYxNqkU+02myN5Jd2uJeBfFBEXqaxbETHiRsPofC3LxQZ4Kye8DIebv9
	oqDBLjzJf80WJfuZxK2GM5syUTGTiUZSFranc8W1VzJ3WDuOmvmhOoon39KdsS/lQakuXdi2eiJ
	+liR+leI7HtcOLmvmUmGihufxiw4okMDQ0WlfG4S/Su0303I4qCN+YxnK9KLUsdo9pp4JHMbx/n
	FIoJNR+6QMrkbsKtPDt3HAzAawJVjIO6pY9/xbKsEURrBcmOdvGDsQ8mcez7GlOkkwGwH/MI0eW
	VhtZp98c6dHpyJCYAFrp3HzRI3FFH4mew0hox4wdAumu6/8dOImgNAqfr2i93/317ls0WwNBrlG
	5nIGWPjoYCPzCaG57kNohYZYRJ3G4Y7PXPPz1PbaObnkQ4DH/eYRY=
X-Received: by 2002:a05:6808:1713:b0:510:7dc8:5ff7 with SMTP id 5614622812f47-5683c945eb5mr1346257b6e.19.1794296694580;
        Mon, 09 Nov 2026 23:44:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:34 -0700
Subject: [PATCH v2 31/58] mtd: rawnand: mxc: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-31-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
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

Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 4d8b92e7e672..d9f1e57c1ebf 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1686,6 +1686,11 @@ static const struct nand_controller_ops mxcnd_controller_ops = {
 	.exec_op = mxcnd_exec_op,
 };
 
+static void mxcnd_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mxc_nand_host, nand.legacy.dummy_controller));
+}
+
 static int mxcnd_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this;
@@ -1694,10 +1699,14 @@ static int mxcnd_probe(struct platform_device *pdev)
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
-	host = devm_kzalloc(&pdev->dev, sizeof(struct mxc_nand_host),
-			GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	this = &host->nand;
+	this->controller = &this->legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, this->controller, mxcnd_release);
+	if (err)
+		return err;
 
 	/* allocate a temporary buffer for the nand_scan_ident() */
 	host->data_buf = devm_kzalloc(&pdev->dev, PAGE_SIZE, GFP_KERNEL);
@@ -1796,9 +1805,15 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto escan;
+	}
 
 	platform_set_drvdata(pdev, host);
 
@@ -1821,9 +1836,10 @@ static void mxcnd_remove(struct platform_device *pdev)
 
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

