Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3092E47142E
	for <imx@lists.linux.dev>; Tue,  1 Sep 2026 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268821; cv=none; b=LbqqoG9pY2rnVzImr83HrStOizyQQ5lvgsHgy7CEYB9VDl6CCUy/1TvrALVt/8LV40/0LD2a1+3pUBBV48c2XzLrMElQgeCl5LsodTMUopf/bB79RNc/qJDlpAlhectdNXmTcbLUNxUwYjcDP+EVqhcDKSIhPkZKN53px5Q7SFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268821; c=relaxed/simple;
	bh=V3NgQAwoAv5KAsH1a+6JKb8kouJtaAwYmlc9b8j/slw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VlNoWgdWrgJqCEtkc4IsC4ZWrlrp+oTdWiXS1HML9fg94iLYVzXIALYsiddnYSt/EKbsVQuIXMQisrnApUzQMzCboLPD9q2EYMNu/0hn0kXQCnYeK97aOWwNrtfnu3mX26Wuzqtr4a3idkQj+VWubxAP1FuO4/0BQIJ7wCJwyns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5AGBlYx; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5AGBlYx"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c252c7270faso793693566b.3
        for <imx@lists.linux.dev>; Tue, 01 Sep 2026 06:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788268818; x=1788873618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HRWe/Fv+Rz84H3JecE5KlcPaNAMK2QWGmxyAItSFjmY=;
        b=l5AGBlYxZUwyALAgmLfqe81xgHH0TBfbMqPQBrheKL3JbI9wb9Y6pF9OK75gupHsOA
         49CwktqLPf9CoozUWJL4BluRVwOAzg96Qx0lcZG6HhJARRhzromZ8Q5FeNrELX/eOCcU
         UD/CRm98Ou9XO4xFB3g8dDoptSAVKUcela4rcY9BFM6tMpYnV4p1j5CsBkqWsv+yydcw
         jxmU6Ez0+cIZVUHV0Wt/qWTcacqc+FrOZG0IyeKFDas+9MJoTYqCJeIP7f1BdEfpzAa+
         4R2ha+YGii068ug4gqn9tdVtSYBj4iYKh/ALI/b5HoJS/CRa/JQ/NOau/nNW5GVWfCQX
         s03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268818; x=1788873618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRWe/Fv+Rz84H3JecE5KlcPaNAMK2QWGmxyAItSFjmY=;
        b=h9ivxzlqlgtQfvVyusOO4fJFEHYLTGpJshcm/s8tfBmeqoHX4/2GT6mvc6nolr4eJZ
         g5iT6t71SoX/HVZHv7nLBAqGHd8Mk7SATgOd4zfmZrD3PUwVrxcMOaYIL6NsBGhPmqq7
         NmhVd6GglPuqZM+iNPi55sxk7BZu9MYTGzIkglgTVxGl2r9xGgXhxFdApPvYTe8kfLwe
         wjJ0bV44TLFxGInxvyesVCh6PY3Rwz1f5Bh+MNMThwLqmLkUw5q7UbgYcngSqp7ETGGD
         rrd3esi2dpKpfkFI1EwEK/gnssAxZQcsb+XsYeGur+/cHtcWURti495D7pNRq8sdQbV2
         gG4g==
X-Forwarded-Encrypted: i=1; AHgh+RrKnxB7OaTqLEajmW75P/KF7Fa7F0XLsdR6SiFKLxfS0+cgwD1srdAXRw3qfNidF8K2jBE=@lists.linux.dev
X-Gm-Message-State: AFuF++kE4y+HwFVSuc/moXcxYmfAfKbQZXtm1onwAQR8f7bXNzkQJeEp
	k5aZqRe3+wMNHhGa8CSFYGlI5qsPBV5aara6EqlqAYjkJjTTB4IH4kjr
X-Gm-Gg: AR+sD11LqyHh2jzn2YSEKGLGl+67Gvub3T098uH4aPX/lruL/OA/hZ4a9i3CCBiqECJ
	6jzanh6KnyBim30Nq81mVhME2JWbPXCqhWUGt4K5UeRYKsSwkdQkJvY21zaWr290ksgVVU9HqEO
	BTsFqVc16j1yEkmZOesdTQcO86oX1hQFOpJTtIFj27QLwA3i0UE0u3lW/S0zMyslJ0brtM5A2JM
	nbun6zNFhmQLa0qj6sQLvaLxN9BYby1G5cJ+aA2/57uucSu8cK0HPNN9QB3qY0p3J90rnxJMqh3
	eAxlnWFKPpvdVYb5oSdtgon4TzrzHFnuCB/W7JHXVaRyWBgUTl/YxvxfvK6H1cRqUrCquUGaJQ5
	h20RosRQzQUIxEtAsI4wtpKLEqbG3VlTv6nis5oG4kHlVrW2ViuAUEEqO8fk2VkukNrWpzQNflV
	6vP93Rr3wkp38KjMrHLGbLrQvoQHuD4Oyfkc/psMjDqAyeVb1GYUsCdzuSgAtUeoDvvmPZloaI/
	WN9FC0rr3Su6WY=
X-Received: by 2002:a17:907:c78a:b0:c21:752f:c3f7 with SMTP id a640c23a62f3a-c25b3d1f286mr658562766b.18.1788268817805;
        Tue, 01 Sep 2026 06:20:17 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25618430fasm580304366b.22.2026.09.01.06.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:20:17 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/2] Introduce basic support for MR-NAVQ95
Date: Tue,  1 Sep 2026 06:19:16 -0700
Message-ID: <20260901131918.1189-1-laurentiumihalcea111@gmail.com>
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

Changes in v3:

* use "gpios" instead of the deprecated "gpio" for the "regulator-usdhc2"
node.

* fix issues raised by running "dt-check-style --mode strict". Note that
"dt-check-style" still reports the following issues:

[property-order] property 'compatible' out of canonical order [...]
[line-length] line exceeds 80 columns [...]

these'll be fixed by Krzysztof Kozlowski's on-going patches: [3]. Manually
applied his patches and dt-check-style seems happy with the DTS.

* link to v2: https://lore.kernel.org/imx/20260827150657.1657-1-laurentiumihalcea111@gmail.com/

[3]: https://lore.kernel.org/lkml/20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com/

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
 arch/arm64/boot/dts/freescale/imx95-navq.dts  | 222 ++++++++++++++++++
 3 files changed, 224 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

-- 
2.53.0

