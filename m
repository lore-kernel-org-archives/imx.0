Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593767;
	b=EDA+SoRMevWg+CeTpJOzjw4E94QhkM+BlOvgW5nxvPXFeEV4u/aU38C++c3+OH5D40im
	 88ez9cqHB2JWFy2l4ysPR+5dTradrv10TtByFYkoKIWTjtpYl+gvDCVkyn+6WZOSEUHwv
	 UXPXOQBzZK7LT5Ns4FwZKy4W/C6c5/ASf7BM+cmMdKRV3V/H9yl/7m6vgYDjkLtqFMEN6
	 o5yQRZ5ASHKoI3JmsYdksGwPdxELRa1dusU/MvSq1vvo6OwDMusqeV5lfisFcsGiSZTWx
	 yQJ+GytAkVUkOEpiCsa+lsaccsqVPTTQLwzsA70kDlp7q+tS0CPH8dJsyfG+z33L3Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
	b=lHkBZVOm8abi/42rSBuraS/V/a0vrmppf3IP9jtT+jxHSV1+yUv3MuJX+B0xstSC10RW
	 zZkLFHoikPVF/9APLuSXzvGbQQvtQrDQD093LdJUK2oYRBu84c4RDOYXgoay7Fkk862pV
	 Sf4gHfShmzzi23ukr90crdjIF3Khd8w0VoPRx193erlGj41U72QFKAyHCHpgbu6006m5o
	 lYJTLKixy4osRulUKzM5u8tp6QzY7RvPbXowHvX/N9+rlmZqnKZB4QCjNqIU/8UB67DnV
	 DPjChDwJRxbY8LHrL0PXg7FA6e8yZO3gqbFvG4aSBthypCE6y7cj9+gGRV6bsyfdNow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T1hL7Hvz;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9796160A2634
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 18:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9796160A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T1hL7Hvz
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8253bc5a613so1454540a34.0
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 10:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593765; x=1795198565; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=T1hL7HvzFVmzaO5CH2aVXTM8TqMY6bBVS8Vz46xrCKYTWF/KeI7iVl28mLfbFndUKt
         quBqEc1z3VBIUUzgdBjoBBFYVTF0ptM/3AkLmi/2X0uFJIfnGZXTX9/Afaq3P1QTKlbR
         FQJkFwFLPzHoWgZWlf0XkJo16wO2o9ytMDuAWiE//enMdrlx97wp3EPYZNsIZL3Z5yG6
         qFowy1zY5tQckemBXWmRF9ywLvVe/cmuzjUhYAgkBjExPgEI3pdn8V7KSwFXDFw+YtXZ
         q6GsNHRMVJD+JaSO0sMwUW6xa5wJOGoKbFzFfRqXw3zmqKuNoGgXzFFnkoXJWgVwyKGj
         UEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593765; x=1795198565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=Q0Olb0/AnOEN/nXFmtEpbxDjeP0w0si/2DoF2w8IfUPizelyYJTLEcEJIMFQe2B8gX
         gbu65r2i5L1LxpwN87D+zrw4aJ0kABZEyvSahHh8owI0EbA4sNCIjrVJAeWwblf9OhKd
         EsdB0QFAOPIYH+JFHEKrPwmUU3b/jx+ElaL07qE+Y7eNVuW2dSLklxEe4BUIfwGFeScx
         gu3VV9WKPV/acmtmZOtlrG25Dsdu0DSbGsLeSf/m385PguLPacwbXD5o/eve2dcbSBeD
         aVfGTPFkJEt9f8z5ROn28SQWYl8ZZC08LQNbyQcQywpPnTZEZajG3IWs57AWO3eH+4tL
         OfuA==
X-Forwarded-Encrypted: i=1; AL+hErHlmeiErzRPA+vDnMJI4qq/qHEY+WK8ifUVEedb+IOO2vo6pOGJJxL0UJaUx/JZ7vTCuSs=@lists.linux.dev
X-Gm-Message-State: APuU4Z/2um6fJGxB3UFAGExTC2tmAH7Nv8ekvKsk8k7+7oZv9wM5rlUx
	Ax10UjwREfhcmJEx+GyudWf8jdtkTTE4gneEUyOesOzXjLkAjTfHK33S
X-Gm-Gg: AYBFou0KWLoxRhUsHckdNifzeWnfSiKzuo33L3LnX/w+RfayP4LLr1F/WKPeiLq6XHT
	qSwkHZUG7wIwPers1o1i/QW6EAZ9ISLjNt6gXSzamGAPo9Nj/WjgcrQGj9LHHtJuuOvy/Hm9uhC
	zUvGTMHAPCZMTnu/srh2FrxQuFFyNW0F0OB4avkIubkKeId/sfQKwZsyhCh0ZfMOvv72M2s89zq
	ghuCz3+6DFRtYrh19xHBxhd0rlAzNg6oaBTUVW8jjnu3XXBVAgz4Afj4A/gsjzPvdh6FL+f4qJ8
	31/PSOm8Ejnp6gHDREq0IMDWWVq/wuL5Vy1nSykjsX1iKd12wuhUcl+LzLt0OCfpf0MBIs8yaXo
	tNuN6+sXFXluTPk9RNvpcbzYmxKwHtTp65dvZ4UrXgOjzv20zwzAqQ3Ea6q1vFMMFmqO9hDX70I
	VOjQISlC+0uvRK9zKMcjrRmNvjX6cemYm7IY3CHEXZ/7GLQykyp0ayImczOl941EtigkFPCVNA7
	Ge8oZ/VVkeR3CLPSuf31B0IBai4fNtyOHGJZQ9osamWxf+AJKGyqS0w77UiTXyElkwpYPYDXtYi
	yQ+dt/EpzbyZByBAgfGNH11RBHyjsGC8NjAle98bQrAERH/TCIiY/Hw2clZ39HE2ztDg5sJhT7E
	ZlnkYttbSjQu91LVkBPrDavJ+5K0Vx6hYb91aBFy2cKHeXts+t61wjBAo07l4qVZUTPtNKQiK+E
	kdObhMsf8OX4UaY6f7A3rdEp76cLPFOx34byawxCGzubUgxszuakxvK/2RFnptGjlBTwYmJ9VFH
	g==
X-Received: by 2002:a05:6830:230c:b0:822:a034:551f with SMTP id 46e09a7af769-86289738d61mr4118424a34.2.1794593765498;
        Fri, 13 Nov 2026 10:16:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:47 -0700
Subject: [PATCH v4 31/58] mtd: rawnand: mxc: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-31-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

