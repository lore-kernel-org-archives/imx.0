Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36817563FB4
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 15:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968453; cv=none; b=fFmKykDK074P3cEenSmihT62+Rc08iX+R5bWZMtLldyqWQXqlR2FvszUy+vNh2iUziz/sQpPjgyGPner4qCVBzvWLo9gtosF0eDQge1ZICvpPjs/I5w2BLOMndH0MzkcLZc+4LBAuWEDr6avosyZdn5ep+dZuYpTRdNhkGjwfRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968453; c=relaxed/simple;
	bh=3GY6XOvXPbUEDiiCOkrH5UVYFspQUAgBaWkiq8xenTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CXktWMYT5MqjjGE6l57HLM2eooqcRtWAk3VE4aeVW0zrcdNiJw7xa+lOhMylS7BangOzWSHkZexWBCzEoH7hma93htzEwB/4zxy3LxWJKM1/KCkqK2i0Qto0fgqcP3FS01BYK7ZtEmXVuDVOk3DVPcwbt5zY5oT+FIAWpJ4YnHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4ay7o55; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4ay7o55"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4869b6f8629so98206f8f.2
        for <imx@lists.linux.dev>; Wed, 09 Sep 2026 08:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788968450; x=1789573250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8S9AI7MuVos4oGOaFeo64Xw5+h+A/2gGgWVTyAi5z6M=;
        b=h4ay7o55q+UMsl4jeKVfx7/qy87pTFoIyx+aCy+rUxiJ6P/JBz5BrB2ppjF0cDNV4N
         qOhEBj21nwLME8uptEAk1j4po8B4HOg0EIKJ6BJVxERz0JJfMjQhHv8VwD6+hOh5Jnh+
         usg6LmuCjE550CqV7Ev3L7unBFSIeL34bDYa8UlyaQ1OnUQBGKm/TW0XRdmgcZlhIskv
         3/1NVvf8pCwuFihqTDukpvf9nEGBY94v86Q4RYyNRj8Dh2cpqgFZ7x9gBrtwz4QJUFPq
         k4HoEoFYYsPnysZ3SRmGN3qCFb5VKpGPDR/E3BD7q/h0CcWLp3t6Fevhp/EHKpIhjdLz
         UDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968450; x=1789573250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8S9AI7MuVos4oGOaFeo64Xw5+h+A/2gGgWVTyAi5z6M=;
        b=WrjHe8hq45+t8irSrCRdi+4Nzb0zXmAp5pffWVcyI1f6xAhd9w4Ih7k+RWFTmHjbxK
         /airhnvf6U49i5p76ZuoMQmKrFvvO/m4lBSzJfTSSxW4B2eXCc5MXUoXep1pOov7Cuky
         +aufCi3LP3VNuJguLrGRhBJvFgiCkVdVJy7xnE1uhBCzJH+e4KwXWOLCCAxhKEzVqZ+m
         CrdYKQM3K6kKBH1KqttquHoTp1pc0o21iShaXy99ANtGt4BI9h4p2k0qKcBVWY+A0tnJ
         xHw8tXQOfTLDoI9ipoDHSjkDc1wJAXJj0zF37bNYOZhrzOKLyvYRJ2bZCTzbBaEk49WK
         sBDA==
X-Forwarded-Encrypted: i=1; AKwUvBzfHRBRLEGpS7I6saZg7/XTxGulyaLYNfBbelvp3k/Tq4Ea8LqrSl4gigGQVjlpSf0H4RQ=@lists.linux.dev
X-Gm-Message-State: AFuF++nMq9hkC4Pxqy4r68quaNpMb8B+z5qPGNcpnJE1nKqS2VHxAwLF
	nHrV9GxUfqyf+BJlKKHF7Y6MKrl4ZzLD08uEUPL8OcGhigvNq9YeWF0d
X-Gm-Gg: AYBFou0FOJ8LDxAyXmkRXA8HKkUsWwadhyAhws225y63wX8L6mOZQNEyqhB+dmTyPaI
	OGaOTvB1Xaslox9950/AMZZAHKx4OcdviD5Jq9R6aXPa0zIYxHQ07Gy3swHEw33BQrE4TI9Tz5D
	QW3oZZ04oevMIuXkzAgoz6guc4WvgamgjCyxxIE88aQTi0w4NGiJUEgzDo2s/dpH2FRZXxV4W1f
	3lLqqey1jTw6BLLGCoLz0MpcySn1sF8xDTv1OTPHcaKttTZ9Z1X6dP3iBl3Ngl+f5at/A5UHCYe
	Sq7W4nrPMLp1BEAJ4JM9hzuPVPW9auRHYPe35MlbhaqGA/9WqPA+yfCqc8sknwn0k7pLEwcUtkM
	zOUwuwiCt6qXyoInKtO+SbMbEc0I8zwylLx+aIB01faFxuXKzjSlhjk0FrvL1snx5EYCJDd2dsK
	0LPtBDzz1YryNdHbZOva35nPgHkQOfRnp4E2wgTrpz/ydJQrN4SlKYoiNQ8o2FnJH72nrTaJcLW
	YtE5S2JrVO+uI5k6BFLZjlgeg==
X-Received: by 2002:a05:6000:2602:b0:485:8c16:a34a with SMTP id ffacd0b85a97d-4858c16a7ffmr34924854f8f.34.1788968449996;
        Wed, 09 Sep 2026 08:40:49 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm43810943f8f.32.2026.09.09.08.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:40:49 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	consmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/2] Introduce basic support for MR-NAVQ95
Date: Wed,  9 Sep 2026 08:39:41 -0700
Message-ID: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
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

