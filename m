Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1101C1B6D1A
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 00:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769993777; cv=none; b=IIDDI2n2PzsER7XIcA2QZm8p3YOR6zXkAUYt8KO8lYy5/QZBeOfP3tJhlbkk4n15XhU9FfMJgjAGDORJl12/pQjl8/P+Z9aoQ/ttyF08wg8MJKUrR5F1pZJ/i4gqfexRXmGdfhXvLgmhUpcHDYm5iunPlcF/YYRFvuD5c9uBodo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769993777; c=relaxed/simple;
	bh=Ot9neNXCAkn9XG7rJQLGWOBdh7/20JJ+yMkxFQnSqVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IPOQ3OgITJs/SGb80Em1hKpjQp13CKtr73Zl+7clQg21SRUmdBPI+B0ZefrNiS29BQNjwp/NFHVtRfMUjAyXT+gGGOj9/JGTtK5jK18o/ChWfzHhXCPibHYA6zEIe91qPjbsGuJMY+yd1F0AwZlZeG+T0oOp3UOO3U3TpPel0Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nZUd/vPP; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nZUd/vPP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=/u4+cpiDLvMa8adBkWUhweswccOR8Bd0nJxDNMjfQIQ=; b=nZUd/vPPIMZkKtxLxGIB3Nkd2m
	dSrlDcuz/HfcTrfcU8GDO6rFlWYvXpM1ZOnduTylA3+6e4Ck0la4XFjl2ZhPRDW9IwzCA2XjO/AY4
	Lef+1V7DPbEspitnmJiojLQs8slYnL8h4r/i5zcNtGg5YXNFQ554La0X8h43eHHxiTk8Wkn7DvkdN
	m9Ep1hQ457nFJpfDUhcrU9nbV4WwiuVJ/5AvXii61IEZwzcb/ULrXw1sOdE3rWg/YY+0tc228Ugo5
	4KbScWLsd96AvacH70sIhhaz6WF8jQ1vhGUaFjmoBPrJTfjHyDYQII1nPc95flGKjQL8WrYgaRx8C
	9nBVZckw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmiES-00000004HOI-29FM;
	Mon, 02 Feb 2026 00:56:00 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] gpu: ipu-v3: clean up kernel-doc warnings
Date: Sun,  1 Feb 2026 16:55:59 -0800
Message-ID: <20260202005559.369861-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct all kernel-doc warnings:
- fix a typedef kernel-doc comment
- mark a list_head as private
- use Returns: for function return values

Warning: include/video/imx-ipu-image-convert.h:31 struct member 'list' not described in 'ipu_image_convert_run'
Warning: include/video/imx-ipu-image-convert.h:40 function parameter 'ipu_image_convert_cb_t' not described in 'void'
Warning: include/video/imx-ipu-image-convert.h:40 expecting prototype for ipu_image_convert_cb_t(). Prototype was for void() instead
Warning: include/video/imx-ipu-image-convert.h:66 No description found for return value of 'ipu_image_convert_verify'
Warning: include/video/imx-ipu-image-convert.h:90 No description found for return value of 'ipu_image_convert_prepare'
Warning: include/video/imx-ipu-image-convert.h:125 No description found for return value of 'ipu_image_convert_queue'
Warning: include/video/imx-ipu-image-convert.h:163 No description found for return value of 'ipu_image_convert'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org

 include/video/imx-ipu-image-convert.h |   16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

--- linux-next-20260130.orig/include/video/imx-ipu-image-convert.h
+++ linux-next-20260130/include/video/imx-ipu-image-convert.h
@@ -27,12 +27,13 @@ struct ipu_image_convert_run {
 
 	int status;
 
+	/* private: */
 	/* internal to image converter, callers don't touch */
 	struct list_head list;
 };
 
 /**
- * ipu_image_convert_cb_t - conversion callback function prototype
+ * typedef ipu_image_convert_cb_t - conversion callback function prototype
  *
  * @run:	the completed conversion run pointer
  * @ctx:	a private context pointer for the callback
@@ -60,7 +61,7 @@ void ipu_image_convert_adjust(struct ipu
  * @out:	output image format
  * @rot_mode:	rotation mode
  *
- * Returns 0 if the formats and rotation mode meet IPU restrictions,
+ * Returns: 0 if the formats and rotation mode meet IPU restrictions,
  * -EINVAL otherwise.
  */
 int ipu_image_convert_verify(struct ipu_image *in, struct ipu_image *out,
@@ -77,11 +78,11 @@ int ipu_image_convert_verify(struct ipu_
  * @complete:	run completion callback
  * @complete_context:	a context pointer for the completion callback
  *
- * Returns an opaque conversion context pointer on success, error pointer
+ * In V4L2, drivers should call ipu_image_convert_prepare() at streamon.
+ *
+ * Returns: an opaque conversion context pointer on success, error pointer
  * on failure. The input/output formats and rotation mode must already meet
  * IPU retrictions.
- *
- * In V4L2, drivers should call ipu_image_convert_prepare() at streamon.
  */
 struct ipu_image_convert_ctx *
 ipu_image_convert_prepare(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
@@ -122,6 +123,8 @@ void ipu_image_convert_unprepare(struct
  * In V4L2, drivers should call ipu_image_convert_queue() while
  * streaming to queue the conversion of a received input buffer.
  * For example mem2mem devices this would be called in .device_run.
+ *
+ * Returns: 0 on success or -errno on error.
  */
 int ipu_image_convert_queue(struct ipu_image_convert_run *run);
 
@@ -155,6 +158,9 @@ void ipu_image_convert_abort(struct ipu_
  * On successful return the caller can queue more run requests if needed, using
  * the prepared context in run->ctx. The caller is responsible for unpreparing
  * the context when no more conversion requests are needed.
+ *
+ * Returns: pointer to the created &struct ipu_image_convert_run that has
+ * been queued on success; an ERR_PTR(errno) on error.
  */
 struct ipu_image_convert_run *
 ipu_image_convert(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
