Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DA82F999F
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 14:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767623394; cv=none; b=CIwgRwtuC6VtgllKk+p5CdFIi55cQ5uIgWPOJ1XctFYszu2YsoiwcaCRLoZHZf0eT3fSlwfpfvLi6AWSRKG7hw55tFZ4y+wFpRh2utXySEqQ2rLcflMUs29Kj3hAhzI8yQNDP92Cg7iSq//1WKxE6JALQRS9jlYSWGd6iJaPLNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767623394; c=relaxed/simple;
	bh=fAegm32bM9RyJz+Nl9EGlr82cAT+Hy4WuMkpCZJ7rro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WBKQ66rXcXwPh4DDVEUh2u9TtS70Wn9VbmykSjvaMX9xVW6YqWm78XeOkOtKbggzPqSs/HVjVhzC53Spg6Z/i7G3HLmCE5hkV9wYosb13ptdVw60v7lHF5q1cObnCimplv2MYLYXLQF603BMnXXF1UEmjMmdsUThQPByAtNspvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NE43sUYG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NA54oKph; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NE43sUYG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NA54oKph"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60585ncJ3610334
	for <imx@lists.linux.dev>; Mon, 5 Jan 2026 14:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uHEQAWSamf6mSgVcU48rQFJXFmJhwrjLABU
	raXAPotc=; b=NE43sUYGtyV+BvCZMBQIlJdT1wm1XiOf0OTrOVxUk6y94X1MIZ9
	ZKDSaZmmPrDjoKgy3AsWeKkhGI/uOMJGiViqpAccR4l8KvKTeGMQeldaRmiaB4w+
	2BJdykkqdO9+fR0CmXfpYsSf9fEF4XaA5cVJpknsKXoKIK8pjG9ODV45uqlEDKBP
	fQBBuyFaNu2TeJexcXxH9gQzKh/XZum8C6E7f1BQN4/5SVNh8l7tDHVgCP7rQKjH
	QHekhAyPev/dTFuNwA9z5D6pAhTVVAHRPDmQQkdMQ7cipVi2kQQaOrwSIUbkR0r6
	ZpV9fk+ZA/PERJSiIG6vDs6AVqL8jUEheCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4r2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 05 Jan 2026 14:29:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b17194d321so1587704485a.0
        for <imx@lists.linux.dev>; Mon, 05 Jan 2026 06:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767623391; x=1768228191; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uHEQAWSamf6mSgVcU48rQFJXFmJhwrjLABUraXAPotc=;
        b=NA54oKphgvJRGxFKfe8ymTeQrE3gpsWK3t0Z2rLRdJn7t3VyvNi/XZn0yDL6s3/MZb
         XvI/QmdHEieJczExwZf8kVVYBG0aPkNUeY50uMbii+UbVVee9TddQO01jRuqjZ+ln954
         OYFma/k3iNNk5QyLoP5mVeSJHSgGHGfHADcNKL9emhksV2gFU+y3zFE/iDiWCXPh+GcU
         9LQ+NafrzSux/n5nUWOWbE4KVLUfKz/laGzcF8aG/+uUZ0RYSPZdhLP/yse8x90Juy8S
         SnSNlVtNAODoLxQP91LjLj52orGB/7LAmX/6iWK/lV8WD6cyQKSYY4e7MZEqhP8KOp9J
         Re1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767623391; x=1768228191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHEQAWSamf6mSgVcU48rQFJXFmJhwrjLABUraXAPotc=;
        b=BEtRoMuyThGbyWA92FGwW5hdfuSn9vy6v11e+xRTfTUvZpmkmNu6SnMBrElZygKGy8
         wmBZsmkCGnjNnmMJnxtXGRf0xE12OCes7nWpjJAwvZrkjUUNpfvy1kTxODuiKY0cPCNO
         9tH/IfLKxD7iU517KABkwkzdK0U7mU7msJ8PgaYBfBBbmPOVVpraZmdQiP8H7ohmsOXW
         LQxMutFec77zF5r9wkWxn4EmIgJlDLVn+I/NDN8UBnuBWmK3Iq5rJjOGayw63nqYwx5u
         PUbwMJ+sCGBwNk9NCxvaa1CJ0ndTfv70PNwmdYMD2a/UzB08vL5/K0i5mg5UfWjARjOW
         KouA==
