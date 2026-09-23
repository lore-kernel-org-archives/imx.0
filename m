Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDFD53C3A5
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 15:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176518; cv=none; b=nq3/jykncj6UzuEL/KRUNV9OrrFHlZdflSlhMBQshE97cI0SgoyvFnQ39qucnLZGmBYXk6r2KZN72PkXXo5w8KA99LkwcVimnH/zpMQ2/uhuSyyImOnpjkHvMf2XC+0yDSPobQtuIYfeBGqDZokzgzGC5UArLBuof0NPRfgxcyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176518; c=relaxed/simple;
	bh=jfayhtSopYOEWeU7mQ3PMtF551UTcttTpfNpnv/qXOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kcM6+gCm/rk9vX5g+WQUfGsNgvTzqRKu2v6vGvGIG2EVvcITnHrs3ZGCSJ1OOxdeaO5ie+xLWlw5eOc8O3gz3KiN+fNxy3AioqloK0AApNG5tDtBQLQZqGWbbKBzF9yj07mtcof2qHOHOuQvlJIP5xpiNrj08f3mkEML+ieaKuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LaMhEbnL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUEOMBL4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LaMhEbnL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUEOMBL4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKprk2056299
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 15:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CdtPSGF9ls/Sy7AsSe7QI575wPQVCQ9miE07kAZmRYI=; b=LaMhEbnLKYl7BEAZ
	9XsZio8HygjOXqGJBMZXrcFtBMeQLJ7kkgAkSGlcl5w4Om61SqA9BrM8kcRLkxnX
	O8+OgriPGvgbauQxnk+VKs4r0mni3lQTg9xIhnptLHIClQK2ffdh0CBiO4hS73ym
	89Vss9QCHwIhkS7UcidwU0U2hlE9HFJwZ2VY9M5eQJUA8ht9L75+jNnz6708mOUe
	Ofv5d8WgNYYPgTjEJ23elOMs1/7UdeNfME7nQaFa0rTc1r5nquotBrxQFAPnPx8M
	QM9Gg8TtDTRVxYqbthMlzS3MBLiXIP4hDWGvi4QY1ewSPj1S9Vt7qHHhW1tdfvYZ
	Njr7hg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv0hem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 15:15:12 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bbd01d56ecso331534e0c.3
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 08:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790176511; x=1790781311; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CdtPSGF9ls/Sy7AsSe7QI575wPQVCQ9miE07kAZmRYI=;
        b=YUEOMBL48D/oxzxpwrkk7F3lJzpGPL/tIoE8KESFrhsWvpVrJKLs7evqTYmyHtTwIM
         NGq/Qe4lQilGfwIweHWhFR5kdeM+73DIGQw/50ZvTerGUn+k656RFaxpHLkjhs/BD1YP
         NAL6OiTMV+DX6m6mpNiznr/QAULAqyPYwaRi6hE4AjIj59w461tiHTZqqdeLGB6/7mde
         ol9yM0JxGOT87FDcps4QoEof7HTUvGTGBr8XHlehLiqJhaAgFCcUMwI2j/JMm9w5mKPZ
         xQiqdSZC4fx4+JYK6lGxIVQ9TC1z57niQYF+BmrS9QUQYAsIdURu4QCx7RUs2bxIEotb
         +xZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176511; x=1790781311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CdtPSGF9ls/Sy7AsSe7QI575wPQVCQ9miE07kAZmRYI=;
        b=rTtKo+AuUMCW/HG9ZYBbOJaoL3TH+88Q8/hRuWzIPn7IsDqDsawX1rPftjeDjYPsGB
         Z12pBJgoQILZrS4gPl39OmADG7iZkzYh1c1A8Z1JVqXrndm8I72HMdQzAt9d35GbZr6M
         kRI7+hYDiFvlT4sHDSS4MIFavmLFaWjwS+0Kkgq7KJAirHTbu8rG19TYU8d4E4HuID/8
         XWsOB4zoClbLPDMpYIoZH6jEjWeETdavfYwh6FWQY/fHklF+EDt4E48foFPVOKgfcxwy
         gX2qYASZ4+lUdsWlv7VYb9e4hncRQ+0ZyHoq4sfC6XDti3THcXGkZaqbKfUnOSo5Qxs/
         0aYg==
