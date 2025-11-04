Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D321B0439
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 15:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268820; cv=none; b=sE8qV4Bo0qLytNnjpdmXrMnifhiwIF0mqIcnPETAjhh8uGktOoAUg3xZ0A4ENesVP+k1jw0JpnFS2JarEMT1vb4USymcHIcmlv4aEur3e2KBFU/JTROCi0HuJLvTpjkgv4fJv1WEHd7YUlXY7KogL7ZhkD0Ez0yK+3ghMhubU4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268820; c=relaxed/simple;
	bh=p5LFmwEX6fbf6gDhCZzGUh0cp3wC6wAYcyXldsJFIIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F4Q4ptov1Kr/arNX+Asr3fXX3uIXXB6wXzZVwceHqnOfcGv0mYzAlGsk+EQjDblT/y0DgO4iUqnf5N+HC79i7+oZJT2TYQfXpjonCPFlP+kyIU3XUHBK2xuk4INOd0aKyogqDoxZv+/jal2x9pxxz6A48xGdwFDknA6YPelWMFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eneBn+GJ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eneBn+GJ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-641018845beso122204a12.3
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 07:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268817; x=1762873617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5mpUIW6+CyzXZCjIETW1X/eFRIiBeTonduLxFWGZK/o=;
        b=eneBn+GJuuPEfVDR/ztxWg1dltpwM23SBvTOuNaTxdrUhhOf7uq0kn7YqQyP9JJ0Is
         Lx06Ep995IbwhyvA4BF0YOWnd27ikfrox7FXMJ/F7ShTGXI+c/R6Ae7io6wwAuboOuur
         B9AmvPzNjR9N6bTJZssZDFEXWWY+KGIaB3zbTBbcenKXA8Aj9nLici8UkwRdKgsx2Kmm
         ifbb+v1edIaHiGorKH1yMtlfPQVi7GzMUxY2xrIYfNSvy4rfBdzwu/QsT11JANif1gVE
         arbYLoq2Ux43WUF+msP9aLZB4qNSrG7881OuvqCL2UraWGC7/WxWodcWZ3DcN+ekLrgr
         6dDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268817; x=1762873617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mpUIW6+CyzXZCjIETW1X/eFRIiBeTonduLxFWGZK/o=;
        b=KKnppo+MFXX6oDzbc6+3JtyHhDnOMmrnihCMLDK0hjdFV9bURMJgvD683o9EMCE0f0
         PmhTxEZt6R8guR7gB6pqZ/uPJAY2BTazWPYTsfdbFGmMYYdNfOVS3rM02LaJquTUaMDe
         sA6lKzZKnuyNuXrhheyu0Z1EaIUJFo/bj0+r8k5zcfNRB+Sc4ijj1LgLY96wYGPePQo8
         PdnUgwrgGlTGPNS9dr0HmEH89nQQhnBIH6vScDKycKWk3/GTP6orMwnJjwius7cKcHgS
         +0rMzuvAOlJhTjVXZL+rtDCVTTiHq6k3pTilRfORxffKyrnRLBnTvGoUfvFgOsVFBGgz
         GWTg==
X-Forwarded-Encrypted: i=1; AJvYcCX/4LpZRJiKUMaWqlG17bIc3YQ73lSNpReIFDXOegmVHFnYzfCjb2wAsoHQcV2MP8fj0/o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+yRrPRanHLih3qG47Lygk6lnA3xQbGT3dXZxF/pdW3DGXXAGi
	P+3POoafRageXCnAmIflbMckS4bqL4K2Ri/MWvEfmk4MafQXPgaCnGex
X-Gm-Gg: ASbGncu8I9Kip3nuiGMWfUtQtD2mD/CRjIo+GIAYOLtPQtT+mxUoxkb/3+bx5jm1uLZ
	/7QZPG0B+Fctu8UFwSdYzNyVZ5d9oMl4fRd8EzlFVR0iVJbVc4yxXdiwWzn99L+QjiXU5sggIXJ
	eaYKbJPqErBQtTU6Iz4lFoKKVOmdAUHQNAcrMZs6C9/anczcuJrrdH5DRss6tC1KKjxnEZf1mI0
	GnQi8J47I+EQkpBevQkuVbZz6v/LuAlO+q2I09T28HZR5HUo30Lts4cLqQNdy54dxU8P7f4A+50
	sojCzPt1lvhPmFcl6haxnbF0bS400wbHH0tNQSumEbKiFQp62xwVBjb4nKnTOq6M1eWkfbVd5GJ
	NB5Ty7ybbUrnBfrywUAoOnJeUpy2AyI70q6jo0GWC4L1npaQS2Z6yKXu0VH3k9m7UKrncoetdn/
	4vFCZsO59quv5EbAK6OT4kJFRCUQ==
X-Google-Smtp-Source: AGHT+IHpPTJa2+j0h+Cs4K2bC2PC8wb2EuNR51cOnJgsXf5x4woRyQv45qLS4utiEScOeGGzpAw/cg==
X-Received: by 2002:a05:6402:50c8:b0:63c:4537:75c0 with SMTP id 4fb4d7f45d1cf-640770823a5mr12779586a12.38.1762268817213;
        Tue, 04 Nov 2025 07:06:57 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6805da3sm2342014a12.15.2025.11.04.07.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 07:06:55 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Switch to using AIPSTZ5 on i.MX8MP
Date: Tue,  4 Nov 2025 07:06:09 -0800
Message-ID: <20251104150612.1874-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This series is a combination of the previously dropped patches from [1]
and the config-related patch from [2]. This enables the usage of AIPSTZ5
on i.MX8MP-based platforms.

[1]: https://lore.kernel.org/lkml/20250610160152.1113930-1-laurentiumihalcea111@gmail.com/
[2]: https://lore.kernel.org/lkml/20250707234628.164151-1-laurentiumihalcea111@gmail.com/

---
Changes in v2:

* squash patch 3 into patch 4.
* rewrite commit message of patch 1 to state that this driver is used
  for the IMX8MP-EVK board.
* rewrite commit message of patch 2 to (hopefully) better describe
  why we need this change.
* link to v1: https://lore.kernel.org/lkml/20250821105634.1893-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (3):
  arm64: defconfig: enable i.MX AIPSTZ driver
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 16 ++++++---
 arch/arm64/configs/defconfig                  |  1 +
 3 files changed, 46 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

-- 
2.43.0

