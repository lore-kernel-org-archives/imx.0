Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1629E3ACA7C
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272096; cv=none; b=HA1pC/AyvXx5WWaFLLlE3w6TwQOAPkJLi4IYZKiJluj39vTq7GgOQHiWvLuLpMag507doX/2nan7UNCbHKeIIFvu9zowPqcFSRqtxRV2L5byx8yxpb/dSURmhxTLdG0Hkp9BajkVr7CwMTafXMM28oCO2mstRy9QOvzaHZez7mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272096; c=relaxed/simple;
	bh=XhgTnkFPN/kAnMEKzRTRMtvjC9Al1B8l8RFwI+TZLZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mgyZXTCE5VbbKKJwd2lQLjpzO2e8DZgGXPTNoUQlFiZwSLfYxMxB7taz34NHBOxwKIw3o6mzbLZiCSM+Fq6ATRFBaB6lVbiByFzv3t97chNzvb6GeoYNuKxOCf7D+bjB55p1ZY65goUv8ni2dzfr+llq+fwVdltBb1XiJWQSOUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RiIZdJBx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cewmcNtG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RiIZdJBx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cewmcNtG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NC22Q53041826
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 13:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=; b=RiIZdJBx0zNOW65x
	ejEVRTugcPZjZkn7wavZeSWx1bgJ4HO5O13SdCGuT/1h4UgYcpyKx4Be4j0rQ9sd
	eb+aUVikEp/81INv6F4RqByBtm0eyVFj6TergholBecydJTKEiWDRg6e8Q8Dsfbz
	3g5PNMFNWX7j2tP6DjJFDX1XZT1dsYsu+EMM9WKX78EyzHTPZXJdHRtMhIbPHIYX
	W7W+2P9Wb26c1byE70y4RREdYvJwahTJOUbaNOa1a4tjjOXey6YdVWniEGOFh+sQ
	6Pn8+iE7R+2C0YV7WSy5oatRlJeuZ06nwuhJW5U+WivfW2JJL2evw3kJmNnbvKLc
	kgqEhg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w08bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 13:21:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b3544bc7bso1955111cf.2
        for <imx@lists.linux.dev>; Mon, 23 Mar 2026 06:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272093; x=1774876893; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=;
        b=cewmcNtGfgvt19pBICDWdykBKOaxAvnmrwyMSIOZpopKts7tZBDTkWw5xzCySDcqCK
         iJe7L7I/ainStaCHA4xykDsspOgnfpZpY4jXYa86nJgetnhiqgm3iNXAJwiwLRFBBO1k
         9Ch+rENuA25ZpiFh/3AxfiDzOmy/QmIEXj1Hqmh1c8AO8H9ovnLO4d+NeQCbv8vnbxlf
         8vMeJmCsy715nzCZ3PsNqFpdvqTfCXYtraA6UXd8enILjoiAVyVW3hDJUJ8WmLp9KMXM
         0bTyzAh2sSllWS05ggkA6JcjBXfXKVcU/svAHuB+bGpcrf7kp3sfDkXZF483e5Prl4Lj
         zlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272093; x=1774876893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=;
        b=XXZoMg8Nzsl2hp1bFPqUHgIjPCDoUw9bwOmv5YCuYKE0AG2+DEXCwNyxMkPDW1/hKK
         iB0LZI0jDFLdU1tIr+mwCyk3Cycd6a6cZuAQcGLl8mCcq0Aq1owZwmvfaqFEJiPROhUK
         yTqSLTLeyRoz5hzJqlUfncbMkAob6Esp6xeQjsb8wbJBPd7+J86y5y6MT9yyLvNnpwFe
         C7YHLDGWblgrMYkmO4yngogRvx7Eq5X883PXGvobLARFPrfqzpUt0H+DCinuMGxSaASr
         dZPRbkO3hVtPW6wRKQUU8yRYAf0kK+rPq9eOul1V5o3nNL6VfGqtPzVkVxPyGBHa7w2I
         FMuw==
X-Forwarded-Encrypted: i=1; AJvYcCVDm1o/Ac1mazQIvdGPZkfQRnbpzqxfrNoTico+gDG/KgzRzPUOgvnwfT6kxGy76zS141c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+d2M3pL9bb+d8hwxWNk2QQ0GiNrEu2dQuP6CF0vi7KDm5z8Th
	8wXnlol0lpZ2382a3EPXtpkG66xsmoS5cVvA1EWczN2EK/x2Ioa+KQlKveRkK+Q8abhXmoxbepJ
	RageNC8XMgjXlqf5txpOt/QA98zQC5qcqpeg7g/60c9vkctmZh6mbO88=
