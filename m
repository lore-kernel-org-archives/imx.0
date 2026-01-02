Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF94320CD9
	for <imx@lists.linux.dev>; Fri,  2 Jan 2026 12:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358249; cv=none; b=L8j0nBlotmXaQphFSSOJs73iHC7YKbSbeiImT+OWg5+lYGGwcv4mjN0sMwQH9BNdwaCkuggqj3qDe3ekfnU6R0j6315VrkXCjKfNatyoUGN2/q6eEDkCj8OgTicBp8UpWGZpTNQlbX6khtRVsTJ53uvYuxuaGlvEWbHOMyc4C3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358249; c=relaxed/simple;
	bh=VqwBxy8XYcU5QNpyDWii4kc8lsFQn+uB7jr4u0TFrb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I1RAJjj8+2d4ep1KDiku30p5YZr6/fKooobHSgZaMaKCMoM+FZAV6Voa6IniowIGohX0Gh10i5Y0CrH4H1unmzSC7WCMr9prpC9RogIpvi28ePzcof7Kzfl5TEzlf/yNdvVsMKAPNDTNkOUNYbraVIowXTZG/qr+x3g3r7cdPaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+FcXJaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0dlNKKa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i+FcXJaR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0dlNKKa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VwUM2310157
	for <imx@lists.linux.dev>; Fri, 2 Jan 2026 12:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eNQ3dB0qjMdF3sPcFxLBfd7x75qLiik9Ihq
	QvOvA0YY=; b=i+FcXJaRoiSiRNNGV86Khuqm1BEf9vijAMGsTzZh9iW+xEzsWbO
	s9JCY4QxCOA4Vkowmt/cFMUkV+gVFJAxmpNFxFXJcO6852p9cfywX4cnvQUWY6mp
	NRW+0+DIuPXjTp93yAovMGEL96LAHL87q3y/V92SDIVxzbJMss3JHRJvHJ+Zzt7M
	GFUZIQqjsR9FrNhZOH3eCbjhB8KjmdH8lvgIZk3bkt0fUSurAdj32r2JVz5volno
	3TI8WFUQJRCfwkDzq3G12JTnVAx9o2UDhyNnx/6zguRhu0mJS87IkhWzgk5TC4SU
	44R4jzu4qEZ2ILc+/tC/D2bHTyqOG+uiw6A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bdsc9t1t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 02 Jan 2026 12:50:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee09693109so248533391cf.3
        for <imx@lists.linux.dev>; Fri, 02 Jan 2026 04:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358246; x=1767963046; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eNQ3dB0qjMdF3sPcFxLBfd7x75qLiik9IhqQvOvA0YY=;
        b=i0dlNKKanxCHtdQ4UVX66itHXynEXzQOuuR5XHRoaA5+yOTyxatMgyAM1hS1M8Tcwc
         7tY2TCZ1UBhmBlKfjljyi3OSDmP6u/bDuzU3lrnehholMcVrsfVL4AMzF/PetJD7zmvb
         DZt69y92Ky7la8ZmI3b/qV/nIwU9IBXaBizToOT6C6RcqXzaZJ/w5yrX98klPYLD4sME
         ROoa9SahWjkccYFr2xovKBmHGw6FzlXvez9cwi2zVxjHb2jeicemPS1IMHFSVj5U9rtF
         TTHGlXefoigkS6aEQHwjsBia8lnIMEUgBJU2WTDu9HpLt2cDmJCJS+3dhuI18lmZjELH
         A1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358246; x=1767963046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNQ3dB0qjMdF3sPcFxLBfd7x75qLiik9IhqQvOvA0YY=;
        b=CNSeVUSRiYqyynHDZuI3CxBiz7cvEw//DuYRaSkm6lUU1/EgAYSXd/qavl8dGgjBj1
         KzuXPZCTDUYtu49y/zckxFiSLsOXnI+eFK/wpKxZIZ2JBAriwUieYrBFFWnFQAUGQSjR
         HXHqor+l5qYsm4yewEpRHnyO+MF4KobSikxwFkO7X3ZAeNXSpAn3aLvzOq+s3/+fTImn
         CpWKp8LohPQoBkcN1vqF8UoQT49/5AkN+x/rdMytWxNA1TW66us7gu4WYreTYUM75ujN
         ++bdUPF/cF5Cp92m/WbPp/yFmildjDucTeJ0xSLN0NurKQIUt5S3ZOt/r7ELm1vkHaCK
         +0tA==
