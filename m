Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9342DA75A
	for <imx@lists.linux.dev>; Wed, 20 May 2026 08:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264211; cv=none; b=qfMFhB6bET9JAIu7LXDrO2YRaBNpExtGOCH0J7rkvJ3OsvH9g9UxMRKv5Hdc2Lt44DRDIqdoqtqIBUzEmUCo+KOF1ae39tzJJ7coz14+EsiXiIkLeweDo1np3FyDNgYQhm0Az932g8/B5XvgVftAoOUy90kYnywT3Hfc2/48MZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264211; c=relaxed/simple;
	bh=phzhKGxsD8t3YkGlCEmeP10wiLTAREuNp3sc6yMT+Ic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qccEfSuFLH2CkDCTsArcNDgJstp4ZA73v6zguIxmjVtbei2UolxFJHMV2SZxD7GDo7QnCr10NBJ8mwr6r9tR9zAzOhc+A44piqJCqtxUATMFpxmGUo1f/73z7Dy2mLu89Rqq2WjDSppbgc0UDrymTmjg746LIy72U46MrPpwGdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWVwVHnz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cr254vvk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWVwVHnz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cr254vvk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6kR8w1953973
	for <imx@lists.linux.dev>; Wed, 20 May 2026 08:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FIwRGbihw9ibmdw2sFBiy3DnC7QkudGEzjZgfV2uv2w=; b=aWVwVHnzTd6YLtiG
	xH4Okt96JuBzSmgt2+3v9vv4+yIWWzx/kbLxCpSsuaik5jk5SIPN0GjHNwXMinHs
	OBVnw1Z/CxjAbcvkecP+wPx/Gw/R7gcFU6ctu2+uj4mwYOB9WDcvNQTVyh/jOYId
	XRuj/5eTFHfO0UcC9SEfkKhzxQseCU99nGmzI5ZEvR4KkvWj9WEx/Ze1XGpaCtNw
	xAUtc1fp/YLFs42biudgbkKKi9ALDsDE6BpTCKzdybU+KR3e1HlEwzPGVQm17cL4
	A9sP0MeX9FNDV/Ylg76eYqJ6u8175Sm7AjjnNSLm3vwKq3pLFuDs4Cb3NhlDHh+e
	2t9XQg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xuq83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 20 May 2026 08:03:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36781927b4dso4875094a91.0
        for <imx@lists.linux.dev>; Wed, 20 May 2026 01:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779264209; x=1779869009; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FIwRGbihw9ibmdw2sFBiy3DnC7QkudGEzjZgfV2uv2w=;
        b=Cr254vvkvu8+eSed68VCwmO/zmDohHOBwlWS5u7QswH8yqyWqCA48hLLeBcBgo773f
         UToB4HMV8dvMEOxTbK2aJ1fiomtAONiAnXzGGi8uOH5WMKTGcaI7uzo3BXZcR2OSQIHI
         WeFyafDFtcfAbE3fPUnk4R3/lzb2H0lg8LEmxCA2Edrac/Y+FjEBMnvvneh2i5QNzh3j
         nhpKp3xY7z178BBtd939YVEOJGYNB0UJp5D00wxY+3hc44NJvNs3NC6ycmFVuJ0KFdqZ
         0xYxmF3B8WIgvXfEY7fIgUGBx09Z8GDnlGzRrsxLDdgfzIwSTvKPfsNc58IE/fft4OqD
         qaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264209; x=1779869009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FIwRGbihw9ibmdw2sFBiy3DnC7QkudGEzjZgfV2uv2w=;
        b=onjk2z8W4ZzDEaECyMPPj9wiMrc28wS3E8eSYTKFsgzsBXuS6xMOXeTwGLudkodnsw
         WSgSQqD6VG5t8kTJcMZXWFy37km6dBHXamUFPE54G47a7fDRb7kEhSctXaZ8weHbcxKI
         xL70Sw9yAEFhu+Vps8mdgl0lrCa/tbZIfjmg9WiD97JHGU9Po1Q4+6JMMM1gvZcKjWVT
         xXSdRsOR3OGjp3/3dUfwNAA0DVkSyKVVLHtPn6Wl9UiP50uZO1AnWAm7IG2QD9Z65kX4
         PbQgxR2rv+3FVTtqHC+OwbLix0zSuPXfmWLp1KW6/KqpJFIwFiqdDK+bHu6zcJynUycH
         LdQA==
