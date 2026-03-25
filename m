Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CDF3CAE66
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436954; cv=none; b=HOIw6dqZK5XJuerMlRdOR/El4wM8cJ5sAGMHQMq4dTPIaWItgWNHGBfuM6OQdnf/K6AphWMqNT2SWOXv482/ypRXEs9wMZZxjK0zpVMDXPCJPQA3CCQbMajTAbdX+WGGaDryRCq8B1z8v7poZjHr0W7wGbPsoZL1MJOliX2lg+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436954; c=relaxed/simple;
	bh=b8dYo16XmJ2xon8GV97URYfm4xZzwK4rrsPqdHa33Kk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eyhdum0buN+fx9KbTUgP+yTzPVtFUQVaVOHR0V73lSKoM10ueSYqNpFtsxxtm/VPPPgEFl344F3Sna+7YccRCjgw8Q4t9DLIevIIxemsGSGFkX1EGE2OOonWI4rp2avIg/+rgweIc0MSpK5nHXJEDmO7yyAd3KjTZ0yVwFes8vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TiMEGExk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jsQINlRD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiMEGExk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jsQINlRD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P9CwQ74158032
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 11:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0xsjrEryjWzRb9dOuIF+d8
	yzYCspWSHX+0TlzKhGxRo=; b=TiMEGExkVM9gpL8cmTL1Y1MM+EHGdJ2UifJ7G9
	+3eMUGbdKh5bKay+aRyF7hZyOgk2/v+Ic8E2ObTbeV+5jRc5ljbjfAM366mDRq8Q
	p/c6wKlT8DwRmmdjtytX4aZYLV7FsCQbrWiFiGIpvpHTlh5XQb3KFsSTaCfYpqqM
	1rCSphJtlm6zmKIuCrM6PhQAdSYH04ZNY7qyz3M6fxBj7kufweRkpHTvNuLf3B1e
	yNKDTM6ys0BdHBaZOEU0o7H9qmFXjVMSR5+KcOCSliemYOsSFSJRINAtb+096EuP
	x2tFAR5Nr6nKw8fI7XAcvpCn1JBCNK7ldq+j0SS2gOpp6XTw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp0epf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 11:09:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a88a2704fso581205b3a.0
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 04:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436951; x=1775041751; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0xsjrEryjWzRb9dOuIF+d8yzYCspWSHX+0TlzKhGxRo=;
        b=jsQINlRDgY2dwkmWC1e09vJ1UsP+N/jv40RJrNBCJIb50PJyaDttDRJmICruz/ELeG
         V+3/UhTOTZeMdShWbk8B7H1I0rxJPpBbWq7yM+jy5gq6i2ujw0GLAzqk7kssrBz8l+St
         8EwEdLriQHSeRoz1VOyyO13cpqPYnvErNDYUrFjkvBgq8fxfdjL5tP6N7+58DrybFt+w
         7sdJLNehPerPHPBZgjrWK8Yk5xLm3psrHb08XRrfH5arSE+iGxCYGBuWNGgSU5qW1GLv
         sWTNucC14pTnjvNixbIX5DIWIf9q9GI14flUPINIrAd5Pvbug4d+jco0hrWlQwZUSzSj
         FpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436951; x=1775041751;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xsjrEryjWzRb9dOuIF+d8yzYCspWSHX+0TlzKhGxRo=;
        b=Gcdn7ZOGW5bx1FWFS3MztUbkQVf+i0Vie54Gxy35qPd4N100byrqYn7oNsOZqNwQRd
         0AiWayPFRND1yCRiD5Xz+No2nwNDJo0X5hZZgB0iyfuigHA6if/JMgXhiF6kRxp/WxCX
         xbf7+zOAObBMuqeNidafJwT+juov8j1OsmIxKIH43wmXYT32g8vKrpytb1uY3Jt5KVkR
         NG0u84TM/sEl8YWfHIYsSs+adUuIEKrtuipOnZFiy9Dxy/5aysE+QmwY7pbvfKPryfR5
         /FSfoWRGJKbIgYR+mDnQZeO5mUL2ysWo6lejEJpbEKsZUo2Ziw95QzNw0t+U1sD4MzcJ
         unhw==
X-Forwarded-Encrypted: i=1; AJvYcCW/Czn00BKKEQKntiSssZQ3uecPkH2VahMj6lNlS0Ub1z66HVUQmcoWEuH/w6j0EDvsr1M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZGv7xnyOiEjyibnNyy5vkjaphgH3Fst4+2pjxfXd4iHCSQiB8
	eYcz5pzm0vnvRbmoCzon8+/+aAReCJ1MMFN54Zbhuq+D7IUcTLFYX3NSjlPjbB+eFus0z2m1t9e
	yl9yB2FTQfMG+k5gdoSWXzOOIFMksRgV0iAVcqump7cSjlvSMIp14qHE=
