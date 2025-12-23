Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246DC3491DE
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 15:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503598; cv=none; b=P5XHFbhpdm5EU0WffU7Ycxhutu3OfDLnFp/RIfHDzNdIH5ddONyV5tfaPl2jhYXpnaodt7sywjrU0R3iBtQq6CoWg2PKh4PlR7mkDSKa/PsHGRMse+sMPFhB0kFYuPXAhnYCTQ85YUlqAklG5deHgFV7O6I43WsUVF4llwoXGh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503598; c=relaxed/simple;
	bh=XwVq4TxKF1acPKLlxqcGO/YA7P0U9hG6xlmC0ItzMFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCyKL4iS8dQQyXn7VPwpzdKE5z4CeT6ScbHmZOwZDEKEVO9clc6MjG9dKEBKjPr+mZ5hqCrmzeHYQzejZIFjjCSo6p7CN97x/jJaY7nKHr/UGlIeW3QFkT38hTcCUvfmoknPo+79LxYkPUsriEV/AlUpboP5KV7IDTAwQx97Atc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JG9go6Cx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZUBFeGpA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JG9go6Cx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZUBFeGpA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFML2l2115407
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 15:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AVWCbXSNGZn
	bI5kX4fL1E4TNiUaaqdA7LKOxq95u69U=; b=JG9go6CxdVBzmdyocySrs1IVu75
	MFalkmKzAbPhZD3CL71qKaFpXwJ42uDfCBIb1jLBzCBTXgPV8h7PjlH3IJyKv2Gy
	2gXTIE8r8hJpghi7y/uJ1Mue4AFDbxNOn/diH7rvHfJ67JYAnyTYlOHufdtPetHb
	N6THtlIJXD1v/4H9gABVe2GtcHxSd7GOxCf1d6iW0je3Zv1QNFkVGyXaTvHBX3Un
	9qEdHcWx4Mu5NDRKEVxUGuBaAtAYOWjpyiG8djgcBxU0Ja/sNlriP2VLyqrXAoSw
	WrnnxKJx+AEMoqko8mBMEgenieSbLc8spxZsEoYeCKr8GQBRk0rIiUfw/KA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudk4jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 15:26:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f35f31000cso71815011cf.2
        for <imx@lists.linux.dev>; Tue, 23 Dec 2025 07:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503594; x=1767108394; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVWCbXSNGZnbI5kX4fL1E4TNiUaaqdA7LKOxq95u69U=;
        b=ZUBFeGpAzQn+cCdTHT6G6BSFbH/biumHixI85QYwKDjca7oHlLkNzZ+18oVY/9UfF/
         oct8fKG/SBpz12AhCtQmmpWyEXRJEiFlWPkTDUQFcxunLY/ohSq0qJGH/R7K9uk5aJ4W
         4ENdSTU+zQSqC2zK/UYjHLz0k+fD8PZRatXH9ITlO20zYgB6Iln182Qz2RXWnQVusjQ4
         TIjF+hFilKwyqh+TdEyV/upSDVIRfqgiApap8Dlhrbim+GtMeQTrHurj7nLh5WRM5Wjl
         LP42fKVfYxXG0dx0lRQY98vFPUd8ZeSRV97o0j2XNMyL2Wjix78rXCs1d0Dv7wwnPxBN
         XGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503594; x=1767108394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AVWCbXSNGZnbI5kX4fL1E4TNiUaaqdA7LKOxq95u69U=;
        b=eJ/c/LacY5cHWQEKKLwWOg6tsUgnursoJ9Vpa/pURuRw0U/Fz63wa/Mu0m+zJCu3TX
         kaRyvV1j2nLPyeSBQEFc44O/YoYbkab2MFHsjE2d1ShUqr2FsS8AjSanl3hjYj//FQD2
         PIf3RnjgRavJawcUeMIdpebbNZnWj2WuMp4w2sQpWggVL7GAIq0TYwp9dXgTcC87yopA
         +d8Eipf4lAliFI4kIDuzIKUhPfj9/y37w3GVEQynRVRkX0oTKzNVUaWUxDAY6BjIRghZ
         69u8UyJQSQ13lAZX+TZfQGWFCDKX9A1Ijiufi5lHZnlwwnPhpFlSb3OcH1ahTyboPSdl
         4NWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5srvTepVDGc1a4m03x5qU1Ut93YX9EEA8Jyct6hTmYxzSHbI8OE1tW6ib5DW2BsOHSFs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRxBfjWwyz53pS437VnkHVccF6r1ylXPwbdh/vDoGHwkXkZNDV
	Xlxakr1hY06/nc1THhNUCjwIpAfi5rJmy7oHm7aLel12tZFIHODNEtHLGItPIIN1lyzoL2hA9kI
	vx2+Q13NGIEdi5+TWCPjXZ7B4y0Srr7zd3pZJaFpyAjDQ5FlE/Xu6L5g=
