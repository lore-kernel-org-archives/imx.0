Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C2A3FF1B1
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 11:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732570; cv=none; b=PxlEq0fHbNRallu5y+9lDIOAwZemMyhBGY75oUnAZMSw5EA46fNfr6U66PAZgOmTDmGLvfg5LTFrc7Hnafd0GjpmA6ZNSgY0CPO0gFQoj6anuqxLTg7WNzXcmFVeSuBjU2X0oXrrbDMZMuRExujEHzRq9rziydw7mITEzzWLPQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732570; c=relaxed/simple;
	bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ndfEzuDTWKARoD35s7UGrzLI82tqReQ5dMJywhW6gB1tz96J9b3lXe/Ppz2Whyk2TIIGBLa3QbGKY1RBmwDWxClTySkTmnH8amOd4812U6/1x1ZZ2Lmcz3sWgr4QHqFfiYNhatBRwGUJ7/cMymV0rfj597Wjk6WPzNZBJk8VbCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7fmsNYR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=deeuU5tr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7fmsNYR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="deeuU5tr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATB7l2647641
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 11:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=B7fmsNYRL8aorCjh
	GkGtC15NuXFLrM4H5JOnAeJZRw4ftYA3jmzaIPdv5tLcXoW3w9ni09DVmLePuMCj
	MCsX+7wJP89eJIOZvk6wKaeLxVpixcWzjkwuqLkmksY3Bh7DytOgz88ZtRwu2OLU
	qmIxW/7IU5P+U0dKfbmMJH3PVd/jQIXXWHdtGc+Gn2lWkHWcVW0Tlq6TJE8Hqx2b
	Y8Hb39FxYdMAGHxxiApziNKhbRsn10Xx/Vmp7Xvj+cYfYYbRQxE6O5JxSVHLCW82
	HoDuLdqBAUCeagHW/5UyHXnxKK8Cfbsk+6x7lYFVNnq0bPOh4r2urwD1lWpAQ31P
	KcN7Fw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjh1hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 11:29:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92da6f3cc81so372403785a.2
        for <imx@lists.linux.dev>; Mon, 29 Jun 2026 04:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732566; x=1783337366; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=deeuU5troNdVaGs99RVskgEzLm1IwL8QYdQZau4ovtvA3ZbiSzuzs1CeY9BWTZOpl9
         a5egN3f3ZIR4EYboAi0Gi/4RaX30OtEsxkGMCCJjPKqt9Lb8bK3QGQdX8ungRnurH7O+
         CsDwB0xIutgTs/azBR1AKRtK4WQsuPnTo+F+1GqnPBVOAzmrgBp8QhfTcbRmJbhFC+CN
         sJNu4GXpYEez+9Eavgt0sQhc1jkPAldVwgNOnNUbnq0n8vg6frI0Ngu+YKIXswemMJDL
         +vmFGXe1aj3f0VkJN5kXHt82n96yBzkdqQudxreACN0KHWalAG7JQB3+qbnpBOuc/lZG
         ++1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732566; x=1783337366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=nbbGzpsmGGv1l5E2qXLQ3sKleJUZ11Uk/KfCnWOvOx0qUzm8LF+zExCz1F9PMrrhB8
         wWD5lZ5RMarlvYQkre0d7KVYhXJ4qYQErgADlbyNplLBfbRw40ViQ4XQIhIITWre/VgI
         8Ev8XqaAP9LWnvvJls+eVt8n2Kfo2NLLWyGjG0FXEPTQCFL6KsGF0WQTRVhMSY9JSllf
         O7vkt/KzenOYZ4wltvm9vQV/gUYAzFuPm8Btl8Z4jHJfoWAixF0biOfVtBFHP9fUNaVQ
         H5qbbhaeDtJ/1hmZjhenuxTTwkiljKZ4wCBWXW/Ye88hWhGl6eoOVFP34p/KQpOtndc4
         v1cw==
X-Forwarded-Encrypted: i=1; AFNElJ9HS131RZBaFBvjSsgls83i0YSQbaeVdSSthe3RjFycCb8OICBf5mL/S8c1mtGuEd197lo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9md19z8f01+NN2pCKPETW0E8hPgEvQL67hoDJMM0CMH1gY+xe
	IpF6W8syN1iXgoyuEUT5CHLzZ3n6wP7R5AaWwdmtHPGYhBVniHMBWX6nNog01eB+ncTWvwcqr1v
	MMTkSFaeOh7fW6vea+jzIGnIsxsQ+4LYgfWJ8YXx/f8h8YYUSMJe1z4s=
