Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C40218D636
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 06:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691665; cv=none; b=BSLPeb3TqE45mHzoI9iW1QJrWL9qZfMY9SP5a2nkVtfCuETZ+3IKkDPfYqbOzSZlRDR4nHgHgQWuWwomu5Su2KkPxkRg7Iie+1H1rrakxsReUY/HfTwrPJ2gn1BfkHaEDNMvS/TYn1ZFrq59nJ97tNT3Gh5IPj+NjPp8bSrd38s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691665; c=relaxed/simple;
	bh=+S/OPWfD8jiRnySHXDwKPl0Gx38XUkXnA2tMQyqcytY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ODngwmpW1cKfFTOlaUvxhi6vnMqSboPagrFy+a1YLBPNyX6DaMvwPRplIlSpos2ifcqKTnT9fPXUNdJmh67TukpxPNVsOoBk3qLdtKkGnWTZQ/Z5k8wkeE9cAXZcF5rnIyDAzE6Zr/ZPizaKBYK3jB4h0b5IGX31iKnkIBi9Wug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ju9HgQ8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hhITI5dp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ju9HgQ8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hhITI5dp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BgQM021019
	for <imx@lists.linux.dev>; Thu, 5 Mar 2026 06:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgaCGe2HP5UpbVXKB+EsAI8njddCU+iXqu2dkviOtjA=; b=ju9HgQ8QDLzph2X2
	xcDGeWw8SDOnOkvNNbt49XN4ZK+XhDud5SLcq0Ghl1tvktnW2BjVxoexEvKd3IQg
	QDZZ8u0G2DkHpJ5Uck7sp2jum/GBWLKHCaigUwZ003HZm1LismPGqN1kyiGdphzd
	cQxtKl3qS39B+ozKyzA+57WMI4NcvDONPwoguFukPRUOEHrsuBaC8BHxGSXaOWY+
	E+Y3H/bDoKGtm/uPPpMmUw9NIox+WUwghBOxxcLzwOoSPeZeuQFD5nN2daV3jl6q
	nM8T2ttith7sadvyGNney6CIhS3wwj2SoMler+1/clVjqTX8YwYWXqEXmnlGHfxP
	G41tfQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpupthfee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 05 Mar 2026 06:21:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358f058973fso7324682a91.1
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 22:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691663; x=1773296463; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgaCGe2HP5UpbVXKB+EsAI8njddCU+iXqu2dkviOtjA=;
        b=hhITI5dpUGwe8lTmG4P1z4l3YlI6aAK7ItQtZegzQPQsL9YVaJ3GQ0BVJdksqqd9in
         TXNwRGijOfljCwyWiCbAspn+h+ODljSEwELU41PxzFeUN2O5WQe5lsO9gQwmnmC9U8TA
         uzCuYp5aYidpUMvfCqxsS5Og/21SJ9k6aXPE+bYVJo0Jmpjansz2YFiK5HRhc/0otN11
         PRo7YSGMp6vORUUf064iHyj5XZXIFJ4pn4I/4vADva0nfcJx0l3P4F8JcEPDbt1c4jG9
         RybuNlyI9J2AWyWGbYmNsWx9yopqQEsbGgKs+NflowNKIRtZEuYS0Nl1AKTWl0yvIj+z
         6+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691663; x=1773296463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rgaCGe2HP5UpbVXKB+EsAI8njddCU+iXqu2dkviOtjA=;
        b=vMk6WBHL0d2YLLRnbquQ3XtQQLsl1QF6JnY0SLAz5vBxxRBj8lUf92ygedS4AhcKTs
         cRXfY9PrTpVWx5DZvbBd1aySeWIHWBR0uxkRjISLHDYXlIr/d5mVbwKfUuD8kK+OFZ6U
         p6rv298mfTSI7IVCrFL2NixpmPJtha1IqiXL1pyULZPkiyjHEey8q5+j5QqyQstKKgF2
         n2CSGJiesR/lTigBqHpzLIZUl902IjIxUf6QM4IFyRdHjFyRPTjn99MKWKqJEbzvK7q6
         CZE2l9uxebGzQyTYESRZOpM8/floI8liXLEJOntcAtOQYgojSUnDY2lcuNSkyWsuq6Wi
         HlfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNPszwgIc7Upl8rp/fTE9lw8mGxzUK2L0bfKezSSO7GyBEH9g9fTIa5AawT9tCoB9LMSk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyikBZUGgnQquE+Ro+8n/+FFqUjbE3deE/E+O8ZAXHLpvc/w+Ym
	ePQHnTytjJJGMkxxiyj6sEVjTgbrSlY2hj0GuHXDHIm5gZgQ0AkxMTg/tisaG6zT/DVMOtrfQ55
	/mtU9LAjyqEAKC4U49eXBELWDKnhTClP4ABoVVyIn/1W+8VduIhGoEK8=