X-Gm-Gg: AY/fxX5Y1+kDZ14SQMPkpJp6GXBJDs6WycGZE+yAELEfg/gc0u4B/BqRFqjD2Y2eP+O
	PcFuPeNAogEfa2YBd60oKd/Ku1/CySQ9j++Cg+Qiet8HtLDVo6wo5UzARMwQXulVQYNM/qettoA
	ftNtjNh8AeYFnZlD0IbKDIP+XkFatO4dyaFDw32NmHQ+dm5uFmWIcwZB52Lcv0bK5Bt7dhQC77I
	/3T4jAhjMcTxfVPAeEgnzuMwUe++gzUM1hBSVfT94HQwdPZPTsyqH58W1fazdwJ1UOcRD3CmFxK
	KELCps1KA/rHh8pHtn/2pXOC/gzrHll2uTCLQrgHCxTzHGXukwjdDbhyYkf9zJL494v4AIE4r67
	QUFpUha+8M3oxZMz9kdpCvcBmwmD5fmWiLjBWswG2TrSRVvfG4byjSJxHNYEhhiPYA7w=
X-Received: by 2002:ac8:5795:0:b0:4f0:237a:22fc with SMTP id d75a77b69052e-4f4abdd23aemr203751961cf.82.1766503593728;
        Tue, 23 Dec 2025 07:26:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuQ/PAg4NUgIsL1+chudwzo1r3gRcBsobjBG6N1uZUXGKhLDInYGKu3n8ROW2JAtYWrXFSMg==
X-Received: by 2002:ac8:5795:0:b0:4f0:237a:22fc with SMTP id d75a77b69052e-4f4abdd23aemr203751501cf.82.1766503593151;
        Tue, 23 Dec 2025 07:26:33 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1454905266b.60.2025.12.23.07.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:26:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux@ew.tq-group.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: freescale: Use lowercase hex
Date: Tue, 23 Dec 2025 16:26:27 +0100
Message-ID: <20251223152624.155845-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223152624.155845-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152624.155845-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=21879; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=XwVq4TxKF1acPKLlxqcGO/YA7P0U9hG6xlmC0ItzMFA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrSiErLwNwVyInwbHfNXa/GgJbdwtERIy922O
 6VpUMCMIx+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0ogAKCRDBN2bmhouD
 1yD1D/9GTDTWKh/rKvwtb8Q9J6gIU8RQa1Zu4Gz/uYtME747NFAPYqgLhsw0QKhoN7xc/g+iyjC
 CuG2qtesZN0FiRL/ZzQAmSaB9L57jmcI6VioGduTMC2N24AlDS6hhszv5zKwayNMYG9IT6wq/qo
 e+IPoHTT/yXwICQSXsaPk648jtbzP6QxDqQAfF0bNut3IGjsOEXyaxTdp8curP34NYf1avacIcE
 EkS31VSht447rsXZodJIApUUuQUje1wtXBJcWWkhXoHdhypYqWD3VfQblsW0E5PduoRoRWhrgow
 p45+QtLc3J/Qo3zMnuh3LaeqcwBCCcbu/7sW/YL19boue6j4l8L+K0o9ISQdqgo+2S2Ht47B1zC
 2KSeEfXOPTfmE347hlzYeJHPbmqhfnmxNAKNps0fP8OtpBZ8pWi5rkr31IVa3VgdpzPkFyYRgPB
 HdUYgPKECh0k93NQTMk+vmH1m9sAkknZgdakpbGyobfUyqHZNYXpBToLhY7IeQI/K0+4d0KKHQc
 qLiWIebt/n1jmDcv3XKJzaYw9W1+IRfIbyM84Nfp1fHqMPmvFW3NSLR3f198bNEnF8KRDDwZa/e
 2spU66ANekvGwSGQ/ZQKuQXHcprCq0ajk6DsHTMHCSVyKzOb689zDFI+EfoWKWuG9+46febAuP6 BpNfGMNtCQkjrRA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694ab4ab cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UQ5DvL-buY1nlY1IEJUA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: yjvRZcdU-jDc9xu2ptpSaRDhfIJnWBof
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX0ZWWTptGssN3
 2/FzKxQLiREcPtykN5fiMA9P9CEKHdWEjv1R7bU4X7rgpxCU7vVwn02ADV3Scu7/m5CTuUyL7xC
 sDoq4K3oEwLtim2HZWLg0Rco+a1bF+bSVJT95J4gRfp7mYyTRF8ItQoqYuxPKk0dxwrQltzHKIP
 kVw19f1KE5QYlQLU7NmoAhBDCKOaO2KeQnryxMFctsXfyCSf0v5cWo/v+i9C45lmN3FbJuHAHU2
 Jo7l1TqOcIwoAN/IcovlLLSGxoe5pu7zNtg/97gszxFK40aXIB+r+zu3b4SinCpuH9oblEsqiQ8
 6LNzf2BPvUVJBIO/5pGBkiN/yTCC3sfv/qjz68fpSleItyNF10j1/1wPLvrmxPJJ2gO5MGnRHlB
 LmgoqkrKmBcsrEcO8yJQbvAtPbiNdxK71UZWYCqa0dZMYsIbQlnC4R70hedCkO8z5BO4WDi1TNv
 s0AbocWEIng3k9ynumw==
