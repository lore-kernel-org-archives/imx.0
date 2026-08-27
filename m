Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AA247DFBE
	for <imx@lists.linux.dev>; Thu, 27 Aug 2026 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843309; cv=none; b=oi5G+q+r2lPsuIcTRe5dey78iDtx1oL92Mww2gRtsdHOtZHpzdFkR2xSq6ZhKGFy1m8FnRV9aRZGRWD4ckdyHGgrd9Jtzd8YDXG7BA10krgdayv/RvUuIPOyn/MQBK/dsj2/1H9jG8ZZ8g6ef5vydsMyChNHVKGl0H5JpxS5NSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843309; c=relaxed/simple;
	bh=gAKJTXCOZU+YKYQWwwMx7YWAfaH/SysH0hVcYfn9dVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ucQbxzogC+SzrRLlMHdRBCHOz6d0tiL1ZWABQWzaZsAv6zE7TgSA6GFDDJL96DtQphax311WI89/bE1cBYs4wZHTS4kYTcs6gkjFesh/ZHZXuyZ/fsgipCeZbZ+hfeccLT+BgtFHHT5b2hTjUG556AfjivFDYMUbT4QOKYzokuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBZ12/mv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBZ12/mv"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fd4531020so1340130f8f.3
        for <imx@lists.linux.dev>; Thu, 27 Aug 2026 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787843306; x=1788448106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fag10csC5nrC5HLW7gpXLgEuW1jB3xGm4i/F+3ymn7w=;
        b=OBZ12/mvdljXB2U17+UxtBxzYqUAsXLyWMmmaR2z2BUtMsTP3x8vx8bn4NTYqMtezX
         pVzRnp2F2TUurL3/tzUpItRi2nGbHvMtQIZLSdx5z7doVdpbu05tm+y6DLDuwqojKRu0
         HS5cFQcP1W1/f4IVmFGGAWgo3H+uJ5TR2UP6h1lbgevsGeaoZd7LFgyZqufFcdgLVlll
         amdWTHImf+G9G9gR7wF2zFLsN/4lZILk4PwglUA6D/HKscUVxh+WK4FGSidaEB7am5Gt
         mlgO0LwbWn6l9pSEvNwmbqs/rXYUE5Om8cy7Xk+VaPh1uIdzkoB3u6Lqo5apcdrh/CYB
         Y2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843306; x=1788448106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fag10csC5nrC5HLW7gpXLgEuW1jB3xGm4i/F+3ymn7w=;
        b=nujzy6gOW2YgZJ4RvSGntm0Fx9UcDMmcDdsi5MLr2fqos4Qaoc/1Jy7YluhilyIp1E
         Nbi+nyd7ObTuc5SMClkYVsCyvjUQHFf1/keaHp2GTMIrDuCfl5W3H+CtoMBDTLvpR83r
         PBzdoXawa6WmMwg2+SKIIhm4wyNGSD6GVQ2h2kDFjQ1v8KLmURUUNdYPXQiZKqdxSQHT
         5aDTTVfEyRGs02UsxpqDtJXMwQsp4Bxz0iVd+38CLN5//O4/nPgjqHWkGn9fxpzQ1Jrh
         LFHL/SMmLvkKN+Dq2e1MCVkkxSD4m7ZbiG+ZVleFirGP5mKaFF+OIVS5hUFcoNtgCVn3
         3WGQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKIEVYj77pOKphLrsEuWXNEbf0VzTUckbDFdUZ4o4mK6M3YVuyWDqxovCeFWMm5N8QkYc=@lists.linux.dev
X-Gm-Message-State: AFuF++nY59rTdE2L+HuOgEGGf6k4hrjiSoGOUljfry14zk5KqB65wKlK
	8/F0DOBOXXmVSnvzbYL/SP552VQn+rQTTi8KIAl+06KU+6M116yiYvOU
X-Gm-Gg: AR+sD12tOeH/o+MZovRHGldzMOaMoiHKZNtDNJcE5PmiDg+69gMJQHEzej4nOYOvqSC
	Xo73l/Vik7q5fMf1ghheszsXHVtmmV9xFe5RQMHjRb9ay04xOLkIfs9+TJ1BxaxCC+9IHGziZEv
	p0CNDFtWXwfwd0oiIioR7kR+UlaKRVubDonRJJO3gIYrj1jdrssBJo+TfPYuJdRvU5BfyvttQlS
	sJ8ReEZnULOcN7AG6EWiAjNEN8K0I+sqw+S5RDUCjOnKYumu29Et0BYCAnP2Mmsfqh1Y998L3Bu
	FlQOKecMEAx+FoANB5e8C3oZAlr7mVX6Laqyq2n3Qa5dnMVB6I2ThRSoARJBnGRE0reeiLCj8vk
	6l/dGYr1ssaYjSO2P61atbHNdV8IOB1ypEpNLUe2v+/eih/0l6A5Sbdho2UViXeVpZfbN+5gaLH
	N+svSLW3m2UTcW6Otsw9Dp9SBM6FLxr3FWA+dclhKC8vh2CpauDAjAdHKsFVBJJvrC+vdoCffvF
	8B3wSlZNm6jBIE=
X-Received: by 2002:a05:6000:26c4:b0:47f:7759:89df with SMTP id ffacd0b85a97d-482e26bf25amr18874741f8f.3.1787843306015;
        Thu, 27 Aug 2026 08:08:26 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([165.85.187.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb11sm10247151f8f.8.2026.08.27.08.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:08:25 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] Introduce basic support for MR-NAVQ95
Date: Thu, 27 Aug 2026 08:06:55 -0700
Message-ID: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hi folks,

So, as the title says, this series attempts to introduce basic support for
NXP's MR-NAVQ95 board. The "basic support" refers to introducing a new DTS
and enabling a couple of peripherals so that the board'll be able to boot
from eMMC/SD/NFS.

So, compared to MX95-19x19-EVK, this board has a smaller form factor
(comparable to the MX95-based FRDM boards) and is designed for
robotics-related applications (e.g. drones, rovers, humanoids, etc...).
The board is currently at revision B and is only available internally.
The board should be officially announced around October/November 2026.

Given that the board and its support are fairly new and still under
development, I would expect some (hopefully) small changes to the DTS.
Hopefully, this'll be acceptable.

The schematics, a brief overview and some pictures of the board are
publicly available at [1].

[1]: https://github.com/NXP-Robotics/MR-NAVQ95

---

Changes in v2:

* remove the "pinctrl_usdhc2_100mhz", "pinctrl_usdhc2_200mhz", and
"pinctrl_usdhc1_100mhz" DT nodes as they have the same configuration
as "pinctrl_usdhc2" and "pinctrl_usdhc1", respectively.

* add "bootph-pre-ram" property to all nodes that were included in Elena's
u-boot patches. See [2]. Note that "imx95-u-boot.dtsi" is still required
for the binman node and for the rest of the nodes tagged with
"bootph-pre-ram".

* link to v1: https://lore.kernel.org/imx/20260825120812.2152-1-laurentiumihalcea111@gmail.com/

[2]: https://lists.u-boot-project.org/pipermail/u-boot/2026-August/629002.html

---

Laurentiu Mihalcea (2):
  dt-bindings: arm: fsl: add MR-NAVQ95 board
  arm64: dts: freescale: add MR-NAVQ95 basic board support

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx95-navq.dts  | 237 ++++++++++++++++++
 3 files changed, 239 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

-- 
2.53.0

