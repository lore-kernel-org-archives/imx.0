Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593769;
	b=uPFOPGqQNfJjEib3M5YALVojQePH+w700nKISRtL+cicqnox4RtMj/Vw7cUHPsJxtMtH
	 +JDGSqKpEBr0HfnKlKJVHv2CiKeQyo0z7HF7TMALuA3meTVyKltVtsK86ADs+nkosX7Pk
	 Q3j1sHpAM84HvKv8V0f/qoIOHWFYCB1R5PHV9810MBU1/wBDEwPUh48DCqJ9Br6OwuVDY
	 XCKFDiUdwzOPJOVy2wOB3YSrAqp2zPdE5VFIgNQOA4BTT6ZRYFNrUtHM2r3MpYx2Y0zm4
	 4XOQTxKslaCWAsD3ksXwXlsdvOe7OwBGN30uQkCDgnP5SXwJazgZhAUJwck6K1QRoYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
	b=dwe9CAa+ljEsGTxQzVWnGqZJJBD3ucS3nxmdJ6V7U6b4Wl7y1YkA9uir4pS0fgPjN9/3
	 ZyU4uDklQH8HMvhggHZ+E+H1Xmit40A6N8JQp/wyKt96GVKRKW4AcE19AOju+v4WWQ7p/
	 ER2aBhXXoyHeawzkuxnuvLbkP7CB76GMfcecoSx1oZ/MGhRESlsBvbT8L29p1mAFq/Xla
	 Q0BbP/7r1GZc9AbYbVoJir4stdRZ0vTs5jjS/AZosSwmvAZZCj0IYsNTOWJAmpLYMP0Cp
	 3fvXuoYyVMO+Ugl5g/NsKuX+Xi418O4OkmJgAL3ObBNpi+S9e8y3RySKN1YkIq0+aWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l0pNxloh;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA8960A380E
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 18:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA8960A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l0pNxloh
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8628b63dd60so390186a34.2
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 10:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593768; x=1795198568; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=l0pNxlohVhSMs9cus3Gi5qv2zHd+lzH60yuGeE2UjtQPdzhC8lZKZ3nDFJ5ZTbZeix
         vHfg9Plfmp0RNp7Zg9gyugov27UnT3cBurzKvAHtXf4ptsh05H/bG5vdXl6ii6NQxbSW
         YPGOdMb0ruRyNb5dDxj9Yi6FcSLAzFscDypdR2AWiruanNgfqdV9PsIxkvkgXujp0PZ0
         H5nh6u6AuG4U3HJU2pUT0nR+ynZ2uTEe7s/wvnLXHoTHJKxylcLXTcXV3yWhHPHlRvpp
         z1mgaGK0ukNLmx0DVGU8xcKgz5ciyNBHwHWuJzjDccvsn5mLrZlOGqIu6y+RNfrom2RT
         Z0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593768; x=1795198568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=NqN6fexBk+QVVb9R4h04H+/tBRF5fPGoDh+QRKa6H0kmmn3yVN3/YHXsJDcfrWAG8q
         FvPaJHyhRixqb0jEqQ2lM6NEmA/bf7J0WDBI7uNKuo9tLNVVA9UaIbdvlWfcQi9sTdeX
         BbtPtxJIjwMC28+lQH1UyCZEjFSWKrFsWqfYJM03mvXlXouy5PWNwcl+tbUN6ikDo0zu
         E3fPYDkLUJgmBRYY8aVPP/f6dpPUrqD5m5ZU7q3n83UYmC/IGMlnkUsZZkWjHn4iF7MA
         MMKY+AIlDDpJTEGTyqyBYYT6YgkkLyOPEq/Dw+elXEaDZLetQzTOpmr1YFRpr1jymSHO
         FR8Q==
X-Forwarded-Encrypted: i=1; AL+hErEmCRGWA6c1U5novmYm8o6ua++rx0kwy39DcojszC374uPicTmIZG1YwJUgHW/urqxAm4U=@lists.linux.dev
X-Gm-Message-State: APuU4Z9vbqjYUUyAxp4fKt44ZOitjFpwTdLZ8ktFazSKK4O4SpiSDzeS
	t5yOHwaXw0Xr1oekm5Mng3V04Vm4Hu3SRxuy7Xq28SHuYmV7yJuVQADo
X-Gm-Gg: AYBFou085VyAwt/WMekWb8tWXQuEEg0oVZugINnMsVOkjVYfTmSZFR/gHktFStaahMh
	/apFh1tAS6akIH2n6lrcmCh25e5ecpY6JbSqeKfxXTQ+rVgdVmZANSLQiZ9UsZ0UsbRHu1MfLWC
	7sT9W19jnfn/6Ay54fJwjt0dsfDYMjM0iiVyPIm9QpDapKBAUKJvaJ7yoW4TfH5t1RI1KHJlkrr
	C9G4ZN8wfrnXeb1hLXZToKPb1pnJZrgqOO4gpYNoLl9TmWJt/ked1Nrbzns3bV1SKMMlk6tW978
	cvIPj2nFdesCxrop3zlz0SnUPb7R99/rNdEtRXhWSqysg1xRfRqovE1JZprHPFwCkH1rloDsx2C
	U1zqt4qdl3b4VFx6cA7RJd/kjIQi1Bg8Bx8zwRZ/1dV2Qs9UUb35Re+5o3aLjYbQpkO8ia/C5Zi
	xtp6H3xrhNK6UFGM40wJQr1YIyL75k5vtGlc5x7uxAo0+m6jHEGpCTtdAE5FxogDkm9/FgDG7tK
	nQt2mu0aiFLQq298GS3NJ1criTyHUb5ENgw2xUp7S9FQao0+3rJNAaplo2u1evN7C4Wf19c/8UQ
	rbNQRwDY9J2AbwVPkVY2VbadqJW+8N48+k5f6LKxfYEULFBf4v0gguT7fEsfZwpYCL3oqnwUQPD
	FjwxAerRKAaWBmB7MCw+nIL2RYfmLNqRl7R0hqgtqMrWyx64+zntEcg2RZVLOtvr9kr9T3Bn5id
	0CLkgxYkEYA2ClgrfROwwZn/oOqHZMtwG4GsqHiII+qf4L029NrpY=
X-Received: by 2002:a05:6830:3489:b0:829:8a9b:de79 with SMTP id 46e09a7af769-8628979e4dcmr2843473a34.4.1794593768395;
        Fri, 13 Nov 2026 10:16:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:49 -0700
Subject: [PATCH v4 33/58] mtd: rawnand: gpmi: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-33-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, Han Xu <han.xu@nxp.com>, 
 imx@lists.linux.dev
X-Mailer: b4 0.15.2

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

