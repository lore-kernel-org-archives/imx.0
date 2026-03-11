Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF2A3E3C43
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 17:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773248655; cv=none; b=aI7WjuOpByRJiZba90NPKaDJF5VjGj1OLcfEKigmir0oAiUcG8xpAHghR3OTfgqqT0SCp2g89pPHhz/M3TW39MYxe6recJ44IkbcWRUDceF0vnu0NrPMvgH0oX9eFvICKAPxc8eov2MQMvD7TsUIuRe1wyJcOiRrnErFm7Ov0PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773248655; c=relaxed/simple;
	bh=6M9a4jID/11s+qxbyBXPEVsE/un124se3J0apoMdmho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U0Md2dlGdZUwDiqMzxfUkxfwfxK03aqGGhXnTfF1v7oPPfgqHW12x8vUMFqwK498tgquLU5FC0mfaQZqIIT5NQUBjCkzCfcXpVbs/bo1Uot0jd6aniDEOioVTb6znEHpkiP06M6n3PbGfIJIS/cCHffvfsUs5dyF7nwOJ1HV2WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k3+NlWJD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLYau9C3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k3+NlWJD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLYau9C3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BForkS3601289
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 17:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQF4J0Ck1r7kMaq7FizMxZ4LkdIkOnUWDeejjTapamY=; b=k3+NlWJDG2n56Rsw
	Jf6FiJMeTBiIf2bx/JtNJthrmX6U1Jf11uZmEY5vORES4wgwmrr7T8kmuFk+T8EG
	dOrQlILvdmJL2bKtvug+tJOaboCH8jYBs7B7YmseDytbIJmLnTDlgChqKufnRHR+
	s6zoSQyvPC0uPJTDg79d9/62w5kbkL/JLHO1dbi0iLQlIRSorujgVAT9YkVLMqhx
	BfX55/m4is8hXQFUEvPNEDkKlFJqde5ecnYLBLkaWGKLsRBnJDQbX0MgiqiST81G
	ohcrdgVmQvrnL2+8vTma0fVnpijzmGasAA22pc+yfhVB25ExLozNCyBTPNebGM9l
	ht759A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cubd4r9nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 17:04:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509219f94b0so6107651cf.3
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 10:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773248652; x=1773853452; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQF4J0Ck1r7kMaq7FizMxZ4LkdIkOnUWDeejjTapamY=;
        b=XLYau9C3B7Z6iEAXh4aZwEDs0S674LGIRfzPMc+0EplCI4n6r1htOHF8Nkvci0b1w3
         UNmInewcWvxaEhdHJMsI71ZCgRf/IMPFS6EymAVGLy57x/NuKpstF/v/S96Dlp0U5H5P
         Cqbj+5ov5JEc2z0RiNuQe3GCX732dP0SYQ8/MSvSWK6cM1hh8SwAzLt4ZKeSBVQ6S2UR
         FfJkzmQVMSjdmFdeVxpQGYE7lVmaVhA3vLVg0TqD+74Mp8s/YNmvq4nLvmS1oOZnA7VC
         A1wCQWx83q3KiLj6KZ1zn0FYbWiUH0FP9NfHRUK8euDS6BaYnUAZSEji6nALRxiWRBf0
         82ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248652; x=1773853452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aQF4J0Ck1r7kMaq7FizMxZ4LkdIkOnUWDeejjTapamY=;
        b=cXFbouPqzk9AxsV3T4KsGg6muTN8HooHoWK8sPUdFKuG1R39Zu4ulVWcuv+kGXD70P
         iwHuw57Fw9s0eGPsZQaB+oH9l3occZWiV5RU/4RSbdoC4aMBtUhP+dFxdSJgDcctAoeg
         W8f/v6xeasJqd2K2F1k8KykRCY/s6XXumWauF1C2ssHsDSF7/nW1C/N/gT6t3smNpROa
         Q1J1ivzsChHYiarXLypLkxuQq1akGtLctyet9ih4OQACfkN3gyas1T4idJAw56emGeBV
         EzbPnQKlcMsNwy52SyOQKA5k1YFNpQRi/OWzp2aAS5umcOVd1AqVfjtSZX7uSP3TsYje
         q4HA==
X-Forwarded-Encrypted: i=1; AJvYcCUH0b8/vw8ZxOESLmTZmzBSP9wt0FCn6ALwg9NpsrYQ/JYDpBQa8iGNe7NyGci/nPULwLY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf4ddjt2yD9BwUeKKKZX8KTvmYNH/JcqDrGAOXxvcDZMyyXfoJ
	1QzrHMctmeCZtlbyqSHkjIf/jF6Knn3rzvjrBXBULTJZFcVRSVcy5zuTkUNCFNASYwsTUAN7nRy
	Wd8ExrHjv6+owRjNc1ny/COUFW+Jgmxd45/6O7vi9aFNZdyfl/mL0tAw=
