Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6D13A9D8F
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272084; cv=none; b=NXhOFUM4tYmAYagy/a9nnJ3Lwz3bFMKtNx0PlWYPo4vvh813dcAcJ/0Sc0NP5lN/C0WTMpUEnym9CQ3OH83sk0XC1lHm49T5Tl/0lQUhcS+hAtDKUcxQknyBBvB1z4HQcKksqa+RbPLZ7voYuSIVqb8GJfwE7gWkro0FSdGJMuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272084; c=relaxed/simple;
	bh=62lf3t5qbOxIlaStdMXwEVkxERzacKVDrC+KBhgqa5o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eZoDsE8FazU9So1RDZYBfNmvJ1oHFaogNYTI7A5yTHbiftNRSrro7FA/CYTKtdivcTf5j25grWIjfyb0pWp/gDY8CrF4VfFnV0HHtLGjRkMi7YkTSgJsyps1q/2thRJnWprRcAOx3nAg+7drTgCVw0nMARIR7VziD3jofgropq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0bGsK2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UdaApHO4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0bGsK2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UdaApHO4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83lY31364114
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 13:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vI/1k+nqYj3LM3ZnQClELF
	8nYZoxxBvQftKyxpY1xZs=; b=o0bGsK2slcntOm/N0wLXwMkCP7ZYcVI1Y46NYs
	zz1sziraJPBbRx+EWkgCeop3Oixt4aIp8ccE3ZOfx5BquubnaZng/A/otlog5jJ6
	z4gzQP5OjYF/qCZ/ZO0xeVZeoltm4BPfOvYolTrg4Mc5i4NBdu84EZ1nD9s0G/po
	WGJy1g6aNmfFOCXQ3MidKW5kAck1o/DPksVHHkbxIj9DEo8MJ8EWRDpyXPbWuXgZ
	dV9tNn5JTvizT6M+ygi7N1biHlD0cvbDSrTb+nW2SVjzQC0T/Q0AhMDh5xwEjH4q
	3wu5YQpkSqNvTkenDT1cIwGyh8gm0wyXxI9GPna7KFsx2Kqw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p793d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 13:21:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b3544bc7bso1951491cf.2
        for <imx@lists.linux.dev>; Mon, 23 Mar 2026 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272081; x=1774876881; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vI/1k+nqYj3LM3ZnQClELF8nYZoxxBvQftKyxpY1xZs=;
        b=UdaApHO4IQiG+VeMhU+b1grKjvVcJ/eyr4/fz7E9M0jSR8L77aOEEM6LIQ+D9QiLT6
         1GFNSgUnZV5rNCkvSrOQZprTle8c4Cv+PsRmePmU3Jp3RhAtckCPuIjW6DkBOalagpdc
         cwXWUXQuWBxateZHECPZv1YKtmjBcVqIe38H8zRNwJPz5rEkO1nXQfHfbdjd3TwNUjfq
         t006GAuGY3upG0vFsPo2HP/O+n5XIMuBlGsOyCVOK91oMauJfuvtF4VMt2MABKnegwEn
         2RpOGXeTFzyTizxjgv7n/P9CdtDT5uEB/N5A51rNqbGARF11NB5k/FieCLH3Y1PFu8kT
         32Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272081; x=1774876881;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vI/1k+nqYj3LM3ZnQClELF8nYZoxxBvQftKyxpY1xZs=;
        b=nqQ32Eh+9yrPN4mOfMzRIO2tQhD/x95EWH5kikHdHVHLJ6+1Toqy936R8BC5fSZzff
         4FQvQ6lt6nFyTOjot5CTfDolhpFGjLrlvOZOxFtqzx3Qtn835+HrcbBRQ77Pf9Br1KbU
         vhIAMUoZyorgmE++klKgV4nYvAx+cp9OaCfExQ0SlscmebOxW9pk4B5H3mcbdLs/w72D
         WwGN4g2LTKpr0BMZmfDscAf0nC+i74S3x3MX3yOM7mbd1K6V2e+fe8xugJ4aFk4pu4uv
         N7WFVzjIfevPT4Y/W86htrvlutXjHLuCtCJKASehB6jR7Rwo5UabWtAmtXPIPfhZ3fyR
         Wggg==
X-Forwarded-Encrypted: i=1; AJvYcCVIwJ1wDF4ymhJQrUbqHVo0rWC+DeeNXY1Q9YJWhpZ7rj73rHWWzfcbwDcADBtMT6CtDFA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4Arg49Grnvzeic7Fw6nsit+v9fpeBp+A53jvzVY3MRFEkuwSi
	DaXYl85spnqY6hNdEV5YdlbsnuQjI3m9PD1wZQMdResTHTciQoFbmQ0iQrefG5TBoUK4T64kgkO
	gYmHnJSpIjTxzrf4rDfzms1PRru2I2M5VfQ1G4ZfTTezOvUyPDFcInA4=
X-Gm-Gg: ATEYQzzlbC33K8gWu2sObwSJ6CtH1fTdqI2xaaExyp7rzNZGVQ/uHxzM+4+A0cUPOFk
	5AoM0g9swx6sxSThnPCKQr6NJHm5KZQopDuy8tSakImdpXbM4v7tIZo/FyJQUPuCwYjknSMCFm4
	9zNYZUqt10jvCzRY3fOEmJuCcL5H/uu7gy9SdYl7RhnThy6WC/INM4bAs1We1sdDvHGc6tIohl5
	kxANJU1XfSQJfkJz/+rciaYhhscqiMDIDm4rc/QrM3Woa11jiMvAdfp3z+JFyWIL6r8LVqwLM/C
	FdHbLNOAqCiwa+EDr5CnWNOGedo40EON1skPIlUf7iXxLSd3rX0Ke/DHabX3JhVHDQSb9K1rAPG
	ry9+K5PZIkNco34VAmxCDfRHch6OsxdCn9XjgMB+RASI6eSBo5Ygb
