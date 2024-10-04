Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1D3148823
	for <imx@lists.linux.dev>; Fri,  4 Oct 2024 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034892; cv=none; b=CIrf06QuEDWeGu5/uulsX7qbZZWBRgCnkafmzvdpJn843ZkA62fcvc6CO/VagYtPWNBRB7cSnihGrud8k/zjaCnfcBgVlU9lI9EJJ2kHx6aHJcqbYlRYPATE7yMqiZK8KjCQaDgkrERWQJRncwBLGVv3VZU77YlMTekFTIEdPN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034892; c=relaxed/simple;
	bh=Sj6wfRnJaMWUuA0Henh0phB6SLngxQVZJUMVNre6pI0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YjdKjTQve0h2Qbud030agE4UkRNgU7+X0HH1P1HdN8RNU06uu4WN6l0SoXZh38lbTo1I/UhFNoN/5PewxGMvAjlP2Tf+hcViGjHyrni1Tta6GXp0K6h+rbIc1DhHb4krnDDa3MGk5Y0Wp34DCa1NITpskV4nh27hu8bhG1NCWPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caKYB7ox; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caKYB7ox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034891; x=1759570891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sj6wfRnJaMWUuA0Henh0phB6SLngxQVZJUMVNre6pI0=;
  b=caKYB7oxvz1fPw6LZJ08OeQYn36iTogd7dS5f/++Q3XoBl3qy3j9OobC
   qwelrS+rsYpSnJFuSI1MgB3NxTcTDs2TH7Z8vShbB9a8lSSuhWZlp0IfH
   FF9Z8tgNhX8vGq65O4TBmaJLCiA8erDE1tt324OnTVbjxzfSe7cMLF4/d
   vLlxv30Lk7ajbdyW806L4zQK98/Fjbyv0Ibn+m05RGako+D0U4bnVVu/R
   LhZyPOr/YG9TLlw8Dw+pPBWBzS8duq1E+ZNimw7lPW6yVOrMcps3/ZSxI
   pBgz9bAxApMWC9CE1CPAPhs2/emz9qcBBWT/9v8tMcpFCpwBPsU6v5dmv
   g==;
X-CSE-ConnectionGUID: IA6lll5pTDyAJuO4/rBYlQ==
X-CSE-MsgGUID: FoKu9HDrQVS/Nh18uP+1VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856286"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="37856286"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:30 -0700
X-CSE-ConnectionGUID: tusglXIpTJW41+eHksuY0g==
X-CSE-MsgGUID: ymmBaPDBSbKX0fZEdgPF3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74331944"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:28 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 584FD120FEC;
	Fri,  4 Oct 2024 12:41:23 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoN-000Tam-18;
	Fri, 04 Oct 2024 12:41:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 23/51] irqchip/imx-irqsteer: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:23 +0300
Message-Id: <20241004094123.113742-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 75a0e980ff35..f8b9462ae968 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -84,7 +84,7 @@ static void imx_irqsteer_irq_bus_sync_unlock(struct irq_data *d)
 {
 	struct irqsteer_data *data = d->chip_data;
 
-	pm_runtime_put_autosuspend(data->dev);
+	__pm_runtime_put_autosuspend(data->dev);
 }
 
 static const struct irq_chip imx_irqsteer_irq_chip = {
-- 
2.39.5

