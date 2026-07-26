Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552E72F39B9
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785095141; cv=none; b=HHCQlKue9DKlspv4HjiDmORDF0TuiYfOJ3iiZFKi5ilFk51+jDJGvS717sww1BQ8oCbS34dC84Cu/kfETRlOJTOwj/a6CPRbm7qPf3MNCPqrWeMdYmH2DhRsXY2yRdEtiup6II6qpb83E7NFtrkUYHYrWGuoDZZZoHWOs132cSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785095141; c=relaxed/simple;
	bh=M/SBdA7VDjpMs5FPTVXoEwvZ9jXN7FwKp4wRYNhbi8s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZsRhrxvKzxwHtTUEr1nl0XNMcpHYkLMW+B5L5OI8SztBc8VZjt1Sx4y2jkxVdSGocCYr+in/1zV72BSaRcMSA2Z5YxkYBHegBYTZYy0nge/hE92w101Pm6vQ5i37kAQDSUX5JMHhJ3B90Y85FOayice1izLkjt6jc67RrR97DWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqepHiM+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NBvQgN/r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqepHiM+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NBvQgN/r"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QJMT6A1607016
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0ajHIxefN4bg3/NHnVq4I6
	V3IZtJtWB7vSvRVCv6OFg=; b=gqepHiM+WpEKBlSCQThncb9R3/gVRYZO040V+o
	sE3PF0NuXELd2wESCl8B3OfxzuLlatHm14QkBSXAjzyjKMiOXNkpAMJrm+bT0ZJK
	f19mpJyfWxA27aIdH6Q3eI0R6rP6O/3Ij8qKzxPEE3CzJEaqxhG9CkllwsgGqHGI
	HMVq3Va4viF79Ype5Dc9cWRgl/4Q1TaCZRlK0yPy68tHcuvIZF0cTmZLKd4iooFE
	DeT1j8UAGNjfrTlK7ajewKz7zqXnlHow3cRH7X+IOD1r4SdOWXCBdflbFRF+j+4W
	6UkzeFwJeyein3cGOkQYR6BehZkelUfQSo0hVIKYY7DkmxuA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7vbjqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:45:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so3061453a91.1
        for <imx@lists.linux.dev>; Sun, 26 Jul 2026 12:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095138; x=1785699938; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0ajHIxefN4bg3/NHnVq4I6V3IZtJtWB7vSvRVCv6OFg=;
        b=NBvQgN/r8eIi2F0MGo8oGerHfvvdXcS5aYo2a9BrmMcF/hZsfAZ3UfvXv/Xypzx0wr
         zt6o5BsJQSZtdbK3DJylbgsTFLesgAibP3SRoGzs/Ys0DG2X2ypfUSYhsvP3icTXP7Ul
         bXbqclfvqnt+bPY8l+SauStg1ziywTt+8w8OxybTvypOGsFJYXPuiXu1gNwcf2OeFPIH
         s021qZdmCN+8d/aS4XKo0XarmYHq5hognrhS/n3tz49ts1LJpVAGpkWSvjB74yQv6hlJ
         qHLfHFG2DRAtdVKB9suY0s3GC57nA7tw5L5kxCvJvQtf+Vr5FaQgbJrAjTYHqIhguyUR
         9mwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095138; x=1785699938;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0ajHIxefN4bg3/NHnVq4I6V3IZtJtWB7vSvRVCv6OFg=;
        b=ejTxCrhWC7jry5gloFOBV2kC4UHTe5zZUGtbT38d/XT7reXCi5RrJtQ3tda78l+N5h
         Xauc27vJ46NdXw4klTK0trTS3RLukPrD35XbeilnFV92XlCcbAV62CZA33F68pUwOuP6
         tByEIuU5d+3A/fTkMLiVaF88LkhWTns04W49GPj9xEXpc/WKoaQ4V/cZXlzEc+9OdAOO
         waRqLTgiFAk2Xn8fH463FfuokEuUvF3Q/ZXNXr6JZHf2HkdPYnTtkIzzztX4VEBNEs8I
         WmR72GHlHAbd4GM2KnLT/18G2hGmxOQb7wPvShMrNNwlPvGqwgN7IWRL+lloZ8Hv9vC9
         wP/g==
