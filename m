Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8120396D27
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 12:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662756; cv=none; b=hbEGqL5S6dlDPE4qVUmMxa7Jk3zd1Zgjm4tRfeyhmVfScBAinsZ4lzJu6c8aPiFQhaPeMCtfVfCENAnpXT+ZkF2kHKLA8zk4ciIJ/Oj0g883I4v5KpOz6p6vZp4rjK8qVGKdFmiPpRcmNOB80ilfHWbC5KTG/cGhBYqdGpbC/5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662756; c=relaxed/simple;
	bh=3YX99yDiykq8wht5jhlxLD9GqcQlDRrqtioZ2YaSMF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+gQsbYeuFHFIX/89O2PVn6BitEOLzhF3ptPoyMl4YoezK7Et+yzuX4+O4AlZiJmTf/0LqYcmgwMLEuYJOQh6+ONF7PTsDKw89y5pgciZ8OVXm3M2aoegtKKrEqUsh/JdVEZquFWm6u6kLm8JLmzFBfbezCvqRo4jqxs4Cen1FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DiiJI7TK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VOTeUJ4b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DiiJI7TK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VOTeUJ4b"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G7n3d3042125
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 12:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Q2i+GiHSpXUMk/5V2t9vb8q95gvl7L2wScFZUzHsU8=; b=DiiJI7TKYsl/asr/
	N/JfRDO2M01wuYZAzzpQc5i3937R/w7NEZsJyBtmu8pAlNIOAnvZkzjKNM0D6HWx
	J/SkNiURIL9RYjA4cxgi8gPutHaIOyrwT4oert+DTpagGL+wNJwpatt8S2Q3AiSU
	dAbWJPf8SFC4yCm3IePE4F9FqI/Bu77h5wC1q6mQTSnHPv0+iEE8eYRCllXmPoKS
	4dw9PwEqt5VwhzYt1cm4iFow9JMBzTj+L/7bcrszUs2HaVdGssKCJzAAMlbqW3tv
	FTSgrC9sH4QGm0WdvHXle7GB/KKG51blTXrzuupJYGJlXX5s8k1Ei4OVLTaZksEI
	fChHbA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt8113d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 12:05:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091782ab06so669253551cf.0
        for <imx@lists.linux.dev>; Mon, 16 Mar 2026 05:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773662753; x=1774267553; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Q2i+GiHSpXUMk/5V2t9vb8q95gvl7L2wScFZUzHsU8=;
        b=VOTeUJ4bFogu2rn8IzQcmZNZgtMRzMd5EiHP0VUNTJiR9kqzyRu93G3cwSEMvGZxME
         fdOneOFcFmZkpDk1oHzoful1MpunpO6JC5VMQu88+6IJUnh/+xkNsqAgpo6E/I6X+qbF
         5n3TY0PFu50MBSdhoz7UKOxu3XMg6q+M76g+AzuOeqWZRiuKUwRYjfJi9a7ztlOIjhVN
         rRquN7l5SkLtCePrCmj2C7ZUyYhwEwWs/XHgylashJ3Glx9Nn8ACv1X8xgeufxcEfplc
         I7lInjxvqpOC+KB1HNFfyvBWXh/nt/gN6JMak/SBIwQC0GqPum1WgSbdJ2IKE1kd+Mh/
         pxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662753; x=1774267553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Q2i+GiHSpXUMk/5V2t9vb8q95gvl7L2wScFZUzHsU8=;
        b=e0eEtTEFAZwqowVQKhtbsGdn4Tu7kZmFESfTtlltY3VIQQ6hT9O9vYIV1OINKo0tbF
         Xx0prIrK4Rd5OlefycRNaJjDwg0+BtNCAanGHD4rf+YIymnxAxjUlVu/D0bpjgg/rJsm
         Z4swHEeAY8cfy5WMk5a9gn5YA3j+kTKGKPbu3MkuvPH5N8NMNo9fkIbsm+uHukgTkax9
         tuZ/BQyym4Uv4f8II+zdj6qjTxwRs92O/iL6td9Do5u37LuMC3N5s0kD6zZnWXpMO4ZL
         nxmaWEnyWKkTWi3DUE4atLvRhBdOzcXWw6Vx7uHUgeYkI8icBFPE3rHozSGNILN89LKj
         6mQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRf6DBK13d6NsnGlvdbRmxpS9u2coyudox6c9NiLGFqDhRlpFSXAwYHi55AOdMWQL0YSw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyzUGO8Wqq5abELJvX0zCdQaGuWt9GvzDObO72gr8+t4JZJ3sZ
	OC0idpYW27DuXzxrOQg310SCCfqOBHuQJtAxuHNxjejpck7YaUi5RJgViC1SuRLL6y2wlCnzUxH
	YMj4EMwTDVGSUB2OFK2RXaoi+VQG+HfCa/uqCqMPgog1LeBmjCj/ZYsE=
