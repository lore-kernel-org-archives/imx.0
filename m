Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810627;
	b=y5j+N0BDsvgk5V11FPglfSmSjvtiUKwt28CDkQxiQUBLdLSWrFvcVVCekVcCFHMTTV/Y
	 rF8Ap2nKOJhiNyILw/v0QnO2++W5xE+xi5yVZC/L1S796ssGJ8fdMoagswVkn6WO+g8Jg
	 QEgRRrlsoDh6PgFVkbLHDoa1z2xEBG7egXO1qLe3JQ0d93LwuUjyO2FVYxfxpV870gRYS
	 /+KzOVQyZwCXWthgZrU1YGfS+AnXcP9yjFfH2bhwyD2tCoNpqwrrXseblkvo3D6cKjTNt
	 zqj2GeGY/cLu/3Rz+6W2hPXzo2QAdIInoMiARhHEONwfrfzZqdLfJmFOCmD6T4DS7aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
	b=YRYHJzdWoSsIwfyAK70xHTNVURiCZMgwlrxYKrrkiPE/48NV/Vi1bGwgwbHlrL6FzBl0
	 dTEVickoDmpnu68PaaJBBO6z8Nq7u+f7VhrKK9F7b/1wD+aQ9RMN+lGWWXvXt/TpfGS7X
	 g6+i/vCefRqfieAa9gyaiBfTdzToL3nuwbdGfwXFGeXzeAiFifgO7vpgCysu62/q5YPsb
	 WS6YVrfkczH71wkPqKPYhvVSvm0bNBhjckqda1TwbFH8ZKrLUOksUjtOFtm6rQ3Y0o8WP
	 xsCTgKdp9mfInFIZ34p5rEhWMEkG9ow4cm/LcmGzttBoOzC6zh0BAu8Eb/L05tTqPOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=maFh5pjK;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6939F60A6F7D
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 06:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6939F60A6F7D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=maFh5pjK
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-7190d9bdb2cso2620122eaf.0
        for <imx@lists.linux.dev>; Sun, 15 Nov 2026 22:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810626; x=1795415426; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=maFh5pjKGoHJKsRpZsdQYyqg8YJsf05VTlQby9UPwF/v4046iJ+n9X2/pgr+b6hwU7
         /eOh80uydNv2kBnCKZ6WvQ1oxK9WZnGoLJdLAkXuUFzid0cQCTMHgFAZLeTKNtiA2mWm
         vMLSfGCdBxxVeiVjomyrcQpGP1jwX1ZY6dU8i8I7tUvl9j3T7nGRP4WsmYkcPfN6jeyb
         gqcVi8WggKWGLjky8VY/5spKCApekKbCpHR5Es2QTYG0r+WpeFjOv2oG7uaokEog8jpU
         DKF8PTfNOAqkyOhJy3niHLq4PQs0OgepvBbEw78h8qJmktjWnnYOr0330qUMs21TKHiH
         CnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810626; x=1795415426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=btODl0L5aMLOD6ccgsupuBiBltvH/GLKaEcVKCb58osOXYzLYQaijWnSTySOxDqAqW
         7H5X/QFtgc4iN2XUhGLluFHBsfKMxk/7JrorlqX4Bpz6wftJjFqvIJjrbGbocEQ6EidO
         RVZ8mQVuv6mVQlPvaAtua2vtOhoyvX5gJkgzDOOtrQM17sWjlqsT66dr4l9CaXrSXrWn
         jEDDF5RzszjfBPo09yOEvQJzkKLYXg9o1LiaZgCu7Eg1Yps1CriagbhlLEPntyQzpwaj
         aVj6XvwC4I7N3mOrDPGqXEmFzhpRjoEUqZv18EhxS6rzFiADcbJ93vFYOQAg9AhTwDje
         YLmw==
