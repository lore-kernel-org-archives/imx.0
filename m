Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F53036C580
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113267; cv=none; b=kUuIipOwRKIcWwk5APD1NFhZ0fhKtXisTwFR1MDkJCyRkEBk+M38FBITNoqeD6F1WLVuxzaKju7W5WAl3Svy80iQ6RXPqzI/41b5AQf2GjPOzOwb4sXm+Ca5y3LOBxcSjkc4AXpK8E/ONtpkg3cEEAxENqLKHfP9C2NrKgFMdDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113267; c=relaxed/simple;
	bh=t5jOCwYs4a0qJx+g0j9jr/ql5g59uodTYfBmURX7TLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YWPBfD+MSm0O/kUxH0FBpBaX5Jv/Hbd69vIKyoYbcp7IpRQM5X0++bf5mPPunUxPUvnmELwcJebrLA/Rs6/1gsay1xI4e64PuGq5LfJncaEvRd+lnMSqAg2Em71e+75zmJ2oPjQNjlElHOM1mQexg7eSxbQQ2DAIej0saCdKvMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 32821201553;
	Thu, 26 Feb 2026 14:40:59 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 101AA201509;
	Thu, 26 Feb 2026 14:40:59 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com [10.162.246.145])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 56D7A2035B;
	Thu, 26 Feb 2026 14:40:57 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Thu, 26 Feb 2026 15:40:40 +0200
Subject: [PATCH 1/9] drm/gem-dma: Add flag for bidirectional mapping of
 non-coherent GEM DMA buffers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-neutron-v1-1-46eccb3bb50a@nxp.com>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
In-Reply-To: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772113256; l=2892;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=t5jOCwYs4a0qJx+g0j9jr/ql5g59uodTYfBmURX7TLI=;
 b=FuK2EVogBLiKqAWSpQj/VvRmlxkqGBRQdPtOI6DDSNPrrj8FO4pZ0CErQ51iQLLpeRvWIydJH
 0NCLiSNBTUhBnS9S4+7LuX+o93vLCiofdPsrriBRdgeEv0BJykkTJWe
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP

Introduce a flag that allows a user to request non-coherent buffers
allocated via the GEM DMA helper for bidirectional use.

Keep current behaviour (DMA_TO_DEVICE mapping) as default, with no change
required for existing GEM DMA users.

While it hasn't been the case until now, some devices like NXP's Neutron
Neural Processing Unit (NPU) require contiguous, non-coherent DMA buffers
they can both read from and write to. Unlike traditional DRM devices,
Neutron uses the same DMA buffer both for reading model data and for
writing inference output.

Neutron's usage scenario is a good match for the GEM DMA helpers, except
for the fact that current implementation only considers the DMA_TO_DEVICE
direction.

Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
 drivers/gpu/drm/drm_gem_dma_helper.c | 6 ++++--
 include/drm/drm_gem_dma_helper.h     | 3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index ecb9746f4da8..dbf5ad4426d3 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -148,7 +148,8 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 	if (dma_obj->map_noncoherent) {
 		dma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
 						       &dma_obj->dma_addr,
-						       DMA_TO_DEVICE,
+						       dma_obj->map_bidirectional ?
+						       DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
 						       GFP_KERNEL | __GFP_NOWARN);
 	} else {
 		dma_obj->vaddr = dma_alloc_wc(drm->dev, size,
@@ -238,7 +239,8 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj)
 		if (dma_obj->map_noncoherent)
 			dma_free_noncoherent(gem_obj->dev->dev, dma_obj->base.size,
 					     dma_obj->vaddr, dma_obj->dma_addr,
-					     DMA_TO_DEVICE);
+					     dma_obj->map_bidirectional ?
+					     DMA_BIDIRECTIONAL : DMA_TO_DEVICE);
 		else
 			dma_free_wc(gem_obj->dev->dev, dma_obj->base.size,
 				    dma_obj->vaddr, dma_obj->dma_addr);
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index f2678e7ecb98..e0022f2fdfef 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -17,6 +17,8 @@ struct drm_mode_create_dumb;
  *       DMA addresses.
  * @vaddr: kernel virtual address of the backing memory
  * @map_noncoherent: if true, the GEM object is backed by non-coherent memory
+ * @map_bidirectional: valid only if map_noncoherent flag is set. If true, allow
+ *                     bidirectional use of the non-coherent memory buffer
  */
 struct drm_gem_dma_object {
 	struct drm_gem_object base;
@@ -27,6 +29,7 @@ struct drm_gem_dma_object {
 	void *vaddr;
 
 	bool map_noncoherent;
+	bool map_bidirectional;
 };
 
 #define to_drm_gem_dma_obj(gem_obj) \

-- 
2.34.1