X-Forwarded-Encrypted: i=1; AJvYcCVwyC7RU7GXZ/4uM4kD923OdOGXpcOw2t1hHnLyHdfwSloLFIJRKBTUfo1rlZ3wDkm9jPw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7xpeJrmYAtPif5jZ0G/ZrsTyqFGvksvudKk3pSJ6fezToXFPr
	6HAZqsNq/st80HY/czZp8rFrDx8NlDl5zYg34B5HiBRrWk8249BBvcKFcXOmBN04DGMyUuBZydN
	NS3mfZgAGa/0R78dWgOl/U8FxC3mIyOxjB3zXLlANtQrfANlWSL4U9Pk=
X-Gm-Gg: AY/fxX4+gq5boCuK11MgwrqTPqFwcB/0iW89xtfO+mk4RCcJrE6wF5Sy72KlmfbYmZQ
	Rsx+21uh/vvF0EHicFNin5txLQBosQsqjUN0c1DTVvGzSlw2nYlNxPJTV7jAi68Pel3t94FyrNr
	qnjrZQL5lkE4aetH9M1Pe+RUqVfJTZKWEF7gRAvzmLRtK54cA23eMD+LJ7nmsBj5Tnfk6VC9K6Q
	kXVXD2bnrQEPD5vfsWGjEw9PLxDrXhuuz2OBcfa/C1m86FJ4htL8XAj40OY5W9VuPVbWSeqhKmd
	vu69F63TPcy05xer9BfFy7NTyzkkglA/Gvr5gbZWp27GrStmBDbvXDr8NrAMqpAU/A/hFoq6I8M
	76W8y1hDEspEn0Eio2lDEXbDRCA==
X-Received: by 2002:a05:622a:230a:b0:4ee:1365:ba71 with SMTP id d75a77b69052e-4f4abca88f1mr652021481cf.9.1767623391196;
        Mon, 05 Jan 2026 06:29:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlvRg+aO8t+zE5vVQx9pWdSJVFNfjvds9sCsVNmPwgMaoM5zPq5KHvwNtUo5Xk2hR51+Kd6Q==
X-Received: by 2002:a05:622a:230a:b0:4ee:1365:ba71 with SMTP id d75a77b69052e-4f4abca88f1mr652021031cf.9.1767623390710;
        Mon, 05 Jan 2026 06:29:50 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842673b560sm2074066b.33.2026.01.05.06.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:29:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] ata: ahci-dwc: Simplify with scoped for each OF child loop
Date: Mon,  5 Jan 2026 15:29:45 +0100
Message-ID: <20260105142944.372959-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1510; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fAegm32bM9RyJz+Nl9EGlr82cAT+Hy4WuMkpCZJ7rro=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW8rY87hRh0OzcNY6V/K6ooLENyRt+Cgnakquq
 iXDKU8drGGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVvK2AAKCRDBN2bmhouD
 12dTD/9Suk2plByjENwiUinWakQ+DPzMnIChhWLkeXgvvr1J3oRE1Ex4KAifn26iU5s0x7BtN68
 GNE+GefUqjIbOHPNiY3BIL0tfcgLjPne+kieuwmTzXonwITY6qodvNg7og57nnlqSV0P57Pi56G
 1PFQyuBOYzqCblfnmTcufc56svhZhH+R3RrCXS1h+xwtD2G3V6bfUUHakvyzAOfjiPhQuhRVKl9
 6EuGeCyEV9A/kvwxohhZsxD2PTZbJ2jk/NBZhxvuf3TLcQU/q2vdnxX9/w7H15XJrMXrMh2FlWQ
 NxLOvtnE9psQpCArJ8Cuvz2R1m+mUHX/MkPuqE6jDe4LjHdQhDPiMpiwVKRv//OrtbNPj1qMIPu
 Vk7BkgehA2WM6IjGm2/Q5lU1zSugg5St8RtFX5LBLcgY0qdC/BFna82n/a9hjV7YIB/V3kKOUOX
 mpTIDU1kw3VlmMvQvx9tk0e3KgAOkb5LxYHhHKtB3wfHxmdrGDLnzaMLilt+R7liU5LvAylVzF4
 26n7JbQVd4OPhs4Ac3Ze7mRUSZ91Cgi139zuyeQm8a+O1TjJLsQoatDVrRb1AKTGeES1pnKz8+H
 FydzfDgQdLIOiNlCdJPHoCrmQE7yCcM5ceup7eonMHEkdZ80viAMSNFdNO0gD0UKK6YKALuJDbL QmtPHJSK6N1c2dw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lH1KdJl8XXOorK3zo8v5bKpDzujRcT2M
