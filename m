Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2C711CA1
	for <imx@lists.linux.dev>; Thu, 23 May 2024 15:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716479489; cv=none; b=VLeybgQzgIggowZC1wslBxl7wL+pwyQM1zsTdW5cmTt4h12X84p88Mobf2wcqIDCWnSFdjS72HOjRrE/im6n1ST5w5SjL6XacovKs5oCkJ5QBxvAD2WKFfqMghfoGEhlbCAOyJVY5yQ+kWRTBgWZu6RHBiBaw36WEzI7HOnGA+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716479489; c=relaxed/simple;
	bh=LWxOpwsQKaJr2wkzuXxKCrV6aG4OKNoCsg0wjE3wLWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jnb0UGHA6DQ0qjKBqCnFMIERrTju384dloG1ZeLD+c57PuLZmKoq6YhTyXuW4OBxr5IGqmjfqLKfcdLQzN4QxEL4CeO+M7HOlMhNd+iVJftz5wzZsAxBk1EXH3pHiN2/PWf5NBnvwfIA9NI0E3/RIihtewxi1E5wWIQX/81XEgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VyRs39AQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyRs39AQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716479487; x=1748015487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LWxOpwsQKaJr2wkzuXxKCrV6aG4OKNoCsg0wjE3wLWw=;
  b=VyRs39AQlmEpVfxx7D+T/PPrZnI3+g9VGYT9ec5fPXcZTPybbYutJHE6
   klxO/H9W592m+jZeWUsRT1FUG+oMW9z+i2oPA+7mLR6x3jrN8r7XFrSyM
   YYL8XuvnewDGnkJXIOUy+RcOtVapV86vnn5337C8CQxjCqLDVQ4qWaOEU
   Y2L4zsvdjzuczotBnzMaTmfoaZE1np2BSnYjzCyqUJJiIB7aBIWTQgXCm
   eZEEU7wCdBY9/HT0ExaLDEDTzFsxdqe3Hnr+gGr5XQ05w5Erjf8D9CXl0
   YoHLsovOjK5ZaiA4OQ0f+ZRgGt0Qxuf5NQ7R8CInzEsPDcqX9C00S7bHY
   Q==;
X-CSE-ConnectionGUID: ydmTMLQTSfioF0j3NDyX5Q==
X-CSE-MsgGUID: JLC7eZH5TcyJoUlIIl33yQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16644268"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="16644268"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 08:51:27 -0700
X-CSE-ConnectionGUID: 1zN68PPiQrS29sCHwNf1+Q==
X-CSE-MsgGUID: Zr6Hen4NSbeQqED/WtlVTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="34324920"
Received: from unknown (HELO localhost) ([10.237.66.160])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 08:51:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	nouveau@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 2/4] drm/nouveau: fix -Wformat-truncation warning in nouveau_backlight_init()
Date: Thu, 23 May 2024 18:51:07 +0300
Message-Id: <de3297edb7f22cfc0654ee15aa0f774fbe607133.1716479340.git.jani.nikula@intel.com>
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

../drivers/gpu/drm/nouveau/nouveau_backlight.c: In function ‘nouveau_backlight_init’:
../drivers/gpu/drm/nouveau/nouveau_backlight.c:56:69: error: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size 3 [-Werror=format-truncation=]
   56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
      |                                                                     ^~
In function ‘nouveau_get_backlight_name’,
    inlined from ‘nouveau_backlight_init’ at ../drivers/gpu/drm/nouveau/nouveau_backlight.c:351:7:
../drivers/gpu/drm/nouveau/nouveau_backlight.c:56:56: note: directive argument in the range [1, 2147483647]
   56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
      |                                                        ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/nouveau/nouveau_backlight.c:56:17: note: ‘snprintf’ output between 14 and 23 bytes into a destination of size 15
   56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Silence the warning by checking the snprintf() return value.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index d47442125fa1..1d77a5f280c5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -49,13 +49,18 @@ nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
 			   struct nouveau_backlight *bl)
 {
 	const int nb = ida_alloc_max(&bl_ida, 99, GFP_KERNEL);
+	int ret;
 
 	if (nb < 0)
 		return false;
 	if (nb > 0)
-		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
+		ret = snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
 	else
-		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight");
+		ret = snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight");
+
+	if (ret >= BL_NAME_SIZE)
+		return false;
+
 	bl->id = nb;
 	return true;
 }
-- 
2.39.2

