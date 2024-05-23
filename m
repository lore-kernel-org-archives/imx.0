Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F027E54C
	for <imx@lists.linux.dev>; Thu, 23 May 2024 15:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716479477; cv=none; b=Sm5F1xmz+yMupVb4/AV7OZDXfxkQvWd/e4CTfEmUqp2N7Mbr+Dwx65jaNy44OUWcbohTaP6UJe1wJNspfJSIPaivDx4kYrmSeWp7Urfp4f76fvZcDmLSO8oE/7IUJICoIWFvBHVx/ebJNoF/rvAdCBT3DOTEc5tWQDvkqCnU7yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716479477; c=relaxed/simple;
	bh=MLcJyGKBQhPZDL6wKgOceQVS3NoUzz+ipqtM9LhBHuE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mzDvjNK8jS3Yj7xmbpAq64yxfEfpT2R+CsQ+aHOjG2vcrHu1+knbmIaSkZBaRN8+zoL+aA7ExVo1YbAI86AFoz1xXauf0OWdS79NhDgQECt8iZg00AbzF3zVPRF047t5k1kpNs/BKa15gwRzJC6ivO7lGdrgqTj+HvmpkCfQy+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuHSclrF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuHSclrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716479475; x=1748015475;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MLcJyGKBQhPZDL6wKgOceQVS3NoUzz+ipqtM9LhBHuE=;
  b=PuHSclrFe9VfTwB6lo4EDrTGJi7mwPmJtoaanlPn5OFlWAVOLnR16CdN
   KvFRFqJvN7tPZIYa3Hnc1NSJcyIVcljkba2byYgfVmCeCzTvI0m0LP7yb
   WGIlzBB5XRToFuA7+OaZl6nvcKo80gQu1/2eKfEx6SKfwE/JJAqOop+u6
   CpKTFrT7cUY0bkQ+GOqkyNLVvUBPnfFoO2udj5UpynoRe03biKNxRDT9R
   u2Y+vpLXCe+QKpV9qbtvoR1giMbAI56ANcpPXWCIvgUTqjKZqrof7GeRC
   qLhQMtyKGtPfS94yNsGP2uV/sVWYsIJDS4HGeaP2BFrRip9k3EpstqFe6
   w==;
X-CSE-ConnectionGUID: 69KNojB3QXisIiy9XPoSLg==
X-CSE-MsgGUID: RlIZINXHRYOKbRWljaWL1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16644235"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="16644235"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 08:51:14 -0700
X-CSE-ConnectionGUID: UbujlJOOTdunzCRUwcWlNA==
X-CSE-MsgGUID: Z2dtz4gLQiyahF37x9OuOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="34324832"
Received: from unknown (HELO localhost) ([10.237.66.160])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 08:51:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	nouveau@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/4] drm: enable -Wformat-truncation
Date: Thu, 23 May 2024 18:51:05 +0300
Message-Id: <cover.1716479340.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Jani Nikula (4):
  drm/amdgpu: fix -Wformat-truncation warning in
    amdgpu_gfx_kiq_init_ring()
  drm/nouveau: fix -Wformat-truncation warning in
    nouveau_backlight_init()
  drm/imx: fix -Wformat-truncation warning in imx_ldb_probe()
  drm: enable -Wformat-truncation across the subsystem

 drivers/gpu/drm/Makefile                    | 3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c     | 6 ++++--
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c         | 6 +++++-
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 9 +++++++--
 4 files changed, 17 insertions(+), 7 deletions(-)

-- 
2.39.2