X-Gm-Gg: ATEYQzyoYSGHDSPYQA/HXyxgPH3wLEc4ohY8DpIFSJz3x25OyyYncWHzWyiFXsutEEa
	EfQoS5MjNg2qHGNY8rAC4f30Fa3U0gdzJIoqvTZpCV9ZE2nqksJlAF2mAKijqKFnvPa7FSwmi4r
	NKW55Y1n7SLjY7aLd6SgigkUKn2+6KocbUJ10qeFNN/ksPjwpGedStUrCltp7cgMiarvQT2aGCj
	sQuHFkHOihp89ABuTBY0pHOeH15keNbOmsIHl1d017CftfhZKF0GSUhp3mSjugycoQbiyv4ef7d
	NRdRp8z7pRTKNed2DwpMqJiOP66yr6aWe2yzpw1mk8+oe6u8NFmO7ue5bd6SsStj/TB5cVARknK
	hO68QfUzY0oUXDijBmBjM/3Mtvtxl1EMu8QPttviCUY3hvFTXiza69c0v
X-Received: by 2002:a05:6a00:1787:b0:827:2ee7:baaf with SMTP id d2e1a72fcca58-82c6d88a70emr3157419b3a.12.1774436950331;
        Wed, 25 Mar 2026 04:09:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:1787:b0:827:2ee7:baaf with SMTP id d2e1a72fcca58-82c6d88a70emr3157358b3a.12.1774436949724;
        Wed, 25 Mar 2026 04:09:09 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040da7besm14615911b3a.49.2026.03.25.04.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:09:09 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v11 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Wed, 25 Mar 2026 16:38:21 +0530
Message-Id: <20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACXCw2kC/33NwQ6CMAwG4FchOzuygiB48j2MIaUUWYIMN1k0h
 Hd3cPJAvDT5/7RfZ+HYanbiHM3CstdOmyEEgEMkqMPhzlI3oRCJSnKVKpAjWseVNo/HVBH3vZN
 AaXrKC+S6RhHuRsutfm/o9RZyp93L2M/2w5dr+0/zpVTy2EBNzEQZw8U4Fz8n7ClsxWGIFfWgf
 qVyTwIVKMqTlhAzhKbYoZZl+QLpzPWgBQEAAA==
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
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774436938; l=5530;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=b8dYo16XmJ2xon8GV97URYfm4xZzwK4rrsPqdHa33Kk=;
 b=J08zhEYoQn9e6bd4Kdzzm/0wjHfQUzVEJmTADcUj7e0wpazI3gC2Wl0RNNsNRBF8E/PVwFYJS
 bUPHaafLLEtCBMQtzU4gcpBawAiyPFytdIVdxsjxMVtFcpymsXi/9KL
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-ORIG-GUID: HItbMc1jq0Hedic3G3qotym9TnIPmc4i
X-Proofpoint-GUID: HItbMc1jq0Hedic3G3qotym9TnIPmc4i
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c3c257 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=w9jVfKxUgDq0yQD5sDkA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX2Ry6sGHI/kqb
 1/N5JpPqQpSLeNx/S/JcvOCS6QACSkSS/AYMsYbgUofBtdjp9lJowclEFBYAm1MUV9brBGs2XZt
 oAphiOsqSQNcKXt+nPaUVTmHDyNxAhq9cZ5jB8JEae78apM4q/akBDm8OMZdJ0URJHdzLJU+sUn
 2i+hV9HmhXcEuI3C8hJBa5B31bulGSUOCP1vMNLdrAlUitUZeqbAK1Rol2SPM0/sLaTiY8/KPHE
 039xd4rK/nNs/zl4BpjJhMvjIob9QE3BGEBYbzTxx4l2cbl3lAbXEhXgAZDD6M0k25/zSU5OSzh
 HJK3LsmJe54VS4bFwW1J78hbgm0o0hFFDNYpSVIMSS4OEWUmETMYYvj09ru8sxlOBC3U2gI3uJY
 yiOMSDZSatc492kiKEnfmxJlwJxtxFXpEnZVYu+Cf1XDCrDqH6HaXTjjOIfLMgeONGi+Q8pgc8T
 VGBja324yXYPxzUDtIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079

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
 drivers/pci/controller/dwc/pci-imx6.c    |  18 ++-
 drivers/pci/controller/pcie-apple.c      |   6 +-
 drivers/xen/grant-dma-ops.c              |   5 +-
 include/linux/of.h                       |  30 ++++-
 9 files changed, 237 insertions(+), 71 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
-- 
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>