X-Forwarded-Encrypted: i=1; AL+hErGc+Ec56Eny4HEfZyR2v/2mKeWUCam1WhZ5vtdu7KkDGw6LuP/f7ILVix82z3cC48NnvLo=@lists.linux.dev
X-Gm-Message-State: APuU4Z+E2fHedwCH4GBjwpt4Oze0i9xlEt//GOtPUnQEiX+uTjE5zXeP
	txX68MRsb5r9lt5peWc96u2ofYjkt6qrZ5f+UyvKEv4nmnlpMDYogp/qojy98AMj
X-Gm-Gg: AYBFou2CGYUpgh1Dr1LjfyRXm25KgXGSIzEoVFo6fGOPDQUhrAyYWH+30RUKjd9uJOR
	RrY4kRKqM1bfq9I+Ry2gF3g5FGAyn231wVWumbmDcn7LMw8mtM896cjUw7a5U7wjfADHgDWwqk/
	l1vhcuVBUvGArMbAxOQzdLGD+294QR9Hf4BMqpyMFX6t0aiLvkKYX3B+st2RNTn9CGbpwBOBVhz
	aqazJhnf4vFXlsx64Okir1yTnfkLVPoOECetVCb1pdnxFSvDMcfqSQ21QxYiwUSJeJp+LnwZ4bX
	l1rcu/bcEQNaAtHfIKOLrR0diHUc9dyenV3rlzPFzz2l/UV5XR269uV2RGk5cYaIxr7DRArvWwH
	4MpVAfkhtV1YZ+BMFIEG2Ns20SVuus1lusNqM3gBmF1JMu7Sli1U+x2NlUP7OtN5LRPfro5Pp2p
	vA7DzqDjTS6PwT0B+fyxD26TepD4nV8PUYifMeJ5HcWanQfRFllsH5Dp1q2YREn3B3ckaS7J7M4
	OLQKqKxi6AmwihlH19EiOlcLwsw5LNESKIZt/oTDYQuPBUNv+thmH+ctl2hGvBWEPYQuJDNAngC
	IoHtAiPeN6yovYyCpLfOFH8k84lY7QR3gng5b0cEYy5COtnIpYtCHwtchAxXhQV8l/ruYZH6v2Q
	Q7FJFRulFWQ9L1PfkbvU+jbAcBlXv1YB939HwIGhx6vwBHj1IIAVHaQHuPYgY3abVN0Fkea4D9+
	0NnNHWj+doAE+AjmaHYKekDqFQq2p5np/BkFDgfC+nlFvnNTns1/A=
X-Received: by 2002:a05:6820:1517:b0:6d7:4af6:e292 with SMTP id 006d021491bc7-71ab4cd94a9mr6597662eaf.2.1794810626312;
        Sun, 15 Nov 2026 22:30:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:48 -0700
Subject: [PATCH v5 33/58] mtd: rawnand: gpmi: retain open-handle state on
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-33-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, Han Xu <han.xu@nxp.com>, 
 imx@lists.linux.dev
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep geometry available after removal while releasing DMA and clocks.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Han Xu <han.xu@nxp.com>
Cc: imx@lists.linux.dev
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 4822485bd512..8fc78e679f0f 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2744,7 +2744,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
-	nand_controller_init(&this->base);
 	this->base.ops = &gpmi_nand_controller_ops;
 	chip->controller = &this->base;
 
@@ -2759,9 +2758,15 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_nand_cleanup;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_out;
+	}
 	return 0;
 
 err_nand_cleanup:
@@ -2787,9 +2792,12 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	struct gpmi_nand_data *this;
 	int ret;
 
-	this = devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
+	this = kzalloc_obj(*this);
 	if (!this)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &this->base, this);
+	if (ret)
+		return ret;
 
 	this->devdata = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, this);
@@ -2838,7 +2846,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
@@ -2846,6 +2854,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	gpmi_disable_clk(this);
 #endif
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpmi_pm_suspend(struct device *dev)

-- 
2.53.0