X-Gm-Gg: ATEYQzzTblG9BPaDm8K6cjGAJetocQQbegu/vpkVLG/ujXH76E6YR+dfkIN1UOilBrN
	Gak4EarOudTFK87tOeDU3P0gS7SgIPIodglEOUvSHeKUMW/hHXV6zGLtteyOZozvz7UYZPKT/oW
	h3kwmTsjb12kCAzYZIakfhbZkK2+SG8FpB/v09RmDv5DKgU7NHyH3CXE2/Q/zGppxRC57UzPDYu
	LACBo8L6rHqXGNgUi7Q2F5iYNhAd+L6fC1iOsw5W/zFosYo5b9FfL7avohAdmgoz/FaA3dfApBU
	0x8qrv+sBBPI9QMzTQmOogiLapARunRZwEHzMI8TcC4mI7IvLU0GY2Dw9jPeddYOU+HLdML2m2J
	kOoJMwpnXhYPhAXOuPeCPKBcKi9c4TygpHCsh2KFINt2ey/w=
X-Received: by 2002:a17:90b:5386:b0:354:bfb7:db13 with SMTP id 98e67ed59e1d1-359a6a922b5mr4188016a91.35.1772691663116;
        Wed, 04 Mar 2026 22:21:03 -0800 (PST)
X-Received: by 2002:a17:90b:5386:b0:354:bfb7:db13 with SMTP id 98e67ed59e1d1-359a6a922b5mr4187982a91.35.1772691662515;
        Wed, 04 Mar 2026 22:21:02 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d38ab8sm843378a91.1.2026.03.04.22.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:21:02 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 11:50:36 +0530
Subject: [PATCH v2 1/2] PCI: API changes for multi-port controller support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-dt-parser-v2-1-85836db8dc06@oss.qualcomm.com>
References: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
In-Reply-To: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Chuanhua Lei <lchuanhua@maxlinear.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Pratyush Anand <pratyush.anand@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772691640; l=3103;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=+S/OPWfD8jiRnySHXDwKPl0Gx38XUkXnA2tMQyqcytY=;
 b=TK72jjuJyknXwVLrSUwewEGuy6eruyMEMLoyVD7ZdXByX5WQ08ffPNtXIK0+Zxd2Jj9MJeA9E
 OHWFPph2BbeAOAPQu90/A9/51gkVzesqs0Q6tFz6anwYgEZlA0RRnh3
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NyBTYWx0ZWRfX5WlCZDdur8tz
 3eDcl2PkmdPcxhPkhlu4biKgcAKmmvQIhFDbOkAda6SyC7Z2mo0B6gDLFX8pVx1jlKjCZz7Tr6z
 V9uWgsgkbE5ee3K+YYQz72d8BKgyyTgPXj/pR6MkHfHwhJD/fNr6ei9dvEgGuD5dK35WYezPPHF
 FWtZs7zkhI+JN0cGQmHGgUEODDL87CytbPdPnkFtUL+DMYs+WEK8++1ERFUQ26jbouO65WnIdI0
 wZZfPoz2gOvKKFxar3p/d4rdCQb4Z/PIsGVEB124AvMEoIK8QHyKxRrX/Vsg1Cr4ZZ6ekXNQl66
 oYy+xOIjzNwlmlZg2CAEbijzDYa+HV1up3iS+d0imN/YQHOVZYBcNFW592aShcjx+UKuDymEj2V
 oeiUKL6PenVCjTyx4WRLIq7cwJN8E7nbofWg/Fhm+si6752rP8APjPwi6p+ugDtIyB/K+IBiAaF
 /GoDTfwGzwStuyBwXsw==