X-Gm-Gg: AfdE7ckor6NfIYtu3KKfH79HtmAj03fvpkk4bBwzIkVK3VPyozFMalPrqX7+1fB3ESY
	S9Wz5E3tbhKq0ZUlbXYv8GJT6mieMrRVfLsX3R3+JnQvy2vJkGqDXrPi5gmY1Tmn+73/0F7ptpm
	GNFJb7MvF+8J2eswvcCp61WzGt8YF7kj4sS1LfH+QE8p99dDgql0iqqx31pc3FPBFtcx+kcAnMJ
	wAZgARu9Y/LenQ7ASjnF2ByuL9fXewPio4C5SdQnan1gyJ75YCcrDfalM6FGBeSurdnml/U5QF7
	HecmT1NXli9TdrBhVjwqEQx8qBwKBzEQ4P0MMgOXMLp1Nh0wj9dqWA2VTTjDqX76izjcJSHj28A
	dUllavLnPYBBTfaK3LSRglqXVVnbYLlBzybIf5c9e
X-Received: by 2002:a05:620a:46a1:b0:92e:472a:2a75 with SMTP id af79cd13be357-92e472a2e26mr761063485a.61.1782732566225;
        Mon, 29 Jun 2026 04:29:26 -0700 (PDT)
X-Received: by 2002:a05:620a:46a1:b0:92e:472a:2a75 with SMTP id af79cd13be357-92e472a2e26mr761057385a.61.1782732565749;
        Mon, 29 Jun 2026 04:29:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960983sm41936351f8f.4.2026.06.29.04.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:29:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:28:50 +0200
Subject: [PATCH net-next v11 4/7] net: stmmac: qcom-ethqos: set serdes mode
 before powerup
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-sa8255p-emac-v11-4-1b7fb95b51f9@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQlcAXYEHjo3nW5lXrEftFSP5te1iX5MUJv9q/
 rn9qnJOMKiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJXAAAKCRAFnS7L/zaE
 wxjzEACZof4MzE5R3AkLo4cdj47nM5c1BmYSvHzKkCHEBen5ThUyVXeDwIwWWblDb9RzJ3y+MLf
 o6oOtrRCBgzHhzIqbHMC8RY56b7Obnpy1liOpYkCXnAoXb6GQIsJOrt2U1uSD0oKANwf7nPzoqL
 OhsmiZfiThdMb8fyV5Uru6/3xaEgp17hCR/aNEhzHtDia7fcIC3r+wIGY1DBbu/Wp/jAu6pkOP+
 CzmnB9+VgEd3M2bqJXsVBck09gVcta+NALXRXu9s9uQcUcHxZ+GXz8kcfv/BkCvefJqXmNlZnrx
 hZHHGxhX2fc2XIobJ6+i56BbO4zGF4ju/pDPL3p/seCOySbXKLximZFUh9EfCKuSW72NgtcoSrC
 sP1C4LfvmWtH6SEwVZS9IwmGHjZ7L7474PXH+4zAq9UV72yW4CTIBxIfy8rYJrT6MjNXYYc5lut
 a//itO77gs5NIRlfmPXEjerOAOcgjX2NdtQLxXIkzK4JLftEBKC2Tq/QxziC3FOoqyL3e3c1IAA
 TBAiTx19G/dHyvRs2d5Ivud6gTiPAzPYmfSqhzheia1ryr4Xh7tfnNT4fDp+JaPeGmm3UwUkTPB
 Jrg8+FwsGLQYmxAKa70+0+gtmRNxyZh3idSJWOb8k8TJdI4CzOQx33u7dp4J/K+nGHNeNNaZhjk
 XzHNQpKFk6JR90w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: awap75VxoQJ1N2FD27ANH9JrjBldIDEs
X-Proofpoint-ORIG-GUID: awap75VxoQJ1N2FD27ANH9JrjBldIDEs
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a425716 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX3m/e6KaBsxUs
 Dc1+HBr1z/0kpCF6NPiVKxcaT/O7remYTAxmpX9+hBv9wJxcWE2vofb4huYAEbvEZNA7WBjCcML
 rrf4Qcv6cwHZIKUOmfflY35KFjo3Z1A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfXx87YjU8ZiD0y
 ZY4kxcuTICU2HIGinX6eZz3Phg1yuW7MM8TcTMTd9gFy+e/jdHO+B1HKAFqJ96/Om5we5ZI70Zu
 xWweLTzGxGA5p+wIenAmy37MiKrT532Bv/Ajqn7X4DkRaiS6lW8fi3aVuaD6TcqUJH5yAjPcXM0
 yQLWaPeOpiUJdfYU8ZrciEw9eqLK93f13gdRQ8nLSk/22AuvTsuvPgO9vZ/5ovS4n0qcOAieMXm
 dndl2QYanQ5or2hFqkeJKXOQLDIcTV9im6sDDWGFiKbfYa6xQNx0fH5UIU9xQbFxc3okRIFgRqx
 7Q5EVXyQPkxI+Ik5FQyj7/A/miqaX8JdHDs9/BHUsryKyKTJUpeeiKG2Lm1xQb28Yqe86ZTSCWc
 VVpK2cN1XcP//5WDpt074cTRp4w1Xi+Q1BLKw+pBlP0QOCBo+C0zLStLgUGt/avZBUNzWv2PPy7
 c1j9AaKLVDbe58wPiDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290094

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