X-Gm-Gg: ATEYQzwBEYE4HbW5dlij7jwszMLLxd3sFEXvUpX3ejDn39rjGMiNLiZjlDEs4jeP7iM
	euAI1ZgrYFO9ztA98QR2LZ4sNBPttzXByEG7QAgeXFa1yvy+VqoC5h+xqNtgkncTuA+DoP7u8VN
	9FvUyoq93XGwUBTznFV9QrYuynhnAPjU7nmeyvrxgOjUGGWmwWtV4F8fpR+ya6zkcVhsBRVQEOe
	S/PbwHpy1LQxejLCvK1DxgqqBnhjXAxDHxhw7SKvipxMVqDN3Gql94bONB3aaw53ff+CDbK0wNV
	0TeLSFIoxCGquxhagD7q9jvRtq4LiVEmnv/4/gIHaccTsmaEcF3wzVcjaNWTJohOIC8KCJAF1EN
	CUiYfO2rraLcOU9t/wSnPv+TnhP85JL+AgDzoZ75+KcQmLk46A+8=
X-Received: by 2002:a05:622a:1a87:b0:509:4091:affe with SMTP id d75a77b69052e-50957e28510mr177055001cf.69.1773662752819;
        Mon, 16 Mar 2026 05:05:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1a87:b0:509:4091:affe with SMTP id d75a77b69052e-50957e28510mr177054061cf.69.1773662752125;
        Mon, 16 Mar 2026 05:05:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:45fe:3ba6:f90:d951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm46468513f8f.34.2026.03.16.05.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:05:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:05:11 +0100
Subject: [PATCH net-next v9 6/6] net: stmmac: qcom-ethqos: add support for
 sa8255p
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-qcom-sa8255p-emac-v9-6-c58934e76ff2@oss.qualcomm.com>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
In-Reply-To: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13278;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3YX99yDiykq8wht5jhlxLD9GqcQlDRrqtioZ2YaSMF4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt/IJ7rps1mNZ7g5+PtadnJ3zPqa8dZ5z8b1NM
 e93budJrwaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfyCQAKCRAFnS7L/zaE
 w20aEACpr9Y5Mk9Y78w0JYOWY5EpyvYX64sAyRDk53Y/JZzT5eAJlA76MTbgXZazP0dSuplyMrl
 eNfL+lKHJjmmI7486O+1g+ssbkDsKho584IWcU123YWfedeQqx17wZInirnIDfs4pqxXmrpH6Yq
 9Jy5hIcBcH683eDUvfE2Lijkj5mq1TLaOnAdOWhkfjoG/sJZcf9pfxuYBmv5pT+hoIwbcvLs1gI
 AqV3AK4fFChTr3ZKGCmm0rCwcsFcg0gvhMuDYJVpeNcmlhYiwsbVDV/vw4Wydee5T5TIP2zr1dq
 Hp54ivBPauz5qQLFVoZRIWe9Sey4Q8qygliJtvxsRs1iVlDYeMcgtu0BYh5ciOxk//ff0SR8UhM
 3gX5fpmdZo/mghcQSBV5782lUT3+2hVpQPFBu9kUqaFb68woTyUsemzbQDBHzPFeOD1Y6WOOe6u
 YlKNYBt+5dgczOr8pLX2pbMIuknsyFyNgQf+eV5X98ygZAzeYYEnpmTRRgIZn4CjfRiJ3EXaqkE
 /SZH91kPPmFBuX7Fg3lqVv/M428y3FdhSamclYfPyP5MJiu1Z+MaPVZdQtVJYuG9QPYI0wyLlJI
 HpClWHw0yUsrHWsxodAYIt2gKXwH0Ok8N1TrhJM0Oukpg16c5h5uvEAx6gM0NIovFvO5mIIKAFV
 boBC1OelpOx/7yA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: xoCywJU6DvsfMwwDSFynU3QdcdrkcgO-
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b7f221 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=eSQ9y_BssGCL3sbXkzsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xoCywJU6DvsfMwwDSFynU3QdcdrkcgO-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MiBTYWx0ZWRfX9WH7l45RGvCJ
 08LZ+QBRRNiscI+SZG85maEnoH5Hir5rPSjjEL9tP2+vyelI5HYd5HLnl3H9gSs4cL3Oa80Eyir
 UhuUZ/o29A4rn+7eVtzK6oq9e1JDkC9nAZ1P2urX8Dq9Cwq8DzPU6NGFQ3jE0sI++xVuZxv7mAZ
 lxgHvYQRsFuTWDEkEG1eniXYfblwyJM1YpPVx9si5AbPlSNveJT2mMMu2ipOBLAinF501HgZOp9
 EOBt9iCDZw2FhHvOPB4mjF8NnGZThPlbv/i0H7KOKEmhcENY77L4Rm6mDo7pr2nk/bD1A9p2+m4
 70Gjv4cGofg/O2BMsPtKi+JeRa2B0ctT9R/pMeF80QrSqiU7xrLRoc+JWK6fuWPavSY/4l9w1Tp
 jDRZ6NNBwQYVO3MkI2BuETO4idRclUNLLIQG+2aX/AcLeMdPvuHsJ2PSWA1e46+49ZRf9v5kfvt
 GGr5gShu8P6FLfIMBUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160092

