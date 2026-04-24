Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33867346E6D
	for <imx@lists.linux.dev>; Fri, 24 Apr 2026 05:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777010258; cv=none; b=GZRK5jI9oD6nSVkJ9znnIYPKPz7GVpgC6z+OVShJslRxomgzkYO+u/mBCZtnyDpciw7iwrdE5Ka/heZiRI21ulZrxGlHhSwF8Hcwd3ljMF9UW9OxE6ewTBVYe41p7HEWUy6NFTAFF8wlHUVayusxIKeMWvm2bIcyizSYgo0p8nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777010258; c=relaxed/simple;
	bh=bmn9oR4CHseVq+Q1yzNkzndMq0RHssJSS9rv7b6NSno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SS+5Vp+ZmRhuLZ5TPVVWNnWynwujMOuK/jXrCSVC97ie927iC4QEQluLq33HnxaePGhVSXYL8RjXyf/kBDu7ZlvKjDiSFqzeF3ekc8GuTe/2gTgLLGyELjEUGQTqLhC4YJH91caJOK2omCDrihF73ND7Mbh3v1LfFpclZIPDEhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7cfeXDV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GG0P6AV/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7cfeXDV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GG0P6AV/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O2X7N12710318
	for <imx@lists.linux.dev>; Fri, 24 Apr 2026 05:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkYW84mNfsxJu25KdM9HhqHWqHHn7yyj15gOr+bOnfo=; b=g7cfeXDVAn3snLm6
	E1quUpkxWxFy4WplkkUVShkx7qxuwSa8rSOoL5CQj0TiunCMKlVceeHnJ1DJA5LA
	bp6L7idWgJBpIEFmCYpTOUOWbQ9+mgBg+IfduEullKSfB7BkALiGYfBNv9GnPeVB
	7sl6a2UzIflDbUnDp9gDH1YtKfab1C1vLw1rnSEWmCWusw52GfaF2/XAow5rAV4u
	zvb/J4VqYDvAOxHKVo9s93kaSVfvCTgslusZ4AWRcVXvWpjd967QbRiN+yNq2IDN
	jiIHmrprUjiFsVfm9uP21SRsU7Wtqzy6u6znqP4vSahr9cI4i7DNkXSOil08nQRY
	+YR/pg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9tffr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 24 Apr 2026 05:57:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2ed279eedso50827565ad.0
        for <imx@lists.linux.dev>; Thu, 23 Apr 2026 22:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777010255; x=1777615055; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkYW84mNfsxJu25KdM9HhqHWqHHn7yyj15gOr+bOnfo=;
        b=GG0P6AV/Y6xGs8ldwVhdOwg0F0+W9eIUYTlhlDCjiV32N4hB3Nt0V2cmgot6Ys+d8l
         IxLTtL2RUjrptv1XkngEV7byaKHuGwG1MlrcuQAfHpwFQpg4Ga/wQaxhn2ZLKT6T1Q/r
         eVX+xT/0TIF7mlhrPtefdFxMhIm59qMk90M4IV2An0Vbm71JfPnu2nZ/x9QYcGlvvg8b
         LfIDVT3FQka5YalMzddVIwKqGplD5PEWouARTsx7TiGSC+acIfC8WMY5MkpceAL237oA
         8d8iU1OnkOmeft9J9P4kZqhW7/vUEITUEO8zxuYD8AfiTsjhm63b8M2yWy7UCfA5tAGx
         OqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777010255; x=1777615055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QkYW84mNfsxJu25KdM9HhqHWqHHn7yyj15gOr+bOnfo=;
        b=msnd7gflY2HXzx3EM25ds5KwWNqqOanJax2A4pd4HcAuB8wH1G6UZUeOyFYPw1Ea54
         C0jk6+15BfMlMAOHXE8viVOVT15yt+2IeANPltlP60ZO5S8Y2Je2NLuHSgBWWIcVvtR6
         YK+D1oumGJxfjAKDzXmgep2ZIvRf9kMmOwYtP9HF1DFm++FOCDmJgHi7KUu3CT/Q8xSl
         7HCEU+Z5MTpPrIzrX6pXk+C6k7hf5ivOx4APq3f/3parb15vES34m+bURYqHP6UqnN0A
         fqXue0j5GmXMJAnYg49LHclstVENdGDdxobdOahnSCpAcDG8TPspoV/3+2nmXnJYETd/
         8org==
X-Forwarded-Encrypted: i=1; AFNElJ9rZwarSCV8vxXLMVb+oR4Xs88vYaMTOd089FhsG3XLstIaQ8gGsRJ5QsqDceFUTxp+LjU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyExDKgP26eapusRVvvto+32ffOGac1y6tDB3tVeo8jt/VSw7mP
	Pq+BP1C7ftoGm19NDOvwHrH+LuAxFv2YLqu9IoyzHD3QFiKbayUh2RTmDpPhdEpt2tn0PxJ9n+0
	FsfkdYsHYiDb3Ixke47Tcx8MZp84UT7j921/rOSAWzSetsaG/5iEOHws=
