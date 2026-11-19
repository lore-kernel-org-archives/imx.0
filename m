Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075117;
	b=4B22+iSAX4g1SwkEPFCIkXzg5f7scy89d3yfaa+GCY+hRgHsarnRC51efKvRRar0qVMj
	 mh4guxq6DyH+I/lkkGTuYPRQyYyXbuhqX4cZ92PWsIzy8fRfdDsWO1mm5RNlXDt+10jCw
	 4+7D6sE5vPjFx0TZenkENGY7mUsu5bLGoDBaUlG5xFaltxQ6OuQ618LLf7nvjC8bEkLWH
	 ue2XsgoQW32W5AbVeIADz8lUc41TwOqzLbA55qRzD4VcSqMRlTdmElAWNfSWn92N9NErS
	 3vlNO7Wkq+kNk8BOei0V3ttUIvZwOxifAhEOup3D8ToA+Fw5dhYbswkjsWb9GP6YDug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075117;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E7ul2arr6XENd17+ogc5CtyqshNXPbPmSVo+aN3QCi4=;
	b=LTXKiF/hf8gO3JIqho5sIlUTJTeG8niFkGoh6458GCivT2z2luF4cfvb+Q+/xf+qCCdU
	 EZRy0bGQiNEHEP+Rii1v1lW5ic05TSMjyLIg8TANFlsuYJrLSPprDsQ+4shrEoUbR8vVN
	 AHVR8mKyWYX1LvXQuWbyP1NgGeKQhCgszs6uhwyBlMGnaBWcBWxaRZ2MWFgqY5tH3aPqG
	 oD5iethqzTxhHK1Kw36K2LwYNruzd/ZeLDWVlDzLDLAaDz5SGXfPGK6AnrZxj5lJEtka+
	 gtpwaIaTFDKrMnq9ZA0pzFvmh7ZZFW9oLOJ3Z7a1Fj1nhbGFSuYxKQPanlZrGPsyf3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=AaxlJOZD;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404EF606A324
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 07:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 404EF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=AaxlJOZD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=AaxlJOZDWE1XQp/vmEVc3NShjnZfgv559FJ28Np3fobvcZDDb1+ZthRlFg/0Jp8eMHGXImLrkdlzU
	 1YOR5/Gt9o425YFwQ+cEKpE6n1T4CboeyYry0jFfAHec3nlSGRpbPuL1MMBoW6iXMa3eTT/qRhfgBK
	 dZuR+oNZYw28eAF4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26afeac224a1-57a37;
	Thu, 19 Nov 2026 15:58:33 +0800 (CST)
X-RM-TRANSID:2ee26afeac224a1-57a37
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16afeac26a8c-f54cc;
	Thu, 19 Nov 2026 15:58:33 +0800 (CST)
X-RM-TRANSID:2ee16afeac26a8c-f54cc
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] ASoC: imx-audmix: Balance SAI node references with devres
Date: Thu, 19 Nov 2026 15:58:32 +0800
Message-ID: <20261119075832.50172-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

Each successful parse of a SAI phandle in imx_audmix_probe() takes
a node reference. The card uses these nodes in the DAI links and
codec configuration, but neither probe failure nor device removal
releases the references.

Register a devres action for each reference as soon as it is acquired.
The card registration is managed by the same device, so the actions
release the nodes after the card has been unregistered.

Fixes: b86ef5367761 ("ASoC: fsl: Add Audio Mixer machine driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/fsl/imx-audmix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 2372cd26ee47..8d7faa1b9cc3 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -10,6 +10,7 @@
  * https://www.gnu.org/copyleft/gpl.html
  */
 
+#include <linux/device/devres.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/clk.h>
@@ -123,6 +124,11 @@ static const char *name[][3] = {
 	{"SAI-Playback", "SAI-Playback", "AUDMIX-Capture-0"},
 };
 
+static void imx_audmix_put_node(void *data)
+{
+	of_node_put(data);
+}
+
 static int imx_audmix_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -206,6 +212,11 @@ static int imx_audmix_probe(struct platform_device *pdev)
 			return ret;
 		}
 
+		ret = devm_add_action_or_reset(&pdev->dev, imx_audmix_put_node,
+					       args.np);
+		if (ret)
+			return ret;
+
 		cpu_pdev = of_find_device_by_node(args.np);
 		if (!cpu_pdev) {
 			dev_err(&pdev->dev, "failed to find SAI platform device\n");


