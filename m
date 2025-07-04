Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520262E0B48
	for <imx@lists.linux.dev>; Fri,  4 Jul 2025 07:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615682; cv=none; b=YIkkM4tUxUspsiJi+ey3K5sw07c6r9sGd1YX4o5m72sNRbTLoiopPJ3pbUB4oTxosXTaGRmwHX8Tn2AH1MqxYVQw/yEjJLWcObr3jYHY7EdfDQUTiSt1wriGgMheEaZbuLr/aIhCbrlr08ZCIFaF4eY3hJ2G9o9bueozuTppBTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615682; c=relaxed/simple;
	bh=yOOYW/owvwXZgS2+HcQ7G4ePe8nCZzpY+QwYaMpoeI0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RxBSizwMJNBHO/Yh+oNaIS1X7zniMrEMyDKr1FhemxRUKZGJJPscHT0ExRakwDvu6cRcKGv0PP2rrscKWDIdNgvbCmBKZ2tyhSTYviW2hC1A2Z7HJgJaTS0mlvR5GVDcP5GR5Tc5hz7Budo0NHMIF9vzfZ3NU4XTvCwA1v8SLz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCNElcvh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCNElcvh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615681; x=1783151681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yOOYW/owvwXZgS2+HcQ7G4ePe8nCZzpY+QwYaMpoeI0=;
  b=DCNElcvh7DSKBh/wl1C2Z6tJW57DxIAs2Tv6SLuJExfKd0lQ6Y3UipNZ
   TiK/HV5xX6NyU+h3wk8QOY9zN4OstYqx9rG4s8jjJFBL/wznMhXc53VaV
   GuZMJMtgR0kAd4IO/w/ruVp+koKGDS+EES8JkuP5lkgC41Qx9ZVkxDi8h
   NnSCpLYMxybXaL7xMoq+Kq/LOpQCCc/cZEGq163pDfhbanfyZviqvfoeN
   y6ZktoZAr7AP7B6ho+hQC+DjiwwX139r5/RPvhXO46880GsQcDWw5oC1G
   5eI77CpSiukfXgXAP5WZv2+5Oqqr18SxpBo6qQ07MmZ6WUbCBJRqHb4rh
   w==;
X-CSE-ConnectionGUID: cOVqUynMSJimjU6tnfHO/Q==
X-CSE-MsgGUID: X+LM3jTfQ3OO63iMBvtn+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194115"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194115"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:40 -0700
X-CSE-ConnectionGUID: /AI2m1pvTg66r4GBAEPbDA==
X-CSE-MsgGUID: IR5aMR1DS2eGmRE/uCOv2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616572"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:37 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 1F96F44424;
	Fri,  4 Jul 2025 10:54:35 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 45/80] mtd: rawnand: gpmi: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:34 +0300
Message-Id: <20250704075434.3220589-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index f4e68008ea03..8c1bf09bdbae 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -188,7 +188,6 @@ static int gpmi_init(struct gpmi_nand_data *this)
 	       r->gpmi_regs + HW_GPMI_CTRL1_SET);
 
 err_out:
-	pm_runtime_mark_last_busy(this->dev);
 	pm_runtime_put_autosuspend(this->dev);
 	return ret;
 }
@@ -758,7 +757,6 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
 
 	ret = 0;
 err_out:
-	pm_runtime_mark_last_busy(this->dev);
 	pm_runtime_put_autosuspend(this->dev);
 
 	return ret;
@@ -2664,7 +2662,6 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	this->bch = false;
 
 out_pm:
-	pm_runtime_mark_last_busy(this->dev);
 	pm_runtime_put_autosuspend(this->dev);
 
 	return ret;
-- 
2.39.5

