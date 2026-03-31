Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113C93F9F45
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 14:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965914; cv=none; b=owoNrZ3GFUeyRRWf+yceAZGsAQlnGaGCbIBwOCKFeE5gr4XoIZkEHXGrdkLbUHJXj0CuTkcX1SAB96CYvgI4JUM+gIjF5Xdxt1Fh31CqRXyeZi3BWrHeqnxHaBFa+Lm66I7nBvrFMqG9qyR4XqON1snkAE3n5I759jI/o6g9CH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965914; c=relaxed/simple;
	bh=P2NjOwOfDO9uAKBSdnt+bXSNB/+yNSJiXlluqOTEHNk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l5RR5cmx8gkVwKHQ2VV66EQe4iDa6B76/RQY9QWmMEgrigdTpuR0Vjqim+dRlxrPQ0gJ63Wr78ckm7nXE295XnH2v5QhxkR5Vs5YXzs/PL4EgkdOLceHVMRirvgzflxDQXuLV9X3Li4lgtjoLouT41yetJZYN5cn6uJI5zv4QKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+CZ3OYj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBZrGTDT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+CZ3OYj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBZrGTDT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VCQ2JZ2164237
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 14:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dF4Obv+MCSq8YX0P9fxlsK
	GDvf3O7jRLPn7ezaYrn94=; b=o+CZ3OYj5iT9TfiBJQQTNFVxOHbunQR1j75oeO
	V3YExJ9yt3v/berszKeoWhGOTfi7pdx2GszMQHo48JYAU4vMf8NDj8Qol95WDQtj
	kt2T2qTsSbyWa8Owfkr7utvtrdrH/tohASWBGdMgXOFCECs/gQ6G9iGT+CX3Q2Xc
	MrxqC4EpUdV34HwujWpWIX33DvqEuY1v2ktIbSrDFlRavZFTK/mi9G45ugA5VxS2
	4p7HP8tJJewyZqCsT3WLyCNuBgjgDqmXvj3RFLnzpkGM8rO0prd3v4Kyh2YFupV0
	cMO3ds65t2hoqTNMhqZklxT7/1qmTsjk7AFjVByktZZBITRg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ga1upk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 14:05:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23af7d7e8so126264855ad.0
        for <imx@lists.linux.dev>; Tue, 31 Mar 2026 07:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774965908; x=1775570708; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dF4Obv+MCSq8YX0P9fxlsKGDvf3O7jRLPn7ezaYrn94=;
        b=dBZrGTDTyWuRWasXyGqWfkw7F7uk67UhD5DfyR6l1h0UHZw5kejkoST1tcU7hOI7et
         F+89n+wML2hRwKWA5dIRYcCKo4yyUZBULLcH5rOxE883/SwqEHrzawpvRp2wiU7H6oWM
         C4h0uWcvvDg9HX3hMkPda3z1Mb597kLI0+QC2bARtPK1AWINA/lwpCBj3jAamFAmE695
         hQxFJcTrIQ3+y3rUBPtFs8XOkBUO0Jinscz+MvdCUfWrU8W7QlXmUY8PxvHNn5fIXINi
         GHmohHjEHibVfP5BmX1F8bWWWvkrE2VXzvBlzIGA4h6k7XaMaHI/fU4UfHrwVkuQNHEb
         VB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965908; x=1775570708;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dF4Obv+MCSq8YX0P9fxlsKGDvf3O7jRLPn7ezaYrn94=;
        b=IYfkzmiXLi+aMSzEQk3XwVJwAiJnIgN/oLTWKMSGyPfjLI+lSHWZZ1ttnBOsNKwuxx
         vtYdxHHBwsQFQINoxioVq1m4/uBlgIQMM15+JJUhTrtnDe/W0r1WRLgjYG1gMXS4w5os
         18LSKEXIK/5zJkl5TKxQX2aD2VdQtWIYyR8UOm6EJwf8ZL3Z8k1b54jKCKevEdSRV4rl
         LYplw8KU8bCDBTDBC2EK4aigcfbixLenXvOkf7ZlS18+wKX6P80lMxcaXxoy1l+cz/tS
         qJLXi6IHDKkDLuBLq73veHpOQHkQat2+PNVYPXE+5yQR4xAiajaHCDeHFggTJCtaqMXd
         RdlA==
X-Forwarded-Encrypted: i=1; AJvYcCWeB/1+MKKX4Y139+TZpiyAaiNEpwoYZFhGHhOx4MgRxrSE1ru9C/MAA/cVIzS12RrXW4s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4xgM7AqykYBXgyd/WWTy8B667hr3/0attibIpOkLyaVB9pTMI
	FGAqM/x9CX/pt7JsAfcB9YSNdgrYyS0Z597bN2L/fk9n22wdYrBoYRnBpUch/TxcJqxMFClmhfl
	RsuwUKaYStH52pv0g+gRdgcjK8biRCFyrzWc54sMmJMGYgbp5jEweVxo=
