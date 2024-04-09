Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D166A8AE
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 05:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712641038; cv=none; b=DSPlkOugS+ku1rKZFZST70cSBX4Ij0tqYW8/rvL4T0g3Yv8xtdu6CeezrqwNHn6V+SG0S99KOFcqzbNvbGoK2joLrEVpTvm2FrMgWGhyK4pL+briQajTOHbvwNTOWeRI1MOIZwm39XmafHjUYGqVPHPeFi8iNs931SObPMJzXrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712641038; c=relaxed/simple;
	bh=UeZnCjsFlLic2qaSZoKNxomMdFYr768316T0wajX8u0=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=Lbdo1nzWrLJOVgCiyVWa3ajzE5AT4KB7sZU8/imlB5s7sInH/YQ3SrlBxlvSg1EkNxsiesIJJxoJTyhKCDiRb/tSjTy4Pky+6K215d7+5+oY4X3qd0UNARl26H7+f1hb6JjF5ATl9uC7yvEpnP1bFajzjCr8JetQTuSI42KghJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oDdH/liE; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oDdH/liE"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-611e89cf3b5so84693977b3.3
        for <imx@lists.linux.dev>; Mon, 08 Apr 2024 22:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712641034; x=1713245834; darn=lists.linux.dev;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eHsEtZCKaHOJpKzkmFo1QTaciQX5xyBED5wwHFx24rA=;
        b=oDdH/liE1x5MvjJxdhWmtS9sSapYAHuslzCK/t+hw7AmFQAyTLxQEpL6ujdDfSYPKI
         uzMCsfK8Xg9CunIqNJkvV4pmZZYkClb1Wmlq2yUjfaRGShIpVhpTFu/6ZuKtTQy0bno6
         oxtkF/93sFYHomzzEcOL3/o+VS0TLkHqY0jxlC4M8oGbDrnKx6r9txO3WsGp7Yrqxs6I
         ezJkalzXuCcIv5mZD9CadG0muzXAG4GkGWVH9EwybM/smKnLxWglURC6Hm4L7DemF7mV
         ITahOI1ibaQ9aGwXRJHbaLxxL98OhSCzZbc4q/INJzt7hPk6p09CR0dGB5BRrLHIbFbP
         HYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712641034; x=1713245834;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHsEtZCKaHOJpKzkmFo1QTaciQX5xyBED5wwHFx24rA=;
        b=W49hfe3bh5ZdyUHB02Ntwsb9HFbsX1Hzm7FOe/x4v6yAk7lt+lkFz6sCITdMbsPt7R
         312/WJj7/7duMCwSqtvTo22XT+ZsSRCgDu7wC3vLjOhRdb1LjF1hjhyTZz4s07Yudb07
         9stVsb11gbj1BC6h1RpzXNf7pi2WE4lYnVbHIWqFApm420NZmpn7fmEQeCZ6nAk0PVXc
         gTOLo1EMsg1VT55rFL+mueqFtpc/SPnBhm/OCpt1gr2U9Uq4CGrhz86pms/ftrHho74H
         Po0KsC+RVZPwuzSIJGFEIGUpgcqGdsy0kWSTb8gFpFJIv0eXSXLzSxXaG9hnnSW3VGjK
         fdWg==
X-Forwarded-Encrypted: i=1; AJvYcCUwKhN1yL+dmlJdNDfnj7t7Z1g+aOXIoqQaC9rYP2c7J2k6l6TYzRNQ0kbupswckohXHTTsoCwfmTNWCHo6tCmNfWT6
X-Gm-Message-State: AOJu0YwqE4lUl+F+q2US2CUNcE4wUsE8teW2lKZMyxfiiIqgmcraJprA
	BBOKgx+RJOZ8vEEq50c6Ny3mWKMXWf/omcYbxPEHfnAzOudxbFOg6xBMPp8e9iNti0ymHbrXpta
	WyhQtTUL8M5r9gA==
