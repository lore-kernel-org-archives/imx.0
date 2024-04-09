Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3920757E7
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 05:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712641039; cv=none; b=Um5o6trgNwoIRR+c+CXQRn9uydo/dgG9w+UtCGfJo0Jm9K8769YY42E7AiksgHYRyDaxlUFefOkDawGdPUHsIXKvi9hdCU0EMiap0I+BIgTsjxOUKEea4hTp5EetUPHk+y7mUmSifNZBM09UqAr+3zqib/D2lYsJzOHJcAvV3FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712641039; c=relaxed/simple;
	bh=wkLOEX+/YulnkTfcEPKaLhHUYq2+5Yqcely2pOg3H0A=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=L52XePVBvUw7ke3ehDHJp4fNOw3XdzRpJrVdnVhLDY1p7CkhJph3eUeJC5Gl0c69RET1Tm5BrhfwDgEQ8jEMe/yBgrupx7h907cmzogNA73mSP9k7zzGxzr1mcXVG2cD+bhBLN552SliKW7ZKXkpgL2wONXg9NCbi36RBUiIxLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Rg5ZqzM; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Rg5ZqzM"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6150dcdf83fso101540727b3.2
        for <imx@lists.linux.dev>; Mon, 08 Apr 2024 22:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712641037; x=1713245837; darn=lists.linux.dev;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P1+matSQcfLvW/X39T9zNDkLhGrOhW1miO9PFu3HhWQ=;
        b=3Rg5ZqzMDpA+qDrWAtuKYYIpY1mA2E0xuk5FtE3BHzsMVZTG7x3wzfkI1Pm+SaEbxK
         uLj49DqAJjTBAPBYfg67VYRufDaLqZ5ViCtQ6zxFgUlmLnQPzVg+jYKqQK2gKP/8Z258
         /uwcF+krIXKhf3ytCm5sEgZ5+8zYjxrziMWvfdHF7cItWx1o8mqMOpYkyRI2G330mYbk
         mRpjf780uR2NTy7WQqqYbvdrHluajvC8COYI+MOOEND9E2RO8wUVxWb4FLHpFDy24FXD
         xZuUXNzKiHEXrfdu8m2dWMbw78nwVUSUcF921z1VCUxQyMzzENvqHSkd5h33ZNLhGMvW
         gbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712641037; x=1713245837;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1+matSQcfLvW/X39T9zNDkLhGrOhW1miO9PFu3HhWQ=;
        b=ThhZgJoZKN1AullGandOTQKSjRSwwor6FCgbXiuk/kVZqppzK1xhqhMtId9qPdniAZ
         Js8BwXcwR6a6ucNTlOopQWn2VpHlwiTHxy/gsjFT5DQy72V/7+t/Ua3Yj/SjWhuUgGln
         eP3/N4MDT2JgrKEXaBFOXD4cygGIatDoO1xutwmB0RePFbkEGlfwdNbxQFzzlsA8Fvfy
         8YLiDBt6Na33eXIc3n+z/WyPit0idaTyN8ICuXufxuA+czkJWSaMfJ+tMVXrh4YmKv07
         Or/OjYdTwX0FQSLFRAMQcekga9NuKrVf2thl2oIslFYb3dSOTaHRxBY1YU79obL5/Fsf
         UsOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5h6O0O/ovOWQ3CQgy/kUne22BEOGl+wO6jort29/DUvxNRNziVWfeBsTn3aSrpC3vizaD6f1U7xEfb2qwPkviCsN5
X-Gm-Message-State: AOJu0YzaRTURroAX8s3bATiqKg0GHGiCJZnis3aqlRQazP+eGgxaa22y
	PrzwXEYgV8R5dGPyJaNpVi+ghzssUJw3erYy0RA04XZKP6lEHr6Qcc4yIq8Fli6NQfQaVXBXFdS
	gyf+bpVxmoOuD6g==
X-Google-Smtp-Source: AGHT+IHRQA3n5GfF0BAtqxsFhNOUIMEXcJ7+XDV5u7QRPNR+Gdp77qx8MK2Ot4WCnaL1W/7lk2smyonaDUUJGAU=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:96d3:321a:67f3:5322])
 (user=saravanak job=sendgmr) by 2002:a05:6902:708:b0:dd9:1db5:8348 with SMTP
 id k8-20020a056902070800b00dd91db58348mr3605580ybt.8.1712641037031; Mon, 08
 Apr 2024 22:37:17 -0700 (PDT)
Date: Mon,  8 Apr 2024 22:37:03 -0700
In-Reply-To: <20240409053704.428336-1-saravanak@google.com>
Message-Id: <20240409053704.428336-3-saravanak@google.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240409053704.428336-1-saravanak@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Subject: [RFC PATCH v2 2/2] of: dynamic: Fix probing of overlay devices
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
 drivers/base/core.c    | 23 +++++++++++++++++++++++
 drivers/of/dynamic.c   |  1 +
 include/linux/fwnode.h |  1 +
 3 files changed, 25 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 5f4e03336e68..5ce33dbd7560 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -237,6 +237,29 @@ static void __fw_devlink_pickup_dangling_consumers(struct fwnode_handle *fwnode,
 		__fw_devlink_pickup_dangling_consumers(child, new_sup);
 }
 
+
+void fw_devlink_fixup_new_fwnode(struct fwnode_handle *new_fwnode)
+{
+	struct fwnode_handle *parent;
+
+	if (new_fwnode->dev && new_fwnode->dev->bus)
+		return;
+
+	fwnode_for_each_parent_node(new_fwnode, parent)
+		if (parent->dev && parent->dev->bus)
+			break;
+
+	if (!parent)
+		return;
+
+	mutex_lock(&fwnode_link_lock);
+	__fw_devlink_pickup_dangling_consumers(new_fwnode, parent);
+	__fw_devlink_link_to_consumers(parent->dev);
+	mutex_unlock(&fwnode_link_lock);
+
+	fwnode_handle_put(parent);
+}
+
 static DEFINE_MUTEX(device_links_lock);
 DEFINE_STATIC_SRCU(device_links_srcu);
 
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 19a1a38554f2..a2ad79ea9a06 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -581,6 +581,7 @@ static int __of_changeset_entry_notify(struct of_changeset_entry *ce,
 		memset(&rd, 0, sizeof(rd));
 		rd.dn = ce->np;
 		ret = of_reconfig_notify(ce->action, &rd);
+		fw_devlink_fixup_new_fwnode(of_fwnode_handle(ce->np));
 		break;
 	case OF_RECONFIG_ADD_PROPERTY:
 	case OF_RECONFIG_REMOVE_PROPERTY:
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 0d79070c5a70..230aeccef6f3 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -220,6 +220,7 @@ int fwnode_link_add(struct fwnode_handle *con, struct fwnode_handle *sup,
 		    u8 flags);
 void fwnode_links_purge(struct fwnode_handle *fwnode);
 void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode);
+void fw_devlink_fixup_new_fwnode(struct fwnode_handle *new_fwnode);
 bool fw_devlink_is_strict(void);
 
 #endif
-- 
2.44.0.478.gd926399ef9-goog

