Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE051FF1AD
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 11:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761565238; cv=none; b=tkWcR8gBKEV/yn2n4B2JDjgcO44gOiBOhCVu0yM9XZZ8HmJkLRg1qHVqow0c7lkU3wKYFIS0xRYSR2z4eRThtNe3FRf/4ZPS/5UIHGXqy9ej8VK8fS8HMNk8U1rntZWcWlz6q6rLV8cvSiPm5DuxoeTnHYCYzZjU5hFF8YRCWw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761565238; c=relaxed/simple;
	bh=1Y803tfH++q3iTQw4K8OppCnXwDpAUwOBj5XmSPZLxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NknFjIk5J5KHFQlmtIijF59B7yNf5hI7KX8FdlwYuM+EDuov4S37uqZLVtwohVJvLTh8MMNk5mKAbFTQh5rtRc/UDDNDKXQmtDe2HP0aNDMJT/5ujwKEH702cYCaeOTk46bV+9Cd6U+TBv5sM0dYgeFtxJo3ubKdu9FTvf73Z3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxEwv3bI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxEwv3bI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761565237; x=1793101237;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1Y803tfH++q3iTQw4K8OppCnXwDpAUwOBj5XmSPZLxw=;
  b=lxEwv3bIcPYHHX8By9eJYHN8a8pSTE9G6GB+A9QeSAXsN0ErBaV/zAzW
   4YzIBuGYcJzWxQGR4HYxD/PrdOGtqgrmcLDZH2WPg/9wLG6JULiiVV4sN
   ak/pUeoKFuDkeDaPoa7b/UU4HD95XEk15q6LgiQlcA6gcN6yWmJmmrPns
   c9/CGmVAG3gbvJ8o2Lr10HuWd2hs99Ympp4NmB569GLC4X4vT26MFXUuF
   pT2skOGoeDezQb9wb1dQ7K3p+4ghxmXYOrzMwzaCbBCuzGZ3Za4FptcKp
   3+/gclGlu/cDMhXHvtiNwZy+rYn9C9e79J1JwJitVOOtIX2cZtiCqngUn
   Q==;
X-CSE-ConnectionGUID: MXM3wAvfR1GVVXrvEK5wuA==
X-CSE-MsgGUID: LP3PJSjfTjqLZe7CeGn6Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74984225"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="74984225"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:40:36 -0700
X-CSE-ConnectionGUID: LHkXLvlYSzqMZvlILnyZRw==
X-CSE-MsgGUID: ea//5+ppTnmJyF7SbDmzUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184719428"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:40:34 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 906A5121E63;
	Mon, 27 Oct 2025 13:40:32 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDLaS-00000001deg-2GDC;
	Mon, 27 Oct 2025 13:40:32 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	imx@lists.linux.dev
Subject: [PATCH 1/1] mtd: rawnand: gpmi: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 13:40:32 +0200
Message-ID: <20251027114032.390754-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
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
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index a750f5839e34..51f595fbc834 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -191,7 +191,6 @@ static int gpmi_init(struct gpmi_nand_data *this)
 	       r->gpmi_regs + HW_GPMI_CTRL1_SET);
 
 err_out:
-	pm_runtime_mark_last_busy(this->dev);
 	pm_runtime_put_autosuspend(this->dev);
 	return ret;
 }
@@ -761,7 +760,6 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
 
 	ret = 0;
 err_out:
-	pm_runtime_mark_last_busy(this->dev);
 	pm_runtime_put_autosuspend(this->dev);
 
 	return ret;
@@ -2667,7 +2665,6 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	this->bch = false;
 
 out_pm:
-	pm_runtime_mark_last_busy(this->dev);
 	pm_runtime_put_autosuspend(this->dev);
 
 	return ret;
-- 
2.47.3

