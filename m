Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABAE35EDD2
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608080; cv=none; b=dvym9+o1uIVQzhMHCv4fvTk+egewW+0nflRuZMkQ5YkWj1B7hMflch8ZYGLOMCwPTMmJJG3PgpYRTHNLPCbEIo6KUcFFNdDxtiJAHmstFjWmAXu9DYonybne9QTzht8EjPGvoWln91YpQYu5ytir7pMgbe2YNX2WWtWifueP+bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608080; c=relaxed/simple;
	bh=/xpe0WZiMxl/GqX7qwhgJXFWRG2PG+0p92lLjw6JC0w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M/dpOqaGhJNaVrAVkigwoXiWJHr6NBm/zE834RUND9CCrI80Rik+/bDwXdeNNY2SIIa5dM1ksvlshjEbbas7W7m5Y+wIfPv9mu/xz1kSXWLc51XSzF/YcJiZqTzm5oKdyHdZJQ3S3jBQbj4ETS1NZcP5HIZl8eC65DZjbkXtAwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8YXT+Qe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CaAr8U7W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8YXT+Qe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CaAr8U7W"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S938JL3247337
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 13:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wGMo0m1R2L9wwbTRPxCXUEgVOcQ6/Yw3wU/Y91P03Q8=; b=Q8YXT+QeY4P06cQc
	N/4uFGZiGouljnPWHr1Fr80N2Kqf0k01NRQuAeasyWrFpvFyzmVTsMc4hfLHsGjS
	kfY8MdWdpwixcVYhsvoE6Ep5Af5lLrcA1cGYd+LMnvOVUQGEk/czRmf2Q/B0FwRH
	2/daLG1us83CzfFERdEu+40Ibnf2W50lVoPtqVArBInciktD25oQBR3L95U8pGqm
	D67ea37JPV3Cmzggkv0n3HQhYkjW+M29AnE5rPZchNY5DUoeHoCdBv8kAO0MZ4CG
	7mWpd7mI830gRfF4o1taUUhf6H2YBqL4txuVAJKrcCrGFRP5M23b3CiY+Yi08O1e
	oZCHGA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bydfk1dwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 13:47:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a755a780caso7147935ad.0
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 05:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769608077; x=1770212877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGMo0m1R2L9wwbTRPxCXUEgVOcQ6/Yw3wU/Y91P03Q8=;
        b=CaAr8U7WPkQz8vMfuCWSirjVOAZ5qmFDxcUzvGhSQvIrawTT0Jo1NqAK90Ms8vyK1h
         E/2jDMF2nJFt/6uKtBG3qQDywWsCV868/fcT3LlCaFxumrXcs19olpe1yQrmwmJGfwyE
         OC6eXkUTfEEMGtl8nFNXU+UZspH4tDuh+wwYTKbTECUhThvTfVBMCYCerxZh/Ixyclpf
         eG6ZbwVoclV4TRM9USg2K/DI1mXegsqg97PZvQ/9ps2SzS6ztsSbp11rE5LSDsN3UDrP
         pfx8fA3suCQkbwO8UTXm5WX/oEZ9X8VQByThAzSsx0qAZGski7VQMyiV/h+W/MnAtsar
         uhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769608077; x=1770212877;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wGMo0m1R2L9wwbTRPxCXUEgVOcQ6/Yw3wU/Y91P03Q8=;
        b=dlsYrzeVx8kLhY0z0nqAWGTkLJ7pBYVoyRKzUCbLhuWNPbh3NAe+2GOdXyHMfFWVeF
         caeTEv1Wfm4qN3GFB3GWB+sCWyRYuk1GKe4Rrc+XA48nwKkKazG/IWVItrW47oQhJeUx
         nDkkR7ctZ748t25P06RLbWsZes9MDjUiiz8aPOpuEII5zNAXpF8Yma2+6PcchajENc4F
         5TZEx9bkNr8suj5wHEhslhvhpijs2Gzo2K4rXAhk/KZrgL7L4+sEQ7HnjVIkNjQ2YWiz
         2jglvs1s2UCde4anXoUi8Wk7FYsQ+79PXmUSgTexM2eMPSriaaXoYdT29g6E3JJualgV
         IT/w==
X-Forwarded-Encrypted: i=1; AJvYcCVGNskezECDqtXtLZcqfuTSEpkJ8EQ7tNW+R+evHU5OtPl1SSPBWjKgyplaZWHI5PqJzqk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVLBpJ1W9IMZ40B1lARxQ0vpsBZtRrNh2VkPjIJp4qc55uypuP
	vBkuQ6V1zjoxdcKWp08LS2xH0KoqRLQ4TdPJCQ6AAMnXwBShAobKbnr3A1WwHs36v0L8vihSze3
	XY2s+EgD5LEphk+8oGFMLjLRuvTpIH/7tlKkNsHVrtLe6M1c+1VBLwDI=
X-Gm-Gg: AZuq6aKAoBzCJJj8pxvKMrLgaMJrBj+Hhr8FnPQ/7qEhYpyZtm/Ohdxaho1hvONbCX7
	05fQnW6+JZixUrWnVq+3ff5qdAokBJVQow+nW8mujgataMiG0m+eQYzGMZ5AIKchcRvlAAHDCLU
	afxEaF9Ff0ekrJXD4LLYfof0795vJOe9JkX15vp1aoeSMl3khd2qNtsQG7BGVPeK0Ve+oyl3WCT
	vCWv3Fb/3BlSoF6GvGNaHqXiI7r7pyG1XvZIpgj4R2YrjJhdOKcXXK0mJfVa4/NZ7bXhxrJYdWK
	M/PAMI/rzNgZ/3akPwQP/cKQNR5dPDfRWJIYM4QduaqJ5E6iZdpPg9rN97wnONjHqSWKvfiZuKV
	u/zdBcm4=
