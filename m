Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D9E4F8BB
	for <imx@lists.linux.dev>; Thu, 11 Apr 2024 23:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712879796; cv=none; b=BZB1O0x6vVr/yQuSLDqfP3EeHrGT6/zwVJXZBoBvxyZUIY9s5+ccdplvQE+I8/aBD0XTvGhl8YgILIPaIvyXAbRELFTPhsyTDn1hpXyEC87VQXJi/D0dTbZuZ+oJYxocH2wsVR3lRPTqZUGBIbHALUHfC7z5DFzlbKU71cG9Gkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712879796; c=relaxed/simple;
	bh=UD3bfhO0YU3iaHR4sW0PiOGB9kKHCclU23sLM4TNyko=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=R/eRRm8pslZhCtBUzc6Zv6tMr8rv7Qq7D9/DKld0FeCzH0Rn2MEE24XK/r9qRr2Twq2fltKJeRSXCRt+LUsJdH+r3Yjairpe6MY1SDUoUngAteAyoZI4awhJxv44UcB6EPKV3rHB16930SyyARUdYgJ6uzpvHAmQ7FvIgGPlhcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LqXgGAXi; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LqXgGAXi"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2a2e6197371so310325a91.3
        for <imx@lists.linux.dev>; Thu, 11 Apr 2024 16:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712879794; x=1713484594; darn=lists.linux.dev;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HizrqH7rz47v2QLp5elrgTIyG7EQRo9SAEpqH/+kBy0=;
        b=LqXgGAXiVHWKxYbAx0+pT1aBg2DiebRwBIdmHpCN0CraNPFNH39BlURXWDlokBnV/6
         ++Fn1soY24PlRc5X9uWOVV32i9wSWvXOoi6s2zc2jz2QqKNTtW0GYwGUHI5pEbJYyILR
         pIrjXEmN1DvsB2GowFdGG0NHq48yABcLaFEvn+F4lJDr+6gF/XB3L1fRX/uSs+vdyngn
         t7JiTRtaaVHhNxKwOEvTQ9MOAqSIMf0+k0MDAGvzhY500cRViLp2ySlxMvWb6FMAcmUC
         d9QiqmHX6UqbJKaLP+vuuZ+pTJ5b885J++SrQ+cW9QzV9GwAHAxw2h9WGACrT4N7zH1g
         Pdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712879794; x=1713484594;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HizrqH7rz47v2QLp5elrgTIyG7EQRo9SAEpqH/+kBy0=;
        b=TX6tvWqXiNJnmzkZ3tR6LaV/uVfTY35W/LO5gYSwNIWpNSQQjB+5Z4nO1AYXI3hFrM
         eX2LX5k/CZefnBD4xZyYCM+yNOkYoNDqOfHIB0wS86hIqSxjl65E4pkshVy1xupOex2k
         cu/pkfutDqEE9vRIpPMifTbA1z0ZJfOGWLs2SD4kO1ZwUkTSolljbEQMzyHOY3HFV3XP
         GN29BoQV/B5d1i9BpHNqAtdqDaYCqwlV2rKv/26YUq/D1+QbY1EHaQy5ndzsudv7SvbL
         UOSoAE/ceHxExxo05pwZVXdDBpKxKUvkAngCfUjhliiILDQuI2D+v5gmYU6w95x+pG3x
         48qQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1MN/0MP/5xpob6KzjoTDk4vGT5xlZ3/XVmFltjxCHDrZGVbrlh3LPRNicoeoj5VDlqLan40RkuAM+H6kjdBzfGPEH
X-Gm-Message-State: AOJu0YyZGob8g7SxAjZN1wwkukFFxqMNBmaM1GrASBP/4q0N68uXtWO0
	RQvfL9b4IeZNn0nTnuCuq2vFMHx7d/FGm/93zgPjfnb8JVQMspb2/mwLCGGNjcz0+qOrgkUc36A
	EPpggP9ORu56Gfw==
X-Google-Smtp-Source: AGHT+IHqTq2UPkwQrTsIwISL3TPeqKf9uyBTI5tIlaviAP1Wf5pw15DCSNWSteziJ1gjlX/gPxjg3k35MoA1MA0=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:a472:f40c:d4ba:c29])
 (user=saravanak job=sendgmr) by 2002:a17:90a:6546:b0:2a5:fb3a:32e6 with SMTP
 id f6-20020a17090a654600b002a5fb3a32e6mr3270pjs.4.1712879793807; Thu, 11 Apr
 2024 16:56:33 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:56:22 -0700
In-Reply-To: <20240411235623.1260061-1-saravanak@google.com>
Message-Id: <20240411235623.1260061-3-saravanak@google.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240411235623.1260061-1-saravanak@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v3 2/2] of: dynamic: Fix overlayed devices not probing because
 of fw_devlink
From: Saravana Kannan <saravanak@google.com>
To: Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: kernel-team@android.com, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When an overlay is applied, if the target device has already probed
successfully and bound to a device, then some of the fw_devlink logic
that ran when the device was probed needs to be rerun. This allows newly
created dangling consumers of the overlayed device tree nodes to be
moved to become consumers of the target device.

Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
Reported-by: Herve Codina <herve.codina@bootlin.com>
Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/core.c    | 76 +++++++++++++++++++++++++++++++++++++-----
 drivers/of/overlay.c   | 15 +++++++++
 include/linux/fwnode.h |  1 +
 3 files changed, 83 insertions(+), 9 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 5f4e03336e68..1a646f393dd7 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -46,6 +46,8 @@ static bool fw_devlink_drv_reg_done;
 static bool fw_devlink_best_effort;
 static struct workqueue_struct *device_link_wq;
 
