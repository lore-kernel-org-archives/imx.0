Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FAC3FB077
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965949; cv=none; b=B65nWYAVFf/n7xGB7e7T+8AiS0YCgichn4yKVvH1tPUW+phhF2g7uQlqdwOus4hURJvGHZL6RHX0rQOJVptIP7TfOGM8lgJSEWSAN6vRQi1tkKWoeopGQATEDFo2ec3Bk511wjFfIebb1XPTHoWbOQDpMvC1Frb16VXEBYN+IHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965949; c=relaxed/simple;
	bh=321iTv20Z7OXFtuJcDmECJJpboHYO48kOD5DQXbc3Ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nwr16ivTjoS/6cLwBHtDW+14X2juNObtD+x63hMGrb4jId8HsP4NAdtiEK211YoddMYw3kY/NdJ+zCBBLIwRikU3016kMNBubu/7AqWjmYgTkfaCT5zcEefpROE7qV7hXlUjabxlY3ugqCCLJjoG8zRwsl5gjKWKvncYZuLpkB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmFljeGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZEmkXTTH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmFljeGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZEmkXTTH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VBbdAu2409165
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 14:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VhGHqC2XDynARGpL/uIgYPGZtNXC+dk0e9MA3p7JUHk=; b=CmFljeGRrCbwi0M8
	cwhv5/FP5/VOk7MdZs5SNHg6bg6nJEIENpkh1n33d+bp67pXtA6xs5xbL5Dn+lrP
	B8rz3bQJ+sEIQUk52lFKoyHwQWchlDI/qG7FbFpjK0Yi2vzkzXZpoQb4bFxRFeXc
	nLZ/H5uQhItumLsVUb2ZGZQ/zQTu4IHqQTOT5UK4ROYWC5maANsXvK/gWfLu8Rvg
	0z3NmAwyZ7cs4hpZAx38ui3fiNQu5RkomuUFmNfPnflixWjb/t2WidU7GwNAfpw+
	US3E1DT24bQjd/9Qp56LJS4Bi+/XzKYNO7KN2hfha60anYRz/KnJzY8GnEmYwVha
	Dicf6g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80heugxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 14:05:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24e9b4d82so30911285ad.1
        for <imx@lists.linux.dev>; Tue, 31 Mar 2026 07:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774965941; x=1775570741; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VhGHqC2XDynARGpL/uIgYPGZtNXC+dk0e9MA3p7JUHk=;
        b=ZEmkXTTHDs6tLlHvj8fKtv7vuz2mMLZ/lrQgGdSuHXdzi9YJ4FeuoKULYHDl0MY+eR
         JxpGo5I4D16/xz6FrWmM0CrsCUNYxi8L/7fR9usex9xtr+T9i4jsFPSliywzQaM1agxe
         l/W1gBBN7IV64YSEJmqVuf/hJ+VO1pthinvXAnFo4MyzezxpBqNkhdDQsQed/YCD9cY2
         6dHkjLEYciwiPJVK1goyLCy1v0X/3wnsNJn3ZEaS52EPemMydWc5BBQhVkJfIUmUYMEg
         y+qCo2ePJnDQ6Mb43dWZigv22BqsRj1BWDsqJTfq2e0SObz6ISFhgkZLny/ha/d7m1Jx
         v5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965941; x=1775570741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VhGHqC2XDynARGpL/uIgYPGZtNXC+dk0e9MA3p7JUHk=;
        b=IOIBlNxGABKMVQf+wEmVQORSAoLEkQPiOTpx7UdMV41jUC9YE132mt2UTVOpB1Dybm
         jhx1NLwXf5rBSIAI+GbjyN62paaVgDvM41T2CjCmlLsSkWFlvmrLOqbv/e0tU8x3YFks
         kVobILoZZf+nxbDY5M9+YcL+/FharL3NKCqBzsmFWYL2G7e0gC+5e59LyJIwXLaRKZoT
         pmzCPuB89YTz1YxMdzmnqpJk6wuswhHXipIHhTXfgwM4thmb+AV3c9rRTYNzrijmzBPH
         NZmyW7p11r1w8j/rAZIeGTWSmSa+vJiYLJSS8fkMHKn3cLtv3NCubkh7DZI3u5ctJhTT
         2ooQ==