X-Forwarded-Encrypted: i=1; AJvYcCUhznivDJxVt8YOMmbmWmA7Csjf7Os9dFZr9n+mEL1D8hN5FjeNtQ6TRCdxa3EkJ+S55S4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoHFiqlGqPh9uCGitoxlt4e01rMok60BfZOVOPB4cfz9Gf9Ln+
	o48z3og16G4SxyzeDg3LquNzt1LgZyhBdHt5TQWdg26O44DNmkn/p8Kc2qhHOufiVVishSZuy5a
	yIsZIS3NatQCqzZBIrENktin0IUU0dNm2dM7ouXRQIfPefeQGeW15gP6d9CcWonw=
X-Gm-Gg: AY/fxX4jNyBHEzdECcgAkNG1jPuZ+3y341xobA//Y1yVzfT+xXu7Iv3x3xHXxz3XKne
	edENdasCesj+F4usD/s/qCqjMkJ4fFncL8vNX87VZwnARa97w0049gDAI5Qc2U6KomLJJoaInIE
	1mdbvUS8iG3lYqYMaCjup1Z2xZtJ1khvK5mmuicGRTi9fEGoyuQ8/Tgom+F88SKD58zuOkJUFA8
	78LV6ydZoc8NX0wdKiHNd8eDniBaLRhB0QTCGGHKy/AY+hC5iMCX8Kalwi7AqbSxEhONBnQcasP
	R2vhdEBJbAA6FyqofYpY4+I/MOSQ6rSic0Sfmh4K27ykYYiKFrYtl14W+OV7p0jbIp4QEJsgghS
	1Nu055EANUxQ+4/yMhXCLUfOSgA==
X-Received: by 2002:a05:622a:312:b0:4e8:aee7:c55a with SMTP id d75a77b69052e-4f4abd02696mr589485661cf.26.1767358246469;
        Fri, 02 Jan 2026 04:50:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/YCPL0+UNOHn9nZVMaYS8i6WyQ4Wfeniq2uQe1ZvEyhVOJTJwFUgj3aklQn1hgwDpKla7Bg==
X-Received: by 2002:a05:622a:312:b0:4e8:aee7:c55a with SMTP id d75a77b69052e-4f4abd02696mr589485441cf.26.1767358246063;
        Fri, 02 Jan 2026 04:50:46 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm84491369f8f.7.2026.01.02.04.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:50:45 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] ata: ahci-dwc: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:50:41 +0100
