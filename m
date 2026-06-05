Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C874C8FFD
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 11:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659477; cv=none; b=A2eraNE/YXS/OT8/DcgaA70OLUz7PDRrQ0gIOE89W6NXdfWw0YKQXsJ3qJY3RfBUQaDUOP9E0T0xakNN71qdfLOBgwO445lLpAUZyTZFCPTXcnat1bRheeMuFLHlUNTTMNxd7PsPVNItQSFoofdNnaTCX95SG8SHsaAYDhnPgc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659477; c=relaxed/simple;
	bh=ud1+XTOztQEAwav4x9KhbkFv14fOVw5zbe6eOpJ7gUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jJtFBtgOmQ03UGmPsh1eHJYyQXGdISBkee+qDV5jRAKhutblmJMHbxfY4bsfxN723E0zNGOjA7Lj5itN1Hgm4LPC06QuXMSVBpE6oMT387csNYr9hlNOWiSPDkjePQrINkWAK2eebu2kIe4lcdDzqn3NnlYW+OAC0Qjahwbd0wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkh3ZN01; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkh3ZN01"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1037203f8f.3
        for <imx@lists.linux.dev>; Fri, 05 Jun 2026 04:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659475; x=1781264275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W3r95IPdKLEoIca50s981PYU1XFf+JhCBe7GdZYnQ8c=;
        b=fkh3ZN01Jaa6iUDjtmV4EAVxb0HtWMLplxldNJpgiJ/uwYEPdb+j6m7390VI0/Oxqz
         yO96ZwBYu0TFTgd8D+3WoqBHhlWF5TWCETXhhywjKIh5AgoCG1/9bkR67as4N97uaRkg
         g8PuwidCR8C/nD2bHYr2+Nx9s/NPAdQkmG1gBjzn0GkTPL4fhoKvqqX5gvJbXIb8hvG6
         25H7Q/C7vaIsyq8VkdD1spjTV1QFkzmhulRsOIwMfFrtkjkE+Bc5cw3eCSThMzobXemi
         VjDO5k05JJwh1BtEuMpv+T+BatEvkhqzX7ASFcqBlkAD4hU+PO3iozdE7ZyP3yI0hDEl
         imPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659475; x=1781264275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3r95IPdKLEoIca50s981PYU1XFf+JhCBe7GdZYnQ8c=;
        b=d17ZoQYJ9NIWMfSPJqvWwH9t6GztwVE9My3kl+a0zCBppPrmneRHS3OnY5FQGMX1Ig
         Rh0DSHjFlCBlvd7Sew0dT4w0lBWOzL93f9f4gIFVB8xWXRsJ8qhNN7EzjzeVujDyT3GT
         wojH7lpwvUxT17d6XYQODHOPh6nWSQQ4qcikm32gNocjo6gfr70IruFNypgiZGBetyha
         /cln6TBuviZs/emmCn/HhdgjXD0xewxPLipL0wW0HJau6s+5yiCnC/I+fKJrVvjFhG++
         c6FF/cgm1rA9XiUprnu6xPxnOap2FfR0FUsbRBBFFwtJkNPLuI2FJ8HqziZcXI2o6O8z
         Dq/g==
X-Forwarded-Encrypted: i=1; AFNElJ+4vMahBa5x0PqfWFlx6l+9Lizk6dw0J3+JmLEXdrH4+9PmArWELC+jZeM0sMl5vJ1LmXw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbfT3jqNumhu252LBiZIqKfmZ4nMQ8adDJMZHQ45OGDw0J+9bV
	0kEpPOoD/wHuuMEcW51WpoegNwmhi46Q6NEKuSGdJQl6LUg0tqNXm9Kr
X-Gm-Gg: Acq92OGU383gVmdD73A8yqFW1HkamGzNRKRt76Qp9cen7GEfc5diJ/RJcer+YIKoHhy
	I3WGodymdQy3pdTV06sF4J4eE2EQX3KVIOipKrHmOjYZkMiLHyEi6hmU/tGSPM8rO6RhfUPEmn+
	eVt9Bldu3Gs7yeuVz+PoaZd9unIWfKx4CT1Le32DihOO5x9bCYCeMPpM04gT8ucpHB5wRnt6cNs
	jup0WT1m52UYZVFh68q/iZ65ei7Si2V+VHN8IlsxiEHbuHSRE04gk4k0lDTHohaOrbqPD0jcfBl
	zrzKFW+by2K3/kz9jkaB7g4ar7fUf7pPtSQjLl3bgJOZGD8mZEOm/H6RpkRPuO6rRKMO0y2jo/C
	X0DsxkAkffFwl7fduW+KXTupJkpIoqu3gmhGYd05M/t1a0Ct/Zixu1/0QViFux9SN+OcZUggCbw
	tuzztY3ecYuunucPwYHm88JKQDaHMTmLQhjutay9cJ/IEFaXsueMcwBxfU7lfW
X-Received: by 2002:a05:6000:bce:b0:45f:f142:d56e with SMTP id ffacd0b85a97d-460302e4674mr4256841f8f.13.1780659474765;
        Fri, 05 Jun 2026 04:37:54 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:37:54 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Add RPROC support for the MX95-15x15-FRDM board
Date: Fri,  5 Jun 2026 04:36:17 -0700
Message-ID: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
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

As you can see from the title, this series attempts to introduce/enable
RPROC support for the MX95-15x15-FRDM board.

For a while now, the imx_rproc driver has been using the reserved memory
DT nodes as the carveout names, which would force DT writers to go against
the DT specification's recommendation and use non-generic names (e.g.
"vdev0vring0", "vdev0vring1", etc...). This series also tries to fix this
issue by introducing the "memory-region-names" property and using it in
the imx_rproc driver to figure out the carveout names. The driver will
still allow the old way of doing things (i.e. no "memory-region-names"
property) but a warning will now be printed since this should be
discouraged.

---

Changes in v2:

* change commit message of binding patch to describe why it's needed
* drop restrictions on the string names passed via "memory-region-names"
* drop patch moving the CM7 node to the SoC DTSI. CM7 node is now added
in the RPMSG DT overlay
* rewrite commit message of patch removing some of the RMEM regions from
the bord DTS - previous version was a stale version from first iterations
of this series
* change "micfil" node status from "disabled" to "reserved"
* add check against rmem phandle count and string count mismatch
* include "of_reserved_mem.h" in "imx_rproc.h" to avoid having to rely on
the consumers including it

---

Laurentiu Mihalcea (4):
  dt-bindings: remoteproc: imx_rproc: document optional
    "memory-region-names"
  remoteproc: imx_rpoc: fix carveout name parsing
  arm64: dts: freescale: imx95-15x15-frdm: remove some rmem regions
  arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage

 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  4 ++
 arch/arm64/boot/dts/freescale/Makefile        |  3 +
 .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 67 +++++++++++++++++++
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 ------
 drivers/remoteproc/imx_rproc.c                | 13 +++-
 drivers/remoteproc/imx_rproc.h                | 21 ++++++
 6 files changed, 106 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso

-- 
2.43.0

