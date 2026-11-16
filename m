Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822777;
	b=ZVLSjIwAdx3rbjJtwZlfJmWR8kbpxAyuP4DQF7DRrpUSeufcC7yPj/LVTg8EUolpP8L4
	 8n+6Q3f/0sysZ+RLTj1XO+EtswxD4QfWIGNg1+4O4F6o5/C7t3H5EI08Kx4ENUuXfXvR9
	 eP/lw7c9gP+kMo8/dDzbASkVwPYhhDJV9O2AigeJV/AEFSkO3V3qNNlq9/GbNtDoy7W1U
	 04rGcabB2y+BsTXkUn7hH6bs0CWbzWKOIEUrQRV9xcDsV4Hnbk31r+KOI52NVVaSimmKj
	 LXQiDZPWeVTlny2/B0VPrFT7LHv2G8S1G86X0qAhByIa+2dGr8z5QKFxgohEXGDkagw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822777;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mV9swtsoL3o2EMx3J+Py97A7P4OjFHHdOEE2zPHNifo=;
	b=2EF3k906l+GEEnQyon1QqKacYstZ1LyrmBobpEYuQPIklzUD0XRKoD7qDDpOzdVvamx9
	 o+jBWLILFhAiIDrZCLZGNLkH4mlGWyzas/08TxRbiSS/7vZ8VpJCdrynogdieTKihQU9k
	 IYlx6mV+XXpSd1uoODpq34RPhoyevzipjBVXdJu0ul8U7bGtxA+hKtIV6gjgpfrEBSGSD
	 xMoeomguRMazI93m6cVpnNkdB8+iHycJ/cw9K9rZ15fBKJahFqUPcA80mtAmUAksVbXuA
	 IDGoURg8cFptHvJMjhrv40MelCyEH8aAqXFT0uiTrMizLot4MmCX9jBLETVcrWpq6hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=NX0AFeRu;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D4F606A329
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 09:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D4F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=NX0AFeRu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=NX0AFeRuBGf8xNILELAWCIgB8/+mUnQIrjXoiDyA5jHR8jfUeT+jIRVtoZ7wjs7NkMFaJsT2GpEDE
	 9DdHzmM/YGtTBkWdoZiMSyABSi2lSBzTsDBP+/DQ+T063Xv0fNjOA8Py2GXshQACA7ohSFOl+EOItH
	 oFeIajgECZNS7K6w=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26afad26f57b-3b7da;
	Mon, 16 Nov 2026 17:52:51 +0800 (CST)
X-RM-TRANSID:2ee26afad26f57b-3b7da
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16afad270b12-87bf5;
	Mon, 16 Nov 2026 17:52:51 +0800 (CST)
X-RM-TRANSID:2ee16afad270b12-87bf5
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/imx/dcss: Fix clock leak on blkctl init failure
Date: Mon, 16 Nov 2026 17:52:49 +0800
Message-ID: <20261116095249.1519-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261030111304.2205-1-laixiangwu@cmss.chinamobile.com>
References: <20261030111304.2205-1-laixiangwu@cmss.chinamobile.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Laurentiu,

gentle ping on this patch:

  drm/imx/dcss: Fix clock leak on blkctl init failure
  https://lore.kernel.org/all/20261030111304.2205-1-laixiangwu@cmss.chinamobile.com/

dcss_submodules_init() enables the five DCSS clocks before
initializing the submodules, but if the first submodule (blkctl)
fails to initialize it returns directly, leaving all clocks prepared
and enabled.  v2 jumps to err_clocks like the other error paths and
renames the labels to the err_<x> style you suggested; it carries
your Reviewed-by from Oct 30.

It does not seem to have landed in drm-misc yet - is there anything
else needed from my side to get it queued for the v7.5 merge window?

Best regards,
Xiangwu Lai


