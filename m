Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D7C431E7F
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948899; cv=none; b=BAMNoGlCO6/bmLXO+pQbuxWIsMIUw3+iuJv3qzgs5mRZW1uK4XoNVFmdUgsh6IuA4ly+rIEvyT9i3NG4Su/+almW2/RwboCC97qozXm21aVgLPzC/Wa0KjF9GgaUx0mFavALIkWZBU4UL8t5kBIKmEKgAh3RzeMVu8zBOc5fDoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948899; c=relaxed/simple;
	bh=6sLA5MwnRnvx5ahGg42dP42VZ5Uj0hEZ80jvCL+QkJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tHyDwfX1gUQzS2eSbw1aoqS+wDd8PLqOsiLL9QIs3XSaJYNL5B0gaRgtKxPCPHwfEBr4/OGmfWsus0JlMZEkFVu4RkFcBUICBXH3WZ7nc5M0lC6iteKjGQTzFz1DIt6xWIcKkanY43DvRYairS21ABFUOArk7uusBpRFrYwk4XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPTTBmz2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDmDlKjG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPTTBmz2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDmDlKjG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCFJG41506638
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 13:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZVfYVIvZDWgS16VLGdHQkMZZirnrupFmTaCF7qGBc8=; b=LPTTBmz2tWUvklQZ
	4w8qumFJeCIts8FsDBLzgtgmLmYfaPEXCkAMXr83lS9TifnOO8dfBqTqGLVJZjjE
	EaYmGmv7+ktoqoxELlKoy+2i4vzxFyXaFHbMUCPLts/v1wrGxluhlEHQQHy70nfn
	lGjL46Z2iuMJtbKcWgy6+snBXl62qpzQVPaP1DwTfXtRjPn6iQ6+VxRRWGVZVkTH
	+RthcJQasZ9G+nPUGjZd/L5djbL/UIpdWO8Lhc0X4c+lQfWucvS0tF0f3hDgr7N8
	hohiDIsCwQz4sN7faey4JNeqBMmC4eIfNiQSc6gCGD5z7CznLNbiX6ZihcnaPbYM
	7yGoPA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda0uua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 13:21:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so44013421cf.0
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 06:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948896; x=1784553696; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZVfYVIvZDWgS16VLGdHQkMZZirnrupFmTaCF7qGBc8=;
        b=RDmDlKjGxgkYZHkYxquqZVbN8sCZ0zViKsPN3YfVi4t8uP5jbXO5KXTiyvBKh1FQ2D
         pSveX7I4fFXzfjDjwCfg7dRjPaCdox1esN3cyTk4a2k2lsHSun1PucAvoNHRr9lJdURX
         +2e4vcVQHwAYQzTOATMTEvYgC4v5wrwztpQMwQ4MXyIN7eE2l9saiIE0re2PY/37nRc0
         IpXvPKud9iJDBU4VQO7Eik68c1DR0Z4fYEG7PuSH9l3qQ7+D8hIePcj9O6CPIThw13fN
         eYENx1/2er4Isuo/HCSkf/Sn2qBbdQKI6J8ggJ/E0fQrpXqglLytf03kB8iHyERrMbZD
         JQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948896; x=1784553696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZVfYVIvZDWgS16VLGdHQkMZZirnrupFmTaCF7qGBc8=;
        b=XUe2RniJA04AI411B8mYxbZVhvDWFO9nrozeZKYUxtx0HWJfYk5lGqZkrFgfxSD6r2
         IAMVEkKNxysC7VZ3Q4ypQP5XHok6TLwvze30EhSTBBA2hPHNGzlGXdcTYA3akQjcmsFj
         NxfXTdmbUAPnHAQyHoqogbVjCV9SGQWOup4gUGjhE6qJSSZwVGLU9VQmu95ZCgizpQrk
         KCKumug30MMHCwC6kA9syOI6dA3WjeEiTLVI6FPoABkKADjXkt4FWh3AT4c4Wcai+WmY
         IRQb1/kjFFTBFjZ1RfjWaHWZom8PojwHcOoZp2WAYVfc2HDFw6ugN5kpwdL66FgU7SBV
         O0Mw==
X-Forwarded-Encrypted: i=1; AHgh+RoZ9vX3LFrsoD2sllsQkuJXgKDVTLSeXO6+mcUO0IDSmP0ObCUYAN0XE/Q4S7wmk1r9HxY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yysr+6ypOvy1Kx/A++BPAvhkV/fzUbtlXgZam3G3FIlzh6d3TIK
	txBTzpvDUgfLdMRk3rhWcHb0Mtx1Um0EvlDLK3o5girVyjpP+rNOk+OHfFDSXcOI2YiPK55ea8J
	xiRYeT4TvmpT1NYCt+vZRT/fEjKjRCats4pSw4xMml8ofQVxtQ5uYmO8=