X-Forwarded-Encrypted: i=1; AHgh+RoUhHbosV1iY8RnGAO3EjgDuCAMPEGwm+0UkVFBjAq6EHlyAK1tgSX9BDrutNZ92KdYjw8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPbpb9zolc4AiIyaaIh5krANbc1VWvjdNjSEmhH9oS7FUCyeW0
	8YNx+inuGxXFYyGIQwKKsG339rwhKvMBUrNAhpcGZNXtN07dy+t3m3rNb5E8MHR+GPdtYdtF94U
	vTxZRgb+hfA1VL4Klc34mR+vCnxf92OS1t9cC5nmHHMTbsAj1pj7eD+Y=
X-Gm-Gg: AR+sD11NyoeFfTX4RzaFcMNxpA9JwhTBV+XPQJpp8sGFXxdQhRCGLbu8xXR7lieLA/R
	L6zojhK+Tdia4on8tqoLiFpfWpzCB5AfcQCVIibFOUaMzaE5T804WJb7JRlzuu1Spf+/n5OGvA0
	l1ChjtS13zFuhSqNMch/FAGd/eUqmLK9ogkGYfWKD+fN0XB9iIPhxxUy8hdXUaHZAhMel6aKQnh
	q3r57EDhISuPrQS+JwpTyBsD52ZlqaXSaiO7CWeFagLCS7FLsLUoyW7uCjkiMv0aAIYscLgUXax
	V/hdzr1MKTN+K9xekKpSVneuQSPzXUQUBGXLlOj49AnRwNq2rH5fVE7iKFtQ2BdhqbSoDDirT3x
	anBYupnDDVtDgNpYPXbrc
X-Received: by 2002:a17:90b:2dc5:b0:38d:e0c4:c955 with SMTP id 98e67ed59e1d1-38f2950e5b0mr5850201a91.15.1785095137773;
        Sun, 26 Jul 2026 12:45:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc5:b0:38d:e0c4:c955 with SMTP id 98e67ed59e1d1-38f2950e5b0mr5850172a91.15.1785095137330;
        Sun, 26 Jul 2026 12:45:37 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:45:36 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: [PATCH v3 0/8] drm: replace simple display pipe users with atomic
 helpers
Date: Mon, 27 Jul 2026 03:45:13 +0800
Message-Id: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMtjZmoC/3WOy27CMBBFfyXymkF+EAdY9T+qLhwzFEMcg8exq
 FD+vXZg0UXZjHSluefcByOMDontmweLmB25MJagVg2zJzN+I7hDyUxyqXnHN3CIHsj564Bw8QQ
 RfchmAC4MV8JqI+SOlfI14tHdF/Dn1zPT1J/Rpkp7fUS8TcWYnm+sN4Rgg/cu7ZvqGfGeoJqBa
 5Adq6CToxTizzI4i6X32ta+25YFcOg3KKzhrdJSfQSi9W0yQ5Wty1nIWf6hCf2WJgtNCKXM9mh
 Vt23/oc3z/AthEOIdWgEAAA==
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095128; l=5032;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=M/SBdA7VDjpMs5FPTVXoEwvZ9jXN7FwKp4wRYNhbi8s=;
 b=vdmSVBLYyiSgCzw5y+D627tBad3p1KzqzB30cNZzauX8H/pqI7pNd3FVlHJnpB9kKpf18kN88
 Jj8375htkKRDUvCLX1+Z4CLbQnTHMi4DVNy4Jk0ylOpVkfagdrVuj1K
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a6663e2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=0c0Jg-khWEd_mnVUI7kA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: cmiUDI-lHq3nj6rMpO3QPjtA8eur975g
X-Proofpoint-ORIG-GUID: cmiUDI-lHq3nj6rMpO3QPjtA8eur975g
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX1cIwnWlHogVu
 QEvXe0xFziktLADVXYUaYvcFbfgL8X+hWkh5FFsba18TuCwIO8+vpM+/uT9klTmK7/wLENR0EE5
 +nKmewcZiReGHVIrznzRXP6fbgwG9Zo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX1TWBKXMYduUN
 kOoIc3jZudDxqTA91gp2rxulX2ZFuOKksPJeJJQDn0a5vVFPrHlxSHun4Jf0zb1GXwNLTSn1PdE
 u5bJxOYISAcr3WQCICeM7gL+W9jyJAmCUB4BuVq/0s9ujIebytMnE6fSsbo5M169ZSIcxGrLfGn
 qO/0aNEeCBK7Z+TWwsJoysbgdik6weu+Kib3yi/VmtxPfL8djq+sJdnueaJ+dpqdgm8dN4nL26p
 QN5vjsgDcRwWkgPf4f/nSg4FKiFUBfRQgvt1+Cbwsrxdy1xxumOyoFretkjVRBQm2Vs2TYWN07l
 /P+dUypTOwB6xuGAg7VtPHaQuIp8EF4LaD4phtPDXs+QjCjtifRDk1nwkt2mDMOQfIz8uhOSJBP
 ZMK8ThZuGt2YComL1uRSxiE4/tsIc9k63yadHF/MCEwX2qVxVokdNhmO92Yp9Eavb821rX924aV
 O5JrQvByqpjaKxLEcBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200

