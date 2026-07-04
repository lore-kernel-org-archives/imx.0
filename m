Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6BC288C30
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 18:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783189958; cv=none; b=qJGY64pC1PejmD2xDw0Zd4Ol/QdjddqsQoKWEFx+vZfUVSzoEIBuftiL4Ac/AdI2rFnvBUAdRMfNyyklWmrhWB7mwyLVBWeeg+my4r/veNRuygNDS/+7KeUVVUAZbKGJ+CubSJnz9yBtWaqqcLp0SyavPmGaNJxINtlaTi9aoEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783189958; c=relaxed/simple;
	bh=a3oJlDmIy4JLxHP8+Zy827sxSxkG1qtSrEiIUv8u7fM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YS8kfoc1XL1SqIY1JNmfeHkiOib1rbIKR0oxyTFyIGXeWGiY5lAiPFdWTSXN9OZAevYuAyhkzB+UOqNeO3zjonc69SWwkJosmOv+JAmG0e2YHojCDno546anmZJDFwmYsyfONi4OW3sq0Vz2MopTP2vXstXyfH4SbDUhh0c1+44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSEUNTWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C5A8TVw/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CSEUNTWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C5A8TVw/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664G8SBM3272764
	for <imx@lists.linux.dev>; Sat, 4 Jul 2026 18:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MltfzpfpaLuZDnkNZx+Lb6
	VWJ4GPL8eKrD3GSx0ATGM=; b=CSEUNTWN1DlO1mccs9tBOSMPvsm87QKPUuehKQ
	4K6kTjt1FKnv2ec0M8Ysv/X+5cdqXiRHqij/ORCYEDmUr+Lvfqi2Bb10tvUqlWYK
	6bUxEtHDeSVXR1YlKacaMujOYA044wSdNr9b9B9nlb84ycDuDYWoCL+A2qahMRDh
	QaXY3ntdMFBxDIr+RrCRCbj6/BLG0BZQLRU8QJzw6wEZsRPcqLF+9/q4Kr6AjCvh
	6HdIKJwHHUAO8X324yL3sIeCAbzFf/FbdmaEFj/XSnPAux4wnR7Iw7HkLjguUK31
	c2tOSjRDtb3pqINNlxcgrFkpU1+GI/Hxp75MpAT7pOVePlMQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8haw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 04 Jul 2026 18:32:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8478ff5d801so2819316b3a.2
        for <imx@lists.linux.dev>; Sat, 04 Jul 2026 11:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783189954; x=1783794754; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MltfzpfpaLuZDnkNZx+Lb6VWJ4GPL8eKrD3GSx0ATGM=;
        b=C5A8TVw/mtKqTMaSS37uviNOmURIw8rbzUeh4hITnMc92a3gKZGpcnO3/BtdmXLZwR
         egNtGdpuI6nRyEXf7Oo/hxnqktdPUj7KJSrBQSrwD88YMdsLhr/XDtFjLy05qudJphRQ
         4OaEvV8EZHK3FKyykkayF6eAUMsvJBO1WScU+Z/z0vXs2KaaviDWS35/tZ9OorqlgaoX
         loZf93x3TUf0vopAO4uIVfd4R3wq53TFaPb1UqOViRUe3WAIu5Gi3Wl9PJkTjT94YsBG
         B42bsimn/z8O/R/F/92PuJBYSEgpC+7yR65zjVIxhFNFfMRwAyWOGlZx4uVkeJ1HrdU9
         288A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783189954; x=1783794754;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MltfzpfpaLuZDnkNZx+Lb6VWJ4GPL8eKrD3GSx0ATGM=;
        b=JaKow74alpiNeqYICOdjgE4hhk12BfjJPzpgX2ShUeMsaMFi2e0nQPlqkrS1ua8BMx
         /e/S7IcFMWNC/0FAVUIP06A7PSO1NlMSSnbf8ru7agoV1Glo1lzJw7inNI9aulcr5L6J
         dxvCqUvVxCHlYqM1YwMoRyzm6SF1dyJXCnHUj+vLwrMqSHnLBelfNymwL/z+aAmqh2Uu
         fR5gKxUN/qvzSsCLMkPFZqCfr8CRBKH+rxD+HATPepfbL4fVqlHd9Phw+b3puqhyfGpC
         BNvTss3noqabgEot/UiXXhAkiYwUN1quFdL1KYYv3a6j7YhouInLlLjnn8b0OtxXANxc
         N+oQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tg+crW5bt5Gh/spvBLkofzDiie2qInNqaxAviCDA9lLH4P/UWKEEz4MOJwGxWT4Mu0gU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwudGovK4YGjNYNi3K+4rzByYNLAoHg6nTjY58vAuzZrZN84fmb
	iPF5lfj4AlI0LVQ3zcxVHU/1oppS2lcbkL4r3a519g/zvH3tzOj7cxxL64S1ppaXUr/Bg/kojKC
	NPwy9nt9JpOX2p17Lgdv4kMVuqReCTVA9hba8ULqwlAt4EjFvGxt9BK0=