+#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
+
 /**
  * __fwnode_link_add - Create a link between two fwnode_handles.
  * @con: Consumer end of the link.
@@ -237,6 +239,70 @@ static void __fw_devlink_pickup_dangling_consumers(struct fwnode_handle *fwnode,
 		__fw_devlink_pickup_dangling_consumers(child, new_sup);
 }
 
+static void fw_devlink_pickup_dangling_consumers(struct device *dev)
+{
+	struct fwnode_handle *child;
+
+	mutex_lock(&fwnode_link_lock);
+	fwnode_for_each_available_child_node(dev->fwnode, child)
+		__fw_devlink_pickup_dangling_consumers(child, dev->fwnode);
+	__fw_devlink_link_to_consumers(dev);
+	mutex_unlock(&fwnode_link_lock);
+}
+
+/**
+ * fw_devlink_refresh_fwnode - Recheck the tree under this firmware node
+ * @fwnode: The fwnode under which the fwnode tree has changed
+ *
+ * This function is mainly meant to adjust the supplier/consumer dependencies
+ * after a fwnode tree overlay has occurred.
+ */
+void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode)
+{
+	struct device *dev;
+
+	/*
+	 * Find the closest ancestor fwnode that has been converted to a device
+	 * that can bind to a driver (bus device).
+	 */
+	fwnode_handle_get(fwnode);
+	do {
+		if (fwnode->flags & FWNODE_FLAG_NOT_DEVICE)
+			continue;
+
+		dev = get_dev_from_fwnode(fwnode);
+		if (!dev)
+			continue;
+
+		if (dev->bus)
+			break;
+
+		put_device(dev);
+	} while ((fwnode = fwnode_get_next_parent(fwnode)));
+
+	/*
+	 * If none of the ancestor fwnodes have (yet) been converted to a device
+	 * that can bind to a driver, there's nothing to fix up.
+	 */
+	if (!fwnode)
+		return;
+
+	WARN(device_is_bound(dev) && dev->links.status != DL_DEV_DRIVER_BOUND,
+	     "Don't multithread overlaying and probing the same device!\n");
+
+	/*
+	 * If the device has already bound to a driver, then we need to redo
+	 * some of the work that was done after the device was bound to a
+	 * driver. If the device hasn't bound to a driver, running thing too
+	 * soon would incorrectly pick up consumers that it shouldn't.
+	 */
+	if (dev->links.status == DL_DEV_DRIVER_BOUND)
+		fw_devlink_pickup_dangling_consumers(dev);
+
+	put_device(dev);
+	fwnode_handle_put(fwnode);
+}
+
 static DEFINE_MUTEX(device_links_lock);
 DEFINE_STATIC_SRCU(device_links_srcu);
 
@@ -1322,14 +1388,8 @@ void device_links_driver_bound(struct device *dev)
 	 * child firmware node.
 	 */
 	if (dev->fwnode && dev->fwnode->dev == dev) {
-		struct fwnode_handle *child;
 		fwnode_links_purge_suppliers(dev->fwnode);
-		mutex_lock(&fwnode_link_lock);
-		fwnode_for_each_available_child_node(dev->fwnode, child)
-			__fw_devlink_pickup_dangling_consumers(child,
-							       dev->fwnode);
-		__fw_devlink_link_to_consumers(dev);
-		mutex_unlock(&fwnode_link_lock);
+		fw_devlink_pickup_dangling_consumers(dev);
 	}
 	device_remove_file(dev, &dev_attr_waiting_for_supplier);
 
@@ -1888,8 +1948,6 @@ static void fw_devlink_unblock_consumers(struct device *dev)
 	device_links_write_unlock();
 }
 
-#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
-
 static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
 {
 	struct device *dev;
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 2ae7e9d24a64..7b2396c53127 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -179,6 +179,15 @@ static int overlay_notify(struct overlay_changeset *ovcs,
 	return 0;
 }
 
+static void overlay_fw_devlink_refresh(struct overlay_changeset *ovcs)
+{
+	for (int i = 0; i < ovcs->count; i++) {
+		struct device_node *np = ovcs->fragments[i].target;
+
+		fw_devlink_refresh_fwnode(of_fwnode_handle(np));
+	}
+}
+
 /*
  * The values of properties in the "/__symbols__" node are paths in
  * the ovcs->overlay_root.  When duplicating the properties, the paths
@@ -953,6 +962,12 @@ static int of_overlay_apply(struct overlay_changeset *ovcs,
 		pr_err("overlay apply changeset entry notify error %d\n", ret);
 	/* notify failure is not fatal, continue */
 
+	/*
+	 * Needs to happen after changset notify to give the listeners a chance
+	 * to finish creating all the devices they need to create.
+	 */
+	overlay_fw_devlink_refresh(ovcs);
+
 	ret_tmp = overlay_notify(ovcs, OF_OVERLAY_POST_APPLY);
 	if (ret_tmp)
 		if (!ret)
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 0d79070c5a70..95a78b87777a 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -220,6 +220,7 @@ int fwnode_link_add(struct fwnode_handle *con, struct fwnode_handle *sup,
 		    u8 flags);
 void fwnode_links_purge(struct fwnode_handle *fwnode);
 void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode);
+void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode);
 bool fw_devlink_is_strict(void);
 
 #endif
-- 
2.44.0.683.g7961c838ac-goog

