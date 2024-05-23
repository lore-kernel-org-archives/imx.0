Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DBCE54C
	for <imx@lists.linux.dev>; Thu, 23 May 2024 15:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716479483; cv=none; b=C9HB1Z1JrHWlDEQtTnc+PozXRpzpa/IaXujF9Z6+/AilLsL2LWmWEzFl0b93Iy2Mem7USW8+n6d2Zt3d1QdLbMwUvWHwhAbvPyueMHB2od7PpnNqPINnHOyAOlOcPWRv7CcuHXrxJcsCnj+WnSGL3wq834wKwhUcpCYa01KgI74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716479483; c=relaxed/simple;
	bh=KFEqUVe6krk9OGtuAsBTyaSZZ/QIyp0OxOs/kRFPd2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NVEYQnFikeA8LFgYWpb3mnQbhMKr1rvE0F4QN/kOEBxJQn9NJhv8jSChHETq1bwhrLLtNzm5OpNLE11+jKPCeGjg6uCvqggQ9aK6+AQOeAvKAJQ0EAepuupaXTtxHU0J2OcPSlzFl/v6PBOeid2sFgV5DFxmB/vbOVDmFgWYkM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHxS73JO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHxS73JO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716479482; x=1748015482;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KFEqUVe6krk9OGtuAsBTyaSZZ/QIyp0OxOs/kRFPd2Q=;
  b=HHxS73JOUlonBka8VScGXDdJnhy3m5bW235mXXeKEle8x4DCo4xswa/T
   9AyavjZUhY4vlDsvHU2QoaEXddPucyCntAq0Tyh1Rq0TJgcQdXOn2VhdA
   QqMi/lIx9w0JXzq2i5GbawvMbfNsXz2h9HC6+kz5ZPGx2HQf9PrTvwJJd
   j4q9UNOIcmDCHM3nM2IH0I3Nsa649Tc3KeiuTvUNA0Da3h7heEayTHZot
   4dFiWZGdBczfOxg3tkFlA9qvW/h8llvJLVWpJ1dDyeoPwNg1qFp3hNWYs
   LtN6QgJ4ekkPSHJ7SOFYGfPWeCX6gl1LGVRVGpL3CkQjeokBfmqwsIbmr
   Q==;
X-CSE-ConnectionGUID: lfo9MLodRAWeT9ZLkDDdeQ==
X-CSE-MsgGUID: v9YkkxE8QP2nY6tXYfHaxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12982296"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="12982296"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 08:51:21 -0700
X-CSE-ConnectionGUID: hNSDpPw8Q12d8KM0nWxpHQ==
X-CSE-MsgGUID: GDJ3T2FGRTuYefEhWUQ1eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="38556335"
Received: from unknown (HELO localhost) ([10.237.66.160])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 08:51:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	nouveau@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan Xinhui <Xinhui.Pan@amd.com>
Subject: [PATCH 1/4] drm/amdgpu: fix -Wformat-truncation warning in amdgpu_gfx_kiq_init_ring()
Date: Thu, 23 May 2024 18:51:06 +0300
Message-Id: <4b9ca4a1bd8e77f2d9b912b4af5d4fbdec13e801.1716479340.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1716479340.git.jani.nikula@intel.com>
References: <cover.1716479340.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Enabling -Wformat-truncation yields the following warning:

../drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c: In function ‘amdgpu_gfx_kiq_init_ring’:
../drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:61: error: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 8 [-Werror=format-truncation=]
  332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
      |                                                             ^~
../drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:50: note: directive argument in the range [0, 2147483647]
  332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
      |                                                  ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:9: note: ‘snprintf’ output between 12 and 41 bytes into a destination of size 16
  332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  333 |                  xcc_id, ring->me, ring->pipe, ring->queue);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Silence the warning by checking the snprintf() return value.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Pan Xinhui <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index 1d955652f3ba..92744d0d2c10 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -329,8 +329,10 @@ int amdgpu_gfx_kiq_init_ring(struct amdgpu_device *adev, int xcc_id)
 
 	ring->eop_gpu_addr = kiq->eop_gpu_addr;
 	ring->no_scheduler = true;
-	snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
-		 xcc_id, ring->me, ring->pipe, ring->queue);
+	r = snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
+		     xcc_id, ring->me, ring->pipe, ring->queue);
+	if (r >= sizeof(ring->name))
+		dev_warn(adev->dev, "kiq ring name truncated\n");
 	r = amdgpu_ring_init(adev, ring, 1024, irq, AMDGPU_CP_KIQ_IRQ_DRIVER0,
 			     AMDGPU_RING_PRIO_DEFAULT, NULL);
 	if (r)
-- 
2.39.2