X-Gm-Gg: ATEYQzytivev+8Du7s6Kjvs/Mp29BhcM6pW6BbrJHYuaH0InHWP8l4i0HOTHJ8Rk359
	eCw3UYfc2HckFMRqtjBJ10QYDeaY4wNEHqNLyEFeWbbUAgZeq/NOMOJ04qPNMMITYMufaFn8x3T
	l9ADdxerkwu6q00Dfk6sxm0+BjgTg6mtErgfVlaM+/U9API460w5JUDMsDaFJn0nasnw1MDV+ff
	HQGDmzn3qIrq5TG807iKt3Dq0mmM6FSIqEnqGsfTLUOb36108IRgNx9phMpNyU4YhBlkf/JkYw8
	PodnHBa3dFrEFGCZlo5k9D2TzPkswj8ZOJMedvXFfTtDeuOGj8QfMzbg0GlDT9k7SbNMeISJzZS
	sl+shyCPlAaQNXkxhcVEEa2ULuX9IEe3zBOugEIiqT0HOnR8t6of9
X-Received: by 2002:a05:622a:1c15:b0:50b:4435:5dfd with SMTP id d75a77b69052e-50b4435710bmr163897781cf.1.1774272093207;
        Mon, 23 Mar 2026 06:21:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1c15:b0:50b:4435:5dfd with SMTP id d75a77b69052e-50b4435710bmr163896651cf.1.1774272092510;
        Mon, 23 Mar 2026 06:21:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:21:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:20:56 +0100
Subject: [PATCH net-next v10 4/6] net: stmmac: qcom-ethqos: split power
 management fields into a separate structure
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-sa8255p-emac-v10-4-79302b238a16@oss.qualcomm.com>
References: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
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
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3509;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hJGGsrAtahyuAplrTDgGRPmhh8bkkO/cgS9bRedR9Qk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5JDL4jjZYhLTE71eK774W6IHVRe41TGruCg
 0vfvbkpEM6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+SQAKCRAFnS7L/zaE
 wyLTD/0UpOnzKn1Gecnm8VFBmZ2swR9Ssw5MP0G8PYCTVfO8kjLy1csYm7RO4vytNIo7oM8qO5d
 6VoBYjjJkWEAyasocz5DMrG2vzcX2Novp5c6crEUytqg6DMJxkczKlStaI3yrLD+2Em58/aSiyH
 ++z/X3cGkMmKuzrOnAFcpNFNf0VBfKCugMPJX6yzzDRoSGvz3te1p6KN+ydlpdbt4xreWaEdjS1
 e4W1FGLBE2vS/WNLgzyJ40iy2o7uylNx/A5Dlg/TU+DiIj2TV6s7WeTTzsAdkAnuhyn1XjwVA3a
 /BnjOiasTbtH41mXdnzHxq48giidbbU/VLfCb4h4kwAf4pPLIkcXsChidQONJzOPpKYimqqR7TT
 IZfYtpFtg9MyioYyCVYULzUy3RzeU53Fedhy35Jkcq0RnPvLWA7WankUwL3weBHA1pbjqpB8+Sx
 MISWwp1ugyrC2Z1QjPhvn7z/PzCuh+WUQ+/7dDclXr8c/kMNISn8BX8YGkclxAt8HYxh0xKigxo
 toffB6LtQ9rM3LFay2BEeO4MZOmYVwFqKG5bdE2ISipRn5c62s64ZPDHd+XOWn3FLEK3LOCP4VC
 x9gzzbiXpBXB+TUP9CgQJ8r0S7zFQETvZ0QjptxL01AChqsAPptuNNOjo/p7CH5PLsWHvc2UWyA
 +CboqIj/Y3NjnlA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c13e5e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KCp3k1edx3YIq9yPN_4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: eBgdI4gcfNfXPjmgycN-QkwXwxM6YYQm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfXxLjB8zZLn9sQ
 2cLn9A+b9d6eN1DK8L7v+IR9NTn4uJYtzwD6Z0Wyk4V5+Vd48xrpOCpDH2n85bKysbfSoDhHVBR
 TxZQzrbbSc8bxNd9gCNboHLmxhOs2svuHBf+yEkor2VBYYP5Y4Hbc/nBzgQFs23dIVpMhnLwtAE
 dBZEcRrxN0Yt+FGzhlGstzDnZt1PoaIIdj5cY4P8gJnW8tnl35z//1MCH6naVeE6YwTUc7O7Acx
 dx7ShwaXROzEFwRJx3MzfqScvDgACKcWOODoBDO+a0HW2aFHpx52hFpUH4zUD5a2QdKz2mnEOlO
 l+sHPSa4EMrit+SGa6L6WLgz9Vge6huaaaozEZFEhdAMsJ8q3bNW2uIPm4cJRJd0n+w4PwaFtdg
 h6p3DLFrnaSnmaC/TKWSg/5MZuPtXUyPzNUo8M8qX8yLIv0JdZMCt6Nm9I10lajpZ1c1rXoJxqB
 /EjNdzmqcvoGz9VPSjQ==
X-Proofpoint-GUID: eBgdI4gcfNfXPjmgycN-QkwXwxM6YYQm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230103

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
index 8fda6c128117d7f5b1dece68c919f2a09a511210..cbfae18773c1193cd640f07824f5a66d68f9634b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -92,13 +92,17 @@ struct ethqos_emac_driver_data {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	u8 dma_addr_width;
-	const char *link_clk_name;
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

