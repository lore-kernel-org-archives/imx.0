Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85661EB25
	for <imx@lists.linux.dev>; Mon,  7 Oct 2024 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728313790; cv=none; b=K8I5iHok5ohPrb9i5ratbVKshGApLdhVzdaHjve/H3JxuycqJ2axCK3LolC0y9NLUIC/Mk26tfysbOZVSwIGcDf9lMztDtQXtzD+kZSjpL2/NfVZwNgLOlFXqjtosK7kN50ZJLtB7apY3pvwdXDL4RE1lILR780iiYkwgarduF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728313790; c=relaxed/simple;
	bh=v+m7u6xYkCBvtRWhJdg+uTuu7BjwAyMzFJa9C4zYqqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OAEbqWQr5/SdoBgVStop1iXD2VBQ0ZgrxUznjpyMIUXvRl77zE6x+ZuWqQRjWBTyM8lgyr4Y0H7UFqt7sXuSj7UxrStKhCpjBMSzGhBBCE9UewH3tmg+LmphfwgC2UeYuFRrkBGuBtsvf6ABxrYw1fMA1Dikzg4Dy/U04jQKoRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lH5a7lDj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lH5a7lDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728313789; x=1759849789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v+m7u6xYkCBvtRWhJdg+uTuu7BjwAyMzFJa9C4zYqqo=;
  b=lH5a7lDjEfkPmgfx+0NdnYIhP3IdCFO0F8fhBcMGSK8Y13NV33qYM+2W
   55csq/9GyQYx+D6HEnTU6Us2sHCCKtPiFtVr8Wk0F3gipTvRHTfWYrFJh
   CTuEDExu7ksjKsPu0CVvobOcqae5LQj2lhpntiYPW2GBRqBWQBIP1Imrr
   RDTHJeLM81Ub8EPHabPKO2ND1yG2tWzXuWQNUpIZondziVbhQT01ETS3P
   g5Bn8faHMHqmK9+RfaNoQxMZger8pQrf5o7cd8Ie8RuoT/L1+hg2AMoMw
   bTJqXoi/Td5NjqAippwEFu9EAdFuFPVA6vUkVaSBYBO6bxf1iyh0yiWsW
   Q==;
X-CSE-ConnectionGUID: yi5sGORkQSufiTvT6+Whkg==
X-CSE-MsgGUID: AH6vIXE4Qw+0vBZTuegg2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27346846"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="27346846"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 08:08:58 -0700
X-CSE-ConnectionGUID: N3tW80l1RxCuOo04E+yaXw==
X-CSE-MsgGUID: JWCOqzuCTyCipaIKiLRelw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="79494666"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 07 Oct 2024 08:08:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C68C337D; Mon, 07 Oct 2024 18:08:53 +0300 (EEST)
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
Subject: [PATCH v1 2/4] dmaengine: Use dma_request_channel() instead of __dma_request_channel()
Date: Mon,  7 Oct 2024 18:06:46 +0300
Message-ID: <20241007150852.2183722-3-andriy.shevchenko@linux.intel.com>
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

Let's reduce the surface of the use of __dma_request_channel().
Hopefully we can make it internall to the DMA drivers or kill for good
completely.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/dmaengine.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index b4e6de892d34..2f46056096d6 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1639,7 +1639,7 @@ static inline struct dma_chan
 	if (!fn || !fn_param)
 		return NULL;
 
-	return __dma_request_channel(&mask, fn, fn_param, NULL);
+	return dma_request_channel(mask, fn, fn_param);
 }
 
 static inline char *
-- 
2.43.0.rc1.1336.g36b5255a03ac