X-Forwarded-Encrypted: i=1; AFNElJ9h+V1qFqAgwuXVTsBuWkRct6m2cP608cVJBbyiQvGbELfmV3HXO6V4wbJ0d8DY7sdIAvY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhXOsx4IlmuOPlAr2f/S1rK16ykJE3tVPa34tGKsGoPt6LWaVE
	S47K8di/EFjQkOKuiOX5pMu72XpmMwlmt9VwSJXxyVD7zJHnTB54leuSs8T67X/3dWEol9LIRuB
	Cg5pF1sqebW6tfbzEi/ROEvP2BwQfBNRSTTvcmPgjUAhB16bUOgPKKvM=
X-Gm-Gg: Acq92OE/iUIQr5eZTYcYj6bSoiIRirIIpQCPqxj2KCKu2iKGsRax6XvW1DcQUK4n3Qu
	BVKKwq9giZTr61SFvby6+qfxpUTbbLAHSqNJ9Hjch+4fCS/BuoR8QbDyao6Hit7SuYVbK+Q51AF
	m5T2u/gJWXOyAJP2vJrDTO4Btv6gSSv94ia/elBdjD1kN9plqr8a7XcX3ViDsXtOkthgDqxUxhM
	KtFn3D0u9glCk17tgQX1EVsquZBElmko2tzkzybratBDb6B17Mm8lz5V10i0w7NmlDExMBodyN9
	Xcr1whTnRCjO47IwXK24diXJ9DiiAy5z9W2xerlsM4NkHpjrlV30/wqgIZA4qvBgupZajTx9Hwg
	0Ih7ktZ/NYx0gUR/p2RXJ2fi0KfZC9RTyeOyaLEQXFPs6urdu5Ddfk55b
X-Received: by 2002:a17:90b:260b:b0:368:ed92:6f3 with SMTP id 98e67ed59e1d1-36951b89773mr24767430a91.18.1779264208467;
        Wed, 20 May 2026 01:03:28 -0700 (PDT)
X-Received: by 2002:a17:90b:260b:b0:368:ed92:6f3 with SMTP id 98e67ed59e1d1-36951b89773mr24767391a91.18.1779264207963;
        Wed, 20 May 2026 01:03:27 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517aa6f8sm20889290a91.11.2026.05.20.01.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:03:26 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Wed, 20 May 2026 13:32:40 +0530
Subject: [PATCH v15 1/3] of: Add convenience wrappers for of_map_id()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-parse_iommu_cells-v15-1-b5f99ad4e7e8@oss.qualcomm.com>
References: <20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com>
In-Reply-To: <20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com>
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779264185; l=8692;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=6WwVJdgDC+Pm2Sux0Nsas8KIvED10B5HRfeqtTU/lhc=;
 b=Avwv4njbY9ZiIIe1YQtbsdcqBiwZRYWWqv+UaxTUCSBN/Un8571eB3pAOLYzMSYrhdxLe30qj
 87MQDMJX7ENBWSVj9dLyx0medcxa5u10fEAW2+WnBP1fCf57QH/sMpV
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0d6ad1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=1XWaLZrsAAAA:8
 a=EUspDBNiAAAA:8 a=f4O9XJQV64orvU1ydW8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: wbLTJib9ICJBPAdTgVgXPpYXVkVJw46K