X-Forwarded-Encrypted: i=1; AJvYcCVECKixxPhCC+kqYTS7QBW+z875DUgO6sJeXKiAwk/iDRhFTFJeLvmHh8ydCFnC15hvdUo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvzoA9YwVikxY/d3IMIXneGC10KblvynaXOFjlaovZR92Zs89d
	CH/hCyiB1ceyMBJQeafY13rUMrws5GowmCRuMb9qs4WBdNFxfPxgadfojCEHiKbJXqEzKgE66//
	HAWDExbuuL4F/E0Q+xBVen3gmAlIGdZNlJa7+ashJ7Hr71N+0OlaPVfI=
X-Gm-Gg: ATEYQzyItuAsdvq+l/kNkjMWDD2Len8065OpjzKDzsNsyuV6uo7I2ZGcwIXmYgNp5R/
	85Kd1qNMyKlUg/i0UhDWDDMNriwavROcdAhh4FDT9qFQeQlkYxjW8Eo2DhMtwGgrKdPW6D6Mg8Y
	XeV7zlb+wKZvvVAkWxE1vYzsrbymoPfIBItKwX8NjXnVz2P+lRQ9faM/3Uw7dmrn4n+lcMzlfJm
	jr5rZrQKfPziQ3WxBUX+BvmgHrP5mMJfxjckbHnauDfqTxwBQIHQXQEJsO6ZqYHR+Z0Kcn0JBM6
	ECBV9YxsOgp5+z1Q8DjvTfxfYuYEgVJvOQzxS91+uMr1ZBq5HskUV/sf5xZ3zQ0Y0gdnq1sQ4g0
	gwEaaPKIWWSME/D9gLLI1Uq0f7XEHvrIzkswY5W38dD/AjYVm8GaA92L9
X-Received: by 2002:a17:903:44d2:b0:2b2:4cae:6b2f with SMTP id d9443c01a7336-2b25ee9042amr24712855ad.4.1774965941240;
        Tue, 31 Mar 2026 07:05:41 -0700 (PDT)
X-Received: by 2002:a17:903:44d2:b0:2b2:4cae:6b2f with SMTP id d9443c01a7336-2b25ee9042amr24712315ad.4.1774965940172;
        Tue, 31 Mar 2026 07:05:40 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264292asm118311945ad.4.2026.03.31.07.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:05:39 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 19:34:48 +0530
Subject: [PATCH v12 3/3] of: Respect #{iommu,msi}-cells in maps
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-parse_iommu_cells-v12-3-decfd305eea9@oss.qualcomm.com>
References: <20260331-parse_iommu_cells-v12-0-decfd305eea9@oss.qualcomm.com>
In-Reply-To: <20260331-parse_iommu_cells-v12-0-decfd305eea9@oss.qualcomm.com>
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
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774965896; l=11993;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=hhxFww84fiqdRnnSRnrS9vJjSjcq+XxylCTlpd3SMkE=;
 b=gRrmchAOmvc8H1+6Ovdtg5xTtZ7ZAOXAB76++3lrhnE23wTQ3dnHyDuB45uAmXrmbCsob3oRc
 a1bj22FGcCOCFRbhZMjrfdmDjDPkJBZ5lVAKxqk0At7lTFuaYmzElPK
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cbd4b6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=klF1l1D6msg2vEcBgDUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: Ip_dqz61nvsSfoG8N7zNoCLNldiqOUxa
X-Proofpoint-ORIG-GUID: Ip_dqz61nvsSfoG8N7zNoCLNldiqOUxa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzNyBTYWx0ZWRfX701ji7IP4mYG
 TD+sUg3pTYcXFqjg9ty2SGORg75JK/DreNNwJ+Ux2sS/Iu9i/LdDqfDcwp+bM/mdMBXfN7aZJpj
 KBUvjeNO1ckv+w3OaOhENbfHXBlf/gXvcRsNIStjAoDg8+26XgP2TgkqVni4dcwaE6VbDoJd34a
 4/tNDtoTwQxzB5a4CWdx3lkzctp5ASnsLGZvLk5/ljDGmyB9UuMod9grU66h8B0cb5YaMaoHh1d
 7Y4gOehNSNnj/z7GajOb++i3TR+HRJksMV3P0DAntamc6ZCVUP0QLYynEbALyLnzeqafPXkJozk
 TXFYH7YcPrt32uyhRBs7F/wqmTV3gY/aVSOvoZk+y6ERmLeBDZ11PZ0p3jgznAU2K8YAayGRLs4
 riDnDptB/7C7oBVIGeEMZS8kFcH0ixN5lQs6gKbYwSO3NwStF8/gmWEIOm7sDMZm+xwA8rg/aSa
 I7B24/t+0ZWq2bYxTfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310137