X-Gm-Gg: ATEYQzz0QYdNZKiFUZ4lvvVTWLRltEt24qB9muXJGfmsVcs5ZJg5V8TBe5ACWfmuki9
	uyMnvFkbAggKxUv1bt+y647YQg0l2IytOxDGZMCRCVLDWLJ/4rEObVAQT2NpUyid2+1wka8d45G
	liLhFot7IXwaTfeCmh6V0qGCap4X9vT30wanhx8KzFO5caamRD+nZdcOF51/0Bsl8frST4vzPrM
	OM7g0HJ3jW6SF9jwEuNUti88w4cUU7loSjTGsW/srAt+HQXaFwBFeCz4ZlyB9TIHW3zTwboPLok
	7JF1Frwt/qX9mU7UpMWGkU2nzShOu1LKRUUy7/fGowq/wAUTdqzKmtwNzkmuOmygKSv/wP+nLo/
	FxPc6dNhmbK2fpXtV3zPJr3kjZVCa6S784KLsFXIwqahZqFQKk62c
X-Received: by 2002:a05:622a:1a84:b0:509:2a55:9c5 with SMTP id d75a77b69052e-5093a0d96e7mr42568961cf.19.1773248651829;
        Wed, 11 Mar 2026 10:04:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1a84:b0:509:2a55:9c5 with SMTP id d75a77b69052e-5093a0d96e7mr42567921cf.19.1773248651224;
        Wed, 11 Mar 2026 10:04:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3a92:6740:d71b:5056])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ad1e4esm167993075e9.8.2026.03.11.10.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:04:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 18:03:39 +0100
Subject: [PATCH net-next v8 4/6] net: stmmac: qcom-ethqos: split power
 management fields into a separate structure
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-qcom-sa8255p-emac-v8-4-58227bcf1018@oss.qualcomm.com>
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
In-Reply-To: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3541;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RM1fjAFF4/rBfKY3AWIWw1rUVlUS0NVefDoxG3ay0KY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsaB28EUio5koyA3lZhJISL76YdBlUdjqzECUz
 1BUFVgZwEOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabGgdgAKCRAFnS7L/zaE
 wxgSEACWWXRhsAqQ2n30DGIRpoOVt9yJvPksATliMt9oyQ2CJaSny//RPgS2Z52xWGcqHWKF2S4
 mYAm90ZApw+oAbeilIiVVdFqGrko/4CClxLfiUhx3sCGy+C2OfwB5M2DxGVSP/E0qiCW3WrMEBY
 V3u5UMZuB/y9GSpC387X8pkKgI5uvbYAH3cCBSYUOwtF5Bj+Dx6SpyGMruNJ2I/dnJvx/Qasxwx
 y5i6I+Yr+dPZetjrh7PDWkdDKmHI0JibzdG483DWl8QhLm/9H0rMqxjfv03aoHh1tng2/UNR5eR
 CSOwHfShWHabG0o304fwxWCzHsbAGfgGrgKXRw+yvbmw9+Vjw2Yd3+5BwpYd5aXNcI6ZUdgWMs4
 /WMf7YVs0A54r6VcXyJNmK8JQ2I8oVBAg8OnGbe9gCNPkxUTUkfa50ktLARUFc4O/tV1jmOl8I3
 zkiG/m2XPKWlWLlSN1ThL7P21d2Vhlm6Ht0mfFfHqtLnILW8ivqyRUg9G4R3XLsWpFAcJ1WkU7G
 5rTkVCcdFh1hnrl180/4XqFEOcfhtfP25wN0ZOMe9Gz5lThl9zDxDke0ATRfm7YvBdjW8upjvwK
 NyIueR490SafzehM4vh3O/O+lsAUsEC8YK7IzLo3d80oPtpVGEmRm4irEOOmuWl/wK31Ijhp+b5
 f/6GvPkzZB6eDCw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: vkrbleKN18qJ1JR5y2RuT4tVEVQI76-g
X-Proofpoint-GUID: vkrbleKN18qJ1JR5y2RuT4tVEVQI76-g
X-Authority-Analysis: v=2.4 cv=QLBlhwLL c=1 sm=1 tr=0 ts=69b1a08c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fthQcs0maGYz3WdgJrEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0NCBTYWx0ZWRfX+VsDljVu1nL0
 VH3qAlnzJ6CswZrng0QKOxmUJC0tculaOCNwuV9KBAScCwtnQI6i0hS3+xFGFRyGO9QeB7VAHxv
 J33KNOzU7OgDUey966pqcPgxbgf8vo/MtkulatUkUXkFDz+RMoi6UJlH78xF2/I9yPp9oHoVs0S
 hNY1qmWactJ3EbDaV6YpO6K46riqAjEEQqIrw7oUKls3IRN55xkaisBlfP8Yuwglfd1v5eRM6vr
 qcOfl1g5+/6tdIhq67DJ0du/QMQvUVqrRWnsS2dHu5MDHjWpfA+xbvzYsODp66F/fBJI5ZPEdli
 4zSAMUf7BJSN4RymmreMuLvrZJzCZkbbsRGN1iq/RN6XaKGyu1NxD5ndaRWgzMC0APzfFNCiDkH
 rq1k9fT9FBCqdzD7KeZhmX4b1kqDXdU4Bb3Kg8ILyueKHQCuICWaElRG6/VYE6Au/iacjibbUl7
 7pjY//EFnu9Qf5bNLdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110144

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 92fc1fd0b4a1f85fdca7ee6f2c78b88415ce440d..2166084aac999a38367af4294129f925391179de 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_rgmii_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -301,7 +305,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -322,8 +325,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -749,11 +757,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -800,13 +810,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ? pm_data->link_clk_name : "rgmii";
+
 	ethqos->rgmii_por = drv_data->rgmii_por;
 	ethqos->num_rgmii_por = drv_data->num_rgmii_por;
 	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.47.3

