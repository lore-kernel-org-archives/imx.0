Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489080;
	b=Ss+Xn/9MdP60gMHqAd+0bB0Ufz7SFkmdlLmIZ9EjIoJ5O8UeyeAwoswmIq+vHjihzw66
	 4gUB1mKoO0rjy6fvmFWffmvMcsUDHVDS6gZOLQAhEXrEgc+YBaTUqnEqGIYi4+zhN38K9
	 nRh3Nc6es/28870xQ6QKIzyXDyx8Qh7MLlqOK9TWo70rPu8ipKbwReyNXVTO8L9ea6NH6
	 cbEdCpxZYbIan2OqQ6HKJUo7CYyrj8OTzkUWToHEdbwXurbLDBt3WymRqoDPlKrUDdvnf
	 ozcZfaU/gKz5C6upSDZQSLiemlP5I51izdQ7v7n2Cb3JhYrjW/M6bj3naMPRIFGhRTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489080;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=TksXlMVZXRpHlnAwSWhbl1BTy5EqD5EPHWFrlK+U+co=;
	b=O90B52Xsa5Kd+1jDtF7ijQcMRq6dKfEG5Ht5DO9Z13iOW4R7U3KXJVMp3R1h3QpaPO+B
	 PLAZDIW2ecIX9p/HpiGQnhEvVSTSw6bfx3WOfJ8T2locARlvrgf+HZGtS/bYxq5PVuyyv
	 CUAl6G4iRbXaJDuq7kgA31CEDS4hbp3jKyMw8QzsUj7Y5UlTKWnQtXhYmugwPJ9o4GRZz
	 A7v+/FoBRBXbic/XQ5b4nfya9V+962Xre1gfXdGrCzGOZHwSPwntyde8d/N/Q0wPXpraC
	 T+8cL5+9oRHbeM8s8A9fRoDAr8ayGAkm8I1KKPOHKYjGzMyUcK/GwGhsf+U2O2mH4Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=J6QUpRF1;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3F8606A31B
	for <imx@lists.linux.dev>; Tue, 20 Oct 2026 09:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F3F8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=J6QUpRF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Tk
	sXlMVZXRpHlnAwSWhbl1BTy5EqD5EPHWFrlK+U+co=; b=J6QUpRF1SX7f4nS5et
	3F66bvy2i9ahCAslj/onOhZXSJPxpDCBYObeEA6AQ9aRR49DsMY2RdxpTk1kMd6m
	Qnj0TyC5AcBlgd74YY5+fapPLNMqKdsu4Qz8vCRFTnWs1ALbyVStQYxNAvuGDfNW
	fyldoJGGpPTz9s+rOAzgpKTNc=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3_4ImNtdqupV5Aw--.29320S2;
	Tue, 20 Oct 2026 17:36:40 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Huang Shijie <b32955@freescale.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 0/3] bus: reject devices without platform match data
Date: Tue, 20 Oct 2026 17:36:32 +0800
Message-Id: <20261020093637.1654161-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:PCgvCgD3_4ImNtdqupV5Aw--.29320S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw47Cw1fXFWxWr47Cry7GFg_yoW3tFc_uF
	Z3XrnrX34IgryUG3WrArsFyrW3CFWxWrykZr47t3yfX3yUZr15Jr4qq3yrC39rWFWqqFn8
	Grn8Zr4Yvwn7ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU80tC3UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzggoYmrXNiil+gAA3w

Platform driver_override can bind a device to a platform driver without
matching its OF table. The match-data helpers then return NULL.

The i.MX AIPSTZ and WEIM drivers dereference the missing data during
probe. The STM32 RIFSC driver stores it for later dereference through
its debugfs configuration dump. Add checks before each first use so
these drivers reject unsupported devices instead of dereferencing NULL.

Each change is independent and can be applied separately.

Jiale Yao (3):
  bus: imx-aipstz: reject devices without match data
  bus: imx-weim: reject devices without match data
  bus: stm32-rifsc: reject debugfs setup without match data

 drivers/bus/imx-aipstz.c  | 2 ++
 drivers/bus/imx-weim.c    | 6 +++++-
 drivers/bus/stm32_rifsc.c | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.34.1