From: Robin Murphy <robin.murphy@arm.com>

So far our parsing of {iommu,msi}-map properties has always blindly
assumed that the output specifiers will always have exactly 1 cell.
This typically does happen to be the case, but is not actually enforced
(and the PCI msi-map binding even explicitly states support for 0 or 1
cells) - as a result we've now ended up with dodgy DTs out in the field
which depend on this behaviour to map a 1-cell specifier for a 2-cell
provider, despite that being bogus per the bindings themselves.

Since there is some potential use in being able to map at least single
input IDs to multi-cell output specifiers (and properly support 0-cell
outputs as well), add support for properly parsing and using the target
nodes' #cells values, albeit with the unfortunate complication of still
having to work around expectations of the old behaviour too.

Since there are multi-cell output specifiers, the callers of of_map_id()
may need to get the exact cell output value for further processing.
Update of_map_id() to set args_count in the output to reflect the actual
number of output specifier cells.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
 drivers/of/base.c  | 155 ++++++++++++++++++++++++++++++++++++++++-------------
 include/linux/of.h |   6 ++-
 2 files changed, 123 insertions(+), 38 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index b3d002015192..7b22e2484e1c 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2096,18 +2096,48 @@ int of_find_last_cache_level(unsigned int cpu)
 	return cache_level;
 }
 
+/*
+ * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
+ * specifying only 1 cell. Fortunately they all consist of value '1'
+ * as the 2nd cell entry with the same target, so check for that pattern.
+ *
+ * Example:
+ *	IOMMU node:
+ *		#iommu-cells = <2>;
+ *
+ *	Device node:
+ *		iommu-map = <0x0000 &smmu 0x0000 0x1>,
+ *			    <0x0100 &smmu 0x0100 0x1>;
+ */
+static bool of_check_bad_map(const __be32 *map, int len)
+{
+	__be32 phandle = map[1];
+
+	if (len % 4)
+		return false;
+	for (int i = 0; i < len; i += 4) {
+		if (map[i + 1] != phandle || map[i + 3] != cpu_to_be32(1))
+			return false;
+	}
+	return true;
+}
+
 /**
  * of_map_id - Translate an ID through a downstream mapping.
  * @np: root complex device node.
  * @id: device ID to map.
  * @map_name: property name of the map to use.
+ * @cells_name: property name of target specifier cells.
  * @map_mask_name: optional property name of the mask to use.
  * @filter_np: optional device node to filter matches by, or NULL to match any.
  *	If non-NULL, only map entries targeting this node will be matched.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
- *	@arg->args[0] will contain the translated ID. If a map entry was
- *	matched, @arg->np will be set to the target node with a reference
- *	held that the caller must release with of_node_put().
+ *	@arg->args_count will be set to the number of output specifier cells
+ *	as defined by @cells_name in the target node, and
+ *	@arg->args[0..args_count-1] will contain the translated output
+ *	specifier values. If a map entry was matched, @arg->np will be set
+ *	to the target node with a reference held that the caller must release
+ *	with of_node_put().
  *
  * Given a device ID, look up the appropriate implementation-defined
  * platform ID and/or the target device which receives transactions on that
@@ -2116,17 +2146,19 @@ int of_find_last_cache_level(unsigned int cpu)
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_id(const struct device_node *np, u32 id,
-	       const char *map_name, const char *map_mask_name,
+	       const char *map_name, const char *cells_name,
+	       const char *map_mask_name,
 	       const struct device_node *filter_np, struct of_phandle_args *arg)
 {
 	u32 map_mask, masked_id;
-	int map_len;
+	int map_bytes, map_len, offset = 0;
+	bool bad_map = false;
 	const __be32 *map = NULL;
 
 	if (!np || !map_name || !arg)
 		return -EINVAL;
 
-	map = of_get_property(np, map_name, &map_len);
+	map = of_get_property(np, map_name, &map_bytes);
 	if (!map) {
 		if (filter_np)
 			return -ENODEV;
@@ -2136,11 +2168,9 @@ int of_map_id(const struct device_node *np, u32 id,
 		return 0;
 	}
 
-	if (!map_len || map_len % (4 * sizeof(*map))) {
-		pr_err("%pOF: Error: Bad %s length: %d\n", np,
-			map_name, map_len);
-		return -EINVAL;
-	}
+	if (map_bytes % sizeof(*map))
+		goto err_map_len;
+	map_len = map_bytes / sizeof(*map);
 
 	/* The default is to select all bits. */
 	map_mask = 0xffffffff;
