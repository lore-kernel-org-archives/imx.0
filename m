Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCDD72624
	for <imx@lists.linux.dev>; Wed, 23 Jul 2025 15:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753286255; cv=none; b=ZI0b9s7tfPmZu1m5fNpaHjWjBo5Fpjh9+yY927rzb9TW8NLu+NiN3TFE2TgejnTiSajD2RKya2YmAvtyrQDqZUKQKXNt1F9aePJYS2ScRdnI+ZtOsPpt/wpMiaJQTJUVJibRQQ91HEhhhwcHuJl4NAYZULTZOXjqRun4XdQRTKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753286255; c=relaxed/simple;
	bh=2Lu4l+b66ZqRwcHiTle46y1MR/xDZsH3kzwngLbEfnQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DP8Hu17H3im4810WtIUj7HAQNWT3q9DDhDLjYCKeGiXwgw2NTRmlf9I+MVajuA6pEhP0Amyz9osmr2XPY9f1IscYV4mUcpQdT28m2zYd78koh875Fie7udhHXwPk7l04aMXFucn3nfvt/MNcDMuezMMgaXgGAyAQDZbJMeV5sNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVCYvSH8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVCYvSH8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N90Fr5024516
	for <imx@lists.linux.dev>; Wed, 23 Jul 2025 15:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YtkieUEHX0j7NOkthBC+xkyEn4NoDmNOetl5nOn3gOo=; b=OVCYvSH8JEgtNcW/
	Hvr2RshnKt96aXumsRwK3VvezPHpxY/onja3yBGT/IIGtR4nCEtkaMEiF9WPjedY
	RxXqoKh/FUtVddKCdpSrLF4y9RJZB01MLgZ/rRAe2ly5cMVB2Z8fnLGPYCOBNqTP
	XpV1ECegQvR6l9sXSKPVXdLEe1kXrJurmsK0Qm5i8pWu0F0VxkFOkz1b43Kzes/o
	0FcHb6qpslb9VTVWj6+vI3yrnAJ0D/+owCPz1JLCMn1Oo1d9/MaoE0fU2gr0Tad8
	2owIPQUk1tZMp8dVnpgVvP4XWUisK/n8k85PzPvDWSt/y+jZ7hgIpSLoXinwjCOY
	Brvz2A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ucax2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 23 Jul 2025 15:57:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab76d22670so799791cf.1
        for <imx@lists.linux.dev>; Wed, 23 Jul 2025 08:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753286252; x=1753891052;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtkieUEHX0j7NOkthBC+xkyEn4NoDmNOetl5nOn3gOo=;
        b=F3GErfUHD5fPosvZ6+/ByHtFEsL7xpJTdJ1603FbLnEsAPj0UObdMOpPXsoF4lgncD
         w1KutV7FuNyu+bDtLiX9GCeYCeTna4YkimH9mAWGDj4T49IPNWwT6+KkCdjkPFcGiFWi
         6OasC5qOA2/XJWvJyMu1A3v5lmdMB7m8rs2w1vCpWMDON/2NNR4ofCvZt0A+H9qYFQzs
         C+6SEQSqBGB8Mgl2w8CMbEjdlHnQW5tyvS2j5NOXO11EJ3S+iaV+u5Mk7mduJlb/qnnf
         Fkmg9DHkRS4Nq2yBZqiDiuR6o8hx3lsFwkB3NRj4HFMXvVMLLjoRG9HR1HnW5QvFmu5g
         53aA==
X-Forwarded-Encrypted: i=1; AJvYcCW16xYWfDjUuepWjbjnA7HlUYp3buoIYuM88ZIGzNvmz15H1w8OUxcNg9Te2o2XqACzt3Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTXLlHN2LJ0P8WET4vH9etASloFprQz8e2CMevQyVp53se0dG8
	R0od0UnmsdyAp3jbMDcVhUCdtxUWROByIJJ4VGn0Z0DTL+A+b9KEJuXhVh/L5EFSW1+r978wP8A
	sxSATXhp9t/Nf7eVF/ceyZC5zy55hzfaozRGMLT5hpu3f2VkTrn941Tg=
