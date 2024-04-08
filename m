Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3E014A0B1
	for <imx@lists.linux.dev>; Mon,  8 Apr 2024 23:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712618009; cv=none; b=YAVM8rWK4r+PQqylIQUtORTXU44MwaO9rk+rQ83t/Cn7xrPi1mS1GG8/Ovz6tUNut0rOpGeXsPyxf3cdsWvVUOOKA5lEVLaccgsCDeDextJsI0opVJuytr+od1yW8RwNpAQqGD5/eaZct2hkg76P0qk+ippkHwS/w3I5PyAM4Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712618009; c=relaxed/simple;
	bh=e6fodSav/CbFNwfCAIa1o37PSzn8hWZNWnEmaNgYfBo=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=Y7IUZZDZOrflrXNCR2U4DmjdP3RiH0pJBZ49bjfCrVxf4AwPWHFqfsbYK7Mt+Iat8U/dJqQQvxxapCRgXpKlDabN6/UQrdsjwltf8gHPeblBIWejQfnBw/wFmUq7RMc0FCOJEs/yv1bnhKsJvwsqupfbB6SkeAkjjwxVZBbM0lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Av+qYfsT; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Av+qYfsT"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-60a61b31993so78712137b3.1
        for <imx@lists.linux.dev>; Mon, 08 Apr 2024 16:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712618006; x=1713222806; darn=lists.linux.dev;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nczmkQOw9DMhXXSsKHtJl6R+5z/iUhkTreCA2OOkZws=;
        b=Av+qYfsTpMa0HuUnwJL3fHVFbB3yOMcRbofjFtTgWYXuL7N2+rbLN8nw4saFiOZ5MF
         8UPkHfpJLTkfEeZAd8U5q3IugRGbV+/1UsP0ubumijTOu+CJpWjSqif0HV0k6KIb8rbJ
         EFIIOjX5J+q+TzmL/XqXX5Pgc3zf399xDTmxnVQJD0G5ukEohottYvuTzUwq5/zbbgZc
         L6iVD/GG82BcaKJjxi1rIxWLgPRHNE7COBvneWQMY17X78wnk3TVEQRdeP73OMO65sCf
         QLl7WsQlnvuQg1c4lglrMKx0/RVHF/YgdzdqytKCKzH3no2nPz/pmNacm8or1FHxAg+j
         O9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712618006; x=1713222806;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nczmkQOw9DMhXXSsKHtJl6R+5z/iUhkTreCA2OOkZws=;
        b=CByx6KP53H0gOLCvhLjC2W5jq+gx4rD1hQTFUSaPm7qwLApJL4D7ietr5gX+RZYdWW
         fIREaUMSGAQYswqUueTbGoqNNtywmjgPRXHQH2D+KSXREsE8mcD0O5eoPwViVVGh73SV
         z4yUNrjzztapm4l1jdwzubVk5OBRkEnU6J158BAqzYoG2Ewd/sCkU8vT4QBj3PUfXLAw
         zE+HjwcK+5lhl+ZSIZa7dLWk1GZask2d2KzWJDU/NMCkKy7lQy0XVA21IFVDlPIv63AM
         X6jziYAavfyv6I1zE/0xtpA0yt4/ctbFMqaBHtlvGsuOJNaUIyQUFXuzJxCk0+GFDJ/z
         oM2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwwPYxgafHoyVu8L0u6Ss9l3TzJk1m3zJslhYbdWVrNiVz+6EgaqgPYsoBjM/tylVlHLK2vTFDuQRbTMZgXFgodcQL
X-Gm-Message-State: AOJu0Yzfmmnhw1YarA4SKAzz5FdoepTevVenZHmAYxt3Uuf/isi6EmPD
	arD3NUJtJomEnMVTUyErxssDEw5Juaj+Hme3iFvb5nJp/KX97exVulAbYzLz6/9MAHkKDjn2puf
	ccX8GKOChIfb5LA==
X-Google-Smtp-Source: AGHT+IHInv1s683PD0VpXFGdyKVT7quDre0k4j4QPZmziEdXPq9Eij+lZ0mHQQ58tOImSwsWuy4cFSS2rHxW/D0=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:96d3:321a:67f3:5322])
 (user=saravanak job=sendgmr) by 2002:a25:7456:0:b0:dc7:5c0d:f177 with SMTP id
 p83-20020a257456000000b00dc75c0df177mr3025061ybc.6.1712618006311; Mon, 08 Apr
 2024 16:13:26 -0700 (PDT)
Date: Mon,  8 Apr 2024 16:13:09 -0700
In-Reply-To: <20240408231310.325451-1-saravanak@google.com>
Message-Id: <20240408231310.325451-3-saravanak@google.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240408231310.325451-1-saravanak@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Subject: [RFC PATCH v1 2/2] of: dynamic: Fix probing of overlay devices
From: Saravana Kannan <saravanak@google.com>
To: Herve Codina <herve.codina@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Get fw_devlink to work well with overlay devices.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/core.c    | 10 ++++++++++
 drivers/of/dynamic.c   |  8 ++++++++
 include/linux/fwnode.h |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 5f4e03336e68..d856f9c5d601 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -237,6 +237,16 @@ static void __fw_devlink_pickup_dangling_consumers(struct fwnode_handle *fwnode,
 		__fw_devlink_pickup_dangling_consumers(child, new_sup);
 }
 
+
+void fw_devlink_pickup_dangling_consumers(struct fwnode_handle *child,
+						 struct fwnode_handle *parent)
+{
+	mutex_lock(&fwnode_link_lock);
+	__fw_devlink_pickup_dangling_consumers(child, parent);
+	__fw_devlink_link_to_consumers(parent->dev);
+	mutex_unlock(&fwnode_link_lock);
+}
+
 static DEFINE_MUTEX(device_links_lock);
 DEFINE_STATIC_SRCU(device_links_srcu);
 
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 19a1a38554f2..0a936f46820e 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -237,6 +237,7 @@ static void __of_attach_node(struct device_node *np)
 int of_attach_node(struct device_node *np)
 {
 	struct of_reconfig_data rd;
+	struct fwnode_handle *fwnode, *parent;
 
 	memset(&rd, 0, sizeof(rd));
 	rd.dn = np;
@@ -246,6 +247,13 @@ int of_attach_node(struct device_node *np)
 	mutex_unlock(&of_mutex);
 
 	of_reconfig_notify(OF_RECONFIG_ATTACH_NODE, &rd);
+	fwnode = of_fwnode_handle(np);
+	fwnode_for_each_parent_node(fwnode, parent)
+		if (parent->dev) {
+			fw_devlink_pickup_dangling_consumers(fwnode, parent);
+			fwnode_handle_put(parent);
+			break;
+		}
 
 	return 0;
 }
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 0d79070c5a70..4b3f697a90e8 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -220,6 +220,8 @@ int fwnode_link_add(struct fwnode_handle *con, struct fwnode_handle *sup,
 		    u8 flags);
 void fwnode_links_purge(struct fwnode_handle *fwnode);
 void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode);
+void fw_devlink_pickup_dangling_consumers(struct fwnode_handle *child,
+					  struct fwnode_handle *parent);
 bool fw_devlink_is_strict(void);
 
 #endif
-- 
2.44.0.478.gd926399ef9-goog