@@ -2153,39 +2183,82 @@ int of_map_id(const struct device_node *np, u32 id,
 		of_property_read_u32(np, map_mask_name, &map_mask);
 
 	masked_id = map_mask & id;
-	for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4) {
+
+	while (offset < map_len) {
 		struct device_node *phandle_node;
-		u32 id_base = be32_to_cpup(map + 0);
-		u32 phandle = be32_to_cpup(map + 1);
-		u32 out_base = be32_to_cpup(map + 2);
-		u32 id_len = be32_to_cpup(map + 3);
+		u32 id_base, phandle, id_len, id_off, cells = 0;
+		const __be32 *out_base;
+
+		if (map_len - offset < 2)
+			goto err_map_len;
+
+		id_base = be32_to_cpup(map + offset);
 
 		if (id_base & ~map_mask) {
-			pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
-				np, map_name, map_name,
-				map_mask, id_base);
+			pr_err("%pOF: Invalid %s translation - %s (0x%x) ignores id-base (0x%x)\n",
+			       np, map_name, map_mask_name, map_mask, id_base);
 			return -EFAULT;
 		}
 
-		if (masked_id < id_base || masked_id >= id_base + id_len)
-			continue;
-
+		phandle = be32_to_cpup(map + offset + 1);
 		phandle_node = of_find_node_by_phandle(phandle);
 		if (!phandle_node)
 			return -ENODEV;
 
+		if (!bad_map && of_property_read_u32(phandle_node, cells_name, &cells)) {
+			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
+			of_node_put(phandle_node);
+			return -EINVAL;
+		}
+
+		if (map_len - offset < 3 + cells) {
+			of_node_put(phandle_node);
+			goto err_map_len;
+		}
+
+		if (offset == 0 && cells == 2) {
+			bad_map = of_check_bad_map(map, map_len);
+			if (bad_map) {
+				pr_warn_once("%pOF: %s mismatches target %s, assuming extra cell of 0\n",
+					     np, map_name, cells_name);
+				cells = 1;
+			}
+		}
+
+		out_base = map + offset + 2;
+		offset += 3 + cells;
+
+		id_len = be32_to_cpup(map + offset - 1);
+		if (id_len > 1 && cells > 1) {
+			/*
+			 * With 1 output cell we reasonably assume its value
+			 * has a linear relationship to the input; with more,
+			 * we'd need help from the provider to know what to do.
+			 */
+			pr_err("%pOF: Unsupported %s - cannot handle %d-ID range with %d-cell output specifier\n",
+			       np, map_name, id_len, cells);
+			of_node_put(phandle_node);
+			return -EINVAL;
+		}
+		id_off = masked_id - id_base;
+		if (masked_id < id_base || id_off >= id_len) {
+			of_node_put(phandle_node);
+			continue;
+		}
+
 		if (filter_np && filter_np != phandle_node) {
 			of_node_put(phandle_node);
 			continue;
 		}
 
 		arg->np = phandle_node;
-		arg->args[0] = masked_id - id_base + out_base;
-		arg->args_count = 1;
+		for (int i = 0; i < cells; i++)
+			arg->args[i] = id_off + be32_to_cpu(out_base[i]);
+		arg->args_count = cells;
 
 		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
-			np, map_name, map_mask, id_base, out_base,
-			id_len, id, masked_id - id_base + out_base);
+			np, map_name, map_mask, id_base, be32_to_cpup(out_base),
+			id_len, id, id_off + be32_to_cpup(out_base));
 		return 0;
 	}
 