X-Gm-Gg: AfdE7cnewAVPgU03N8DJEZP7skoMOa6J2n3tfQwvdqLfnrbSn/l8GYOSVGy45i6YiI1
	MV4QBjTlzqVIxsdke+ElZ4oXvppiUxUmI4DaDF4XVwtcbD9gGSNCYmI5Zwae0weo6o2r4QiQiWS
	sAyqvMQuaLM+Eb82KTu/RQIw8V5p8/vS9yaOt1kpdXBrJdOZDCmymPGjdejlRbQy+LVGsC5ixAx
	YDtcqpsagPjahkmZgGOwhgiq0zkQWN2O9xpFgfEVzkO6sG1R9GYXIuQ+2YNWihNlsRCy8vNE/Eo
	ubidxyAEq/k+dAdb2n3eJ/vQyIGOx6QnKKzMChIplhPKq+SnclPT/IIbgrZCgnSM707S/XLDIDj
	g7hEakGLtPWE7+nu6ZntF0zQ=
X-Received: by 2002:a05:6a00:1881:b0:845:ebbf:e7be with SMTP id d2e1a72fcca58-847f6dd3dd7mr3575647b3a.23.1783189953626;
        Sat, 04 Jul 2026 11:32:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:1881:b0:845:ebbf:e7be with SMTP id d2e1a72fcca58-847f6dd3dd7mr3575622b3a.23.1783189953074;
        Sat, 04 Jul 2026 11:32:33 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 11:32:31 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: [PATCH 0/9] drm: replace simple display pipe users with atomic
 helpers
Date: Sun, 05 Jul 2026 02:31:09 +0800
Message-Id: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr0Jm7SRtNRC5imFRyqijFLBTCAnh7
 rbi8iX/v7eBUGASqIsNAi0sPA4J9KkA97TDg5C7xGCUKVWlLtgFj8J+6gnfXjCQHxfbo9JWnbU
 rrTZXSOcp0J3Xn/jWHCxz+yIXs+2/CPSZUzEeM2itELrRe451kTsDrRFzGVWJpoJm37+GdJ5Cs
 QAAAA==
X-Change-ID: 20260704-drm-simple-kms-removal-01a031c6a129
To: Alexey Brodkin <abrodkin@synopsys.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        Alex Lanzano <lanzano.alex@gmail.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Ze Huang <ze.huang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=3497;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=a3oJlDmIy4JLxHP8+Zy827sxSxkG1qtSrEiIUv8u7fM=;
 b=oTFO2p3qM2CB2fGh5FbCqHWfsLjAUpA01rJUrP5DdH2raMv7Em7rY0rPoVQz7ExoGxuGHOYTD
 NpzXPoGsHqtBE5XHc7JyEmeSHN8I2421kM7XwjgHHvZaekp39t8rsAh
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX4AIq93cpOeO/
 Zf2PIgnzza2qLNd6spx/OldHIOZq4N4WFl744nEBn22vgBAddTKbpnC2QHAGW1cl+R0P0ktXuXn
 BY4Ea+jKxpVkjdyC++hcc3yi4KaYkSPNcz63h8UBUSnYLOgNvce77JwnB78htstEFYcpoIlzm/V
 kE436XYkn7YbRVSQ06IYrVKykQQDtr1XRkQHoDAvv+emKoaPx4HVivzALTdYKfT0UHbtBFEjMlE
 NAfr5B/QB3AnYPBqlrkLG+RCIgeYMmGXBtUOOQF9rO0wwL7m97QQEKu1gkege+hnKDWUVVsbG7a
 L36qzGpSNIqCibxug3CFPu75BJmaDnoMgEYlU8XzS5td/FzsGmkp3K1qo/56q1qqFt7oREc7ZK1
 VIi1yr+jYrGPq+mKweqXXatJd0emFoDwqYMCXZQQdqbk+afMU8wIpDm8VgHLErtl7bIJjzog8PF
 I7mp3qt/p33j5c0RHCQ==
