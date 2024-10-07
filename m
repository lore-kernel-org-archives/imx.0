Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741CC1D7E50
	for <imx@lists.linux.dev>; Mon,  7 Oct 2024 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728313740; cv=none; b=MGcLiBY6IpPOxkPRVM2rzpaI+l8PNVbJaOzirFf9tAlk9BzlG+vpf0HqmdARtgRof3dwyYxV9srM0MCNbjA8AyacYCLY/lWlpk3xpofHDIU8qGdOLhw5LztKLmQ1NDI/hyWr19UM/hwiwo7536dIfUe8LENZMA7Xiy0Gs12ewts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728313740; c=relaxed/simple;
	bh=qGhUu9mdJXXubW4rlkY8zXABwAVgp9j7AomaOvWbYPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jf01VlRPGEJ5Va4tJYSDS+gsGn52hUiRh2/WIPG+egHpgsdPlhRg8iVfO6xbrtXkRbLstvH98qDwwrf7h/ilMDoouvlC+q6+118l54adG2grDkJPe7V3RkM2C55eFqiLBo3c7Ou687fw5Q7FzhFs/UoS780p3S1SLf/I/DWIkkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUtC010a; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUtC010a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728313738; x=1759849738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qGhUu9mdJXXubW4rlkY8zXABwAVgp9j7AomaOvWbYPc=;
  b=fUtC010aCptcqUgAFlhBFvuvONgDlqdjv55UztED7WD/kG7mq4So5oGF
   a/ctamizbnq35zFcDl2bvpIYktgVZipzbJ1cL6HOkW0d9KNh+/tcAOd3N
   DmaHnhmFVPb1AldzkQAhrEFswa0ahpPotVvWq24xbkt0JLTVt90iCsXgH
   XWc98UIa6pqU6w5uo1NM0i0+8gc7BEvQ+4GP/C7+MnaGIZP/oBz4ua4MR
   LByMMg/NxjK5N6PweN6NyGntL4RvBDPm4iWhpp54wq6PHcquMdg3iE40s
   c2mNQDYVFIj2Y7dhuTNbULGvsLgEWjEOwpn2Ks4MSENeIsqY1tXsNOaX3
   Q==;
X-CSE-ConnectionGUID: x6EM8pU9QW+noSXU9U+Etg==
X-CSE-MsgGUID: 6UtEFCzPSLGswNWKISo1TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="52870239"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="52870239"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 08:08:58 -0700
X-CSE-ConnectionGUID: pm590HrVQSGvXKUrqLQhkA==
X-CSE-MsgGUID: vHncrqsZQFCU65LpdBLbvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="80477332"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 07 Oct 2024 08:08:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DCC564FB; Mon, 07 Oct 2024 18:08:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 3/4] dmaengine: Add a comment on why it's okay when kasprintf() fails
Date: Mon,  7 Oct 2024 18:06:47 +0300
Message-ID: <20241007150852.2183722-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241007150852.2183722-1-andriy.shevchenko@linux.intel.com>
References: <20241007150852.2183722-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In dma_request_chan() one of the kasprintf() call is not checked
against NULL. This is completely fine right now, but make others
aware of this aspect by adding a comment.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/dmaengine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index c1357d7f3dc6..dd4224d90f07 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -854,8 +854,8 @@ struct dma_chan *dma_request_chan(struct device *dev, const char *name)
 
 found:
 #ifdef CONFIG_DEBUG_FS
-	chan->dbg_client_name = kasprintf(GFP_KERNEL, "%s:%s", dev_name(dev),
-					  name);
+	chan->dbg_client_name = kasprintf(GFP_KERNEL, "%s:%s", dev_name(dev), name);
+	/* No functional issue if it fails, users are supposed to test before use */
 #endif
 
 	chan->name = kasprintf(GFP_KERNEL, "dma:%s", name);
-- 
2.43.0.rc1.1336.g36b5255a03ac

