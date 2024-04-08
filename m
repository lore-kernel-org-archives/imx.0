Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAB5146D74
	for <imx@lists.linux.dev>; Mon,  8 Apr 2024 23:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712618006; cv=none; b=tyXEpxyZjTY8LxYPF9eoevTj+EwahyGpaasjX0bwM5diG1gFevSxaaHOT2h9CGfTYWXDMkgZQHUVihnqd15iywFeT1RlBwIzPguA5EC5p2MyUWsL539OdNCmK7lEM2ExthzBMwONiLZo5zdkyWtFL9Pv3aJa6VZe2eEHgzKOfZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712618006; c=relaxed/simple;
	bh=UeZnCjsFlLic2qaSZoKNxomMdFYr768316T0wajX8u0=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=ibgRWHGXaKGD8PZBOLayrfruATwiHoPe4IWTTm4CcHgVuwYp6hY99fDCzA33t5+G50vuNLcp6sHrNZeOBC58I9yN62xHTbBbJNgQ87VSn5EBSKuKHxJg0+4wp55Yhg5VZvgUtpMXPE6XBTUQUPYR9OljD/VxSPPmu+oqkxzDSBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4M1kq5WJ; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4M1kq5WJ"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-615110c3472so92955077b3.3
        for <imx@lists.linux.dev>; Mon, 08 Apr 2024 16:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712618003; x=1713222803; darn=lists.linux.dev;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eHsEtZCKaHOJpKzkmFo1QTaciQX5xyBED5wwHFx24rA=;
        b=4M1kq5WJFA3UXYL85p/0vPm1rz1nEl59FTb9atHm4ykCbk7Sf4Pf5T2kL+Tw+kzXf3
         xTXGrNY/Hv8BPgTqShbd4dKTrPI8laKHCkt8l1xGrxzH0drG8XX36Lf2SaFQZf9M0qOx
         miOKlBfgCDdTIVwfmThJOhX6RjMSLZ0gdtIpS60Gzwm7WtThCPHWjKYh8aIBpYv/3DIb
         3a0EVDpNoue61uTQItgujvsJCDbNKh+ZBNuds61evR+EWe1NnrLNbjLkS43D5K2PgHVo
         3/U/FdbRM4/jZkCnQ00ZK50CVFDPSCyBJ5YXFvPkWQvVwVeBRp/FrWP+NFxVpO6AR0Dg
         Dr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712618003; x=1713222803;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHsEtZCKaHOJpKzkmFo1QTaciQX5xyBED5wwHFx24rA=;
        b=Xhp0MMTOy1Z9Rtg/6lAoQxJw09DDZ4f3m95TuKFzjm9zqyqNPJZzLzMHmymFRirqRd
         aR1sy2av/C5UWZbshy5themMZCAVoOMtiaqeINVTy4qCuSxbs0DRgxb5qgE+exCmBFnG
         o6SumhQjchK++oKmRXe93qS+Mm+xIWSa0oJgRi37+RlwTpbUaQrrMVYfTdrY1kBP3mxr
         GvOOkdO/xGYdGy1WgrskM0BBH3hZThWrmN0rqR8N+3IIuo+0JaV0aJO58T/v8LSmvUpe
         VYggvZ3+IvTm97Ht/doZXzS11HyUoeWfvCqiSBReYpjsFzZTp0yMhXtgleETSr31hqb7
         uYTw==
X-Forwarded-Encrypted: i=1; AJvYcCVJoVd3SYRHLIhBjzkq0Z+Vo5/6AL2M5mlPVkgVkdUyQe6v7sWo99zorFENUu+U4EtUurMKr9IwJNVr2UAyMg8ntg+h
X-Gm-Message-State: AOJu0YyPQsSwzk402TguvLUQlanC95Tqa1979pd7Kq8MEf+Gjkct7hh5
	5Tt3u21KWudV8u4TpBVqPkzhZ01Q3DqnRxWcvH0AKQHBUoQ59005mlXkvBNUCWD3hsAHG2sIJRd
	f1bfj/vrHCX6e2A==
X-Google-Smtp-Source: AGHT+IGUNVwH6Vn5KU9h3xgJ3juWehgll1GRUIrL/52jY9NzlwNFR0T9bAXNZP4TZgr6puPAMVlsBtbBaZPruJU=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:96d3:321a:67f3:5322])
 (user=saravanak job=sendgmr) by 2002:a05:690c:6e09:b0:615:33de:61d5 with SMTP
 id jb9-20020a05690c6e0900b0061533de61d5mr2900141ywb.1.1712618003548; Mon, 08
 Apr 2024 16:13:23 -0700 (PDT)
Date: Mon,  8 Apr 2024 16:13:08 -0700
In-Reply-To: <20240408231310.325451-1-saravanak@google.com>
Message-Id: <20240408231310.325451-2-saravanak@google.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240408231310.325451-1-saravanak@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Subject: [RFC PATCH v1 1/2] Revert "treewide: Fix probing of devices in DT overlays"
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