@@ -2196,6 +2269,10 @@ int of_map_id(const struct device_node *np, u32 id,
 	arg->args[0] = id;
 	arg->args_count = 1;
 	return 0;
+
+err_map_len:
+	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(of_map_id);
 
@@ -2205,18 +2282,21 @@ EXPORT_SYMBOL_GPL(of_map_id);
  * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
  *      stream/device ID) used as the lookup key in the iommu-map table.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
- *	@arg->args[0] contains the translated ID. If a map entry was matched,
- *	@arg->np holds a reference to the target node that the caller must
- *	release with of_node_put().
+ *	@arg->args_count will be set to the number of output specifier cells
+ *	and @arg->args[0..args_count-1] will contain the translated output
+ *	specifier values. If a map entry was matched, @arg->np holds a
+ *	reference to the target node that the caller must release with
+ *	of_node_put().
  *
- * Convenience wrapper around of_map_id() using "iommu-map" and "iommu-map-mask".
+ * Convenience wrapper around of_map_id() using "iommu-map", "#iommu-cells",
+ * and "iommu-map-mask".
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_iommu_id(const struct device_node *np, u32 id,
 		    struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "iommu-map", "iommu-map-mask", NULL, arg);
+	return of_map_id(np, id, "iommu-map", "#iommu-cells", "iommu-map-mask", NULL, arg);
 }
 EXPORT_SYMBOL_GPL(of_map_iommu_id);
 
@@ -2229,17 +2309,20 @@ EXPORT_SYMBOL_GPL(of_map_iommu_id);
  *	to match any. If non-NULL, only map entries targeting this node will
  *	be matched.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
- *	@arg->args[0] contains the translated ID. If a map entry was matched,
- *	@arg->np holds a reference to the target node that the caller must
- *	release with of_node_put().
+ *	@arg->args_count will be set to the number of output specifier cells
+ *	and @arg->args[0..args_count-1] will contain the translated output
+ *	specifier values. If a map entry was matched, @arg->np holds a
+ *	reference to the target node that the caller must release with
+ *	of_node_put().
  *
- * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
+ * Convenience wrapper around of_map_id() using "msi-map", "#msi-cells",
+ * and "msi-map-mask".
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_msi_id(const struct device_node *np, u32 id,
 		  const struct device_node *filter_np, struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "msi-map", "msi-map-mask", filter_np, arg);
+	return of_map_id(np, id, "msi-map", "#msi-cells", "msi-map-mask", filter_np, arg);
 }
 EXPORT_SYMBOL_GPL(of_map_msi_id);
diff --git a/include/linux/of.h b/include/linux/of.h
index 8548cd9eb4f1..51ac8539f2c3 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -462,7 +462,8 @@ const char *of_prop_next_string(const struct property *prop, const char *cur);
 bool of_console_check(const struct device_node *dn, char *name, int index);
 
 int of_map_id(const struct device_node *np, u32 id,
-	       const char *map_name, const char *map_mask_name,
+	       const char *map_name, const char *cells_name,
+	       const char *map_mask_name,
 	       const struct device_node *filter_np, struct of_phandle_args *arg);
 
 int of_map_iommu_id(const struct device_node *np, u32 id,
@@ -934,7 +935,8 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 }
 
 static inline int of_map_id(const struct device_node *np, u32 id,
-			     const char *map_name, const char *map_mask_name,
+			     const char *map_name, const char *cells_name,
+			     const char *map_mask_name,
 			     const struct device_node *filter_np,
 			     struct of_phandle_args *arg)
 {

-- 
2.34.1

