Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFB761FEB
	for <imx@lists.linux.dev>; Wed,  9 Oct 2024 14:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728482715; cv=none; b=MXy746+6imM1CooKrI9Mdw1bljHFC6cLgZlV7h49RG9Od8hFpNeAG1d2YS6cWjkT5OupW9fW+f1DHyKXxnVddRuqFcejSQ942x+T/asJ1TRz+lp3hFQxpgfZNuhX9HahKfHWjNltvWiy5C1vhejAkEVFVBeI6PjwujbXg0XQf4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728482715; c=relaxed/simple;
	bh=+RcdG33kM26lU8gV00I0eEdx5IVJum437p9861Mbh+E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EoX4hEEK7tOJ6eEa2Acp0hruUygzch9sSDDnVwaT3+v/GbYXq+tT+umtjJOE85BO5R/++ijCBy0Ws0wVfNh9ZNwR6dNfgorEGGpe0kXMROv/gdTvjhJAA3n1/0hs/iY3tn+Ugy58NBaRldRmkdPs+fPcQY7fTcW8EfvZZfVUjTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dq0aGcES; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dq0aGcES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728482714; x=1760018714;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+RcdG33kM26lU8gV00I0eEdx5IVJum437p9861Mbh+E=;
  b=dq0aGcES6N6WqWCSeaUXEkh7i8WkRWOyO+vRIQ2uMjZcDnLTs/38hk3J
   hSkuwAcZjS3VANB40gQzDGNcc9qSPn3JEQPtmwrcLEhA58mI/FdG1ePWY
   HIWJP5+cu4g9UV9J3+IltTrgVqX4099gO5F/ada3rqH/nfyC+GcmyrK0U
   88jdrMrMb7Srz+HyVXw9QTKOisiBjtUEjaxhJnMdtZarz/mlu/Ge2GOHS
   d3pOLewl7EOE82tyVaVOxqy/rcxfktTE1k5SpeQrSyW+I5V2JzpAXqaUc
   LibYbtTbAT02D267pOyqmkvAfMhV5m29z22DwxqoceB17fwwDN1P5b7ot
   w==;
X-CSE-ConnectionGUID: 7Ud/nuehRY6JR7RD3xdSQQ==
X-CSE-MsgGUID: DtXG2drvTb2kzfmyngqBtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31679338"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="31679338"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 07:05:02 -0700
X-CSE-ConnectionGUID: IqgK93AjT/GmyPQQHQc6CQ==
X-CSE-MsgGUID: 5EyCHrbxSQGGYeWY21+fxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="81067851"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.80])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 07:04:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/imx: add forward declarations for types
Date: Wed,  9 Oct 2024 17:04:52 +0300
Message-Id: <20241009140452.1981175-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

The imx.h header does not forward declare the types it uses, and the
header is not self-contained. Fix it.

Fixes: cc3e8a216d6b ("drm/imx: add internal bridge handling display-timings DT node")
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/bridge/imx.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/bridge/imx.h b/include/drm/bridge/imx.h
index e14f429a9ca2..b93f719fe0e7 100644
--- a/include/drm/bridge/imx.h
+++ b/include/drm/bridge/imx.h
@@ -6,6 +6,10 @@
 #ifndef DRM_IMX_BRIDGE_H
 #define DRM_IMX_BRIDGE_H
 
+struct device;
+struct device_node;
+struct drm_bridge;
+
 struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
 					      struct device_node *np,
 					      int type);
-- 
2.39.5