Extend the driver to support a new model - sa8255p. Unlike the
previously supported variants, this one's power management is done in
the firmware using SCMI. This is modeled in linux using power domains so
add support for them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 301 ++++++++++++++++++---
 1 file changed, 262 insertions(+), 39 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f32ff0d9ce513d8270c8db9c549a79778549df59..09ce80b446cbac8bf85d974a3d6517e037b049c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -7,6 +7,8 @@
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_domain.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
@@ -81,6 +83,13 @@
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
+enum ethqos_pd_selector {
+	ETHQOS_PD_CORE = 0,
+	ETHQOS_PD_MDIO,
+	ETHQOS_PD_SERDES,
+	ETHQOS_NUM_PDS,
+};
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
@@ -98,6 +107,9 @@ struct ethqos_emac_driver_data {
 
 struct ethqos_emac_pm_data {
 	const char *link_clk_name;
+	bool use_domains;
+	struct dev_pm_domain_attach_data pd;
+	unsigned int clk_ptp_rate;
 };
 
 struct ethqos_emac_match_data {
@@ -110,13 +122,21 @@ struct ethqos_emac_pm_ctx {
 	struct phy *serdes_phy;
 };
 
+struct ethqos_emac_pd_ctx {
+	struct dev_pm_domain_list *pd_list;
+	int serdes_level;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void (*configure_func)(struct qcom_ethqos *ethqos,
 			       phy_interface_t interface, int speed);
 
-	struct ethqos_emac_pm_ctx pm;
+	union {
+		struct ethqos_emac_pm_ctx pm;
+		struct ethqos_emac_pd_ctx pd;
+	};
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *rgmii_por;
@@ -338,6 +358,25 @@ static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.pm_data = &emac_sa8775p_pm_data,
 };
 
+static const char * const emac_sa8255p_pd_names[] = {
+	"core", "mdio", "serdes"
+};
+
+static const struct ethqos_emac_pm_data emac_sa8255p_pm_data = {
+	.pd = {
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+		.pd_names = emac_sa8255p_pd_names,
+		.num_pd_names = ETHQOS_NUM_PDS,
+	},
+	.use_domains = true,
+	.clk_ptp_rate = 230400000,
+};
+
+static const struct ethqos_emac_match_data emac_sa8255p_data = {
+	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8255p_pm_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -406,6 +445,28 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
+static int qcom_ethqos_domain_on(struct qcom_ethqos *ethqos,
+				 enum ethqos_pd_selector sel)
+{
+	struct device *dev = ethqos->pd.pd_list->pd_devs[sel];
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		dev_err(&ethqos->pdev->dev,
+			"Failed to enable the power domain for %s\n",
+			dev_name(dev));
+	return ret;
+}
+
+static void qcom_ethqos_domain_off(struct qcom_ethqos *ethqos,
+				   enum ethqos_pd_selector sel)
+{
+	struct device *dev = ethqos->pd.pd_list->pd_devs[sel];
+
+	pm_runtime_put_sync(dev);
+}
+
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -655,6 +716,20 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
 	ethqos_pcs_set_inband(priv, interface == PHY_INTERFACE_MODE_SGMII);
 }
 
+static void ethqos_configure_sgmii_pd(struct qcom_ethqos *ethqos,
+				      phy_interface_t interface, int speed)
+{
+	switch (speed) {
+	case SPEED_2500:
+	case SPEED_1000:
+	case SPEED_100:
+	case SPEED_10:
+		ethqos->pd.serdes_level = speed;
+	}
+
+	ethqos_configure_sgmii(ethqos, interface, speed);
+}
+
 static void ethqos_configure(struct qcom_ethqos *ethqos,
 			     phy_interface_t interface, int speed)
 {
@@ -710,6 +785,45 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 	return ret;
 }
 
+static int ethqos_mac_finish_serdes_pd(struct net_device *ndev, void *priv,
+				       unsigned int mode,
+				       phy_interface_t interface)
+{
+	struct qcom_ethqos *ethqos = priv;
+	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
+	int ret = 0;
+
+	qcom_ethqos_set_sgmii_loopback(ethqos, false);
+
+	if (interface == PHY_INTERFACE_MODE_SGMII ||
+	    interface == PHY_INTERFACE_MODE_2500BASEX)
+		ret = dev_pm_opp_set_level(dev, ethqos->pd.serdes_level);
+
+	return ret;
+}
+
+static int qcom_ethqos_pd_serdes_powerup(struct net_device *ndev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
+	int ret;
+
+	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
+	if (ret < 0)
+		return ret;
+
+	return dev_pm_opp_set_level(dev, ethqos->pd.serdes_level);
+}
+
+static void qcom_ethqos_pd_serdes_powerdown(struct net_device *ndev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
+
+	dev_pm_opp_set_level(dev, 0);
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_SERDES);
+}
+
 static int ethqos_clks_config(void *priv, bool enabled)
 {
 	struct qcom_ethqos *ethqos = priv;
@@ -741,6 +855,68 @@ static void ethqos_clks_disable(void *data)
 	ethqos_clks_config(data, false);
 }
 
+static void ethqos_disable_serdes(void *data)
+{
+	struct qcom_ethqos *ethqos = data;
+
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_SERDES);
+}
+
+static int ethqos_pd_clks_config(void *priv, bool enabled)
+{
+	struct qcom_ethqos *ethqos = priv;
+	int ret = 0;
+
+	if (enabled) {
+		ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_MDIO);
+		if (ret < 0) {
+			dev_err(&ethqos->pdev->dev,
+				"Failed to enable the MDIO power domain\n");
+			return ret;
+		}
+
+		ethqos_set_func_clk_en(ethqos);
+	} else {
+		qcom_ethqos_domain_off(ethqos, ETHQOS_PD_MDIO);
+	}
+
+	return ret;
+}
+
+static int qcom_ethqos_pd_init(struct device *dev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+	int ret;
+
+	/*
+	 * Enable functional clock to prevent DMA reset after timeout due
+	 * to no PHY clock being enabled after the hardware block has been
+	 * power cycled. The actual configuration will be adjusted once
+	 * ethqos_fix_mac_speed() is called.
+	 */
+	ethqos_set_func_clk_en(ethqos);
+
+	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_CORE);
+	if (ret)
+		return ret;
+
+	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_MDIO);
+	if (ret) {
+		qcom_ethqos_domain_off(ethqos, ETHQOS_PD_CORE);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void qcom_ethqos_pd_exit(struct device *dev, void *data)
+{
+	struct qcom_ethqos *ethqos = data;
+
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_MDIO);
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_CORE);
+}
+
 static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 {
 	struct plat_stmmacenet_data *plat_dat = priv->plat;
@@ -781,31 +957,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 	}
 
