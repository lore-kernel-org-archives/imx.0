Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2811A08DF
	for <imx@lists.linux.dev>; Mon, 11 Nov 2024 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731335483; cv=none; b=R7X2hW46q1L4YJIe89HqkzFb2686FrdZPj0wMXawZZphPbbxg4gWngr1Mzx4XcYuQezJFrBfSYJ67/NWWDAYYR2SDPn11AbrwVnlwiVpe4Dp+NeFnnTH5af9nLjUbB7zHgzNFlrH2mb68o0ynCsMQbwExFSBrjRjc6dqzj3sYNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731335483; c=relaxed/simple;
	bh=umZIihGKdV3/5ZPSFW3uvIbI1b6LY1k/LdCmOv/8K/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uPi2b1+xqHYzCbVaIlLb3gDHxcrYNKSrSrrOH2FFcO42x6j9lUiG9cmO2wWXBZAn6jRkrBq12MWmnWKtV5qL9llfCATe8IzsoQSBmiCDiFY5QXO0X2SbeqSlBoBJi80EpuKYeHVzavnzhR8RzWArvs2NUYHv0uLRfT6XBHxcMO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2EqUWkL4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O1GFXAej; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2EqUWkL4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O1GFXAej; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2EqUWkL4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O1GFXAej";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2EqUWkL4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O1GFXAej"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C23042198E;
	Mon, 11 Nov 2024 14:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731335479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3aBHbxdOm3avQlNIV4M0kiGIE9VzkafCgHXSn6ic0Y=;
	b=2EqUWkL43psH0r4O+cytWk14kJXDUj2TrjhhAUmnT6Ae9Opsr0Yoy4fwvWmx8j5a1AqlK+
	hb8En2ZXZn5PQYYll7ZaqHJ0MEQIc57b6tS7EbgX7wxiCFCSTuKlK1Bl1uVi4F7Jsv1KlN
	7SN7qVy/s2APijPLR+oH1jrCHfYeurs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731335479;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3aBHbxdOm3avQlNIV4M0kiGIE9VzkafCgHXSn6ic0Y=;
	b=O1GFXAejF4FW2ET3dxgejIyek1c/Nvdu0j7DTc/A0nUx9+Qo4m93f8szg3FzArvOa7UxtH
	tkED5YI0o3JUq5Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731335479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3aBHbxdOm3avQlNIV4M0kiGIE9VzkafCgHXSn6ic0Y=;
	b=2EqUWkL43psH0r4O+cytWk14kJXDUj2TrjhhAUmnT6Ae9Opsr0Yoy4fwvWmx8j5a1AqlK+
	hb8En2ZXZn5PQYYll7ZaqHJ0MEQIc57b6tS7EbgX7wxiCFCSTuKlK1Bl1uVi4F7Jsv1KlN
	7SN7qVy/s2APijPLR+oH1jrCHfYeurs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731335479;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3aBHbxdOm3avQlNIV4M0kiGIE9VzkafCgHXSn6ic0Y=;
	b=O1GFXAejF4FW2ET3dxgejIyek1c/Nvdu0j7DTc/A0nUx9+Qo4m93f8szg3FzArvOa7UxtH
	tkED5YI0o3JUq5Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 870B513301;
	Mon, 11 Nov 2024 14:31:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iDKjHzcVMmeWaAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 11 Nov 2024 14:31:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	p.zabel@pengutronix.de
Cc: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/5] drm/dumb-buffers: Fix size calculations and set default pitch and size
Date: Mon, 11 Nov 2024 15:23:04 +0100
Message-ID: <20241111143114.631690-3-tzimmermann@suse.de>
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
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,pengutronix.de];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

Calculate the dumb-buffer scanline pitch with existing 4CC format
helpers and provide results to drivers. Fixes the overflow and size
tests. Drivers can further reuse the computed values.

The dumb-buffer overflow tests round up any given bits-per-pixel
value to a multiple of 8. So even one-bit formats, such as DRM_FORMAT_C1,
require 8 bits per pixel. While not common, low-end displays use such
formats; with a possibly considerable overallocation of memory.

There's also quite a bit of code duplication among DRM's memory
managers. Each calculates scanline pitch and buffer size from the given
arguments. But the implementations are inconsistent in how they treat
alignment and format support. Therefore, provide the already-calculated
values for pitch and size to memory managers. Later patches will update
each to make use of them.