X-Gm-Gg: AfdE7ckmAQ0fpvySdMPQxfaDpeWIxtMgWVXcwKt8qrtmlepH8fhb77+iZgSy3hWa385
	9LiVJzTzwvKdHDmxwND4iWBTB++ybm+9Kv7xXKl2qgySF7SsyHqE5NS+JDkSFBAcPv0uHrVyvZd
	x+f82JFvXLtNvUtAr4pzaFTj/SirjPWZJn0lER2eGVU0h7oU6lye0DyioUs+geIePX8fLO2NPpk
	580+j3iRaiSKuLtKsA7xfpGEa3ZbfdYXlbYK/rqiIpy5h/HV8Mflk8o3DQv3utRCnOz1p8kbid6
	WjdaiwlOiX8YCPSIyTJ9jzp+Z0AjzyemlUSrxdzwRgpuy131YH6zyLf7dIS63yzT+ag57ok20Mq
	r6Caf3zarQnbbqIlrpTJXaWLOCBMQdARUUwvlz4Se
X-Received: by 2002:ac8:5cd4:0:b0:51a:8c9b:6499 with SMTP id d75a77b69052e-51cbf363dc8mr93366251cf.61.1783948896308;
        Mon, 13 Jul 2026 06:21:36 -0700 (PDT)
X-Received: by 2002:ac8:5cd4:0:b0:51a:8c9b:6499 with SMTP id d75a77b69052e-51cbf363dc8mr93365531cf.61.1783948895804;
        Mon, 13 Jul 2026 06:21:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:37 +0200
Subject: [PATCH net-next v13 08/10] net: stmmac: qcom-ethqos: reuse the
 address of ethqos_emac_driver_data
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-8-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5580;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6sLA5MwnRnvx5ahGg42dP42VZ5Uj0hEZ80jvCL+QkJs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY7WoNWK1fKVT3AeUhvoZN7mOQTGCailFb2O
 0U8Uq1MWjyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmOwAKCRAFnS7L/zaE
 w1bJD/9rL0/b5pecDupw06V5+gDcMleg47Bp4Mj7c0bklOTgY38+9tAIEY1SLjLB7HwKOq1nqO1
 dq4hv8Fzi1RD++rxkUrQold1tLfhGWfOD7AWhFokRPSl3ebXb4UJJqBLEUpybGawZXGb83TjRQp
 TqQuY/OFOse9hQpLrXmnjRa7HhD3bpWH03G/U0OrEuJgSkZTKivy9x9EBTukzmONTUI4CDKI5B7
 06IMnO8pk62ZFboVjxTYIkcE33flA06idPLRtgn+TLMo0HUbjS9ev9F66IQUB0Wf2oI6cj2F9HQ
 bT0Vo879IpyBDA3UI8/bUeT5ZpHpMnag47OsAvtCie56SMBsYzQlpx252so7ZAYKsYZAAKndTCt
 02Gsy7+tuMhxZLaWxu25gb+eQVAcPjjeGVKfXRDRQ2llgESiKBZ1suHws8QKRO7a/ou3vEcbSvY
 TkjQzAmNmDN/31aYfD9yGiPkwzuCc3iN4Cm2svIMRR59VtUGdi+das4vQZ4AbF28v3ka7RtPJQ3
 tutb3bPvbrnMITPys1sJm0UN1M6xGLJFAky2b/TtJFqs8IYm7ABoVAMDEi73Z4+qePbfSVhsJO7
 b94O6zEbexT8kdm6o+6NRK4c6kovWN6IfUrXXTeK57CoDiEsf4wzC81a33bYQvAkDNk6St8CbHB
 bp1Zor92Ha8l7uw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX+FokEfX02ted
 7Jl51smDQ4iL44O9Rt1bvGkNdN4tWpIdY4EjuByD/d+9j50vyqQvbSmSQKEqt8zuvO3LVuecI5j
 YwKGB+xBcfo7at3iVzjyNBQv6/+1SD0=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a54e660 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=fhsz3KazkzAS9s_vSxIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: -M6_BJA2aH9cVN0ZwoeG20L6LzGGcN0Y