X-Gm-Gg: ATEYQzxI0oMzHlJp6AwTeCYFHpsqkgVKg5wTPlrDnvOnlVwebZ0fQJJR3xhCzbMvZ/W
	kdOdIqhrW+4XDliSXRIQ87Cn1QEpkjT/k7baO5SKOeizuC6F7zMqDHVk4WLXrrUuO/puhAjLH7T
	hhsUoufPf1mHhHnvQwbx7zrZLR2j8GQ/s57ZpvmbSQ4Fi9PfVpvBS51YVbMbdOiLV/XpMxWPpUg
	VQWmPC539y76uZ5LBB/wmLIIjvQbBNyHwULpzEvqAmvum6/UICmDBSaszcbrD/kzwlKO9MFnoqB
	QnJtd3EAERpwrZNfhhcPr0qc0jhu5U2+kthxTRboG+XOM8TzkZNmTYa2grwfAWaWI5kgalE//1o
	4IV1HRs0xsBZesYBUv54y8OyWM4tahv6r99YH+xfmm+KW/3A5Cen/2FH4
X-Received: by 2002:a17:902:ced0:b0:2b0:c2d9:270a with SMTP id d9443c01a7336-2b0cdcf0019mr180935835ad.42.1774965908082;
        Tue, 31 Mar 2026 07:05:08 -0700 (PDT)
X-Received: by 2002:a17:902:ced0:b0:2b0:c2d9:270a with SMTP id d9443c01a7336-2b0cdcf0019mr180935015ad.42.1774965907346;
        Tue, 31 Mar 2026 07:05:07 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264292asm118311945ad.4.2026.03.31.07.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:05:06 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v12 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Tue, 31 Mar 2026 19:34:45 +0530
Message-Id: <20260331-parse_iommu_cells-v12-0-decfd305eea9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3Uy2kC/33NwQ6CMAwG4FchOzuyDkHw5HsYQ0opsgQBNyEaw
 rs7OHFAL03+P+3XSTi2hp04B5OwPBpnutYH0IdAUI3tnaUpfSG00omKFMgerePcdI/HkBM3jZN
 AUXRKUuSiQOHvesuVea/o9eZzbdyrs5/1x5gt7T9tzKSSxxIKYiaKGS6dc+FzwIb8VuiHWNAR1
 FbK9iRQnqJEV4QYI5TpLwo2lI53KfAUVFxhTIpTTTvUPM9fQ6NMd1ABAAA=
X-Change-ID: 20260301-parse_iommu_cells-1c33768aebba
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774965896; l=6029;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=P2NjOwOfDO9uAKBSdnt+bXSNB/+yNSJiXlluqOTEHNk=;
 b=66lmuzH48rtm0FKXbMJnsG4s1A7Kc60A/4pJcguDLuPcx0lroADqyzlA9wif2kvUXlYq0+jLu
 KAnx76iLFtQDeoanD5WsP5LMaqzqXOX3e6iR/p1Nc5+FJv7Y4Bg5pDi
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Authority-Analysis: v=2.4 cv=KJpXzVFo c=1 sm=1 tr=0 ts=69cbd495 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=w9jVfKxUgDq0yQD5sDkA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3mZuaulejMdVT0ZsT_boW1qRIL-adtwm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzNiBTYWx0ZWRfX4k1sm1UNiYuR
 4eDpNM/3We7YL+GCH9f9PNA+BAGe+h4pxpMUUQDYeeQCYzEhhYBFeN7HwT+DVeidSNK+KZhw2mt
 NkqY6tkxOF6UYD6DqlnfpET/fx9OhPMZsVGRSC5HXsLDb+ypVaWVEiNHVcdyHQib9zpzbZ/6DHa
 bmVflt45GykiCQX5ajFbSMtIA0C54JTgKX48SHnY/NIL4Ikw1iu4GBF/kH998368joVWTy6G3+s
 8EYRfWG/JTs7dMiZ74LbnxnwjsrDncjObLnvxzj96OzQFC3I3hzTflN3Q8QmEaDLvSOxnsKtnit
 MwMbCth+Xx2XqzAi6vS8TQBlgBvvc4XGwGTKjA5mGB4pIDjDWX0qEK16D3VGVkG/lYPXRsKSNsJ
 rMtoHmFL9LWK/27NqxXdbaC5f0NNgk/5kmEyHGu/06BqYWZmLUh3y388S611KqhGJmF4zFWfjMa
 Qd80LZxCHmBihfQ/qVQ==
X-Proofpoint-ORIG-GUID: 3mZuaulejMdVT0ZsT_boW1qRIL-adtwm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310136

So far our parsing of {iommu,msi}-map properties has always blindly
assumed that the output specifiers will always have exactly 1 cell.
This typically does happen to be the case, but is not actually enforced
(and the PCI msi-map binding even explicitly states support for 0 or 1
cells) - as a result we've now ended up with dodgy DTs out in the field
which depend on this behaviour to map a 1-cell specifier for a 2-cell
provider, despite that being bogus per the bindings themselves.