X-Proofpoint-ORIG-GUID: yjvRZcdU-jDc9xu2ptpSaRDhfIJnWBof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230127

The DTS code coding style expects lowercase hex for values and unit
addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/freescale/fsl-ls1088a-ten64.dts  |  4 +--
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |  2 +-
 .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi |  2 +-
 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 32 +++++++++----------
 .../dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts | 16 +++++-----
 .../dts/freescale/imx8mp-libra-rdk-fpsc.dts   |  2 +-
 .../freescale/imx8mp-phyboard-pollux-rdk.dts  |  2 +-
 .../dts/freescale/imx8mp-toradex-smarc.dtsi   |  6 ++--
 .../imx8mp-tqma8mpql-mba8mp-ras314.dts        |  2 +-
 .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   |  2 +-
 .../dts/freescale/imx8mq-librem5-devkit.dts   |  2 +-
 .../boot/dts/freescale/imx8mq-librem5.dtsi    |  6 ++--
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 12 +++----
 arch/arm64/boot/dts/freescale/imx8qm.dtsi     |  4 +--
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  6 ++--
 .../boot/dts/freescale/imx8x-colibri.dtsi     |  2 +-
 .../boot/dts/freescale/imx95-15x15-evk.dts    |  2 +-
 .../dts/freescale/imx95-toradex-smarc.dtsi    |  2 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  4 +--
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 20 ++++++------
 .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 20 ++++++------
 21 files changed, 75 insertions(+), 75 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
