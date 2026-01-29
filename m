Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3664333557E
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 02:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769653761; cv=none; b=IYsXOU/ZpDwYd0GF7/S9jD/iTp/1m3b4B52YAQj1J6B80isIjfnBrNrc4jFx9ObJ26LzoAPpi+QJ9gp+jHFvtSbqKM0u+pG3zWLM0KY0USwyST8Z8lmxs40EXwwM17fcc2CNXVSbT6+tAqBfvddykhQEt0FpX3iR5Ge1iaJx+gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769653761; c=relaxed/simple;
	bh=auWIfql4Eqi/PyW7sBrBqSD2PXEbiclPGF37FC9B/Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HpBKDk0dlXadJe5/N2c6ALnph23SNG66xQWd1VLnWzDT1M/BHuojX9nmaC2WQ95puFE/5WFLAJP9iFzMyvYDwbhODlMUNJ6w6jlmgfh0jKOI+ugPfr0Tm7Y27fxINu7mGbJdZpGM2AFeEfVqerKyQ/nbrd/VGjXT5Xotac+AmAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqWH/rZu; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqWH/rZu"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c1d98ba11so336146a91.3
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 18:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769653759; x=1770258559; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2hnqyMVnWmWj8jg1bqTVOUz0c/5S35lK3Rmj22NSpoM=;
        b=GqWH/rZugosLBA5Vvg1pY+bwr60xwrCsb9365AWCowqwgkmsaurc6aBBNN9db+9rdT
         +AfcfD20XW5qqOhcl/86/stmgOa2Y6Qyqj5ZWet0Mmju4C+bSS+Y0tudBD1Mdve3SxzJ
         3SKHa8QSUN5Wy3nHUN0mPmzqvcacUOJ8LZB9J+Mf5PBTAPDrdoQ9Vg88wuPWOfHP1iHv
         nKoTqGRdEyBKD98G2gfy/Ag6XgBDA6d0oEpB86ZCNjtx3c7YQydsKFr51vBeZYYpUft5
         cIrhPQBH2qx3DJleVCV/aNVq/bJFtnyle54Yyj1pPQEngZTC/Zzmr9VoNyz7enNXwFoE
         A4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769653759; x=1770258559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hnqyMVnWmWj8jg1bqTVOUz0c/5S35lK3Rmj22NSpoM=;
        b=YqJWzVh9Y2tSZPlX/+4rtpujxCgXcRuxGocgq4yOVZAPjch6rFflzJ+KJYWZdkB5Hd
         846z6o5er4m5g6QdK4sZs73ASPw+OWB0tfUjp95zUcMty8JyrKcD/Pysw5AHaYkC7Dm3
         wj7JYehKz0bbRAmpy2JRrBvfUuAj3e+sMpEGzm/O67Cytr4HXGnhnqrli23scPX+5MS+
         4F3r3FSJmBXBNFIGdJy1tU81FlDK1zsX9/URk2h6F3BFK3RQFoK5ETc1Xcjc7OHQDqAx
         e08LU3AngTbxNMWLscsSGsNx7bG9Df5JV7KrP+2TWr5QeGnpxrs8AXfgOMzoior6eOn7
         LnBA==
X-Forwarded-Encrypted: i=1; AJvYcCXFVOyhkIqTJg+mr7mwAisMnwNcm+ylOzIn4HQ58dNx+EagNJqT8IzjWZJlVhEyFhluYlQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoOY3MZv/FrWERefdTMu28Xklz2p1V1MUVYzt5adSIlIhyuSHY
	xL6BGBSMrANqwBzY0aaiM3q3dvl2LdHXTVshJkVFA+GuPCA9L7YFfj8p
X-Gm-Gg: AZuq6aKRmo4f/dx+4dtR9OwIhkiv2zC0bHdrcFYkuv5sHllGBRwx0wz0OymWZ430BiG
	XYnmD3eC8Na8oQ5wmzv+kCHGd+rYlrmGp/NN1OBNB704ooswdChdXy6sJboA4V7jn6X7K9R2koE
	WKVSPJbH5TQ+wZTquSrPEawCtWTPQulXP6/78sLyRIhVfq7lVUsFhmGoSJn+xyW5jqWO568QVnz
	UxCLADc53kp3mN4Q3snJnMtkRQYK8F6P2q596oKOrNmNGfEMbLg9sv1VLyaIaU42P/lsAuquk/7
	VlEixEJBY8918hc4BL88Sa/Ys/ZDjRTEq0WlfwIFXTZOaaxMIRHGgmQVCjB5ocQE9AJ+d/rYHYc
	5jIn4UtdmiRpvUXiC+xgrL5/tcslPCogryYu3ptYGptuBFUy9fqCnuu1MK5owOX/sclv46n7HxA
	aBHP8A5zOI8YIz14v1TXM1sAAjd6hJddpQOBL9NVb/X2wyXypUJxPx5oM=
X-Received: by 2002:a17:90b:1a81:b0:352:c146:dc39 with SMTP id 98e67ed59e1d1-353fed7b21dmr5803708a91.30.1769653759547;
        Wed, 28 Jan 2026 18:29:19 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f2f0283sm4380542a91.5.2026.01.28.18.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 18:29:19 -0800 (PST)
From: Wig Cheng <onlywig@gmail.com>
To: shawnguo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zaq14760@gmail.com,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH v4 0/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Thu, 29 Jan 2026 10:29:09 +0800
Message-ID: <20260129022910.3942028-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v4:
- Drop invalid property

Changes in v3:
- Misunderstood reviewer's feedback in v1, improved commit message description

Changes in v2:
- Fix Makefile alphabetical ordering
- Move vendor property before status in device tree
- Simplify commit message as suggested by reviewer

Wig Cheng (1):
  arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM

 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 50 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso

-- 
2.43.0