X-Received: by 2002:ac8:5f89:0:b0:50b:51a0:f752 with SMTP id d75a77b69052e-50b51a0fd0fmr92227001cf.15.1774272080812;
        Mon, 23 Mar 2026 06:21:20 -0700 (PDT)
X-Received: by 2002:ac8:5f89:0:b0:50b:51a0:f752 with SMTP id d75a77b69052e-50b51a0fd0fmr92225671cf.15.1774272079938;
        Mon, 23 Mar 2026 06:21:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:21:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH net-next v10 0/6] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
Date: Mon, 23 Mar 2026 14:20:52 +0100
Message-Id: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQ+wWkC/3XRUW/CIBAH8K9ieB7m7oAD9uT3WPZAW6pNtNXWN
 S7G775bk00T8YUEDn78D65qymOXJ/W+uqoxz93UDb1MEN5Wqt6lfpt118iCIiAHHqw+1cNBTym
 Qc0edD6nWwTKQcal2SErOHcfcdpcF/VB9Pus+X87qUyq7bjoP4/dy24xLfXEjQsGdUYM2lHysW
 8zMYbPv+jQO62HcLtxs/gkE8iXCCOGdZ19FMpCqJ8LeCSx2N1shWs/MAMHXOT0R7pEopnBCADY
 mm5RaE54b4TtBGEsEC2GDbxECWca8GaZpffpKe9l6WMvw+/ICMCDSKyBwMo2tKDXBPANLEv+Xh
 MEAlyAvUCMQoIFoK/8CCg8QYgkKArlA5Cv5X8DwAoqPUDFRFKh2IRqbPbctFaDb7fYD3QgOBew
 CAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5284;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=62lf3t5qbOxIlaStdMXwEVkxERzacKVDrC+KBhgqa5o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5BAapgeuAII/igpPc8Q5Z/zNn8yHLPz/tCp
 ZAp3W8wW5mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+QQAKCRAFnS7L/zaE
 w3gsD/9/Dl9xaxiheSRVvYWnqhrPFyNVSpiwZG147FCytvuP+CGThjen3fCnLawlczMGnJizvlZ
 mo1gpTDVRhQZqja8nokWyHnkTRxnlTkYUkLXv5MK2Cp7Ly4Un3lG6k7yl6TI+AiR0tzQT37Rsma
 GqjgSPhb7TfibiBDaAKI5F8VK2iVULENWwTfSaCKyxcX/02JtJrZbdUm9VG6dKa5XOANEVfW7mu
 bJTUdUhk1LDZCjlN/1AROvTL2NQ/ENEWcXXAC8Q8HP/WlJ9qUc/zJ/UceVH1MtCBN0yedHhyNMq
 9Sdqx0XjJZnYNIrb7/wu2qNkGqn4M1KcHDfL/dL3euFCifPN8WjioVSI706yZqrf0idjVy2QHLz
 Tk5glZhJfciJIXTd6z7kUzAAUpMXD39PoG/T4vY4PRaMVr5ZF+sosTPQ0jSPRl/FnlSegyvY53M
 gKdnvwsUdBpxhtwTnOnuEUyy8oCEBgMKH77qJs6AEn1q/ZBFgytSInpjVoyMnYKVhffktwR69e+
 pJw8b3fJBTvwuGmtHexhhUwWCpZXee7Aw/JX6cW7JBF5IU2GdiaUfaIzdVVW6aZ/ssNZbPqRi6u
 XKDxVqIPAbTcoQ1Ym8FwqMNB30UMt1xKZeMqBb3PbnkJSpWgwhdwzn0BftA4j0xVai9SqgK9PCj
 3r3JMxXjRxZ0ymA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c13e51 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=11IwEMuB_qlnYAimh1cA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: 38qk6uawv3IsjAVUbn2sWkI1GRNUZZjI
X-Proofpoint-GUID: 38qk6uawv3IsjAVUbn2sWkI1GRNUZZjI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfX5s6hP6vqEMhV
 aLxjITTRfjDkjL5HgJK+OQit4JjX7P1/OZLMSWqjFpaBSj913Z0vCcnvYzRjh6A7cbCMl6mAOua
 3yziGM3+6wuD7Z1iPuVTL2H7QUwLzxS/zefGTWXz2s8AR7TRqdC4c6L/vM3ZgsmP/EaVic5DZVI
 /rouK4wfHKlSdjQdB9GucVrcsxfqlNBNE1sRExHIv/0K3icgqyle8L2R050RMrS7/D99fgRL4j/
 etee1aLbmLamfTPcny9EQiw+Itoszt7Tc8b+rji375nLHiu+CwnVWPTqSsIEHhwoh6OUWMUcWCt
 Fb6mYV15fb2LY1sJPa0R5n12gH76nNyPS87KNossHHiHyxLrqnFRG6+KUPXAX+zV8G9/0qPikCZ
 BuBOjjyGv/iD+ONMxp9aZXdp05vkqNalkYgmPTrcckCUPffoLhmCw+3vbWwiZnHqG2/T+GAwzVw
 mB3ACt2Ui1O6wvXEzBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230103

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (6):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          |  98 +++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 MAINTAINERS                                        |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 401 +++++++++++++++++----
 26 files changed, 498 insertions(+), 72 deletions(-)
---
base-commit: 2caea0c68b85f5c2ee505a7fc0fe8d71060af7b7
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