X-Gm-Gg: AeBDietENDXOmpaCjSdVNSf/SnkO5yvlSlCIdDZLuSl9jxyWjhKFa2R/g2ifhx2w075
	umA3GXTUstVKUFBFoQ9xK8+JLR95zTmcZCcEALuTuxlP8iQ9ePUJ3RT+cnUppPevKh4j+DHiqAn
	lI6HxHftCiWANT3PCCOWSNj10OM0lk4uZMTF4z0hGebRMbBGA9NtbkWmcooJHV3jLUj2/jLfOP7
	RPFxvP65ozUB6r1J6fNkACjzkqhigmfeXznH6lFW84cwFXIxajry6D+6jx0SvvGnOo1wn1+2K9+
	3GNWExsFjPlunhcDzbVVli/D9hgUhOaEDPB1IJK9Pkq2Mnt16MBwkgme0dZLxqI8aaA7pnvRmS0
	2iURa45Q+5lCHf+BS/PXNoei9Sglghgoll5qV7ySmU9NnkbHKJdmd+/NRgbA5ykTnQjQ=
X-Received: by 2002:a05:6a21:9983:b0:39c:12c5:c6f5 with SMTP id adf61e73a8af0-3a08d73bfe5mr32758957637.18.1777010254767;
        Thu, 23 Apr 2026 22:57:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:9983:b0:39c:12c5:c6f5 with SMTP id adf61e73a8af0-3a08d73bfe5mr32758909637.18.1777010254185;
        Thu, 23 Apr 2026 22:57:34 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79770512afsm17288101a12.31.2026.04.23.22.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:57:33 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:26:08 +0530
Subject: [PATCH v14 1/3] of: Add convenience wrappers for of_map_id()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-parse_iommu_cells-v14-1-fd02f11b6c38@oss.qualcomm.com>
References: <20260424-parse_iommu_cells-v14-0-fd02f11b6c38@oss.qualcomm.com>
In-Reply-To: <20260424-parse_iommu_cells-v14-0-fd02f11b6c38@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777010232; l=8620;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=Bsp9hT6sgzNh1NrIZ0uduUy4Yj5U0gq9szC+ECoPqVA=;
 b=8NWpPedhLlqQ7b2HqBvErn44emkQL1+f69yBIykemc4nTU8mhLdWyBM6UrLv2aTheTYRGoULf
 4gmGUfVAgn/Dyc1fN3co5ZAOWZ919HjRTHUr8oPlkiKa+0pRuDTHh2z
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-GUID: L6gjHM4yiId12eK9iOM-aYK4iO8rWk54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA1MSBTYWx0ZWRfX2JgVLcK920ms
 UqhKcX8RDe+EeOZNmffBGGTFzpwcrlhzOXLT/WDXbmQc/o8nZIDiN6zGRszD9JY7tthPLQPkIlD
 Q0XESWPHEmd6XxsqshisVPbSMuuOieBPXz0N/MVSTXc9Kj4ky+n0k6XXwoMAxPWYwxxWOYuLgxe
 QRQC7YRXaXR8lUBc/NgxpH9Jop/UJMKZmXQ0uwZgojk6KUJhzMbUJX3M5BXzr1jxQZrkPb3XQny
 ylUA6oLNCaaxtE9tbCOJ4XoIW5+EdUZorMAjxyyFj0OMOaKNMFTasgV1bm+wP83joseaJ58UeY3
 QeQNTKxRIjS0XY6rNzL1s56EzoVI2TE4C+aeMIBFmS/LwIEM1h3iQ3QoszaVuEHu4SND7dFD0uo
 JA8qtyOeeqgUS/UXqYbbvcOl3cylj6cKhB8Bk3vz9RFG0cSMLhK2uu9op7rbo5a3/VXYibfxlWs
 lu27dxtD23Hze1Ahx3Q==
X-Proofpoint-ORIG-GUID: L6gjHM4yiId12eK9iOM-aYK4iO8rWk54
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69eb064f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=1XWaLZrsAAAA:8
 a=EUspDBNiAAAA:8 a=f4O9XJQV64orvU1ydW8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240051

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
 drivers/cdx/cdx_msi.c                    |  3 +--
 drivers/iommu/of_iommu.c                 |  4 +---
 drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
 drivers/of/base.c                        | 38 ++++++++++++++++++++++++++++++++
 drivers/of/irq.c                         |  3 +--
 drivers/pci/controller/dwc/pci-imx6.c    |  6 ++---
 drivers/pci/controller/pcie-apple.c      |  3 +--
 drivers/xen/grant-dma-ops.c              |  3 +--
 include/linux/of.h                       | 18 +++++++++++++++
 9 files changed, 64 insertions(+), 16 deletions(-)

diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
index 91b95422b263..63b3544ec997 100644
--- a/drivers/cdx/cdx_msi.c
+++ b/drivers/cdx/cdx_msi.c
@@ -128,8 +128,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
 	int ret;
 
 	/* Retrieve device ID from requestor ID using parent device */
-	ret = of_map_id(parent->of_node, cdx_dev->msi_dev_id, "msi-map", "msi-map-mask",
-			NULL, &dev_id);
+	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &dev_id);
 	if (ret) {
 		dev_err(dev, "of_map_id failed for MSI: %d\n", ret);
 		return ret;
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
index 57420806c1a2..ae04487bd614 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2201,3 +2201,41 @@ int of_map_id(const struct device_node *np, u32 id,
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
index a5b8d0b71677..bff8289f804a 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1144,8 +1144,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
 	u32 sid = 0;
 
 	target = NULL;
-	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask",
-			  &target, &sid_i);
+	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
 	if (target) {
 		of_node_put(target);
 	} else {
@@ -1158,8 +1157,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
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
index be6ec4916adf..fe841f3cc747 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -465,6 +465,12 @@ int of_map_id(const struct device_node *np, u32 id,
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
@@ -934,6 +940,18 @@ static inline int of_map_id(const struct device_node *np, u32 id,
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