Since there is some potential use[1] in being able to map at least
single input IDs to multi-cell output specifiers (and properly support
0-cell outputs as well), add support for properly parsing and using the
target nodes' #cells values, albeit with the unfortunate complication of
still having to work around expectations of the old behaviour too.
							-- Robin.

Unlike single #{}-cell, it is complex to establish a linear relation
between input 'id' and output specifier for multi-cell properties, thus
it is always expected that len never going to be > 1. 

These changes have been tested on QEMU for the arm64 architecture.

Since, this would also need update in dt-schema, raised PR[2] for the
same.

[1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
[2] PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184

Robin,

Could this series be pulled into an immutable branch/tag, if it doesn't make
it into the v7.1 merge window? There are client changes dependent on it,
So it would help to get them moving forward rather than waiting another
cycle.

Thanks,
Vijay

V12:
  - Call of_node_put() unconditionally in imx_pcie_add_lut_by_rid()
    thereby addressing comments from Bjorn Helgaas.

  Link to v11:
  https://lore.kernel.org/r/20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com

V11:
  - Added explicit filter_np parameter to of_map_id() and of_map_msi_id()
    per Dmitry Baryshkov's review feedback, making the filter explicit
    instead of overloading arg->np as both input filter and output parameter.
  - Removed of_node_put() from inside of_map_id(), making the caller responsible
    for reference management. Updated of_msi_xlate() to properly handle reference counting.
  - Collected ACKed by tags, and fixed minor typos.
  Link to v10:
  https://lore.kernel.org/r/20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com

V10:
  - Move of_map_iommu_id()/of_map_msi_id() from include/linux/of.h to
    drivers/of/base.c as out-of-line helpers per feedback from Marc Zyngier
    and Rob Herring.
  - Add kernel-doc to document both helpers for discoverability and
    usage clarity.
  - Fix of_map_msi_id() wrapper and all its callers (cdx_msi.c,
    irq-gic-its-msi-parent.c, drivers/of/irq.c) to correctly use the new
    struct of_phandle_args-based API with proper of_node_put() handling
    as per feeback from Dmitry.
  Link to v9:
  https://lore.kernel.org/r/20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com

V9:
  - Updated TO/CC list based on feedback to include all relevant
    maintainers.
  - No functional changes to the patches themselves.

  Link to V8:
  https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/

V8:
  - Removed mentions of of_map_args from commit message to match code.

  Link to V7:
  https://lore.kernel.org/all/20260210101157.2145113-1-vijayanand.jitta@oss.qualcomm.com/

V7:
  - Removed of_map_id_args structure and replaced it with
    of_phandle_args as suggested by Dmitry.

  Link to V6:
  https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/

V6:
  - Fixed build error reported by kernel test bot.

  Link to V5:
  https://lore.kernel.org/all/20260118181125.1436036-1-vijayanand.jitta@oss.qualcomm.com/

V5:
  - Fixed Build Warnings.
  - Raised PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184

  Link to V4:
  https://lore.kernel.org/all/20251231114257.2382820-1-vijayanand.jitta@oss.qualcomm.com/

V4:
  - Added Reviewed-by tag.
  - Resolved warnings reported by kernel test bot, minor code
    reorganization.

  Link to V3:
  https://lore.kernel.org/all/20251221213602.2413124-1-vijayanand.jitta@oss.qualcomm.com/

V3:
  - Added Reviewed-by tag.
  - Updated of_map_id_args struct as a wrapper to of_phandle_args and
    added comment description as suggested by Rob Herring.

  Link to V2:
  https://lore.kernel.org/all/20251204095530.8627-1-vijayanand.jitta@oss.qualcomm.com/

V2:
  - Incorporated the patches from Robin that does the clean implementation.
  - Dropped the patches the were adding multi-map support from this series
    as suggested.

V1:
 https://lore.kernel.org/all/cover.1762235099.git.charan.kalla@oss.qualcomm.com/

RFC:
 https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/#r

Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
Charan Teja Kalla (1):
      of: Factor arguments passed to of_map_id() into a struct

Robin Murphy (2):
      of: Add convenience wrappers for of_map_id()
      of: Respect #{iommu,msi}-cells in maps

 drivers/cdx/cdx_msi.c                    |   8 +-
 drivers/iommu/of_iommu.c                 |   6 +-
 drivers/irqchip/irq-gic-its-msi-parent.c |  11 +-
 drivers/of/base.c                        | 213 ++++++++++++++++++++++++-------
 drivers/of/irq.c                         |  11 +-
 drivers/pci/controller/dwc/pci-imx6.c    |  34 +++--
 drivers/pci/controller/pcie-apple.c      |   6 +-
 drivers/xen/grant-dma-ops.c              |   5 +-
 include/linux/of.h                       |  30 ++++-
 9 files changed, 240 insertions(+), 84 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
--  
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>