The commit adds drm_mode_align_dumb(), a helper to align a given dumb
buffer's pitch and size. It also exports the function for memory managers
to use.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_dumb_buffers.c | 83 +++++++++++++++++++++++-------
 include/drm/drm_dumb_buffers.h     | 12 +++++
 2 files changed, 77 insertions(+), 18 deletions(-)
 create mode 100644 include/drm/drm_dumb_buffers.h

diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index 9916aaf5b3f2..0f87a4c426c1 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -25,6 +25,8 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_mode.h>
 
@@ -57,41 +59,86 @@
  * a hardware-specific ioctl to allocate suitable buffer objects.
  */
 
+int drm_mode_align_dumb(struct drm_mode_create_dumb *args,
+			unsigned long pitch_align,
+			unsigned long size_align)
+{
+	u32 pitch = args->pitch;
+	u32 size;
+
+	if (!pitch)
+		return -EINVAL;
+
+	if (pitch_align)
+		pitch = roundup(pitch, pitch_align);
+
+	/* overflow checks for 32bit size calculations */
+	if (args->height > U32_MAX / pitch)
+		return -EINVAL;
+
+	if (!size_align)
+		size_align = PAGE_SIZE;
+	else if (!IS_ALIGNED(size_align, PAGE_SIZE))
+		return -EINVAL;
+
+	size = ALIGN(args->height * pitch, size_align);
+	if (!size)
+		return -EINVAL;
+
+	args->pitch = pitch;
+	args->size = size;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_mode_align_dumb);
+
 int drm_mode_create_dumb(struct drm_device *dev,
 			 struct drm_mode_create_dumb *args,
 			 struct drm_file *file_priv)
 {
-	u32 cpp, stride, size;
+	u32 fourcc;
+	const struct drm_format_info *info;
+	u64 pitch;
+	int ret;
 
 	if (!dev->driver->dumb_create)
 		return -ENOSYS;
 	if (!args->width || !args->height || !args->bpp)
 		return -EINVAL;
 
-	/* overflow checks for 32bit size calculations */
-	if (args->bpp > U32_MAX - 8)
-		return -EINVAL;
-	cpp = DIV_ROUND_UP(args->bpp, 8);
-	if (cpp > U32_MAX / args->width)
+	/*
+	 * The scanline pitch depends on the buffer width and the color
+	 * format. The latter is specified as a color-mode constant for
+	 * which we first have to find the corresponding color format.
+	 *
+	 * Different color formats can have the same color-mode constant.
+	 * For example XRGB8888 and BGRX8888 both have a color mode of 32.
+	 * It is possible to use different formats for dumb-buffer allocation
+	 * and rendering as long as all involved formats share the same
+	 * color-mode constant.
+	 */
+	fourcc = drm_driver_color_mode_format(dev, args->bpp);
+	if (fourcc == DRM_FORMAT_INVALID)
 		return -EINVAL;
-	stride = cpp * args->width;
-	if (args->height > U32_MAX / stride)
+	info = drm_format_info(fourcc);
+	if (!info)
 		return -EINVAL;
-
-	/* test for wrap-around */
-	size = args->height * stride;
-	if (PAGE_ALIGN(size) == 0)
+	pitch = drm_format_info_min_pitch(info, 0, args->width);
+	if (!pitch || pitch > U32_MAX)
 		return -EINVAL;
 
 	/*
-	 * handle, pitch and size are output parameters. Zero them out to
-	 * prevent drivers from accidentally using uninitialized data. Since
-	 * not all existing userspace is clearing these fields properly we
-	 * cannot reject IOCTL with garbage in them.
+	 * The fields handle, pitch and size are output parameters. Zero out
+	 * handle to prevent drivers from accidentally using uninitialized
+	 * data. Set default pitch and size to the values computed for the
+	 * overflow tests. Driver are free to override them, the default values
+	 * are what most drivers want.
 	 */
 	args->handle = 0;
-	args->pitch = 0;
-	args->size = 0;
+	args->pitch = pitch;
+	ret = drm_mode_align_dumb(args, 0, 0);
+	if (ret)
+		return ret;
 
 	return dev->driver->dumb_create(file_priv, dev, args);
 }
diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
new file mode 100644
index 000000000000..00172c5997d2
--- /dev/null
+++ b/include/drm/drm_dumb_buffers.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __DRM_DUMB_BUFFERS_H__
+#define __DRM_DUMB_BUFFERS_H__
+
+struct drm_mode_create_dumb;
+
+int drm_mode_align_dumb(struct drm_mode_create_dumb *args,
+			unsigned long pitch_align,
+			unsigned long size_align);
+
+#endif
-- 
2.47.0