X-Proofpoint-ORIG-GUID: -M6_BJA2aH9cVN0ZwoeG20L6LzGGcN0Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX8kyhDqDyXktB
 oZb+CcaOx8itI9zZAfEvs2fONmb76LRZCt54tnmyiv0zKzSjqBSwhmgpPzSQ8elYnDzLk/1HO71
 xI3RFPIZMXDN3ZmS2Vx1nTIjooLv/feytcA/0rvzE8gB/rcfjBeIruQ/o3sQ16uTqXdTKXvnYex
 xYQJP0aqnFZo+ADZi2HrrbnUHayuQ300zETjjKQEFNv24o8Z31WzHq9iIeOBjTXBioKyrxXGBPj
 yx6ycKUQrVG7VT+wcnGOrwq/sZeKSEF/c7Nc7Gev7vmC0EUAhPWUIwru+VJbTEKcU3mstftz8YE
 SohbCNfbdwpdA3MEgEnyqJUqux7C/h7xSwI+YPVnj4pOiWcEELl25Rpp9+CxcvaU7pzmDXZJOGZ
 iNxXnD1qYrW11yff51K/DDT+kR8yfxAX13MNiooEUVt14LQ7qiuXMq0bRWKOk0NFJnla/sEVi10
 R3Jdax4TjAbIDOj13xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139

Instead of needlessly copying the fields of ethqos_emac_driver_data into
struct qcom_ethqos, just use the address of the former as a reference.
It's .rodata after all. This is done in order to avoid having either two
calls to of_device_get_match_data() or having to extend the latter with
another field when adding support for SCMI.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 37 ++++++++--------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e083d7d55782ec8310e9375e466be00213667457..43384960278b87a95f14f23c45442d2bbf75d882 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -103,12 +103,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
-
-	const struct ethqos_emac_por *rgmii_por;
-	unsigned int num_rgmii_por;
-	bool rgmii_config_loopback_en;
-	bool has_emac_ge_3;
-	bool needs_sgmii_loopback;
+	const struct ethqos_emac_driver_data *data;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -189,7 +184,7 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 static void
 qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 {
-	if (!ethqos->needs_sgmii_loopback ||
+	if (!ethqos->data->needs_sgmii_loopback ||
 	    (ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX &&
 	     ethqos->phy_mode != PHY_INTERFACE_MODE_SGMII))
 		return;
@@ -323,7 +318,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	/* Set DLL_EN */
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_MCLK_GATING_EN,
 			      SDCC_HC_REG_DLL_CONFIG);
 
@@ -353,7 +348,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG2_DDR_CAL_EN,
 		      SDCC_HC_REG_DLL_CONFIG2);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_CONFIG2_DLL_CLOCK_DIS,
 			      SDCC_HC_REG_DLL_CONFIG2);
 
@@ -433,7 +428,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 		      RGMII_IO_MACRO_CONFIG2);
 
-	if (speed == SPEED_1000 || ethqos->has_emac_ge_3)
+	if (speed == SPEED_1000 || ethqos->data->has_emac_ge_3)
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
 	else
@@ -457,7 +452,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 /
 		 *  (2 * RX delay ns)
 		 */
-		if (ethqos->has_emac_ge_3) {
+		if (ethqos->data->has_emac_ge_3) {
 			/* 0.9 ns */
 			prg_rclk_dly = 115;
 		} else {
@@ -473,7 +468,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 			      SDCC_HC_REG_DDR_CONFIG);
 	}
 
-	if (ethqos->rgmii_config_loopback_en)
+	if (ethqos->data->rgmii_config_loopback_en)
 		loopback = RGMII_CONFIG_LOOPBACK_EN;
 	else
 		loopback = 0;
@@ -496,9 +491,9 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	dev = &ethqos->pdev->dev;
 
 	/* Reset to POR values and enable clk */
-	for (i = 0; i < ethqos->num_rgmii_por; i++)
-		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
-			     ethqos->rgmii_por[i].offset);
+	for (i = 0; i < ethqos->data->num_rgmii_por; i++)
+		rgmii_writel(ethqos, ethqos->data->rgmii_por[i].value,
+			     ethqos->data->rgmii_por[i].offset);
 
 	ethqos_set_func_clk_en(ethqos);
 
@@ -512,7 +507,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN,
 		      SDCC_HC_REG_DLL_CONFIG);
 
-	if (ethqos->has_emac_ge_3) {
+	if (ethqos->data->has_emac_ge_3) {
 		if (speed == SPEED_1000) {
 			rgmii_writel(ethqos, 0x1800000, SDCC_TEST_CTL);
 			rgmii_writel(ethqos, 0x2C010800, SDCC_USR_CTL);
@@ -539,7 +534,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 			      SDCC_HC_REG_DLL_CONFIG);
 
 		/* Set USR_CTL bit 26 with mask of 3 bits */
-		if (!ethqos->has_emac_ge_3)
+		if (!ethqos->data->has_emac_ge_3)
 			rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26),
 				      SDCC_USR_CTL);
 
@@ -750,11 +745,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = of_device_get_match_data(dev);
-	ethqos->rgmii_por = data->rgmii_por;
-	ethqos->num_rgmii_por = data->num_rgmii_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	ethqos->data = data;
 
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
@@ -791,7 +782,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-	if (ethqos->has_emac_ge_3)
+	if (data->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))

-- 
2.47.3