X-Proofpoint-ORIG-GUID: wbLTJib9ICJBPAdTgVgXPpYXVkVJw46K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3NiBTYWx0ZWRfX5/QTWQVmzB/c
 y9lPdXQeuR0Dh7RKAUZtTadScRvgOTNk/cAlfIw5tVjlBDe1Myxn1odVq0S08JRFIszQDozXe8S
 KZRs8p8wEijQYpqyQfBd5hS6IsDyR8oEw+eLlk5mJCddZdvvXt3hNS3+urKqF2S/5FEpCgh9HC+
 rO2f7sS/5OXtpMzNT8IaoCJ+hW8FXOQjc5vLObxdAt46VadutrHTW4A0Lg+WN3Ev+rYVI3+pZyv
 d2M0r3tTZQPsu9XYOmg5hB3A4G2gvqvo3Bw6n9g5XS8fZSzBVSfulEVfQLVhFlkZyhzeZDuVD4H
 vpJLUDCcsykrSkmiJMa/1xmA1J9gEVeIhFEzswC57edPWfEVjzEeXALdzXLeGQotrv3BvBtf/jg
 +7q/PeJud59J1Jo+h/H/4pW2cbHCiglpLpvHdzKSCcLdwfe3/Lw/aRvdFo4F54bruRoPg39pTsC
 OpKnui4IYjEjvS575lA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200076

From: Robin Murphy <robin.murphy@arm.com>

Since we now have quite a few users parsing "iommu-map" and "msi-map"
properties, give them some wrappers to conveniently encapsulate the
appropriate sets of property names. This will also make it easier to
then change of_map_id() to correctly account for specifier cells.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
 drivers/cdx/cdx_msi.c                    |  5 ++---
 drivers/iommu/of_iommu.c                 |  4 +---
 drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
 drivers/of/base.c                        | 38 ++++++++++++++++++++++++++++++++
 drivers/of/irq.c                         |  3 +--
 drivers/pci/controller/dwc/pci-imx6.c    |  6 ++---
 drivers/pci/controller/pcie-apple.c      |  3 +--
 drivers/xen/grant-dma-ops.c              |  3 +--
 include/linux/of.h                       | 18 +++++++++++++++
 9 files changed, 65 insertions(+), 17 deletions(-)

diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
index 91b95422b263..78edb7308856 100644
--- a/drivers/cdx/cdx_msi.c
+++ b/drivers/cdx/cdx_msi.c
@@ -128,10 +128,9 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
 	int ret;
 
 	/* Retrieve device ID from requestor ID using parent device */
-	ret = of_map_id(parent->of_node, cdx_dev->msi_dev_id, "msi-map", "msi-map-mask",
-			NULL, &dev_id);
+	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &dev_id);
 	if (ret) {
-		dev_err(dev, "of_map_id failed for MSI: %d\n", ret);
+		dev_err(dev, "of_map_msi_id failed for MSI: %d\n", ret);
 		return ret;
 	}
 
diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 6b989a62def2..a511ecf21fcd 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -48,9 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
 	struct of_phandle_args iommu_spec = { .args_count = 1 };
 	int err;
 
-	err = of_map_id(master_np, *id, "iommu-map",
-			 "iommu-map-mask", &iommu_spec.np,
-			 iommu_spec.args);
+	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
 	if (err)
 		return err;
 
diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
index d36b278ae66c..b63343a227a9 100644
--- a/drivers/irqchip/irq-gic-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-its-msi-parent.c
@@ -180,7 +180,7 @@ static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u
 
 	struct device_node *msi_ctrl __free(device_node) = NULL;
 
-	return of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &msi_ctrl, dev_id);
+	return of_map_msi_id(dev->of_node, dev->id, &msi_ctrl, dev_id);
 }
 
 static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
