Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E60E54C
	for <imx@lists.linux.dev>; Thu, 23 May 2024 15:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716479501; cv=none; b=TZ7b0r4uL9f2FBNF5rqvH9bnmwCf3EoFTelZGZbvMv1qOZqdTipSzNr8Mlu86UxPoEVAwIcLl4aYLf2mRzEjn+KTSLdAHlSfEyLKV5xxCJo7QM+eEyeeIypUSVj+0k4340+/ZNwT+SZaIytwtNZVWZUtEL9qxfCkUGrPjJK2tT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716479501; c=relaxed/simple;
	bh=u5C+G2r6BRqBl+StF3Q+wwcxgy8yjkrFhSiEp0mdUyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NKvwgRKeeujmxHPgydolYBUYsD4cOlKi47K0JtOQsgQLABtaW4f1/Uw+c6FIVOU7BeNCxoBvkjdb6tHG9LaEMzkZGs+QWqcq8akAQmsPOeonzsfnFl5S1sb2Ftp/qCh2QX6ghVswNqBcqnOg3EbkGLE/JUCZNmK47a/ARleGx8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhLAyRfY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhLAyRfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716479499; x=1748015499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u5C+G2r6BRqBl+StF3Q+wwcxgy8yjkrFhSiEp0mdUyQ=;
  b=FhLAyRfYcGLNrijnvci3lHizjBgvzBQkOheD8IeZFLQm9A7nc0GcPM4z
   o2EghryF1W45f5xWN/pzvHRYbX2Pjr+VPQog13xBj6EIsLZcnCtdKt+U4
   Xqe+k3BjVyB09xUGU4ccaR5jrkE58YaEoN5VG6s45niog4rTLiVrcqyYi
   GQkRovjyVLwFJCu3/UVbGn/dBTtBupUM+qmbkkfMT+QdTU0QhUhK0vI0x
   Y6k+6yexIQL/SkkE6tntKGGY89rAj8nK7Te2aXP984ujvbQxnim1e2nz+
   Eh6IbmeW7bvS9fhz7z9vBfhIUHuycCKyXmI2MJCt68/CFF9raNZeDFQMx
   A==;
X-CSE-ConnectionGUID: FqmxAS6DS4a+xoTgGUsuCg==
X-CSE-MsgGUID: AFcJwrbtSpmSKyA18NguLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12982340"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="12982340"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 08:51:39 -0700
X-CSE-ConnectionGUID: tRe+GP46QGeClIHEEwEkdg==
X-CSE-MsgGUID: zjUvqLI3RnCT8irAol/ZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="38556571"
Received: from unknown (HELO localhost) ([10.237.66.160])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 08:51:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	nouveau@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 4/4] drm: enable -Wformat-truncation across the subsystem
Date: Thu, 23 May 2024 18:51:09 +0300
Message-Id: <719debc351075abc36b2573266bfd4d963361e40.1716479340.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1716479340.git.jani.nikula@intel.com>
References: <cover.1716479340.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

With the -Wformat-truncation warnings fixed, finish the job started in
commit a61ddb4393ad ("drm: enable (most) W=1 warnings by default across
the subsystem"), and enable that warning too.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Gut feeling says there are more issues, and my configs just don't catch
them all, but let's see what the build bots have to say. ;)
---
 drivers/gpu/drm/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 68cc9258ffc4..644613dbedda 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -16,8 +16,7 @@ subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
 subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
 subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
 subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
-# FIXME: fix -Wformat-truncation warnings and uncomment
-#subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
+subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
 subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
 # The following turn off the warnings enabled by -Wextra
 ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
-- 
2.39.2

