Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810625;
	b=Y92Jp4XjHm/pf+GLnt65ffrl2/IX/kaCZxzYoFw60GpLik8KnGTGPx+l5/CQw+xOcCsM
	 6/ACJs5nBKuGre8JmfwGD4HJFi80QzFVcdGY30r0gtFOzCBVqoZKqyLL6TFiJLPzppxsc
	 3P8T03i0IpDYUVhLuIPgylDkpWcV2EIdirKpvYZqFilfLFwsuROlPLVZlJV4IxVRx4BZn
	 WA10UQlGaZk6G/7MhLhD18pA7U36E7jZlRPHE4UIJWTQPhRAki2dHNB9dMQ2D7kYiCmhC
	 vnq3AZjaqgpViIM71XhdR50OGYr4zKaXkC6qkBxhrpbgPR9A9ycyYmzuE0RwN87oMBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
	b=4e9e/aogcEP3qxgghd+58UcjzZX6vLj559XkBsfYYUzAsmu5S4/xHlJ16M0rtIH7nr8g
	 wMq9+/7WHJ1PpHfZ3g9WTzzRUmedPJUOc4QPG5ED5piDSI+iZxEL6Cj2MHPaacnA9asie
	 OOHGHMHTsp4vIe6sXjBsCjhcKNLfYuiA7OyyI74bXdNZv+AY+O1CQTQzxTQyiopnVcRkF
	 diKzg2YoHQ/PFI7Na7pCN4y1deovJz8+Sesgd4x1S05YsMoxfHKd12u6vPwripV51hK9g
	 m/0nOJYMkipyfsRRPflYw+BQeSyMdInJjao2G7S/Q7IyBwJR9IxdUkqHbkR5Qoe0UcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KuE/7zik";
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3361060A260B
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 06:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3361060A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KuE/7zik
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-71ada4644f8so660444eaf.0
        for <imx@lists.linux.dev>; Sun, 15 Nov 2026 22:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810624; x=1795415424; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=KuE/7zikeQw1u5AQY+WQccJS79oSHUTMMznyOIbIpaIxaD1rnehY71Bamy4/z2wR9E
         1dsskeKB6uGTn7iBEvSr1vg84n3XhUmWu2Q3zf6W6ZDIv3RuPVfFVlwymW0N21vwmsxj
         D8Eeo9bZy7UrOVjftG2VHxs9LiV1NfDGBTAjLhCz55xAejh/Rl5/8FXsgkJ5U8HGmdr4
         81Zmc28dazz5eSEagP4CZZUGVIddGxg6hYkmBppeuGJhN/wReJ9PGc7UTAig0oE92+LH
         stZBAkjHaElaVhcPQLjW7bZImMpUDKH3cdZU7/tDNZZDHd79y3O1zc+h7VJpgAFN4kKG
         4ALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810624; x=1795415424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=TKFQnMG1t233EsMJPihNA1UEDm/L6z4tyqgtZtSkJ9khmMqjysLkZ3o7cmharXeHtp
         l1HEmzSNfsHklAgaHFbmvafU/X0UptUEiXMD8jS9n4R7fBInilc/sjiGQ5HPwGK0ueS0
         5yJvZqntjWUNbPfhDsW3zW8mJ2q0Tcg1nIFzz4FTNJBZJjxlBaOaqFS2gWcXXKI/cx/y
         F1PDMWNm7JktnueiWo0KM3xKrLQawF0S+3EGyXFObPRMrlEBVz2K+NE8gaPjcnlwH71v
         EhpdAG/2QTqJ3pb6kH0Lm5JsYZfJPhcrxmxnDrCuqNjU5DPJtYVtQj6dFvHzsvwbvUdp
         ixfQ==
X-Forwarded-Encrypted: i=1; AL+hErGB42esMu1f55s+1B+lH1w0L8c1R4MTkxB/S3CAEh9bNZiumIQas0WpZQgCp3kEL1EZ83U=@lists.linux.dev
X-Gm-Message-State: APuU4Z+qDe0yzdpwd5x72s1kehtAfVDFuSJZ/CZtRxqZ729twAIDrwdT
	x+qESfKKaF+h2pMqt/mPpSwOtp1XFbxeQheUygbTjSTDkvmT8LuzDu1A
X-Gm-Gg: AYBFou3nBG7BFRIRYFALLMfPDJ0KLpfxX73/zGJRK3ehEOQQz2l9zKQsCtsvgzoPVkl
	FRZwYe0gIHBex4VQKvzpY1G3lA76Cd/GjwacMPtQPj50/wVqtpA9FvSiHNDaWg3qu2uMiKwZA1C
	HlzIP0PqJY6Hd+L24j1JZKbd9rz6b8ILSlDg6NmYOiHz/fy1KBv/hj6d6daW/L8byUOQisiXmDT
	EjmEhMnypU4czM6y5GR8OcmqCoqiJHU2AS8MIf+XRKNFeF2NMhMD1ey4O9VZduXrM6Xle8XV8W2
	zHd2rtNsU/mxuP0/LULLatcnRwZEJS5Jm7tZYMJYpYut+e7tSnBtCKRZecYJHW8X3Et+BnjWhrL
	6EdtUYasszIDvhIX9fu0HHiEfDMTI5fAxXFddKNzh2neKzlrLf0mMzLW/n9FEmHLjNW5qWR0u4Y
	I2wfYyClMtc8NnLeEuxNBNbbRvw9y09zpqgmuaY4xD+LjQZIALkDWxVMgC0YCMz6qyTgyGv1qr/
	vY545NLGQteFP2LDHReqJTcvXCyE0lmEFIgnj1XcrgfSq+9sSrL9kcTRKVtgiQqg1wG77SIWArC
	utc4GvnvFXJ+Kmj/jUQQc5FBmrRaqBx5RuYMnyzakfWbQ1P7Mt/LDUUSJ/lKmhEqZv1D23f1X+F
	njwVy+SV8uz/jvwqM9wAp9w76yjoeuZx1ECH+JSF2Tch3w3SLx+QJWS/iolu7/gGFEmGObIfGMQ
	VNhCgVNXZ2js0aq42ofOMpLHXkvDzve/Xojn48/06qIwuZwrizgj4=
X-Received: by 2002:a05:6820:f016:b0:71a:ce4f:4a7e with SMTP id 006d021491bc7-71ace4f7812mr3792885eaf.12.1794810624151;
        Sun, 15 Nov 2026 22:30:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:46 -0700
Subject: [PATCH v5 31/58] mtd: rawnand: mxc: retain open-handle state on
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-31-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.17-dev

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

