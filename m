Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5344544D42
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 15:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176519; cv=none; b=L8hjxSXSt1QFDTWU0f+2uBAbUJ6VA5CjP5MlxlsHBw8oJe/ceRIkWCE0z+GoX2qurW2uU7bWEUVzUdYsDcaxj5J8HKRyBK3JkYR2rNwPPwzd0qibZU3eDyhO80x6piMSzY1BGlxoxPvNwxTOLOyGdLKpoTOAoK4SJYTQ/jwADLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176519; c=relaxed/simple;
	bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c8Qyn8+69pe6qykYPDDWa8cWJc+2Ha4hCt9SZfzal7LfwxxoT7JVJ1ABHxGGnnD+MjA15HXU6ete91wEBlYiWtQgyGNIoQBMh684y25E0OWbkRmcHJTm9xrREUFUif3sDiHFh8n4lNFkJ7OvfAta5AnLdG+pnCNqXp7ijM57/JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaYnBI4F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBVfDOnN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oaYnBI4F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBVfDOnN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKfm9322172
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 15:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=oaYnBI4FY86JFFj3
	NUUpWuY4PVq1DwIYGrcirTaLqvcQk/tmiNCY6/X9tXRqfDyhxo2AxQmecmdOPRo+
	6XoTmN005WvzxmivYvjDXyhSSOLn7TZEm05ri3XmUUtOpRhIQ4DRmS+q5BjFm1GY
	EaVVKxuos1j8XiiBf0t3znXt9blhwYVawv9yR1Qq0y2VD6pxmqEVd+9oIwpiNwlQ
	dcrF0fIILFrB0X+oABM5Qc/qSuZjk4kTc/ElbGTRrjhVpnzhRxMK4o5MyHvVbcu8
	x1zwYIk7NDQnfqHz851x0gX00BMUOi2nxJ63Frq30NfAsKsXZuOPyXSEyshW9Tps
	aIbaTA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsghde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 15:15:15 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bbd01d56ecso331574e0c.3
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790176514; x=1790781314; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=EBVfDOnNqJkveqqomdIwwf79ZCHrlSeXzP0Yd94tXIQxpuSx0nJEKVBKbHvNUiQWe6
         usjrt6+D4Ft7eR7cy2DR3mz1XR0qhxEG0p8JBwO6iQvRvvJnjytJO8BSaxrO6GRxOsO1
         nl+Jc52Hf0oxrYBThLvDaic676hTK4MoivgRT5Djeb3IkPy4OCWN9ZGaMn5b+WrrsbtX
         HGgDyC7oWdDbDfzDXXZeE6xJTAbPEL/KXApgEI800D5B4JJ2ptObuZL9a18EN83yOiKJ
         zBqrXPksGrahQavPle7vXRmO762MQDPpQTYGEtnUJ99DVwOyeq4LowFpQdFCykaSKDsV
         ylzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176514; x=1790781314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=qdcpbrUjnENYKmfdV4E7AMOQ9sl0YcKNjnsBBHOqXuNXizcLcrBCH45lZPJLAGIS0e
         +sz29pnEBiSycSf5ZujJ0wnXijOKlfpuDaFxJnb52/nS7hbAMCJf0nymKZDKFoI0hml1
         Ntx3vfgo3MGbFDlnQFV8hmMgH+0tf5l301nRmqObNrmONgrkGmYtJJEptIdUwHvP3+L1
         ouy+TU57tCWmpZZ1Ft3mqlhZ18/HHtLNPSBbyNuYqB3Taib93dUU2uS3h3jFRTaUd/It
         BD1souucAiPtMX9mM/UCnAO7NGKdqAQyaVxfwNK2YTQm99icU39j5dUt8xXGjfgsxP0Y
         CtCg==
X-Forwarded-Encrypted: i=1; AKwUvBzNjWzS0kyliSMC+o7AcrI3YmhD0xM2zIadgPlTIuly9CPrHM6ouOfBM8A7EKc15pjrhMI=@lists.linux.dev
X-Gm-Message-State: AFuF++kOcgQUOlNJ3Kt0L2H3Dc+iO7RDPx3LavBtbjeGgKYAj98q2vYk
	/+Z93HPFyVRzZU00YtgE3wRPbC53VnTJSfzjigd+6djZlhUqDLP2gT0jVZGC2zAwJQE+rfHmlVd
	SNq/H9LgYSKqGX2TrgRVNg/NP8xGBNrfI8Vht2ctfvmyQjIMsshUwnMs=
X-Gm-Gg: AYBFou1UUgMzgf7nX0kk7yES+xiwC7qoDUhdBqDx4x5wD4BNL/AfeyLtqiZAsA/beJq
	kGpPry2t3oHfFUZQwemTmYGKy/MMfI0FWyf9V99ZIpBXXHRqcoC4JS9hYv4GSiRnJC+hcTrykq4
	n8F5NuYHqeAlbZB3ioRybsCDkCe82f+vSUzriFuYC0Ouf2IHRQAeFr2ttfAco2BGRXJXT0vUY/N
	I37B1S44RCa+BtH++dl9qYOK/xRRt03ZDbB8UUC04Rm+Y+lEtlu1l5Cf6DKTBGm5vK1d5r6YHX8
	TXSF1dRQmwLk4vrW+gJktyetgCzTNpsCnDgnoAGPfKjeaTvkmD2ga6JJTB0jdNhwWGOsTpvF2sB
	tlbHid0K8TkFF9j6sy+8cbpcY2waf