Message-ID: <20260102125040.65256-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=VqwBxy8XYcU5QNpyDWii4kc8lsFQn+uB7jr4u0TFrb0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV78gkLRi/ij6HD+pORAra8irvuUDfnaiYR8he
 QSPIHHh1yOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe/IAAKCRDBN2bmhouD
 1zh1D/4jn2PFeyojebR9apQNrt0zOd38aGoQnQmhw+d60/iPQ7SsnfwDvpdHHYesOAvjS6nKSTF
 bwee5ROqrJxWj6OGKTA4bXX287VEFogf9JyAtejUrefW4NcpiRx47yhAMAGrABcdvoZ3Pu+RoNs
 nJVd59fqABzCpnJ62EOgzL+oX53+ejsxt/bzKBKcH9LUapbh21+ZNuFMc/MUSxU6npQCNyQHYD6
 vRAQjck2ol0e0ZZkEqHd07mFJmoHDp32+MMiIl0zdLx2N4+/NRLrsobUSDFa6NE9fv9pGL3qG2S
 0Stn30U3Lnv+Pe0fSSRw8C2qv1s8rbQXhdjycztw24EYv/ZGGcBbeDzqIqG80IIOEZbGSQ5RWJk
 RkArRTFQ5Qy2+TW452GwDnpx7vKofpmxYZPYGdlFXS3fWIPmz1xfQojd+bS54iQneC6Hnj+ANuR
 6/yB68IB0jiMd+WQayC2VxySQeMUtUxdDDgiJnp4PlGmp6MXNs23ZnxaaU6rfwv856zPT62rNyl
 oZNh8fWpanng2WdHj4r9FJ4t9+smikxfVxLWEGdhXZhvNZCEQaNlfAMhrh5i3PNbm+r55hn1mBJ
 btjRk75NXo/7g3HWMir8wllZsipsg02MFIertSaDH3TCC27v4zYOQ4ZqAKO1vgsKuyGvc1xYOdS 7VILipyVJ3AFWtg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lOe5dnQJIVfcBbERCcAJhiVAhHoJAB8U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExNCBTYWx0ZWRfX4rGe6o3xklpo
 pwJygO91FtFjSynoqEl7hunfvnahEqqcns747oiM5iKWMe4OcOqUHBrrGc3a02lIOP7EaPBstAI
 LTjOdGHS12rvwJJjcxhkIjmBY0btjs3+28SjYB8sfuXDIvPSQ1m4/2gMk9TFDJW5PaPTvW1dLsY
 DQtcBWS16j/R3jLUIFj7ZapVyV1kBl0T1N984lc+q4dR50rHUPZaHUMJGzVcKb18Z8DwdEdHX5e
 cERZAYR2B4Hgwg0w+t5oC71lYSwbkbCtjcQRYseSvpxqZqIkGFQ5mrq+2RTnE8qedBVGfv0xzlH
 rjNoSsNZ9ZMHzeXXCqo+77QZtKtA2HinC4694PoTaNxL7/YAWBNRWWhl/meV0VifNnknaZdOg1Q
 yPJbMDm7rH6B9JF7bD3aWJ+wTdVfi+laQCJR/JJle6jSyKYALqFWBDjxm+PY7YFTN4C5H6KbP91
 6iukI6y2MqKHiHA+jjA==
X-Proofpoint-GUID: lOe5dnQJIVfcBbERCcAJhiVAhHoJAB8U
X-Authority-Analysis: v=2.4 cv=Hq972kTS c=1 sm=1 tr=0 ts=6957bf27 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sw2bo_H_5zbN9pJnse8A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020114

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/ata/ahci_dwc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/ahci_dwc.c b/drivers/ata/ahci_dwc.c
index aec6d793f51a..bfd24772ee67 100644
--- a/drivers/ata/ahci_dwc.c
+++ b/drivers/ata/ahci_dwc.c
@@ -260,7 +260,6 @@ static void ahci_dwc_init_timer(struct ahci_host_priv *hpriv)
 static int ahci_dwc_init_dmacr(struct ahci_host_priv *hpriv)
 {
 	struct ahci_dwc_host_priv *dpriv = hpriv->plat_data;
-	struct device_node *child;
 	void __iomem *port_mmio;
 	u32 port, dmacr, ts;
 
@@ -271,14 +270,12 @@ static int ahci_dwc_init_dmacr(struct ahci_host_priv *hpriv)
 	 * the HBA global reset so we can freely initialize it once until the
 	 * next system reset.
 	 */
-	for_each_child_of_node(dpriv->pdev->dev.of_node, child) {
+	for_each_child_of_node_scoped(dpriv->pdev->dev.of_node, child) {
 		if (!of_device_is_available(child))
 			continue;
 
-		if (of_property_read_u32(child, "reg", &port)) {
-			of_node_put(child);
+		if (of_property_read_u32(child, "reg", &port))
 			return -EINVAL;
-		}
 
 		port_mmio = __ahci_port_base(hpriv, port);
 		dmacr = readl(port_mmio + AHCI_DWC_PORT_DMACR);
-- 
2.51.0