X-Google-Smtp-Source: AGHT+IFVWQRJuqt+RfUsHPn8GX0evGqrx/pn1nt0eRiDqqPwuJeYG8bIxyrI0zUOLfzh2v9qJA48jtkZ7a+SQoA=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:96d3:321a:67f3:5322])
 (user=saravanak job=sendgmr) by 2002:a0d:d983:0:b0:615:dce:e3e with SMTP id
 b125-20020a0dd983000000b006150dce0e3emr2755710ywe.9.1712641034295; Mon, 08
 Apr 2024 22:37:14 -0700 (PDT)
Date: Mon,  8 Apr 2024 22:37:02 -0700
In-Reply-To: <20240409053704.428336-1-saravanak@google.com>
Message-Id: <20240409053704.428336-2-saravanak@google.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240409053704.428336-1-saravanak@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Subject: [RFC PATCH v2 1/2] Revert "treewide: Fix probing of devices in DT overlays"
From: Saravana Kannan <saravanak@google.com>
To: Herve Codina <herve.codina@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.
---
 drivers/bus/imx-weim.c    | 6 ------
 drivers/i2c/i2c-core-of.c | 5 -----
 drivers/of/dynamic.c      | 1 -
 drivers/of/platform.c     | 5 -----
 drivers/spi/spi.c         | 5 -----
 5 files changed, 22 deletions(-)

diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
index 837bf9d51c6e..caaf887e0ccc 100644
--- a/drivers/bus/imx-weim.c
+++ b/drivers/bus/imx-weim.c
@@ -331,12 +331,6 @@ static int of_weim_notify(struct notifier_block *nb, unsigned long action,
 				 "Failed to setup timing for '%pOF'\n", rd->dn);
 
 		if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
-			/*
-			 * Clear the flag before adding the device so that
-			 * fw_devlink doesn't skip adding consumers to this
-			 * device.
-			 */
-			rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 			if (!of_platform_device_create(rd->dn, NULL, &pdev->dev)) {
 				dev_err(&pdev->dev,
 					"Failed to create child device '%pOF'\n",
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index a6c407d36800..a250921bbce0 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -178,11 +178,6 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
 			return NOTIFY_OK;
 		}
 
-		/*
-		 * Clear the flag before adding the device so that fw_devlink
-		 * doesn't skip adding consumers to this device.
-		 */
-		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 		client = of_i2c_register_device(adap, rd->dn);
 		if (IS_ERR(client)) {
 			dev_err(&adap->dev, "failed to create client for '%pOF'\n",
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 4d57a4e34105..19a1a38554f2 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -224,7 +224,6 @@ static void __of_attach_node(struct device_node *np)
 	np->sibling = np->parent->child;
 	np->parent->child = np;
 	of_node_clear_flag(np, OF_DETACHED);
-	np->fwnode.flags |= FWNODE_FLAG_NOT_DEVICE;
 
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 389d4ea6bfc1..efd861fa254f 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -743,11 +743,6 @@ static int of_platform_notify(struct notifier_block *nb,
 		if (of_node_check_flag(rd->dn, OF_POPULATED))
 			return NOTIFY_OK;
 
-		/*
-		 * Clear the flag before adding the device so that fw_devlink
-		 * doesn't skip adding consumers to this device.
-		 */
-		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 		/* pdev_parent may be NULL when no bus platform device */
 		pdev_parent = of_find_device_by_node(rd->dn->parent);
 		pdev = of_platform_device_create(rd->dn, NULL,
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index ff75838c1b5d..17cd417f7681 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -4761,11 +4761,6 @@ static int of_spi_notify(struct notifier_block *nb, unsigned long action,
 			return NOTIFY_OK;
 		}
 
-		/*
-		 * Clear the flag before adding the device so that fw_devlink
-		 * doesn't skip adding consumers to this device.
-		 */
-		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 		spi = of_register_spi_device(ctlr, rd->dn);
 		put_device(&ctlr->dev);
 
-- 
2.44.0.478.gd926399ef9-goog

