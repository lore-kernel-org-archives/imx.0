Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE466443C00
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385711; cv=none; b=e+GA0LRuMfn47857nxIILEQyXAGi/FhG1jVa1gpwdQsNQ4FJ1EY0wAizg4iK6C4F+nTU4NlYV2smXUkKH0PKDeRTTb8kMDhiNkvgxtFCpUDpb876BZSdKGfzlI4aEFhUWsMIiAzJYDehUYcNT43fUzXPX0FKYXCgUGuGCDgn9xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385711; c=relaxed/simple;
	bh=DCEztktHgwImiVlEr+3EZnHKk5I/nI7nHcPmbmHQMNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N148WT2Yu2AWCQWw6bcEOwlP+GojEYMIdGWcvOrs1ypzDvqgBOYgfeej3f6KAUHyA0DUJiL0mwx3Zy71UBZRLrrde3cASayM1ihprp3B57W9wWq8/WADeVPGYlb+Ln440Ps9vQuOAqs79mBaYVFuGTVzEAsHqCVgV+NdiNfTsGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUiIbBRp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUiIbBRp"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49e717c9841so10756385e9.0
        for <imx@lists.linux.dev>; Mon, 14 Sep 2026 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789385707; x=1789990507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0F2Pzqq5v5cdo6z+ooVLKEAM4UOF9cFccLrXL8bbvc=;
        b=RUiIbBRpvyndUQku2m3YvTwMrwIuU4yDM8v02cMS2ntz8Snxu+Ero1r55GoqmqyvBu
         XbkJ3NtJCVLsVNkg/NFuuU5V+hZzTE+qRLhnN+gdKmkPfpC826jpqNg3Am+Uskea/Ciz
         UKjRIItJqF7JyzliPFahG9XQWXtrzIX2WNQ+GOWcDipUqE2W14IMtYl3mMVb6pTn1Hmj
         OOFfF9aISeJpMPFckq+aOwIy4UYq+fNWCGE08IiTn/m/reQrR2UMrwE57qIUwLEbTfSm
         920tpoWRL3D/8aVjfIsuAnkleP5D2vXCSkxm5I8ICZXLgcBsnL5k7F8OX1p+aYE5Wdvr
         cptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385707; x=1789990507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0F2Pzqq5v5cdo6z+ooVLKEAM4UOF9cFccLrXL8bbvc=;
        b=hb7DsAN1pNeRd/BZwyoPnHG/mnsHhCztM1W35na87Wrh4WdiUFz+BdnznncEf6RSUz
         vZKAoGRfOMagmKy+FxBVBEXeAT2+8MpSG5evXZIlRiy+eVqtnyNb2chZyhBOtgquska4
         C0UIUlIyq1xJXEGPpueTXY0GcIdKRElKP7Y8T3xWC1t+YfB1nf5IFyWnfpqdLiKvpaeM
         hOdiWbdNzB8/L5LMKn0F7STkhpaDfhi/KTlt+D5yZ77yZ/FqIqmZEUI6hWt03N9AasYb
         zgD1albrZcvoU4ntIChPTK8DP61fj1kifrzlNtef++quGkwqVHFdsK9FNQ/morRrdeVc
         mxxg==
X-Forwarded-Encrypted: i=1; AKwUvByhF9FtHu+hS8aJ/48YHo7Urtou3APHArGBnrklEX3JcSIZOAfcoAxLeTYVDAm8UWmGMw0=@lists.linux.dev
X-Gm-Message-State: AFuF++kWV0cTXVE87nUySYgmIoRtocWshfVwiG7LoJhRf3kTk4wBr5xD
	AZwkxMGWO+6FMWgRwuNjvWFj6felxEPI683bDR20hCRNa9EjEQM4e5YD
X-Gm-Gg: AYBFou3bRXS7r/sEVcSfZ0HpfagK0EZEo2ZwIdoJ+fe0A1D22pbNVta7PRhmgN2wyw/
	HQ/25GI+vP7wlC3P5nBfcyyig6lABIF0yOiWO1VwyGBvXe+tQoxPWzjcCnElcPi39JtBpSD0JML
	7hDJKQDlV1Bi0xMU2NM+FseA2Ls/Ztcnnhiz/q3KjM6Yrzp6276AsgpVAZ/Dhgmabk3ScppyVWC
	KK2boId4b1/vBDcfc67iO71uFh9mM3NcLMv3J45zUMP0Zd9nHa5ZWuJN2Hhr1xO2B1vb0852X3O
	Wc56ovZEZFMuB4Oo9ZprIujwjLKxX4pjnufHXQYJmoZDVNeKaH5Ehn0mM6AogOaSJmQfsUZfEQe
	3A+l2dopdUFFtSbVRM/cxtxREWKlbFP8fUu2C3U57hinZpsyHXeVwUU8rM7SqjxlugKTq/5vfua
	s+iaCVEnrESh2R3g1Ij94e4zVgejovvb6EqnAdUtGCclAc0uOQUwukUFngvmqkbbKVx4WNMNVMM
	813RsjHC71xJlYxjR77aZJUCA==
X-Received: by 2002:a05:600c:548f:b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-49e7a67f688mr27341065e9.32.1789385706603;
        Mon, 14 Sep 2026 04:35:06 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm27906531f8f.37.2026.09.14.04.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:35:06 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/2] Introduce basic support for MR-NAVQ95
Date: Mon, 14 Sep 2026 04:30:08 -0700
Message-ID: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
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

Changes in v5:

* changed "up to 16GB of LPDDR5 memory" to "16GB of LPDDR5 memory". At the moment,
the board comes with 16GB LPDDR5 memory with no other options available.

* set sdtout-path to "serial0:115200n8" as suggested by Ahmad.

* the size of the memory node was left unchanged since there were no preferences
stated in this regard. The bootloader will set the actual size.

* link to v4: https://lore.kernel.org/imx/20260909153943.1048-1-laurentiumihalcea111@gmail.com/

Changes in v4:

* added missing "memory" node.

* link to v3: https://lore.kernel.org/imx/20260901131918.1189-1-laurentiumihalcea111@gmail.com

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
 arch/arm64/boot/dts/freescale/imx95-navq.dts  | 228 ++++++++++++++++++
 3 files changed, 230 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

-- 
2.53.0

