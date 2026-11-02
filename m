Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602644;
	b=sSZyeMI+VSuHOMSvWg8c+JvatWDufQ7h9Wy8FSA39Sr0vS2c6fychspjB/94jLX6Qg+r
	 LSu9HdQWV45Akc+VXf3PCmk7kXeqi94nEulO6BLwsBS2Qd4bo2rhodYPTAHxG/Ih0FuQ3
	 HDyuAyVrjh9mis3Q+q6r6LZuiPqbLBnFJrTLgUWEiuvt8jadSQ7cHBGUwZo+Oh4NzjNVg
	 RI7hgc7bu7OA6WdPL9pOOyAugSCX4kRW/0MZB/CfHOMC3Lt1km38gaAe9L/4FDl6dtXHb
	 r2hzlnpe0f+/pbK0sCBZ9UgeuqsND+db0rMT/peOGM6D/iUCxtR07USjPdi9QGvjqMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/czB0+NxeiClWKKhtKr0SNwTuovPGhxvsx0Vin52hrY=;
	b=v+rJAMIEOEzpKC3W8z6m0AfVClGDIZN0wagi5ixD8UxQz8RFjiDbwG23fQ3WTJyC2BbA
	 VV64lkDBOhqTFIqfkiFDMdZmoFXKO9JrqgPyITxF8v4ftAH+zEtb20yGbjtlazXWNHGn0
	 1uuZjzPZxx6vBJUkmENVv8jqjcvJGIK3uh2YKvKQZR9dsU+pJgZXLg8gN4wXmvwwHq7Ax
	 Lw1Ym5Mi+LZai0qFrdPS81bslUI1A3ufkYl6PXQFlydkbw31DmLSGGvjng3CxnyU1Cd0/
	 s+e7J8R7qugJ5bHUdfhdIlvI15HvwyQG6+lnWozaA+0F4/2RD/4Et5aTl19oe3aHBNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJpQF+l6;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD5D606A32C
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 06:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAD5D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJpQF+l6
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso3467704eec.1
        for <imx@lists.linux.dev>; Sun, 01 Nov 2026 22:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793602643; x=1794207443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/czB0+NxeiClWKKhtKr0SNwTuovPGhxvsx0Vin52hrY=;
        b=CJpQF+l6gEiGvx7k4w3Ta+YY88wqG9gYpWrXAJnfJdAZ1vPxSM7/BeUHJIJ/SnKTWi
         WNHDuepEljwljMX1lG0XQrOaxMxzKltkaRqvVCvRrWLb1rZTRZ16YxSeP4NaQU4Y8oqI
         L2IOHW0rF9bYaXfxbkTIDI2vWTKR5Qi+E8As4oAiC2IoFJUBwKiX4uyzxEW9x237n7OP
         taENJ4NFW2Yh6ulVwO/QaKMO85Z+0vev4/tNpsvGmUV+uJzY9eQlo33yxWXHf0Q/BsIi
         3G/83cF5LptLW21r+51csZuz2MavdDtUn4m20m4sPMDaauXXKZoKbdFuqaC+kiTiiCv4
         Feig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793602643; x=1794207443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/czB0+NxeiClWKKhtKr0SNwTuovPGhxvsx0Vin52hrY=;
        b=z7Ye6hEkLVPp/S6vPq3FOmnmIG+pMFNr9RWHZxiMMXRzQNMPoDpmD3gj1xTf5gfTvZ
         sslQhOoQoBtLUIonuXOCfgWOgSeU1s89Hbho3kveDHICUDP+CY3Xd3Aqt/xdQ/JjkhH7
         13mGLi+SxTERmrNuvHNorBy4Tgz7Pbjl2o2806YkGBcRmCVvQL/PzYkALlTvsPaRJdhT
         C1KnJPz1aDlxioJEjxvuJHHQUelElSEF/GRoJYPlHoO0OGfjB91G/gHsLPXVo2yp/yi0
         bZJF/FMb1PVmh+TZetbVX5g6Y+H1aI0Wb6M+3DOR6ZECveBD78T5ZTP+YG3ZgYwsrUlD
         6Jnw==
X-Gm-Message-State: APuU4Z+t/ddcBDj4XkcPvMS8n9u9/tHAFNJkiH4AeqPOAH3DdMDSTjSI
	4NCb383e75SssYpNXRdFO/Xbwyiq38a9X2l4kE4lCckOJIOhHbHXQW/1
X-Gm-Gg: AYBFou3m40E5w2bdLVsX/ijmw2EkQcKkBnHTajxcih2zNDHQGI8p4ombjUXXWc+5Wng
	TqNbjUnAsXm4cBVqqIP6bkpkry1wyNUHBYZkfwffYhxpnKLg7YbkBNR9daMoHF3zYOXrecQK+ZV
	59MsdwmIaZNrWyhYNOYP0vw9f2+Gyh8iMkf2O7HDwyF/PUUdCwupKRs954jqvNl4QekjNScOc6Z
	Fb12wzIvyF/0T7Ln9S6xZnO5oOnVbj8ZuSQpfHyVdJKiBu5/7pEOZk9q4UqQ/iEnwZI5xjYqfjU
	fCmKdF00vjeSjnFwJSihMZ3Uv6krtvClbKZoTR0CcV4N3nc4yN2Gv9yNCuiodx81WJw/5X3Bq9W
	woQQjv81pEZsyZZpuizLvQV5kyHrFjf+bOTnmjkcCClMXny7E5cGmplNd6wuRRrb+gJqA2xT+IM
	29pWqgylfHtjN8VNMg2DTO1GF7X/IZWDQTERLeBPUDZeX9+IkNnmKXmW9NJRrjomOTQJCSTsWn2
	9R9rr9TGd4ZZ+Y/58mdQTtnYB9c+Hvw64hfsM0Vs8bwOVlQr2ylVfoYNkNETtl3le3HbeOkLcOW
	+bCcRzC5X14faKK3pSUIdP86Lgb8+dBqYh+IsqGjU8i2BtlazCEDBeT8dvbfCxjOLA==
X-Received: by 2002:a05:7301:716:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-36a42453282mr12430597eec.38.1793602642851;
        Sun, 01 Nov 2026 22:57:22 -0800 (PST)
Received: from localhost.localdomain ([14.97.230.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm29169317eec.4.2026.11.01.22.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:57:22 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
X-Google-Original-From: Dinesh kumar v <dinesh.v@adlinktech.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dinesh.v@adlinktech.com>
Subject: [PATCH 0/2] Add ADLINK LEC-iMX95 board support
Date: Mon,  2 Nov 2026 12:26:43 +0530
Message-Id: <20261102065645.121046-1-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds device tree support for the ADLINK LEC-iMX95
module on the I-Pi SMARC Plus carrier board.

The series includes:

- Add the ADLINK LEC-iMX95 compatible strings to the Freescale i.MX
  device tree binding.

- Add the common device tree description for the LEC-iMX95 module.

- Add the I-Pi SMARC Plus carrier board device tree.

- Add the new board DTB to the Freescale device tree Makefile.

The module device tree describes the onboard peripherals and interfaces,
while the carrier board device tree describes the carrier-specific
hardware connections.

The device tree has been compiled and validated using DT schema checks.

Hardware: ADLINK LEC-iMX95
Carrier board: I-Pi SMARC Plus
SoC: NXP i.MX95

Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>

Dinesh kumar v (2):
  dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
  arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 237 ++++++++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 414 ++++++++++++++++++
 4 files changed, 658 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi

-- 
2.25.1