struct drm_simple_display_pipe was meant to simplify simple DRM
drivers, but instead adds an extra wrapper around normal DRM atomic
helper setup. As noted in Documentation/gpu/todo.rst, remaining users
should be converted to regular atomic helpers and stop depending on the
simple-KMS interfaces.

This series converts the following drivers:

  - arcpgu
  - aspeed
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

Except for gm12u320, no hardware testing was performed.

This series is based on drm-next-2026-06-27.

AI usage disclosure:
- I wrote the first two commits myself. The remaining patches were completed
  with assistance from AI tools.
- AI tools were also used to review the code and suggest code changes for
  the DRM atomic conversion.

Thanks,
Ze Huang

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
Changes in v3:
- Use atomic state from the commit path consistently in converted helpers:
  fetch new CRTC/plane state from the commit in enable/update/flush paths, and
  use drm_atomic_get_crtc_state() with PTR_ERR() handling in plane atomic_check
  hooks before drm_atomic_helper_check_plane_state().
- Move MCDE one-shot flow start from plane atomic_update() to CRTC
  atomic_flush(), after pending vblank event handling.
- Fix repaper damage update path to skip updates unless CRTC is active.
- Fix arcpgu missing remote encoder node handling and lock CRTC state access in
  debugfs.
- Make container helpers static inline.
- Link to v2: https://lore.kernel.org/r/20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com

Changes in v2:
- common changes:
- create upcast helpers
- use 'commit' as name of struct drm_atomic_commit in atomic helpers
- improve control flow in *_crtc_helper_atomic_check() and
  *_plane_helper_atomic_check()
- Moved page-flip/vblank event handling out of plane update paths and into
  CRTC atomic_flush(), using atomic_flush and disable paths for mcde,
  pl111 and tve200
- arcpgu:
    - remove reduntant mod_supported helper
    - change obsolete mode field to crtc->state->mode
- mcde:
    - drop attach of unused encoder
- tve200:
    - reorder connector/bridge attach
- xen:
    - change possible_crtcs mask to 0
- Link to v1: https://patch.msgid.link/20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com

---
Ze Huang (8):
      drm/arcpgu: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/aspeed: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/mcde: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/pl111: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/gm12u320: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/repaper: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/tve200: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/xen: replace struct drm_simple_display_pipe with regular atomic helpers

 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  11 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 203 ++++++++++++++++++-------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
 drivers/gpu/drm/mcde/mcde_display.c      | 248 ++++++++++++++++++++-----------
 drivers/gpu/drm/mcde/mcde_drm.h          |  12 +-
 drivers/gpu/drm/mcde/mcde_drv.c          |   3 +-
 drivers/gpu/drm/pl111/pl111_display.c    | 199 ++++++++++++++++++-------
 drivers/gpu/drm/pl111/pl111_drm.h        |   5 +-
 drivers/gpu/drm/pl111/pl111_drv.c        |   3 +-
 drivers/gpu/drm/tiny/arcpgu.c            | 201 +++++++++++++++++++------
 drivers/gpu/drm/tiny/gm12u320.c          | 138 +++++++++++++----
 drivers/gpu/drm/tiny/repaper.c           | 138 +++++++++++++----
 drivers/gpu/drm/tve200/tve200_display.c  | 219 ++++++++++++++++++---------
 drivers/gpu/drm/tve200/tve200_drm.h      |   6 +-
 drivers/gpu/drm/tve200/tve200_drv.c      |  12 +-
 drivers/gpu/drm/xen/xen_drm_front.h      |   6 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c  | 188 ++++++++++++++++-------
 17 files changed, 1155 insertions(+), 440 deletions(-)
---
base-commit: 3696d07837d1df13a5603d77f667685e7dfb3c53
change-id: 20260704-drm-simple-kms-removal-01a031c6a129

Best regards,
-- 
Ze Huang <ze.huang@oss.qualcomm.com>

