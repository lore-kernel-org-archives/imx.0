Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10103848D
	for <imx@lists.linux.dev>; Tue, 18 Jun 2024 02:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718676521; cv=none; b=CF8aDg1Tgr3nYdBxeZ8RtKQT+CEj7zIZNLc6e1M/xX3mpgcksFVYIUSANn5IxzagItIk6uRH9B/J+liWco+7IscRjA/IrMeV7gvvF24bOrjoEqlrOJR2n/lQ/TBXvDGedxZDpqRPvaWXMQtsSsJTDYbzPgXFwUsJxfjfMg+Atbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718676521; c=relaxed/simple;
	bh=gUomNn1CHk6+YmN9Nt0imJzwNb+S6m9Y0NkOoJSUVhY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=RpYOwm85XMjnAcKRkzjs3dQqwmOOWYjJxTVLmC5NVigKuvZvwKNPVZp4jqoR/DuDGreZ94ooFGfSGci0v2G8/TTp9jrg1IV34eUBRWA2FWlnIGQie3xogMkR2Wb+xsLvvmCA1fqYSUqLA4OJ/FxVr7Y+n3/zkLywzjk7k1SlByw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 738F81A0A59;
	Tue, 18 Jun 2024 04:08:32 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 287571A0A67;
	Tue, 18 Jun 2024 04:08:32 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E0911180222F;
	Tue, 18 Jun 2024 10:08:30 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com
Cc: imx@lists.linux.dev,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH] LF-12487 arm64: dts: Fix i.MX95 PCIe EP functions broken
Date: Tue, 18 Jun 2024 09:51:25 +0800
Message-Id: <1718675485-25316-1-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

RC can only read out "0xFFFFFFFF" from memory regions specified by EP's
BARs.
Root-cause: the memory read issued from RC to access the EP's BARs are
blocked by IOMMU of EP side.

When PCIe EP mode is enabled, disable the SMMU at EP side to fix it.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtso | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtso b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtso
index 9c5c46a281ef8..cc1a3cd74212c 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtso
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtso
@@ -6,6 +6,11 @@
 /dts-v1/;
 /plugin/;
 
+&smmu {
+       status = "disabled";
+};
+
+
 &pcie1 {
 	status = "disabled";
 };
-- 
2.37.1