-	plat_dat->clks_config = ethqos_clks_config;
-
 	ethqos = devm_kzalloc(dev, sizeof(*ethqos), GFP_KERNEL);
 	if (!ethqos)
 		return -ENOMEM;
 
 	ethqos->phy_mode = plat_dat->phy_interface;
-	switch (ethqos->phy_mode) {
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		ethqos->configure_func = ethqos_configure_rgmii;
-		break;
-	case PHY_INTERFACE_MODE_2500BASEX:
-	case PHY_INTERFACE_MODE_SGMII:
-		ethqos->configure_func = ethqos_configure_sgmii;
-		plat_dat->mac_finish = ethqos_mac_finish_serdes;
-		break;
-	default:
-		dev_err(dev, "Unsupported phy mode %s\n",
-			phy_modes(ethqos->phy_mode));
-		return -EINVAL;
-	}
-
 	ethqos->pdev = pdev;
 	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_base))
@@ -823,35 +979,101 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->pm.link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
-				     "Failed to get link_clk\n");
+	if (pm_data && pm_data->use_domains) {
+		switch (ethqos->phy_mode) {
+		case PHY_INTERFACE_MODE_RGMII:
+		case PHY_INTERFACE_MODE_RGMII_ID:
+		case PHY_INTERFACE_MODE_RGMII_RXID:
+		case PHY_INTERFACE_MODE_RGMII_TXID:
+			ethqos->configure_func = ethqos_configure_rgmii;
+			break;
+		case PHY_INTERFACE_MODE_2500BASEX:
+		case PHY_INTERFACE_MODE_SGMII:
+			ethqos->configure_func = ethqos_configure_sgmii_pd;
+			plat_dat->mac_finish = ethqos_mac_finish_serdes_pd;
+			break;
+		default:
+			dev_err(dev, "Unsupported phy mode %s\n",
+				phy_modes(ethqos->phy_mode));
+			return -EINVAL;
+		}
 
-	ret = ethqos_clks_config(ethqos, true);
-	if (ret)
-		return ret;
+		ret = devm_pm_domain_attach_list(dev, &pm_data->pd,
+						 &ethqos->pd.pd_list);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Failed to attach power domains\n");
+
+		plat_dat->clks_config = ethqos_pd_clks_config;
+		plat_dat->serdes_powerup = qcom_ethqos_pd_serdes_powerup;
+		plat_dat->serdes_powerdown = qcom_ethqos_pd_serdes_powerdown;
+		plat_dat->exit = qcom_ethqos_pd_exit;
+		plat_dat->init = qcom_ethqos_pd_init;
+		plat_dat->clk_ptp_rate = pm_data->clk_ptp_rate;
+
+		ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to enable the serdes power domain\n");
+
+		ret = devm_add_action_or_reset(dev, ethqos_disable_serdes, ethqos);
+		if (ret)
+			return ret;
+	} else {
+		switch (ethqos->phy_mode) {
+		case PHY_INTERFACE_MODE_RGMII:
+		case PHY_INTERFACE_MODE_RGMII_ID:
+		case PHY_INTERFACE_MODE_RGMII_RXID:
+		case PHY_INTERFACE_MODE_RGMII_TXID:
+			ethqos->configure_func = ethqos_configure_rgmii;
+			break;
+		case PHY_INTERFACE_MODE_2500BASEX:
+		case PHY_INTERFACE_MODE_SGMII:
+			ethqos->configure_func = ethqos_configure_sgmii;
+			plat_dat->mac_finish = ethqos_mac_finish_serdes;
+			break;
+		default:
+			dev_err(dev, "Unsupported phy mode %s\n",
+				phy_modes(ethqos->phy_mode));
+			return -EINVAL;
+		}
 
-	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
-	if (ret)
-		return ret;
+		ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+		if (IS_ERR(ethqos->pm.link_clk))
+			return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
+					     "Failed to get link_clk\n");
+
+		ret = ethqos_clks_config(ethqos, true);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+		if (ret)
+			return ret;
+
+		ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+		if (IS_ERR(ethqos->pm.serdes_phy))
+			return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
+					     "Failed to get serdes phy\n");
 
-	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->pm.serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
-				     "Failed to get serdes phy\n");
+		ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
+				       SPEED_1000);
 
-	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
-			       SPEED_1000);
+		plat_dat->clks_config = ethqos_clks_config;
+		plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
+		plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
+
+		if (ethqos->pm.serdes_phy) {
+			plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
+			plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
+		}
+	}
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);
 
 	plat_dat->bsp_priv = ethqos;
-	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
 	plat_dat->fix_mac_speed = ethqos_fix_mac_speed;
 	plat_dat->dump_debug_regs = rgmii_dump;
-	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
@@ -877,6 +1099,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_sa8255p_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},

-- 
2.47.3