X-Received: by 2002:a17:902:f60b:b0:298:45e5:54a4 with SMTP id d9443c01a7336-2a87120f746mr50144085ad.1.1769608076703;
        Wed, 28 Jan 2026 05:47:56 -0800 (PST)
X-Received: by 2002:a17:902:f60b:b0:298:45e5:54a4 with SMTP id d9443c01a7336-2a87120f746mr50143365ad.1.1769608076044;
        Wed, 28 Jan 2026 05:47:56 -0800 (PST)
Received: from [192.168.1.102] ([120.60.55.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c45c4sm23790595ad.62.2026.01.28.05.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 05:47:55 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, bhelgaas@google.com, cassel@kernel.org,
        Frank.Li@nxp.com, Koichiro Den <den@valinux.co.jp>
Cc: vigneshr@ti.com, s-vadapalli@ti.com, hongxing.zhu@nxp.com,
        l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, minghuan.Lian@nxp.com,
        mingkai.hu@nxp.com, roy.zang@nxp.com, jesper.nilsson@axis.com,
        heiko@sntech.de, srikanth.thokala@intel.com,
        marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        geert+renesas@glider.be, magnus.damm@gmail.com,
        christian.bruel@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, hayashi.kunihiko@socionext.com,
        mhiramat@kernel.org, kishon@kernel.org, jirislaby@kernel.org,
        rongqianfeng@vivo.com, 18255117159@163.com, shawn.lin@rock-chips.com,
        nicolas.frattaroli@collabora.com, linux.amoon@gmail.com,
        vidyas@nvidia.com, shuah@kernel.org, linux-omap@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@axis.com,
        linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
        linux-kselftest@vger.kernel.org
In-Reply-To: <20260124145012.2794108-1-den@valinux.co.jp>
References: <20260124145012.2794108-1-den@valinux.co.jp>
Subject: Re: [PATCH v10 0/8] PCI: endpoint: BAR subrange mapping support
Message-Id: <176960806032.58847.15614322725355216575.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 19:17:40 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDExMyBTYWx0ZWRfX7xSJPOo6shOp
 pjgo4a7doDQupFge3oTBaVrgCxDq1c2JFy7W6q59rHBDR3I/SW36kFFcqWIRl75VK8b8JDUOAPG
 Xlzt5lIXuQce9D8X/qMw+t6MuvpTlX9U+7XB9rMOegcTcEWvsXnrQRu3ckbQ9Oqkjock1gBEpz5
 OKf1Quay25HB0DVYTDTtD66bVDIUiyRL8XArsme2MSIZb6Qq4aI4PqstAhL03dOSajcvix56zxh
 JsVESqNrqaTrC7bCyeuVOgQgi4lgQ1U/BIF79OcU2q3fghBraSIvKkN4RsBEzmuVSyHjALzocHP
 wZHEDWq8H20jC7dF9BhrV6T0HCbrvzA1YCoam8k6gTrUFM+SihjCD7xuVfp88Zl30db9QgdQC+x
 OIrF3AMsxuSSmbGE04suhDp5ox/mSkrOvd13tbRsEpxIEiCUK8/W5zC/P84cVMU6QXbvZVj1YgS
 QhSo1ixIN+f89ItcOaw==
X-Authority-Analysis: v=2.4 cv=XfWEDY55 c=1 sm=1 tr=0 ts=697a138e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=F3mjE3T3/ow0zpRzCzjSvA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Ux4BfgyPd-WidXiTcjQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: brgOKKPe0g1sbW_I2WfkL_GtS4M8q0Nq
X-Proofpoint-ORIG-GUID: brgOKKPe0g1sbW_I2WfkL_GtS4M8q0Nq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280113


On Sat, 24 Jan 2026 23:50:04 +0900, Koichiro Den wrote:
> This series proposes support for mapping subranges within a PCIe endpoint
> BAR and enables controllers to program inbound address translation for
> those subranges.
> 
> Note: This series is a spin-off from a larger RFC series:
>       https://lore.kernel.org/all/20260118135440.1958279-1-den@valinux.co.jp/
>       The first user is the pci-endpoint-test, and the real user will
>       likely be epf-vntb for Remote eDMA-backed NTB transport, demonstrated
>       in that RFC series.
> 
> [...]

Applied, thanks!

[1/8] PCI: endpoint: Add dynamic_inbound_mapping EPC feature
      commit: 06a81c5940e46cc7bddee28f16bdd29a12a76344
[2/8] PCI: endpoint: Add BAR subrange mapping support
      commit: 31fb95400451040050361e22ff480476964280f0
[3/8] PCI: dwc: Advertise dynamic inbound mapping support
      commit: c0f1506f63546308e894469ceb0f1fadbdf9d2f9
[4/8] PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match Mode iATU
      commit: cfbc98dbf44d52738976f592f30c2ca6bb282939
[5/8] Documentation: PCI: endpoint: Clarify pci_epc_set_bar() usage
      commit: 7d857a3f517df4591d4c85832c4ce5aeb0ddc038
[6/8] PCI: endpoint: pci-epf-test: Add BAR subrange mapping test support
      commit: 530e3701a81b228c369261798ce1b7f63f5d6c08
[7/8] misc: pci_endpoint_test: Add BAR subrange mapping test case
      commit: 622e1ad5e49c6949dd8c97d71f609bd17cfb8813
[8/8] selftests: pci_endpoint: Add BAR subrange mapping test case
      commit: 0ebf8e7943e01b2c38c199228f51adbb89c02425

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

