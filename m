Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A661E36C0C5
	for <imx@lists.linux.dev>; Sun,  8 Mar 2026 19:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772998462; cv=none; b=iC69ygrIDfxwtfgiYkkcyoe1taivkiObw0/AhNT+KtER4d72XZrkezrzqs42EU24dFARfEGkxufD58Bzy/sNlnomBFFZfMdMFaEDPuOvmAtkEqokHLWqEbn4eoXiSU3i//KhNQT3POO/V0KhonsbZqqOnDVvypEBhW84ISYM74M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772998462; c=relaxed/simple;
	bh=7EneF9OfF2N9iGr57suK7zde70VcftO86WC3m1+RuqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WFgXieAvrcKtPhqbpGmZvlyk5PZpMESSvBYeykH1lh3ZeHMU0Pgosh3CBm2rAi/YTl4R7MWnO664cTPjrxygyDvjAWNo6hmsQk70w+mANgGDJYjQ7Gj+rrBnnJEsw1TeRCapBPNe2ItlVkWUqhWW2WiA5rA+HQ2sRq5e7dwDCqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCiJDgtF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajQdqebM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCiJDgtF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajQdqebM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6285t64N2908366
	for <imx@lists.linux.dev>; Sun, 8 Mar 2026 19:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vh58ApOUDm3FbXz3u/s00W13OYNSc/5jru8Nq3PkHFY=; b=NCiJDgtFWX7fALOI
	cYlP/SeFlV7hVz3MMfIeBj4CIRQ7aHOJrvUrZvIDdAmOU9/tq7yhusXbtHXNp8Hk
	16EIUYQa18m/Kv//TOVmYeeua7F6BBwm/Mx9+MF0hNupRWTAaVjQb2rzBHct/TDq
	tVHq0PUr2BjRX6/4RgD3Cg16ebBqEHLgJJUR96n6chJZ4fRkP1cWEt/ha508VGWU
	HI3mRNebuPtZnigCqMTAY1JrIduqeylWEC7IR12dr9dUMRe9EVupNyiqi8xkFIyD
	gTLU5WKT8ALMzi/7zlFHh/r6sdP+v355QrvVbXlXe3wgVXX2jtEc8HC5nmO5nR+V
	Dc6ieg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crb14u52f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 08 Mar 2026 19:34:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso10529943a91.0
        for <imx@lists.linux.dev>; Sun, 08 Mar 2026 12:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772998459; x=1773603259; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vh58ApOUDm3FbXz3u/s00W13OYNSc/5jru8Nq3PkHFY=;
        b=ajQdqebM9O6NbaEZn23pHcTkzW1YGY7NpWi0S14rxkuXdjpuORvvie35Od6wr27aGc
         GQCCGSJXP6ReoyDt1eE/7wksZxTtz6keUeQLEvX+4DjdiDZ8heeCnDVerhndS78lnAJt
         nQXleO+SbAwVBES/uQHOn/I6rU+7lIYMQYvyu+rhrD8ngOB1WT0SHK5jiAX3SFltwMr5
         52tRSTqqbDYZdlm7SRcWi4KknOg7MBOlFoihcxVP6EKgkRBdORC/PhZaZI1uHdeI7u9W
         KfrMA75ivbsRL7g5Bu6uENLuVrrnmNezRB6bpmjgYf+QOgIscwao4B0qv92XUq1hk2l1
         FgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772998459; x=1773603259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vh58ApOUDm3FbXz3u/s00W13OYNSc/5jru8Nq3PkHFY=;
        b=bVfoyU8H0JpzuYRB5hs3tkf7GvRlyOZeMeY1gTxPUa5o9zKdA9cxYEM/6bslXq5vsR
         +LsJjfk3wYe4terMGgk3hl5DkEvQxKmPJHhVpb/Hbnl3oh51xhPwpBpbBoDcJoNHdBWv
         AdjctEaYQ4mCExT4GaEr8zqmS5E8qDr5SPd0FuPC/Z2o8X8lO6I8/jmW+MWQlLamWbDU
         pK2vEoUR5j0t8Bv5RS74LiJ3h1WJEwd5Hb2L01skjAwHyTVIerbsx4vfWk7SSDQ2eMV+
         vrs33YwyknGIlAkSd2vhAgIFuQHfv6h4syIjcJEObx5kM2b9oLtOu6ybrQ/u/+2+S47K
         ZFoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+WmOrF31zUftqqauv8sdLKLpc+TXRrv5Ev6yF9Ocr2m+I1920uczeZH6kNI9g+oycUTg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkuYBKyh78qSucUQX2WSD9tApAVQWJUR/XFKIgvCTWUJAWbgll
	6Ih0gKTa0xCUjR3gpGTXDOITXDfoQq1/o6EhhewwB4v0TwsL0vJke7Fmn9mf314lcLEiIRV+/u+
	5A12OJLn7VsJddlJWIsT6AcHLijGrWXmrP4e4adowKXNlqwOAyRLQTGY=