X-Proofpoint-ORIG-GUID: DUZ59im8AZiaSjzD2voGTegaMNtGftzl
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a920cf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ujblt7VnwxmsJrSXvRcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: DUZ59im8AZiaSjzD2voGTegaMNtGftzl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050047

For multi-port controllers, equalization preset properties should be
specified in individual Root Port nodes rather than the controller node,
allowing each port to have its own configuration.

Change of_pci_get_equalization_presets() to accept a device_node pointer.
This allows parsing equalization presets from any device tree node,
which is needed for multi-port PCIe controllers.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/pci/of.c  | 6 ++++--
 drivers/pci/pci.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 3579265f119845637e163d9051437c89662762f8..d09eff40b523c920c9ca3eaa64f784765b3c5bf8 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -971,6 +971,7 @@ EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
  * of_pci_get_equalization_presets - Parses the "eq-presets-Ngts" property.
  *
  * @dev: Device containing the properties.
+ * @node: Device tree node containing the properties.
  * @presets: Pointer to store the parsed data.
  * @num_lanes: Maximum number of lanes supported.
  *
@@ -981,6 +982,7 @@ EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
  * errno otherwise.
  */
 int of_pci_get_equalization_presets(struct device *dev,
+				    struct device_node *node,
 				    struct pci_eq_presets *presets,
 				    int num_lanes)
 {
@@ -988,7 +990,7 @@ int of_pci_get_equalization_presets(struct device *dev,
 	int ret;
 
 	presets->eq_presets_8gts[0] = PCI_EQ_RESV;
-	ret = of_property_read_u16_array(dev->of_node, "eq-presets-8gts",
+	ret = of_property_read_u16_array(node, "eq-presets-8gts",
 					 presets->eq_presets_8gts, num_lanes);
 	if (ret && ret != -EINVAL) {
 		dev_err(dev, "Error reading eq-presets-8gts: %d\n", ret);
@@ -998,7 +1000,7 @@ int of_pci_get_equalization_presets(struct device *dev,
 	for (int i = 0; i < EQ_PRESET_TYPE_MAX - 1; i++) {
 		presets->eq_presets_Ngts[i][0] = PCI_EQ_RESV;
 		snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << (i + 1));
-		ret = of_property_read_u8_array(dev->of_node, name,
+		ret = of_property_read_u8_array(node, name,
 						presets->eq_presets_Ngts[i],
 						num_lanes);
 		if (ret && ret != -EINVAL) {
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 34f65d69662e9f61f0c489ec58de2ce17d21c0c6..72fa6db95b8a75f6e69b8019d1eb2262b6a46c13 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -965,6 +965,7 @@ void pci_release_bus_of_node(struct pci_bus *bus);
 int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
 bool of_pci_supply_present(struct device_node *np);
 int of_pci_get_equalization_presets(struct device *dev,
+				    struct device_node *node,
 				    struct pci_eq_presets *presets,
 				    int num_lanes);
 #else
@@ -1013,6 +1014,7 @@ static inline bool of_pci_supply_present(struct device_node *np)
 }
 
 static inline int of_pci_get_equalization_presets(struct device *dev,
+						  struct device_node *node,
 						  struct pci_eq_presets *presets,
 						  int num_lanes)
 {

-- 
2.34.1