X-Received: by 2002:a05:6122:e442:b0:573:a779:62cf with SMTP id 71dfb90a1353d-5c9f15a8529mr3242453e0c.7.1790176514310;
        Wed, 23 Sep 2026 08:15:14 -0700 (PDT)
X-Received: by 2002:a05:6122:e442:b0:573:a779:62cf with SMTP id 71dfb90a1353d-5c9f15a8529mr3242398e0c.7.1790176513783;
        Wed, 23 Sep 2026 08:15:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm55126325e9.3.2026.09.23.08.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:15:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:14:39 +0200
Subject: [PATCH net-next v15 5/9] net: stmmac: qcom-ethqos: set serdes mode
 before powerup
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom-sa8255p-emac-v15-5-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqs+znmxfJ65EaHdReTe9c8RxTkoxpSJy+BciHI
 ooUHTBSphqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarPs5wAKCRAFnS7L/zaE
 w7eGD/9me0usFPzjz9Ap74v8M7uevU7NNQu8WYdLzpmJBCHqK46zb9X3Qs31qUKCdGnsbihLbjr
 i7C+wf7iDiXNppsWiIlCGYG4rcfZr4DVYR31Lynd5rZ9PcdXo0M7xf2aFf4DsojYNa9fye3g3do
 TSI32h1enIQKeNqFocyf8COvMtqtaAdDYXnQOFzIfulM1+e5AWjLLse+e+ppmzj3tu3PJUlkjEw
 s/RVWFLLFDAhl+1Qb13GOnrTJjMPrr+0gb8aAX0ApIh21VxiWlk/lkP/UMboIQjsDMyr/0E5Tk7
 1M+nCLSLRLuJPVpgimvvWmeQWrc8t6tE+avihxWVQjF1yPTWqG6YnG5PPmhJK4visB5CI5gE+Qr
 3eI0RmGvllLQifmGqzMC6ivwn3DI5Fljv5hug3bePkXBkjR4eF91PptFTM+rRu4LU1RdWwKYpCU
 uTYPakyKgugnnE3+ga/iY/SfTfJUJaBscMdUW6G4VE3rDiM+0hg3onBrwKkxQ6iWwFqM81uTgJ6
 UdOBGv9yzdFuevJdpJe7T2JDJ32Zp+zGmbdn6jr6OAiyxz8uUgq+bYrYSCeB/jXsDjUtvQ+1Mbz
 PHjDsbKrjzuRXy32lDmtrXX0dukM9pTbcJN2PXKbKJJjF5Y3FtYhPaHU4ryuGcX9Lr9HyNGtWWX
 PHxpgsRslwWmWhA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfXz6i+QaTI6Fax
 vuwdq9pNfMP2cQI0MReVKTBpRh+A/rkut1yDRbvGbnTxOgROFla6a6++S5r9VYKkW/7wiSbSrdt
 hvHXjY1BCJ2PnIw1kbsB2H3VAocJIH62NLVi7FJUkNYw8TpRQFtkYoaKwjIpjiJL1FL0rPOFqpM
 1Hg58Odmo4xFYbpPEXzZgDzGXqA7cGMtlGI6oX0GwdWyYqbdC8m0KpYtFC7qpp5jyAdoX4etsIf
 tZ0Gc2UDfWwc+KVStgvcBVpbrnjYe28/d/iE8hAVdjQZZ+Wd+gWcBXIN+IQyDIEiVC9ppAwZxiy
 VxBiYK4n79Z9POpftrlZK/LehWx0XvE6aOccr3CJY7EyKGsNlnAsAWoxBKDLGJAN7Yip/Y2TKro
 1Ik5KEfBDx9+mUQIgkMo/wkhZWGOR3Xok6vynjxWQN4CX3AHURyuEpY2+00/ia2yf/mcn6R+oUm
 55EhWbjBtM4Wef2gRpA==
X-Proofpoint-GUID: iAjyuEziog8TVnGDjySoRRhfc4kP8LSu
X-Proofpoint-ORIG-GUID: iAjyuEziog8TVnGDjySoRRhfc4kP8LSu
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab3ed03 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX3gRmA3276xdI
 xhl1agFjzBE+8wD1yO4ItNvqX/pWzQYcQl2XTgSFc0H2fjdLPoTrV2UP0LxZFSeLu2raXUETusY
 4vLKK6xjG2EkXMkh88aRTnShIXZ64LI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230060

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
SCMI systems this is required for the PHY driver to select the right
performance level - which translates to the link speed. This is done
ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..47b70b5e706f221c01f1c0ae3b1acafae6641165 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,19 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+			       ethqos->phy_mode);
+	if (ret)
+		goto err_out;
+
 	ret = phy_power_on(ethqos->serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		goto err_out;
 
+	return 0;
+
+err_out:
+	phy_exit(ethqos->serdes_phy);
 	return ret;
 }
 

-- 
2.47.3