X-Forwarded-Encrypted: i=1; AKwUvByKQF2KjQfnxVkHUd/cT/SBXWVfdTUuaZD7O110WKRRwTp03UKogXvXM7HfEQJME1EQSlk=@lists.linux.dev
X-Gm-Message-State: AFuF++kfJKX3cKlteaBlHbuJtVQh1iI7H70xhXLWBWaHvjjJmOQDB1z3
	D/cwFPznX0J4rYerwInromHFHJME2B1NGv0eNex9apCLqpQcHRSHROyIZygIuGlPfYVFrRBL3LS
	z44WrdLoiS6w7IoeecB8FeFHAIpX9sHdpM2Ez+P5uvuDiXcM/XXLR8Iw=
X-Gm-Gg: AYBFou38VAym/FN83Uoz9RvA4Xi+alNDfV7kbnC+I+f4XXeteCk5ZT8ZVECruS32NQt
	qAjX0J6AaDmGnC/Te1xw4xddDuQMZTq53h609EI97BssBskjPl/7PlZZXl1TFfGKh9WIVGlVosP
	u4i4XnWZmaWkoLA3ntkSHXSjA5uvHDEb2+fL3IhfhU1M4LT0yx4wDN8WEtrlJ1kIJQwFeDhVekr
	IGU9tSuNvX3Nm44XW1zASEeZT9rd/fPMo3qiniNt67wQZSEg4/56K1K+dkREVjzI9Q6uQ0dJBoA
	C8Oz+GRkLgzMNmpEwn7k/6D9Pe/p/gh9CfX+Rf8nRk9RqxgTjXE4xjLhGPaQ9Jo8lcYNIywEEFL
	ZNX2VHI75R1y7lRpmpHbsy+Li3xK7
X-Received: by 2002:a05:6122:2093:b0:5c9:a60b:e5d4 with SMTP id 71dfb90a1353d-5c9f165664amr3340962e0c.14.1790176511272;
        Wed, 23 Sep 2026 08:15:11 -0700 (PDT)
X-Received: by 2002:a05:6122:2093:b0:5c9:a60b:e5d4 with SMTP id 71dfb90a1353d-5c9f165664amr3340851e0c.14.1790176510486;
        Wed, 23 Sep 2026 08:15:10 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm55126325e9.3.2026.09.23.08.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:15:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:14:38 +0200