diff --git a/drivers/of/base.c b/drivers/of/base.c
index a650c91897cc..1e9b9692c0d9 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2221,3 +2221,41 @@ int of_map_id(const struct device_node *np, u32 id,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_map_id);
+
+/**
+ * of_map_iommu_id - Translate an ID using "iommu-map" bindings.
+ * @np: root complex device node.
+ * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
+ *      stream/device ID) used as the lookup key in the iommu-map table.
+ * @target: optional pointer to a target device node.
+ * @id_out: optional pointer to receive the translated ID.
+ *
+ * Convenience wrapper around of_map_id() using "iommu-map" and "iommu-map-mask".
+ *
+ * Return: 0 on success or a standard error code on failure.
+ */
+int of_map_iommu_id(const struct device_node *np, u32 id,
+		    struct device_node **target, u32 *id_out)
+{
+	return of_map_id(np, id, "iommu-map", "iommu-map-mask", target, id_out);
+}
+EXPORT_SYMBOL_GPL(of_map_iommu_id);
+
+/**
+ * of_map_msi_id - Translate an ID using "msi-map" bindings.
+ * @np: root complex device node.
+ * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
+ *      stream/device ID) used as the lookup key in the msi-map table.
+ * @target: optional pointer to a target device node.
+ * @id_out: optional pointer to receive the translated ID.
+ *
+ * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
+ *
+ * Return: 0 on success or a standard error code on failure.
+ */
+int of_map_msi_id(const struct device_node *np, u32 id,
+		  struct device_node **target, u32 *id_out)
+{
+	return of_map_id(np, id, "msi-map", "msi-map-mask", target, id_out);
+}
+EXPORT_SYMBOL_GPL(of_map_msi_id);
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 6367c67732d2..e37c1b3f8736 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -817,8 +817,7 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
 	 * "msi-map" or an "msi-parent" property.
 	 */
 	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
-		if (!of_map_id(parent_dev->of_node, id_in, "msi-map",
-				"msi-map-mask", msi_np, &id_out))
+		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &id_out))
 			break;
 		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
 			break;
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 1034ac5c5f5c..c863c7b02289 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1128,8 +1128,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
 	u32 sid = 0;
 
 	target = NULL;
-	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask",
-			  &target, &sid_i);
+	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
 	if (target) {
 		of_node_put(target);
 	} else {
@@ -1142,8 +1141,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
 	}
 
 	target = NULL;
-	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask",
-			  &target, &sid_m);
+	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
 
 	/*
 	 *   err_m      target
diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 2d92fc79f6dd..a0937b7b3c4d 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -764,8 +764,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
 	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
 		pci_name(pdev->bus->self), port->idx);
 
-	err = of_map_id(port->pcie->dev->of_node, rid, "iommu-map",
-			"iommu-map-mask", NULL, &sid);
+	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
 	if (err)
 		return err;
 
diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index c2603e700178..1b7696b2d762 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -325,8 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
 		struct pci_dev *pdev = to_pci_dev(dev);
 		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
 
-		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_spec.np,
-				iommu_spec.args)) {
+		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
 			dev_dbg(dev, "Cannot translate ID\n");
 			return -ESRCH;
 		}
diff --git a/include/linux/of.h b/include/linux/of.h
index 959786f8f196..721525334b4b 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -468,6 +468,12 @@ int of_map_id(const struct device_node *np, u32 id,
 	       const char *map_name, const char *map_mask_name,
 	       struct device_node **target, u32 *id_out);
 
+int of_map_iommu_id(const struct device_node *np, u32 id,
+		    struct device_node **target, u32 *id_out);
+
+int of_map_msi_id(const struct device_node *np, u32 id,
+		  struct device_node **target, u32 *id_out);
+
 phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
 
 struct kimage;
@@ -948,6 +954,18 @@ static inline int of_map_id(const struct device_node *np, u32 id,
 	return -EINVAL;
 }
 
+static inline int of_map_iommu_id(const struct device_node *np, u32 id,
+				  struct device_node **target, u32 *id_out)
+{
+	return -EINVAL;
+}
+
+static inline int of_map_msi_id(const struct device_node *np, u32 id,
+				struct device_node **target, u32 *id_out)
+{
+	return -EINVAL;
+}
+
 static inline phys_addr_t of_dma_get_max_cpu_address(struct device_node *np)
 {
 	return PHYS_ADDR_MAX;

-- 
2.34.1