X-Gm-Gg: ATEYQzwQ7LFxuuYU/d3ZhLRsb9P1uSxdeTi3JVhSUbmS1R8+SeuvvzBO0vYG5GNdP32
	D41b6BsPLGMO3chV1zePZputZS3OdfbSdAgw06i5erIIeJvPWX4BHGxQ9rN72LOy+Lq0RJp/fEs
	8EkD/XEboQvLfAcsV2xJcOYv/Oy5vCeh9AuZTirwaXK08sTZOGwhcK3n9HEgnOdAher3HZU9reY
	NsmrtVTxc5mayHGAYRClUwtEgPwqbQCjQvoiQQNsz1P3RIGlpV7zWJbZDTMNMSH+rAqidNK0ZnE
	Qy5BXIrKzxh36D55LTKAQWg8qXXRAP8DPJ9z36kVKlJ+0svd0vnCSarmwvZ37ut0y6ePq70I9q/
	moDHs2hvQ80jXnpWhC2O4UwM6Lj6eDDV0GmDGrLvyPgtcGQFlu3SCtMPd
X-Received: by 2002:a05:6a00:3d98:b0:7e8:43f5:bd4c with SMTP id d2e1a72fcca58-829a30b0da4mr5836504b3a.56.1772998458275;
        Sun, 08 Mar 2026 12:34:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d98:b0:7e8:43f5:bd4c with SMTP id d2e1a72fcca58-829a30b0da4mr5836476b3a.56.1772998457759;
        Sun, 08 Mar 2026 12:34:17 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4676593sm7818909b3a.28.2026.03.08.12.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 12:34:17 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 01:03:37 +0530
Subject: [PATCH v10 1/3] of: Add convenience wrappers for of_map_id()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-parse_iommu_cells-v10-1-c62fcaa5a1d8@oss.qualcomm.com>
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
In-Reply-To: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
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
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772998436; l=8304;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=0HcqUiUmz/4eYD3bErvod4ldrniwhh4k5wTOZyawn+Q=;
 b=NIW6O7RTPmvFreddKnzjsXyJ5nMuEQ3h35YKP6uS4GabQ++O++b3BwYxmZvNyx/JcaKUBuwi5
 TReogjCXsU8DzPxev4DnCf+9kM0nkPTOxhZZFRkatpC4OluXCiVlu9/
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Authority-Analysis: v=2.4 cv=IYSKmGqa c=1 sm=1 tr=0 ts=69adcf3b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=jVkiwcMdNzIszB0OPoYA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: lgYN_Z1Pm4B3A2oMjA_gnAEG8XQbEU7i
X-Proofpoint-ORIG-GUID: lgYN_Z1Pm4B3A2oMjA_gnAEG8XQbEU7i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE4MSBTYWx0ZWRfX3kEq7fUQC3IQ
 lRR4wdyzLpBxof0lsy61CspHzNOybz9idnX9y1UbqqoLDroZcaJYaIi3q5X+C27Ixa8jXBu/lBv
 6cxWXhLSJb0jaCnWytY5CocuQ19qzYH48FHWjZTkzI4UnXTGnoa/9VOWZbcecW3xLzIBeBFR+0I
 JANBkenPR38tbcOcoheZhYIGmPN5AqxK1crwQPnIkUPOChSMNo1USEWtF9hdDS4o8cc/c5e7rZb
 QfjFo4Ie+t/g9LkaiivLNXBFysw1fg+V8m9HBI0NLUYkOv1wt8tdh+s1mjIgfDwn695h2ObZvZ2
 D/qRVR4oIihDbMfp+b5TNEgTOACf8TGiisDM0JFPydnaNcSGzaC2CPmDpsY+cUBbizC5swyZlow
 X6ozFWKMbejKCnjiouSF0nHBtvcpsZi7SjopECIqNpS8qm0kSzWRSFUSq9skIKKeDADmHwHLB8w
 DMgjC0JgQzvPQ42VW9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080181

From: Robin Murphy <robin.murphy@arm.com>

Since we now have quite a few users parsing "iommu-map" and "msi-map"
properties, give them some wrappers to conveniently encapsulate the
appropriate sets of property names. This will also make it easier to
then change of_map_id() to correctly account for specifier cells.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
 drivers/cdx/cdx_msi.c                    |  3 +--
 drivers/iommu/of_iommu.c                 |  4 +---
 drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
 drivers/of/base.c                        | 36 ++++++++++++++++++++++++++++++++
 drivers/of/irq.c                         |  3 +--
 drivers/pci/controller/dwc/pci-imx6.c    |  6 ++----
 drivers/pci/controller/pcie-apple.c      |  3 +--
 drivers/xen/grant-dma-ops.c              |  3 +--
 include/linux/of.h                       | 18 ++++++++++++++++
 9 files changed, 62 insertions(+), 16 deletions(-)

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
index 57420806c1a2..959305a84748 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2201,3 +2201,39 @@ int of_map_id(const struct device_node *np, u32 id,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_map_id);
+
+/**
+ * of_map_iommu_id - Translate an ID using "iommu-map" bindings.
+ * @np: root complex device node.
+ * @id: device ID to map.
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
+ * @id: device ID to map.
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

