Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E395217A58C
	for <imx@lists.linux.dev>; Mon, 11 Nov 2024 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731335483; cv=none; b=BjXg7crcNf7gbxFnMgmg3Jt10DQcrAq/YaVt3WBx4WH3YSMR6LQpprGwdfabPPQgodOs5sDZocjK7YDxG221AQdopX5MM5BP+ept6IDzGUpqhKRaNoVnR+UlJegDHfNf0SL3VMGGUvJ8NrrwXT2pVQ2ntIHJjD5DQHG1ZpZ3s1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731335483; c=relaxed/simple;
	bh=3f7PYVCnUVG9o41swwE6GaVp3aoxlLmCmqDkUr3LSdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IqNbda63TU1P6aGbZSIWF49HrKqGOGzcrk3N3SGBsDt7MMl8Bqwa/ylxc4lbpNqBxbWJzdyfXMuWq8l+sbIdSGDCYMyBJYFuOHwXgofZBWVAF1ZraJ1kQbeg2jLfPIzAhgvdYmawjRYPVAAbU3oNEngw6rBDOFZS2dFijRTDeCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4E1331F457;
	Mon, 11 Nov 2024 14:31:20 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 143E513301;
	Mon, 11 Nov 2024 14:31:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kJmMAzgVMmeWaAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 11 Nov 2024 14:31:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	p.zabel@pengutronix.de
Cc: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/5] drm/gem-shmem: Use aligned default pitch and size for dumb buffers
Date: Mon, 11 Nov 2024 15:23:06 +0100
Message-ID: <20241111143114.631690-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241111143114.631690-1-tzimmermann@suse.de>
References: <20241111143114.631690-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 4E1331F457
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Use the pitch and size values stored in the args parameter for
allocating a dumb buffer in drm_gem_shmem_dumb_create(). The values
come from drm_mode_create_dumb(). Align the pitch to a multiple of 8.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 8508060a1a95..630a4fad7af1 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -18,6 +18,7 @@
 #include <drm/drm.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
@@ -514,18 +515,11 @@ EXPORT_SYMBOL(drm_gem_shmem_purge);
 int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			      struct drm_mode_create_dumb *args)
 {
-	u32 min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	int ret;
 
-	if (!args->pitch || !args->size) {
-		args->pitch = min_pitch;
-		args->size = PAGE_ALIGN(args->pitch * args->height);
-	} else {
-		/* ensure sane minimum values */
-		if (args->pitch < min_pitch)
-			args->pitch = min_pitch;
-		if (args->size < args->pitch * args->height)
-			args->size = PAGE_ALIGN(args->pitch * args->height);
-	}
+	ret = drm_mode_align_dumb(args, 8, 0);
+	if (ret)
+		return ret;
 
 	return drm_gem_shmem_create_with_handle(file, dev, args->size, &args->handle);
 }
-- 
2.47.0