X-Proofpoint-ORIG-GUID: QXH41GTwFg-xhuzuRdcGTp0_OEMmlloS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX5ziNJTQmXnfn
 T5P9Ok4HJHFWF5t8l+OJ+WWlUb9XTm6VZUKg1KO93o4RIJ+JUK5lqOVMuSVzG8bE5amVcfNWtLo
 fjWvhMYx7h9ZBicYqDNehtTuGx/tdt8=
X-Proofpoint-GUID: QXH41GTwFg-xhuzuRdcGTp0_OEMmlloS
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4951c2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mcgfQexBA9BlAWrkqKUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607040192

struct drm_simple_display_pipe was meant to simplify simple DRM
drivers, but instead adds an extra wrapper around normal DRM atomic
helper setup. As noted in Documentation/gpu/todo.rst, remaining users
should be converted to regular atomic helpers and stop depending on the
simple-KMS interfaces.

This series converts the following drivers:

  - arcpgu
  - aspeed
  - imx lcdc
  - mcde
  - pl111
  - gm12u320
  - repaper
  - tve200
  - xen frontend

Each patch replaces drm_simple_display_pipe_init() with explicit
primary plane, CRTC and encoder setup, and moves the old simple-pipe
callbacks into regular plane and CRTC helper callbacks named according
to local driver conventions.

The conversions preserve helper behavior that used to be implicit in
drm_simple_kms_helper.c, including plane-state validation, CRTC
primary-plane checks, affected-plane propagation, framebuffer prepare
handling, and existing event/vblank flow where applicable.

Result is less helper indirection and more explicit driver-side atomic
wiring, with no remaining simple-KMS dependency in these drivers.

These changes are build-tested only. No hardware testing has been
performed on the affected devices.

This series is based on drm-next-2026-06-27.

Thanks,
Ze Huang

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
Ze Huang (9):
      drm/arcpgu: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/aspeed: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/imx: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/mcde: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/pl111: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/gm12u320: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/repaper: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/tve200: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/xen: replace struct drm_simple_display_pipe with regular atomic helpers

 drivers/gpu/drm/aspeed/aspeed_gfx.h      |   5 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 156 ++++++++++++++++------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c      | 178 ++++++++++++++++++-------
 drivers/gpu/drm/mcde/mcde_display.c      | 162 ++++++++++++++++------
 drivers/gpu/drm/mcde/mcde_drm.h          |   6 +-
 drivers/gpu/drm/mcde/mcde_drv.c          |   3 +-
 drivers/gpu/drm/pl111/pl111_display.c    | 174 ++++++++++++++++++------
 drivers/gpu/drm/pl111/pl111_drm.h        |   5 +-
 drivers/gpu/drm/pl111/pl111_drv.c        |   3 +-
 drivers/gpu/drm/tiny/arcpgu.c            | 165 ++++++++++++++++++-----
 drivers/gpu/drm/tiny/gm12u320.c          | 128 ++++++++++++++----
 drivers/gpu/drm/tiny/repaper.c           | 130 ++++++++++++++----
 drivers/gpu/drm/tve200/tve200_display.c  | 221 +++++++++++++++++++++----------
 drivers/gpu/drm/tve200/tve200_drm.h      |   6 +-
 drivers/gpu/drm/tve200/tve200_drv.c      |  17 ++-
 drivers/gpu/drm/xen/xen_drm_front.h      |   6 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c  | 177 +++++++++++++++++++------
 18 files changed, 1164 insertions(+), 381 deletions(-)
---
base-commit: 3696d07837d1df13a5603d77f667685e7dfb3c53
change-id: 20260704-drm-simple-kms-removal-01a031c6a129

Best regards,
--  
Ze Huang <ze.huang@oss.qualcomm.com>