index 71765ec91745..f51508952d51 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
@@ -392,13 +392,13 @@ partition@800000 {
 			/* ubia (first OpenWrt) - a/b names to prevent confusion with ubi0/1/etc. */
 			partition@2800000 {
 				label = "ubia";
-				reg = <0x2800000 0x6C00000>;
+				reg = <0x2800000 0x6c00000>;
 			};
 
 			/* ubib (second OpenWrt) */
 			partition@9400000 {
 				label = "ubib";
-				reg = <0x9400000 0x6C00000>;
+				reg = <0x9400000 0x6c00000>;
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index b2f6cd237be0..99016768b73f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -684,7 +684,7 @@ smmu: iommu@5000000 {
 			compatible = "arm,mmu-500";
 			reg = <0 0x5000000 0 0x800000>;
 			#iommu-cells = <1>;
-			stream-match-mask = <0x7C00>;
+			stream-match-mask = <0x7c00>;
 			dma-coherent;
 			#global-interrupts = <12>;
 				     // global secure fault
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 9421fdd7e30e..6073e426774a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -881,7 +881,7 @@ smmu: iommu@5000000 {
 			reg = <0 0x5000000 0 0x800000>;
 			#global-interrupts = <12>;
 			#iommu-cells = <1>;
-			stream-match-mask = <0x7C00>;
+			stream-match-mask = <0x7c00>;
 			dma-coherent;
 			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>, /* global secure fault */
 				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>, /* combined secure interrupt */
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index d899c0355e51..853b01452813 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -35,7 +35,7 @@ cpu0: cpu@0 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster0_l2>;
@@ -52,7 +52,7 @@ cpu1: cpu@1 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster0_l2>;
@@ -69,7 +69,7 @@ cpu100: cpu@100 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster1_l2>;
@@ -86,7 +86,7 @@ cpu101: cpu@101 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster1_l2>;
@@ -103,7 +103,7 @@ cpu200: cpu@200 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster2_l2>;
@@ -120,7 +120,7 @@ cpu201: cpu@201 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster2_l2>;
@@ -137,7 +137,7 @@ cpu300: cpu@300 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster3_l2>;
@@ -154,7 +154,7 @@ cpu301: cpu@301 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster3_l2>;
@@ -171,7 +171,7 @@ cpu400: cpu@400 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster4_l2>;
@@ -188,7 +188,7 @@ cpu401: cpu@401 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster4_l2>;
@@ -205,7 +205,7 @@ cpu500: cpu@500 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster5_l2>;
@@ -222,7 +222,7 @@ cpu501: cpu@501 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster5_l2>;
@@ -239,7 +239,7 @@ cpu600: cpu@600 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster6_l2>;
@@ -256,7 +256,7 @@ cpu601: cpu@601 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster6_l2>;
@@ -273,7 +273,7 @@ cpu700: cpu@700 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster7_l2>;
@@ -290,7 +290,7 @@ cpu701: cpu@701 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <192>;
 			next-level-cache = <&cluster7_l2>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
index d7f7f9aafb7d..54b6f04645f4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
@@ -143,23 +143,23 @@ pinctrl_gpioled: gpioledgrp {
 	};
 
 	pinctrl_i2c2: i2c2grp {
-		fsl,pins = <MX8MN_IOMUXC_I2C2_SCL_I2C2_SCL		0x400001C4>,
-			   <MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001C4>;
+		fsl,pins = <MX8MN_IOMUXC_I2C2_SCL_I2C2_SCL		0x400001c4>,
+			   <MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c4>;
 	};
 
 	pinctrl_i2c2_gpio: i2c2gpiogrp {
-		fsl,pins = <MX8MN_IOMUXC_I2C2_SCL_GPIO5_IO16		0x400001C4>,
-			   <MX8MN_IOMUXC_I2C2_SDA_GPIO5_IO17		0x400001C4>;
+		fsl,pins = <MX8MN_IOMUXC_I2C2_SCL_GPIO5_IO16		0x400001c4>,
+			   <MX8MN_IOMUXC_I2C2_SDA_GPIO5_IO17		0x400001c4>;
 	};
 
 	pinctrl_i2c3: i2c3grp {
-		fsl,pins = <MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001C4>,
-			   <MX8MN_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001C4>;
+		fsl,pins = <MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c4>,
+			   <MX8MN_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c4>;
 	};
 
 	pinctrl_i2c3_gpio: i2c3gpiogrp {
-		fsl,pins = <MX8MN_IOMUXC_I2C3_SCL_GPIO5_IO18		0x400001C4>,
-			   <MX8MN_IOMUXC_I2C3_SDA_GPIO5_IO19		0x400001C4>;
+		fsl,pins = <MX8MN_IOMUXC_I2C3_SCL_GPIO5_IO18		0x400001c4>,
+			   <MX8MN_IOMUXC_I2C3_SDA_GPIO5_IO19		0x400001c4>;
 	};
 
 	pinctrl_pwm3: pwm3grp {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
index 6f3a7b863dca..3f5734abf6f1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
@@ -226,7 +226,7 @@ MX8MP_IOMUXC_UART1_TXD__GPIO5_IO23	0x12
 	};
 	pinctrl_rtc: rtcgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_UART2_TXD__GPIO5_IO25	0x1C0
+			MX8MP_IOMUXC_UART2_TXD__GPIO5_IO25	0x1c0
 		>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 9687b4ded8f4..ed29e3b88415 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -470,7 +470,7 @@ MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40
 
 	pinctrl_rtc: rtcgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19	0x1C0
+			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19	0x1c0
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index bebe19eb360f..0348da385f23 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -1044,7 +1044,7 @@ pinctrl_lvds_dsi_sel: lvdsdsiselgrp {
 	};
 
 	pinctrl_mcu_int: mcuintgrp {
-		fsl,pins = <MX8MP_IOMUXC_NAND_DATA02__GPIO3_IO08	0x1C0>; /* MCU_INT# */
+		fsl,pins = <MX8MP_IOMUXC_NAND_DATA02__GPIO3_IO08	0x1c0>; /* MCU_INT# */
 	};
 
 	/* SMARC LCD1_BKLT_PWM */
@@ -1096,12 +1096,12 @@ pinctrl_sai3: sai3grp {
 
 	/* SMARC SLEEP# */
 	pinctrl_sleep: sleepgrp {
-		fsl,pins = <MX8MP_IOMUXC_NAND_CE0_B__GPIO3_IO01	0x1C0>; /* SMARC S149 - SLEEP# */
+		fsl,pins = <MX8MP_IOMUXC_NAND_CE0_B__GPIO3_IO01	0x1c0>; /* SMARC S149 - SLEEP# */
 	};
 
 	/* SMARC SMB_ALERT# */
 	pinctrl_smb_alert: smbalertgrp {
-		fsl,pins = <MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16	0x1C0>; /* SMARC P1 - SMB_ALERT# */
+		fsl,pins = <MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16	0x1c0>; /* SMARC P1 - SMB_ALERT# */
 	};
 
 	/* TPM_CS# */
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index f7346b3d35fe..d5881ee0fe78 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -134,7 +134,7 @@ linux,cma {
 			compatible = "shared-dma-pool";
 			reusable;
 			size = <0 0x38000000>;
-			alloc-ranges = <0 0x40000000 0 0xB0000000>;
+			alloc-ranges = <0 0x40000000 0 0xb0000000>;
 			linux,cma-default;
 		};
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 59642a8a2c44..ae1f1ec77c14 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -227,7 +227,7 @@ linux,cma {
 			compatible = "shared-dma-pool";
 			reusable;
 			size = <0 0x38000000>;
-			alloc-ranges = <0 0x40000000 0 0xB0000000>;
+			alloc-ranges = <0 0x40000000 0 0xb0000000>;
 			linux,cma-default;
 		};
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
index d9f203c79519..aadaeef928bd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
@@ -633,7 +633,7 @@ MX8MQ_IOMUXC_SPDIF_RX_GPIO5_IO4		0xc6   /* nHAPTIC */
 
 	pinctrl_hpdet: hpdetgrp {
 		fsl,pins = <
-			MX8MQ_IOMUXC_SAI5_RXC_GPIO3_IO20	0xC0   /* HP_DET */
+			MX8MQ_IOMUXC_SAI5_RXC_GPIO3_IO20	0xc0   /* HP_DET */
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 9e0e2d7271ef..2975e9451661 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -536,9 +536,9 @@ MX8MQ_IOMUXC_I2C4_SDA_I2C4_SDA		0x40000026
 	pinctrl_keys: keysgrp {
 		fsl,pins = <
 			/* VOL- */
-			MX8MQ_IOMUXC_ENET_MDIO_GPIO1_IO17	0x01C0
+			MX8MQ_IOMUXC_ENET_MDIO_GPIO1_IO17	0x01c0
 			/* VOL+ */
-			MX8MQ_IOMUXC_ENET_MDC_GPIO1_IO16	0x01C0
+			MX8MQ_IOMUXC_ENET_MDC_GPIO1_IO16	0x01c0
 		>;
 	};
 
@@ -620,7 +620,7 @@ MX8MQ_IOMUXC_SAI1_TXD5_SAI6_TX_DATA0	0xd6
 	pinctrl_tcpc: tcpcgrp {
 		fsl,pins = <
 			/* TCPC_INT */
-			MX8MQ_IOMUXC_GPIO1_IO10_GPIO1_IO10	0x01C0
+			MX8MQ_IOMUXC_GPIO1_IO10_GPIO1_IO10	0x01c0
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 779d9f78fb81..7d4574c6de1d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -1214,17 +1214,17 @@ IMX8QM_LVDS1_I2C1_SDA_LVDS1_I2C1_SDA	0xc600004c
 
 	pinctrl_mipi_csi0: mipi-csi0grp {
 		fsl,pins = <
-			IMX8QM_MIPI_CSI0_GPIO0_00_LSIO_GPIO1_IO27		0xC0000041
-			IMX8QM_MIPI_CSI0_GPIO0_01_LSIO_GPIO1_IO28		0xC0000041
-			IMX8QM_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xC0000041
+			IMX8QM_MIPI_CSI0_GPIO0_00_LSIO_GPIO1_IO27		0xc0000041
+			IMX8QM_MIPI_CSI0_GPIO0_01_LSIO_GPIO1_IO28		0xc0000041
+			IMX8QM_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xc0000041
 		>;
 	};
 
 	pinctrl_mipi_csi1: mipi-csi1grp {
 		fsl,pins = <
-			IMX8QM_MIPI_CSI1_GPIO0_00_LSIO_GPIO1_IO30		0xC0000041
-			IMX8QM_MIPI_CSI1_GPIO0_01_LSIO_GPIO1_IO31		0xC0000041
-			IMX8QM_MIPI_CSI1_MCLK_OUT_MIPI_CSI1_ACM_MCLK_OUT	0xC0000041
+			IMX8QM_MIPI_CSI1_GPIO0_00_LSIO_GPIO1_IO30		0xc0000041
+			IMX8QM_MIPI_CSI1_GPIO0_01_LSIO_GPIO1_IO31		0xc0000041
+			IMX8QM_MIPI_CSI1_MCLK_OUT_MIPI_CSI1_ACM_MCLK_OUT	0xc0000041
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index cb66853b1cd3..c0a869c88098 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -137,7 +137,7 @@ A72_0: cpu@100 {
 			reg = <0x0 0x100>;
 			clocks = <&clk IMX_SC_R_A72 IMX_SC_PM_CLK_CPU>;
 			enable-method = "psci";
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
 			d-cache-size = <0x8000>;
@@ -241,7 +241,7 @@ opp-1596000000 {
 	gic: interrupt-controller@51a00000 {
 		compatible = "arm,gic-v3";
 		reg = <0x0 0x51a00000 0 0x10000>, /* GIC Dist */
-		      <0x0 0x51b00000 0 0xC0000>, /* GICR */
+		      <0x0 0x51b00000 0 0xc0000>, /* GICR */
 		      <0x0 0x52000000 0 0x2000>,  /* GICC */
 		      <0x0 0x52010000 0 0x1000>,  /* GICH */
 		      <0x0 0x52020000 0 0x20000>; /* GICV */
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 523f48896b6b..90b02fa3c949 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -1030,9 +1030,9 @@ IMX8QXP_FLEXCAN2_RX_ADMA_UART3_RX			0x06000020
 
 	pinctrl_mipi_csi0: mipi-csi0grp {
 		fsl,pins = <
-			IMX8QXP_MIPI_CSI0_GPIO0_01_LSIO_GPIO3_IO07		0xC0000041
-			IMX8QXP_MIPI_CSI0_GPIO0_00_LSIO_GPIO3_IO08		0xC0000041
-			IMX8QXP_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xC0000041
+			IMX8QXP_MIPI_CSI0_GPIO0_01_LSIO_GPIO3_IO07		0xc0000041
+			IMX8QXP_MIPI_CSI0_GPIO0_00_LSIO_GPIO3_IO08		0xc0000041
+			IMX8QXP_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xc0000041
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index 8e9e841cc828..014808774b0e 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -623,7 +623,7 @@ pinctrl_csi_ctl: csictlgrp {
 	};
 
 	pinctrl_csi_mclk: csimclkgrp {
-		fsl,pins = <IMX8QXP_CSI_MCLK_CI_PI_MCLK				0xC0000041>;	/* SODIMM  75 / X3-12 */
+		fsl,pins = <IMX8QXP_CSI_MCLK_CI_PI_MCLK				0xc0000041>;	/* SODIMM  75 / X3-12 */
 	};
 
 	pinctrl_ext_io0: extio0grp {
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index ff720c139a7e..b12687d87920 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -179,7 +179,7 @@ reserved-memory {
 
 		linux_cma: linux,cma {
 			compatible = "shared-dma-pool";
-			alloc-ranges = <0 0x80000000 0 0x7F000000>;
+			alloc-ranges = <0 0x80000000 0 0x7f000000>;
 			reusable;
 			size = <0 0x3c000000>;
 			linux,cma-default;
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index afbdadcb3686..a0752f21edf9 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -153,7 +153,7 @@ linux_cma: linux,cma {
 			compatible = "shared-dma-pool";
 			reusable;
 			size = <0 0x3c000000>;
-			alloc-ranges = <0 0x80000000 0 0x7F000000>;
+			alloc-ranges = <0 0x80000000 0 0x7f000000>;
 			linux,cma-default;
 		};
 	};
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index eff7673e7f34..e314f3c7d61d 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -641,9 +641,9 @@ swt6: watchdog@40208000 {
 			status = "disabled";
 		};
 
-		swt7: watchdog@4020C000 {
+		swt7: watchdog@4020c000 {
 			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
-			reg = <0x4020C000 0x1000>;
+			reg = <0x4020c000 0x1000>;
 			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
 			clock-names = "counter", "module", "register";
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
index f1969cdcef19..803ff4531077 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
@@ -197,16 +197,16 @@ dspi1-grp2 {
 		};
 
 		dspi1-grp3 {
-			pinmux = <0x5F0>;
+			pinmux = <0x5f0>;
 			input-enable;
 			slew-rate = <150>;
 			bias-pull-up;
 		};
 
 		dspi1-grp4 {
-			pinmux = <0x3D92>,
-				 <0x3DA2>,
-				 <0x3DB2>;
+			pinmux = <0x3d92>,
+				 <0x3da2>,
+				 <0x3db2>;
 		};
 	};
 
@@ -219,26 +219,26 @@ dspi5-grp0 {
 		};
 
 		dspi5-grp1 {
-			pinmux = <0xA0>;
+			pinmux = <0xa0>;
 			input-enable;
 			slew-rate = <150>;
 			bias-pull-up;
 		};
 
 		dspi5-grp2 {
-			pinmux = <0x3ED2>,
-				 <0x3EE2>,
-				 <0x3EF2>;
+			pinmux = <0x3ed2>,
+				 <0x3ee2>,
+				 <0x3ef2>;
 		};
 
 		dspi5-grp3 {
-			pinmux = <0xB3>;
+			pinmux = <0xb3>;
 			output-enable;
 			slew-rate = <150>;
 		};
 
 		dspi5-grp4 {
-			pinmux = <0xC3>;
+			pinmux = <0xc3>;
 			output-enable;
 			input-enable;
 			slew-rate = <150>;
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
index 3bc3335c9248..979868f6d2c5 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
@@ -151,16 +151,16 @@ dspi1-grp2 {
 		};
 
 		dspi1-grp3 {
-			pinmux = <0x5F0>;
+			pinmux = <0x5f0>;
 			input-enable;
 			slew-rate = <150>;
 			bias-pull-up;
 		};
 
 		dspi1-grp4 {
-			pinmux = <0x3D92>,
-				 <0x3DA2>,
-				 <0x3DB2>;
+			pinmux = <0x3d92>,
+				 <0x3da2>,
+				 <0x3db2>;
 		};
 	};
 
@@ -173,26 +173,26 @@ dspi5-grp0 {
 		};
 
 		dspi5-grp1 {
-			pinmux = <0xA0>;
+			pinmux = <0xa0>;
 			input-enable;
 			slew-rate = <150>;
 			bias-pull-up;
 		};
 
 		dspi5-grp2 {
-			pinmux = <0x3ED2>,
-				 <0x3EE2>,
-				 <0x3EF2>;
+			pinmux = <0x3ed2>,
+				 <0x3ee2>,
+				 <0x3ef2>;
 		};
 
 		dspi5-grp3 {
-			pinmux = <0xB3>;
+			pinmux = <0xb3>;
 			output-enable;
 			slew-rate = <150>;
 		};
 
 		dspi5-grp4 {
-			pinmux = <0xC3>;
+			pinmux = <0xc3>;
 			output-enable;
 			input-enable;
 			slew-rate = <150>;
-- 
2.51.0