Subject: [PATCH net-next v15 4/9] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom-sa8255p-emac-v15-4-e82f33720737@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=19567;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=qdsBqzJkHtvDODVD06EhWpN2FUxuPLQA0Hur1HxPFXg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqs+zmL+t29M7EOtQEh+f+3bNZd94vy+3XXZ+bK
 6EAQb183QmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarPs5gAKCRAFnS7L/zaE
 w9MpEACKuBNFJJiQ3gaVdRnDiDg2eyQPFgYhcRzd6vEe+xyRTDXjLuxV5daEW77h0CY2jHimFBi
 szn0rtDe0G1TMbHDU94m9Q47//iyrBm/qYOPQBFePsRdsTZIk0/omxybPCR7/E1dXaum9NZdHI0
 JEJ8uDSDnCUmwd2xuLu83JzxRmzExTs998huKdDpeFvc988j6596Dt51DUZB7MKegKuor01CZKq
 bRt6/n8zfVJ0hYFKDhGPp/Ux0Gk9NwFDmZ0+DFXCMeqV5u89KWHh8CDWGJjmY7U8rnRED1qWlZV
 N7qxnQCFlSbaGBfnYlb/BNOLdNbrq9EEtyL2lULdbrZAclzN2ziCGxojDy9XmhSDcwAtKrqi6Oy
 47wMK7wFXdZ98Ed2YB5NBh4Ka6I3C8m7GdTXR0cOVNlHK/9w755ioC8iFet9B08Vl/fxc3tmnHx
 9bP67zQQbKBHI93FO9PIk3IJNjP6AzkXqTcwkP/ougR7Gyb+5m+hAVHgI+hUGoWFObMRF6ViSxQ
 pbIBGcYuiELNpEkgzefntt0N+hrV3V/5gxDOJ4LBhQKqXF+BtLNgttm/UWSF7n0N8CTL3Gv5TYb
 uNPVC4ssHXQLfy1o8M4spKndwJAq3FaykDMvGBZpmTViuP8TeavuOfI+ALLRaCIQnxh+jEVi45B
 hBaJ+yyItG4Ux/A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX2iZekfwFXbtU
 yk1NMhmF6oB9+vE5riQgsH/z/54J3zQQOOkPZ8uotI5LWzYwQ0DHPHlgjArR1DuUuPdbHuins5l
 z78mJ6VxoEg78Io6TheHPubwM1AXiRFbdXZ1mblNtSY5s0+wL/h7ae51VE8ysHDNU7Ngd54Dalm
 4ZLKjGIuyqyDIHrSIq+BAzy/zsvCKDuaiV9Pm53PzQVHaD1rcMV8IptnL+AAegBWsZQevFsdfOn
 wM9Oa2lSMeMycV4YWSz2x/pJNmtSlsxnAapeS3lr12K/WtW47J3ntmZyW7iy5z8G8mn8eWnFjGz
 G1PHowDrMM+i8notHHV/y4zxAAsGm8sehwou6VkyZWFg7mMgzo8NVaM9/06isVBf7Rks4RzaxDJ
 rBm1Oi/9+CtpD8maqGKcLlkoSIEXy8nXC2QU6hx/fGSWEybfv/RrE+vHtNZegnyveMvltHQycEx
 mTRoazMsFOjC8CNeeGQ==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab3ed00 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=mK_AVkanAAAA:8 a=EUspDBNiAAAA:8 a=yC-0_ovQAAAA:8
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=GKXZHVDtzPw5QJjWUvEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=3gWm3jAn84ENXaBijsEo:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: -NRBCZIy7RC_-CWSkY_mwDAeLFyzBNxZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX9e4iggZkNgTI
 D3c7QqO1u0PE6nO0ttTu2oYLJZYDvbFl5tuYkQCCYmxaUAGz+aEqYyt9ZCUry4GeszY0gWz8u/w
 NM5vwQyZDBQvld5KKssLWHau+WsnD0g=
X-Proofpoint-ORIG-GUID: -NRBCZIy7RC_-CWSkY_mwDAeLFyzBNxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230060

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Describe the firmware-managed variant of the QCom DesignWare MAC. As the
properties here differ a lot from the HLOS-managed variant, lets put it
in a separate file. Since we need to update the maximum number of power
domains, let's update existing bindings referencing the top-level
snps,dwmac.yaml and limit their maxItems for power-domains to 1.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com> # For RZ/N1
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml         |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          | 107 +++++++++++++++++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/spacemit,k3-dwmac.yaml |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 MAINTAINERS                                        |   1 +
 26 files changed, 181 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
index 23e92be33ac8609a16db530782989caed22a5730..b12632545673b2ad0148a677f45a7447309a43cd 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
@@ -40,6 +40,9 @@ properties:
     description:
       PHY regulator
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
index d8f90d36d24698e38e4dc7a7c0ce83db7179b876..ce1bd5f2c4702d5ce4c4b669b84406d98a33838a 100644
--- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
+++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
@@ -156,6 +156,9 @@ properties:
           - description: offset of the control register
           - description: shift within the control register
 
+  power-domains:
+    maxItems: 1
+
 patternProperties:
   "^mdio[0-9]$":
     type: object
diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 5c91716d1f21e617543b03c5a90b993f8aee053c..9c9cc3ef384da0270489c21b3426572ea46d9499 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -158,6 +158,9 @@ properties:
   interrupt-names:
     const: macirq
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
index ba49fd6a086cb92777310bc9e38efe1b3ccd2f7e..b79058b36d704fabb14f2df3c01fe9bfaefdf8a9 100644
--- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -120,6 +120,9 @@ properties:
           - description: Optional offset of register controlling TXD delay
           - description: Optional offset of register controlling RXD delay
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
index d1522216d32b943993489f2c47dcf97e822b2316..81c123fe6bb9474f537f988814b414e451f88c16 100644
--- a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
+++ b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
@@ -47,6 +47,9 @@ properties:
   interrupt-names:
     const: macirq
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml b/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml
index c4f3224bad387b87a5b4a3049dabd75f2c4bd42f..c9a131b8d8304c41559a416b324df749c0a87d14 100644
--- a/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml
@@ -66,6 +66,9 @@ properties:
       - mii
       - rgmii-id
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml b/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml
index 99001b940b8361f69bb917617f857ee99f4b3fa5..49db18423dd807683b9bb297978f5da8ea6cee3d 100644
--- a/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml
+++ b/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml
@@ -65,6 +65,9 @@ properties:
       - mii
       - rmii
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
index ab18702e53f9b4800a366febba1a6cf3eba173a4..5301fe64e98b8da843c1c14c7e4b28653b1095fd 100644
--- a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -69,6 +69,9 @@ properties:
     items:
       - const: stmmaceth
 
+  power-domains:
+    maxItems: 1
+
   phy-mode:
     enum:
       - rmii
diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
index e5db346beca9649be4f97727b78fda8973095912..b240c76e7dd5254d0c3752610c4aa848a3c3d65b 100644
--- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
@@ -83,6 +83,9 @@ properties:
     description:
       To select RMII reference clock from external.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml
index 05acd9bc7616356e68090ebdd4df20e42f70dd7e..f61188ab0dbe3c0cec5b10f7a65dfaff4dc3898f 100644
--- a/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml
@@ -51,6 +51,9 @@ properties:
     items:
       - const: stmmaceth
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
index 753a04941659b82b655dad1439ff66f8b37fa18b..fcad2274302d9cff36760184b74918a9835906f7 100644
--- a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
@@ -81,6 +81,9 @@ properties:
       - const: rx
       - const: ptp_ref
 
+  power-domains:
+    maxItems: 1
+
 required:
   - clocks
   - clock-names
diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 423959cb928d945aa3e758a3c803d12bd61ec42b..ef520f8105773e22c0536ff419dad55fe316e1bd 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -86,6 +86,9 @@ properties:
   phy-names:
     const: serdes
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5158481e5e5b0feed5b3dcd2cda2f593b7ff62e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qcom,sa8255p-ethqos.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Ethernet ETHQOS device (firmware managed)
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konradybcio@kernel.org>
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+description:
+  dwmac based Qualcomm ethernet devices which support Gigabit
+  ethernet (version v2.3.0 and onwards) with clocks, interconnects, etc.
+  managed by firmware
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    const: qcom,sa8255p-ethqos
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: stmmaceth
+      - const: rgmii
+
+  interrupts:
+    items:
+      - description: Combined signal for various interrupt events
+      - description: The interrupt that occurs when HW safety error triggered
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: sfty
+
+  power-domains:
+    minItems: 2
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: core
+      - const: mdio
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: serdes
+
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
+required:
+  - compatible
+  - reg-names
+  - power-domains
+  - power-domain-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ethernet: ethernet@23040000 {
+        compatible = "qcom,sa8255p-ethqos";
+        reg = <0x23040000 0x10000>,
+              <0x23056000 0x100>;
+        reg-names = "stmmaceth", "rgmii";
+
+        iommus = <&apps_smmu 0x120 0x7>;
+
+        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq", "sfty";
+
+        dma-coherent;
+
+        snps,tso;
+        snps,pbl = <32>;
+        rx-fifo-depth = <16384>;
+        tx-fifo-depth = <16384>;
+
+        phy-handle = <&ethernet_phy>;
+        phy-mode = "2500base-x";
+
+        snps,mtl-rx-config = <&mtl_rx_setup1>;
+        snps,mtl-tx-config = <&mtl_tx_setup1>;
+
+        power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>;
+        power-domain-names = "core", "mdio";
+
+        phys = <&serdes1>;
+        phy-names = "serdes";
+    };
diff --git a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
index 16dd7a2631abf6fb7dc8e0c90755ab1e81915b38..ed0d10a19ca4c47c05f6873c64b0537b90acd15a 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
@@ -44,6 +44,9 @@ properties:
       phandle pointing to a PCS sub-node compatible with
       renesas,rzn1-miic.yaml#
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
 
diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
index c8f76c8e75843e8375ce968d33e125feeb78f999..1c084aafa8f78f4640262ee88c64697a7259c089 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
@@ -154,6 +154,9 @@ properties:
       Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml#
       (Refer RZ/T2H portion in the DT-binding file)
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c4533deff85b052157984d0e2f23..3ec3f6dc2a125908ba98f20b1120311de8967954 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -123,6 +123,9 @@ properties:
   phy-supply:
     description: PHY regulator
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 0ff9e3284a06124cb0a3ee62e2ea6d0b1f7f646d..1f2ee684dc391e943f62c394a9789b447049df6e 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -72,6 +72,7 @@ properties:
         - nuvoton,ma35d1-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
+        - qcom,sa8255p-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
@@ -186,7 +187,8 @@ properties:
           - enum: [ahb, stmmaceth-ocp]
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   mac-mode:
     $ref: ethernet-controller.yaml#/properties/phy-connection-type
@@ -631,6 +633,7 @@ allOf:
                 - ingenic,x1830-mac
                 - ingenic,x2000-mac
                 - qcom,qcs404-ethqos
+                - qcom,sa8255p-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
                 - qcom,sm8150-ethqos
diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
index b89456f0ef830991135bd17626da98661429596c..e78cbf594c695204040a53ab1e367daa9e12246b 100644
--- a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
@@ -49,6 +49,9 @@ properties:
   reset-names:
     const: stmmaceth
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index e8d3814db0e94fdcd0f3ab2a9fa8bab972a97ab5..845e2c67d20037496bb1eec6eb73c99cde74e944 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -52,6 +52,9 @@ properties:
   interrupt-names:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   resets:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
index 678eccf044f975eb0bed16e7052532e5f19502db..9e0fb995327a925f7c488e5d990563b4f92cd644 100644
--- a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
@@ -56,6 +56,9 @@ properties:
   reset-names:
     const: stmmaceth
 
+  power-domains:
+    maxItems: 1
+
   spacemit,apmu:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
index fdcc61c65f87d1dc15a17b9486cde032ffa7798b..c424e77973921e1f9f18135c3106f1c270c9ac87 100644
--- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
@@ -75,6 +75,9 @@ properties:
       The argument one is the offset of phy mode selection, the
       argument two is the shift of phy mode selection.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index 987254900d0da7aab81237f20b1540ad8a17bd21..29b878079ff0c1a0ef95fc63f2035f478ee039b2 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -121,6 +121,9 @@ properties:
     minItems: 1
     maxItems: 2
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
index dd7481bb16e59982c26c1a54ae82b8cff85fdfe0..ad635529d676ed6b752ab3bde5152d5cbddcb519 100644
--- a/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
@@ -67,6 +67,9 @@ properties:
       - rgmii-rxid
       - rgmii-txid
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
index b3492a9aa4effa73fadf92a63a76ba8bb65a8769..c859f8bb5d582af8b8782f2f89ab5e6ee3d7a46c 100644
--- a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
@@ -78,6 +78,9 @@ properties:
     items:
       - const: macirq
 
+  power-domains:
+    maxItems: 1
+
 required:
   - clocks
   - clock-names
diff --git a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
index f0f32e18fc8550e6f63b87b60a095972453836c9..efa39eab0256a1102b01872bd848749788c9b4e8 100644
--- a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
@@ -48,6 +48,9 @@ properties:
   interrupt-names:
     const: macirq
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/MAINTAINERS b/MAINTAINERS
index dccddc99ac9a5edef77c555c85333f4ba7741cf0..bf2a211343e8db2e08f2ff08d7e31136504ddd1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22676,6 +22676,7 @@ L:	netdev@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+F:	Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 
 QUALCOMM FASTRPC DRIVER

-- 
2.47.3

