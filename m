Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42676328B60
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771422899; cv=pass; b=COcTchmVM2ATowt42gvN1z9oGev1bpOlr+xRugGokVeuBMMJuKrswmRA3/aOSEpxBxB0+cfT64mRG19ASq6XkFfPEhlJqFCTTNzKFqdbpcFCDWzQw9nUvVocXXvpc2qxZagMMYLy6TTiBhXsW4kzawVPmMFkg0pJ9fDikzs1bi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771422899; c=relaxed/simple;
	bh=GkFpwIxd9ZPdwB3wVXiAnilEh1TsSX3EBhlGS1agX6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e+a1j1IzJJqa0RJNFL0HV5H9xKMs5Dt8uUb+IitnS5J4eiy10y/xOv0JyUT6O1b1urkGfVARlDIPS3wEdKSvq0iF8crl2Sg40mr5VLqL++Y1/cg4Q71uEYcc4tJSkGDIZM/Gm2d8H7wF4G5agEfKD9a4OZ5eDEzZHrKkbyY1lhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=CWC+DPBB; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="CWC+DPBB"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=UZxwDfS1oPS90ifu0h6kKEX5WvdE1VG547kjfsTBm2U=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771422880;
 b=TbTkBmKCmYrzCcLfjw2yazxGl5lAfO9habHqZf/luoqkU964ktf8AVsUkQWd0iC952fX8N++
 1xTRXi7tcAds1bFUsfEKqLnD9YmaBCi5K5YzxJy4IvPLesUXzgw5gCrE+M2liYoOGiuASUIVCpg
 HYZGHxRBRQHkTC9VQBSwLr0XyCwZgZQpM3hsj7DhvJY8poMCc/xBJr7vBC2wlGQmv4OLIg3E3Tm
 nMOqDvaTTtmD7VtuYtLJ7Rrb5k3mQBHCapC4f8aEQOlAR6UU6paRm7vXC7g0aFgdIxaD/8Spu7M
 MpTYURptMvi2xWY8M2WErLF0pPVMSo9ukYnxFOZeWDu+A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771422880;
 b=guxu4KF3r6Ni5Co0M3h1H++ktGxR8Da9wXBOitP48r9d98WhdwPaFp2MPt42BE0QaZ0U0ziJ
 vFgHTOlWBPXLu6GKSYlCyP6zcvjJXU8M1XxCOtjXvw7puS1bueWHwudaPZB9SOKSnmAbSCBEz8k
 vGfK3+ZWODrqKFQ1kG0tqY63Zy2e/rqbwdMhEWRvwDw2Ojb9Mb+VUVth28Q1IhCC3uis7v8fFr5
 8t4t+3qqeraAqVvr/u7uJJiCE7GLurUShrNrge0H9kn/pQ9xfVYUI/IOrHoPmJ46vqXXrQzDfdj
 pODOaCvz/GR/vVoltqJzcMW8sUWGjMSFjQR4hhKqqRIOA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Wed, 18 Feb 2026 14:54:39 +0100
Received: from FEILKEA-LNX-W.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 40A72220568;
	Wed, 18 Feb 2026 14:54:26 +0100 (CET)
From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux@ew.tq-group.com,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ARM: dts: TQMa7: modify for use in bootloaders
Date: Wed, 18 Feb 2026 14:54:11 +0100
Message-ID: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.feilke@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fGJ0M0CGxz3ybFB
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:d82c1795a7bafb33397f842ea10eaabf
X-cloud-security:scantime:2.092
DKIM-Signature: a=rsa-sha256;
 bh=UZxwDfS1oPS90ifu0h6kKEX5WvdE1VG547kjfsTBm2U=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771422879; v=1;
 b=CWC+DPBBg8yxhsQn9WHUDncSsAzuoj/+djsWK2P+L/MRsbfuTEJAyWJCXT+yj1fyj+shfdzs
 F9npPSEUptvxRX59EnkhNunTC1W9BdtasNjLrtfxu/mHmNfH8wW2a3b2VfjwFlG1b5CgS1LDMnA
 DZQZiyQ7AoKqZ92bCJOE0fvVW+E95g4r8Ju0SzlJDtHqDFVpY3yvfwj5keTUeuzijR8yl6F6xRe
 F4iUCwYw4NeUGjHWCJU/vfKHaSmO6gM0QLGEaKSMmaL60gJvv2rGQjgu8LkFi9Hrev+6bpN1JRu
 XuoyD8TvHNTnGTjN5TBhGM3HforkGKTSWs/Uj0YK6P66g==

This series contains modifications for using Linux device trees
in bootloaders. Changes from U-Boot bootloader are incorporated
directly into the Linux device trees.


Alexander Feilke (3):
  ARM: dts: imx7s: add boot phase properties
  ARM: dts: tqma7: add boot phase properties
  ARM: dts: imx7-mba7: disable boot_cfg pins after boot

 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi  | 13 +++++++++++++
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi |  2 ++
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi      |  5 +++++
 3 files changed, 20 insertions(+)

-- 
2.43.0