X-Proofpoint-GUID: lH1KdJl8XXOorK3zo8v5bKpDzujRcT2M
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bcae0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6c6E2J2u3FmSKLr74-YA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyNiBTYWx0ZWRfX0a6ZQ8oV8wa4
 +udSa/ordGoKUI6SIgmn7/jmEvmxuczs25Ht6QwQ/ZXIcJebSZxH2Q8HuMFFfLYM1xDTb3t4j/s
 yCzwiLOip+AWh5zQMG4RaoUa17yzkK8gHCB5JYjTSCE0ATOPtwiSlsegbss/9q7dbXVHEuqs4T8
 KK6UfU21sO6GYHv3anSPbLS5S2/n9hDscdcsQ6OKhXanOOeoPK8mfgcxOcPfn2GFE/lepuLsnOS
 WZ+Hi0eyhzsqEzCSLSDCdbrmKp1fZqWnpKoxrJJbW3zxqhzj7nKdKnp333pzQDgBoDsv8EFIaZp
 +4hXLpCKp6u7dJ+cFE4881CdI78XDoR6AKajfnblGvRx8mrs42NSum+tH4GkXkpaayySfzf123P
 rVlS7448wAl77NXOZyfM79PABzjCY93X0o8orWDfQ7czNnGPnjCpp91b8JpUX01BNcc1QBOiGiw
 YIXknbF4PAdEo5JGfGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050126

Use scoped for-each loop when iterating over device nodes and switch to
iterating already over available nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use for_each_available_child_of_node_scoped (Jonathan)
---
 drivers/ata/ahci_dwc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/ata/ahci_dwc.c b/drivers/ata/ahci_dwc.c
index aec6d793f51a..64abf865bb67 100644
--- a/drivers/ata/ahci_dwc.c
+++ b/drivers/ata/ahci_dwc.c
@@ -260,7 +260,6 @@ static void ahci_dwc_init_timer(struct ahci_host_priv *hpriv)
 static int ahci_dwc_init_dmacr(struct ahci_host_priv *hpriv)
 {
 	struct ahci_dwc_host_priv *dpriv = hpriv->plat_data;
-	struct device_node *child;
 	void __iomem *port_mmio;
 	u32 port, dmacr, ts;
 
@@ -271,14 +270,9 @@ static int ahci_dwc_init_dmacr(struct ahci_host_priv *hpriv)
 	 * the HBA global reset so we can freely initialize it once until the
 	 * next system reset.
 	 */
-	for_each_child_of_node(dpriv->pdev->dev.of_node, child) {
-		if (!of_device_is_available(child))
-			continue;
-
-		if (of_property_read_u32(child, "reg", &port)) {
-			of_node_put(child);
+	for_each_available_child_of_node_scoped(dpriv->pdev->dev.of_node, child) {
+		if (of_property_read_u32(child, "reg", &port))
 			return -EINVAL;
-		}
 
 		port_mmio = __ahci_port_base(hpriv, port);
 		dmacr = readl(port_mmio + AHCI_DWC_PORT_DMACR);
-- 
2.51.0