X-Gm-Gg: ASbGncu4MA5VL6dcR4/vUc9Bc0KWWBcl7rpW9HWwAsqx8wvsMLcn+xHVB83Yo+1V1Lx
	U/oOjGI4l4U5LpymWw5144weZEM2reWa73TQ5mmh/OcXMC3L6TY0Bta+Vt/8DoapXfzTPRg57jM
	nP+b97QiuQt3UEHFRc5E4sStUciRPj7JDmmP0LLcUR7dNcmoSoc+I+SvBltpMwnXiGN1nkFdiOP
	3D/cyr/RgTmAyjITrfxBXed9G2Yfvlsd4d+QHnJs+BoELtyxiLVf840iDF4/f8vqnLXRD2K1AhS
	msLZIZM5jcdhCOv0dftXWmLtxDfpfk8MljA=
X-Received: by 2002:a05:622a:1482:b0:4ab:5d1a:93bd with SMTP id d75a77b69052e-4ae6de8785emr46129111cf.23.1753286251755;
        Wed, 23 Jul 2025 08:57:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENrtc6QBbO0UPOgNoyMOBayciVcsK2EoG0Ya9QJi7FVg7P5WTjyM0W0swWYhkBXSIiTPi+sQ==
X-Received: by 2002:a05:622a:1482:b0:4ab:5d1a:93bd with SMTP id d75a77b69052e-4ae6de8785emr46128651cf.23.1753286251322;
        Wed, 23 Jul 2025 08:57:31 -0700 (PDT)
Received: from [192.168.1.17] ([61.2.112.87])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae5c52c3d0sm24709271cf.26.2025.07.23.08.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 08:57:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
        kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250709033722.2924372-1-hongxing.zhu@nxp.com>
References: <20250709033722.2924372-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v4 0/2] PCI: imx6: Refine apps_reset and EP link
 behavior
Message-Id: <175328624589.28758.7232251472383556230.b4-ty@kernel.org>
Date: Wed, 23 Jul 2025 21:27:25 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=6881066d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=L2vWZV9GmkZVUxua0bORKQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=L_pc-btOT9_bO7MH69IA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDEzNyBTYWx0ZWRfX8GuiU7CmrkBc
 ovVZwBpuc3H5DIU34NlwuiHk7Hf0brZ8bwZH8GNJsJ0PVbrMmKgN8+71AVGwhy/PrfFLswlJoPz
 B/Bya2aPgx0GyXjjZZyKkFLvcC9OAm0uzf1WcLqFUWskkOnxYjnuf2MDI8YGFk2c7sagRoJUaZa
 VrnoTZXtjYelUNxRTrbIO1N9KK+52cOijjrb1ZiV85jvlB4uqMEAZ9HBQPlE9Qvzig8vzdbB2Qi
 yqo5l1XDpcmVHsvXQyIzn7AHBBY1ykWD1pTKpX60viiV5wR+qlUTy1XSj7w7dIBjwuhaSBYk5ew
 bITsCIQvIa+akgFivf3RpOQEv4vz3UnOp1xjahvu3Vtm3L2dOVdBGbIN7CfNV1z3XZGY02NJuIs
 HKBiWDNcW9JjJQI9BRH8f2aHhES7VcXV3tHue+/gSPTrw86gC+rsppfcqoF/u/OUcVLzUJoL
X-Proofpoint-ORIG-GUID: GGFKJ29lT87mDLCtOJtLGrwqgru4anCb
X-Proofpoint-GUID: GGFKJ29lT87mDLCtOJtLGrwqgru4anCb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=588 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230137


On Wed, 09 Jul 2025 11:37:20 +0800, Richard Zhu wrote:
> apps_reset is LTSSM_EN on i.MX7, i.MX8MQ, i.MX8MM and i.MX8MP platforms.
> Since the assertion/de-assertion of apps_reset(LTSSM_EN bit) had been
> wrappered in imx_pcie_ltssm_enable() and imx_pcie_ltssm_disable();
> 
> Remove apps_reset toggle in imx_pcie_assert_core_reset() and
> imx_pcie_deassert_core_reset() functions. Use imx_pcie_ltssm_enable()
> and imx_pcie_ltssm_disable() to configure apps_reset directly.
> 
> [...]

Applied, thanks!

[1/2] PCI: imx6: Remove apps_reset toggle in _core_reset functions
      commit: 315b747ae6b07ffabb27ed8ca584e6e6df8050a5
[2/2] PCI: imx6: Align EP link start behavior with documentation
      commit: a43b68bc510aa61a5b7618c79784dbc83074e504

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

